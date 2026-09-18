'	.----.  .--.  .----.-.----.           
'	| {_} }/ {} \{ {__-{ | }`-'
'	| {_} /  /\  .-._} | | },-.           
'	.-.---..---..-.--.-.----.-. .-.-----. 
'	{ } }}_} }}_} |  { | }`-{ {_} `-' '-'
'	| | } \| } \} '--| | }, -| { } } } {
'	`-`-' - '`-' - '`----`-`----`-' `-' `-'
'----------------------------------------------------------------------------
'	Basic-Irrlicht Wrapper by EM ENGINEERING LLC ©2019-2024
'----------------------------------------------------------------------------
' This software is provided 'as - is', without any express Or implied
' warranty.  In no event will the author(s) be held liable For any damages
' arising from the use of this software.
'----------------------------------------------------------------------------

'##############################################################
'#	IMPORT THE BASIC IRRLICHT LIBRARY
'##############################################################
#Include once "..\Libs\BasicIrrlicht.bi"

Type Players
	Ent      as iENTITY
	Pivot    as iENTITY
	pName    as string
	X        as single
	Y        as single
	Z        as single
	Yaw      as integer
	Jumping  as integer = 0
	JumpTime as integer
	Shadow   as iSHADOW
End Type

declare sub Update_Player( DeltaTime as single )

'iVSync( TRUE )
iAntialias( 2 )
iGraphics3D( 1366, 768, 32, FALSE )
iAppTitle( "BASIC IRRLICHT 3RD PERSON DEMO" )
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont(myfont )

' add a zip file that is password protected - If password is wrong, file contents will Not exist.
iAddArchive( "3rd Person Resources.rez", true, true, "bIrrlichtExample" )

Const Gravity as single = 0.2
Const MaxVel as single = 5.0

dim shared ScreenWidth as integer
dim shared ScreenHeight as integer 
dim shared BILogo as iTEXTURE
dim shared IrrlichtLogo as iTEXTURE
dim shared Terrain as iTERRAIN
dim shared TerrainTexture0 as iTEXTURE
dim shared TerrainTexture1 as iTEXTURE
dim shared terrainColor as integer
dim shared TerrainHeightY as single

dim shared Camera as iCAMERA
dim shared CameraPivot as iENTITY
dim shared CameraPivotYaw as integer = 0
dim shared CameraPivotX as integer = -200
dim shared CameraPivotY as integer = 100
dim shared CameraPivotZ as integer = 0
dim shared Water as iENTITY
dim shared WaterTexture as iTEXTURE
dim shared WaterDepth as integer = 300
dim shared BelowWater as boolean = False
dim shared Local_Player as Players
dim shared CurrentAnim as integer
dim shared LastAnim as Integer
dim shared RunSpeed as Single = 5.0  'HAD TO MAKE NEGATIVE FOR SOME REASON??????????
dim shared xAcc as Single
dim shared zAcc as Single
dim shared xVel as Single
dim shared zVel as Single
dim shared FirstMouse as integer = True
dim shared ModelRotation as Integer = 0
dim shared ModelYawOffset as Integer = 0
dim shared Light as iLIGHT
dim shared Flare as iENTITY
dim shared FlareTexture as iTEXTURE
dim shared Sun as iTEXTURE 
dim shared BitmapFont as iFONT
dim shared collWorld as iMETA_SELECTOR
dim shared Last_Actual_Heading as Integer

ScreenWidth = iGraphicsWidth()
ScreenHeight = iGraphicsHeight()
iShadowColor( 0, 0, 0, 128 )
BILogo = iLoadTexture( "media/bi_logo.png" )
IrrlichtLogo = iLoadTexture( "media/IrrlichtLogo.png" )

' -----------------------------------------------------------------------------
' Add Terrain
' -----------------------------------------------------------------------------
TerrainTexture0 = iLoadTexture( "media/island.jpg")
TerrainTexture1 = iLoadTexture( "media/detailmap3.jpg" )
Terrain = iLoadTerrain( "media/iheight.jpg" )
iScaleTerrainTexture( Terrain, 1.0, 40.0, TERRAIN_NORMAL )
iScaleEntity( Terrain, 40.0, 4, 40.0 )
iEntityMaterialType ( Terrain, EMT_DETAIL_MAP )
iEntityTexture( Terrain, TerrainTexture0, 0 )
iEntityTexture( Terrain, TerrainTexture1, 1 )
dim terrainshadow as iTEXTURE = iLoadTexture( "media/Terrain/cloud01.png" )
iEntityTexture( Terrain, terrainshadow, 2 )
iEntityMaterialFlag( Terrain, EMF_LIGHTING, true )
iEntityMaterialFlag( Terrain, EMF_FOG_ENABLE, True )

' SETUP TERRAIN For RAY COLLISION TESTING
collWorld = iCreateMetaSelector()
iMetaAddSelector( collWorld, iCreateTerrainSelector( Terrain, 0 ) )

' -----------------------------------------------------------------------------
' Add Water
' -----------------------------------------------------------------------------
Water = iCreateWater( "media/Water.jpg", "media/Water.jpg", 2.0,300.0,10.0 )
iPositionEntity( Water, 2.0, 300.0, 10.0 ) 
iEntityMaterialType ( Water, EMT_REFLECTION_2_LAYER )
iScaleEntity( Water, 500, 1, 500 )
iEntityMaterialFlag( Water, EMF_LIGHTING, True )
iEntityMaterialFlag( Water, EMF_FOG_ENABLE, True )
iEntityMaterialFlag( Water, EMF_BACK_FACE_CULLING, false )

' SETUP WATER For RAY COLLISION TESTING
iMetaAddSelector( collWorld, iCreateBoxSelector( Water, false ) )

' -----------------------------------------------------------------------------
'	TREES
' -----------------------------------------------------------------------------
dim i as Integer
dim xl as Integer
dim yl as Integer
dim new_tree as iEntity
dim tree_mod2 as iEntity = iLoadMeshEntity( "Media\Trees\tree2.b3d" )
iScaleEntity( tree_mod2, 1.3, 1.6, 1.3 )
iEntityMaterialFlag( tree_mod2, EMF_FOG_ENABLE, True )
iEntityMaterialFlag( tree_mod2, EMF_LIGHTING, True )
for i = 1 to 50
   new_tree = iCopyEntity( tree_mod2 )
   iMetaAddSelector( collWorld, iCreateTriSelector( new_tree, false ) )
   DO 
      xl = iRand( 1, 10000)
      yl = iRand( 1, 10000)
   loop until iTerrainHeight( terrain, xl, yl ) > 300
   iPositionEntity( new_tree, xl, iTerrainHeight( terrain, xl, yl )-5, yl )
   iRotateEntity( new_tree, 0, iRand(0,359), 0 )
next
iHideEntity( tree_mod2 )

' -----------------------------------------------------------------------------
' 3rd Person Camera
' -----------------------------------------------------------------------------
CameraPivot = iCreatePivot()
Camera = iCreateCamera( False )
iCameraRange( Camera, 1.0, 12000 )

' -----------------------------------------------------------------------------
' Add Fog
' -----------------------------------------------------------------------------
iFogType( EFT_FOG_LINEAR )
iFogColor( 128, 128, 255 )
iFogRange( 1.0, 1000.0 )

' -----------------------------------------------------------------------------
' Add Local Player
' -----------------------------------------------------------------------------
Local_Player.Pivot = iCreatePivot()
Local_Player.Ent = iLoadAnimMesh( "media/zumlin.md2", False )
dim MeshTexture as iTEXTURE = iLoadTexture( "media/zumlin.pcx" )
iEntityTexture( Local_Player.Ent, MeshTexture, 0 )
MeshTexture = iLoadTexture( "media/ParticleGrey.tga" )
iEntityTexture( Local_Player.Ent, MeshTexture, 1 )
iEntityMaterialFlag( Local_Player.Ent, EMF_LIGHTING, True )
iPlayMD2Animation( Local_Player.Ent, EMAT_STAND )
Local_Player.Shadow = iEntityCastShadow( Local_Player.Ent )
iMetaAddSelector( collWorld, iCreateTriSelector( Local_Player.Ent ) )

' -----------------------------------------------------------------------------
' Set Parent Child Relationships
' -----------------------------------------------------------------------------
iEntityParent( Camera, CameraPivot )
iEntityParent( CameraPivot, Local_Player.Pivot )
iEntityParent( Local_Player.Ent, Local_Player.Pivot )

' -----------------------------------------------------------------------------
' Initialize Positions
' -----------------------------------------------------------------------------
iPositionEntity( CameraPivot, CameraPivotX, CameraPivotY, CameraPivotZ )
iPositionEntity( Local_Player.Pivot, 5000, 0, 3500 )

' -----------------------------------------------------------------------------
' Add Sun & Flare
' -----------------------------------------------------------------------------
' SPRITE
Sun = iLoadSprite( "media/sun2.tga", false, Flare )
iScaleSprite( Sun, 300, 300 )
iEntityMaterialType ( Sun, EMT_TRANSPARENT_ALPHA_CHANNEL )
iEntityMaterialFlag( Sun, EMF_LIGHTING, False )
iEntityMaterialFlag( Sun, EMF_FOG_ENABLE, False )
' FLARE
FlareTexture = iLoadTexture( "media/flares.jpg" )
Flare = iCreateLensFlare( FlareTexture, Sun )
iPositionEntity( Sun, 5000, 1500, 1000 )
 
' -----------------------------------------------------------------------------
' Add Light
' -----------------------------------------------------------------------------
Light = iCreateLight( ELT_POINT )
iPositionEntity( Light, 5000, 1500, 1000 )
iLightColor( Light, 250, 40, 40 )
iLightRadius( Light, 20000.0 )
iAmbientLight( 128, 128, 128 )

' -----------------------------------------------------------------------------
' Prepare For Main Loop
' -----------------------------------------------------------------------------
iShowPointer()
iMoveMouse( iGraphicsWidth()/2, iGraphicsHeight()/2 )
dim HitEntity as iENTITY
dim Info as String

iCLSColor( 128, 128, 255 )
iClearUnusedMeshes()
iFadeIn( 3000 )
'iFrameLimit( 30 )

'#############################################################
'	MAIN LOOP
'#############################################################
dim LFPS as Integer = 0
dim Lfps_count as Integer = 0
dim fps_time as Integer = iMilliSecs()
dim LogicFPS as uInteger = 60
dim FramePeriod as Integer = 1000 / LogicFPS
dim FrameTime as Integer = iMilliSecs() - FramePeriod
dim FrameElapsed as Integer = 0
dim FrameLimit as Integer = 0
dim FrameTicks as Integer = 0
dim dStartTime as integer = iMillisecs()
dim shared DeltaTime as single = 0.0

while( iRun() and (not iKeyHit( KEY_ESCAPE )) ):
'-----------------------------------------------------------------------------
'	CALCULATE FPS EACH FRAME
'-----------------------------------------------------------------------------
   DeltaTime = iMillisecs() - dStartTime
   dStartTime = iMillisecs()
   if iMilliSecs() - fps_time > 1000 then
      LFPS = Lfps_count : Lfps_count = 1 : fps_time = iMilliSecs()
   end if
'-----------------------------------------------------------------------------
'	FRAME TIMER TO KEEP GAME LOGIC IN SYNC
'-----------------------------------------------------------------------------
   do
      FrameElapsed = iMilliSecs() - FrameTime
   loop until FrameElapsed
   FrameTicks = FrameElapsed / FramePeriod
   For FrameLimit = 1 To FrameTicks
      FrameTime = FrameTime + FramePeriod
      Lfps_count += 1
'-----------------------------------------------------------------------------
'	    CODE LOGIC AFFECTED BY FRAME TIME HERE
'-----------------------------------------------------------------------------
      Update_Player( DeltaTime )


   next
'-----------------------------------------------------------------------------
'  CODE NOT AFFECTED BY FRAME TIME HERE
'-----------------------------------------------------------------------------
'	BEFORE WE DRAW THE SCENE:
'	HIDE LENS FLARE WHEN CAMERA IS BEHIND TERRAIN OR UNDER WATER (Shoot a ray from the sun To the Camera)
	if not iEntityVisible( Camera, Sun, collWorld ) then
   	iHideEntity( Flare )
	Else
		iShowEntity( Flare )
	End If
'	HIDE OUR SHADOW WHEN OUR PLAYER IS BEHIND TERRAIN OR UNDER WATER (Shoot a ray from the sun To our Player)
	if not iEntityVisible( Local_Player.Ent, Sun, collWorld ) then
   	iHideEntity( Local_Player.Shadow )
		iEntityMaterialFlag( Local_Player.Ent, EMF_LIGHTING, False )
      iEntityColor( Local_Player.Ent, 20, 20, 20 )
	Else
		iShowEntity( Local_Player.Shadow )
		iEntityMaterialFlag( Local_Player.Ent, EMF_LIGHTING, True )
      iEntityColor( Local_Player.Ent, 255, 255, 255 )
	End If


'-----------------------------------------------------------------------------
   iUpdateScene()    
   iRenderScene()
'-----------------------------------------------------------------------------	
'	2D STUFF AFTER EVERY 3D RENDER
'-----------------------------------------------------------------------------
   iColor( 255, 255, 255 )
   iText(10,10,  "ENGINE FPS: "+str( iFPS() ))
   iText(10,30,  "LOGIC FPS: "+str( LFPS ))
   iText(10,50,  "PRIMITIVES RENDERED: "+str( iTrisRendered() ) )
   iText(10,70,  "IRRLICHT RUN TIME: "+Str(iRunTime()) )
   iText(ScreenWidth/2,10,  "HEADING: "+Str(CameraPivotYaw), true )
   iText(ScreenWidth/2,40,  "X: "+str(Int(Local_Player.X))+"   Z: "+str(Int(Local_Player.Z)), true )
   iColor( 0, 255, 0 )
   iText(10,230, "*ESCAPE KEY TO EXIT")
	iDrawTexture( BILogo, ScreenWidth - 350, ScreenHeight - 64)
	iDrawTexture( IrrlichtLogo, 0, ScreenHeight - 74)


'-----------------------------------------------------------------------------
   iRenderGUI()
   iFlip()
   if iKeyHit( KEY_F12 ) then
      iScreenShot()
   end if
wend
'#############################################################
'	END
'#############################################################
iEndGraphics()
end



' -----------------------------------------------------------------------------
' Functions
' -----------------------------------------------------------------------------
sub Update_Player( DeltaTime as single )
   dim adj as integer = 0'2
	dim MouseXMove as integer
	dim MouseYMove as integer
	dim Actual_Heading as integer = 0
   dim Disable_Movement as boolean = false
   
   if iFullscreen() then adj = 0
' -----------------------------------------------------------------------------
'	To prevent movement 'jerk' when initially pressing the mouse look, we must
'	 zero out the mouse (center screen) And Then caculate second time around.
' -----------------------------------------------------------------------------
	If (iMouseDown(MOUSE_RIGHT) or iMouseDown(MOUSE_LEFT) ) And FirstMouse Then 'or iMouseDown(MOUSE_LEFT)
		iMoveMouse( iGraphicsWidth()/2, iGraphicsHeight()/2 )
		FirstMouse = False
		Return
	End If
' -----------------------------------------------------------------------------
'	Get And store all Current values
' -----------------------------------------------------------------------------
	Local_Player.X = iEntityX( Local_Player.Pivot, False )
	Local_Player.Y = iEntityY( Local_Player.Pivot, False )
	Local_Player.Z = iEntityZ( Local_Player.Pivot, False )
	Local_Player.Yaw = iEntityYaw( Local_Player.Pivot, False )
	CameraPivotYaw = iEntityYaw( Local_Player.Pivot, False )
	CameraPivotX = iEntityX( CameraPivot, False )
	CameraPivotY = iEntityY( CameraPivot, False )
	CameraPivotZ = iEntityZ( CameraPivot, False )
	xAcc = 0
	zAcc = 0
' -----------------------------------------------------------------------------
'	Check For Key Movement Input
' -----------------------------------------------------------------------------
	Select case Local_Player.Jumping
		Case False
			If iKeyDown( KEY_W ) then           'Forward
				CurrentAnim = EMAT_RUN
				xAcc = RunSpeed
				zAcc = RunSpeed
				If iKeyDown( KEY_A ) then        'Forward And Left
					ModelRotation = 315
					ModelYawOffset = -45				
				ElseIf iKeyDown( KEY_D )	then  'Forward And Right
					ModelRotation = 45
					ModelYawOffset = 45				
				Else
					ModelRotation = 0
					ModelYawOffset = 0
				End If
			ElseIf iKeyDown( KEY_S ) then       'Backward
				CurrentAnim = EMAT_RUN
				xAcc = RunSpeed
				zAcc = RunSpeed
				If iKeyDown( KEY_A )	then        'Backward And Left
					ModelRotation = 225
					ModelYawOffset = -135
				ElseIf iKeyDown( KEY_D ) then    'Backward And Right
					ModelRotation = 135
					ModelYawOffset = 135				
				Else
					ModelRotation = 180
					ModelYawOffset = 180
				End If
			ElseIf iKeyDown( KEY_A )	then     'Left
				CurrentAnim = EMAT_RUN
				xAcc = RunSpeed
				zAcc = RunSpeed
				ModelRotation = 270
				ModelYawOffset = -90
			ElseIf iKeyDown( KEY_D ) then       'Right
				CurrentAnim = EMAT_RUN
				xAcc = RunSpeed
				zAcc = RunSpeed
				ModelRotation = 90	
				ModelYawOffset = 90			
			Else
				CurrentAnim = EMAT_STAND
			EndIf
	End Select
' -----------------------------------------------------------------------------
'	Check For jump
' -----------------------------------------------------------------------------
	If (Not Local_Player.Jumping) And iKeyHit( KEY_SPACE ) then
		CurrentAnim = EMAT_JUMP
		Local_Player.Jumping = True
		Local_Player.JumpTime = iMilliSecs()
	End If
	If Local_Player.Jumping And (iMilliSecs() > Local_Player.JumpTime + 400) then
		'iFlushKeys()
		Local_Player.Jumping = False
		'CurrentAnim = EMAT_STAND
	End If
' -----------------------------------------------------------------------------
'	Check Mouse Movement Input
' -----------------------------------------------------------------------------
   if not FirstMouse then
      If iMouseDown(MOUSE_RIGHT) then
         iHidePointer()
         MouseXMove = ((ScreenWidth/2) - iMouseX()) * 0.5
         MouseYMove = ((ScreenHeight/2) - iMouseY()) * 0.5
         iMoveMouse( iGraphicsWidth()/2, iGraphicsHeight()/2 )
         CameraPivotY = CameraPivotY - MouseYMove + adj
         CameraPivotYaw = CameraPivotYaw - MouseXMove + adj
         If iMouseDown(MOUSE_LEFT) Then
            If Not Local_Player.Jumping Then CurrentAnim = EMAT_RUN
            xAcc = RunSpeed
            zAcc = RunSpeed
            ModelRotation = 0
            ModelYawOffset = 0
         End If
      elseIf iMouseDown(MOUSE_LEFT) then
               iHidePointer()
               MouseXMove = ((ScreenWidth/2) - iMouseX()) * 0.5
               MouseYMove = ((ScreenHeight/2) - iMouseY()) * 0.5
               iMoveMouse( iGraphicsWidth()/2, iGraphicsHeight()/2 )
               CameraPivotY = CameraPivotY - MouseYMove + adj
               CameraPivotYaw = CameraPivotYaw - MouseXMove + adj

               ModelYawOffset = ModelRotation '+CameraPivotYaw
               ModelRotation = (-CameraPivotYaw - ModelYawOffset)-(135 +CameraPivotYaw)
               
               'ModelYawOffset = ModelRotation
               'Local_Player.Yaw = CameraPivotYaw + ModelYawOffset
               'CameraPivotYaw
               'ModelRotation
               'ModelYawOffset
               'iEntityYaw(Local_Player.Pivot)
               'ActualHeading = Local_Player.Yaw + ModelYawOffset
               'Disable_Movement = true
      Else
         FirstMouse = True
         iShowPointer()
      End If
   end if
'	Set a Min And Max For the camera height
	If CameraPivotY < -20 Then CameraPivotY = -20
	If CameraPivotY > 300 Then CameraPivotY = 300
	CameraPivotX = CameraPivotX + (iMouseZ() * 15)
'	Set a Min And Max on mouse zoom
	If CameraPivotX < -400 Then CameraPivotX = -400
	If CameraPivotX > -110 Then CameraPivotX = -110
' -----------------------------------------------------------------------------	
'	Update Velocities
' -----------------------------------------------------------------------------
'	First check To ensure there was an acceleration
	If xAcc <> 0 Then
		xVel = xAcc * DeltaTime
		If Abs(xVel) > MaxVel Then xVel = Sgn(xVel) * MaxVel
	Else
'	Otherwise If Not, lets fake friction
		If Not Local_Player.Jumping then
			xVel = xVel * Gravity
			If Abs(xVel) < .001 Then xVel = 0
		End If
	End If	
	If zAcc <> 0 Then
		zVel = zAcc * DeltaTime
		If Abs(zVel) > MaxVel Then zVel = Sgn(zVel) * MaxVel
	Else
		If Not Local_Player.Jumping then
			zVel = zVel * Gravity
			If Abs(zVel) < .001 Then zVel = 0
		End If
	End If
' -----------------------------------------------------------------------------	
'	Check For Animation Change And apply If necessary	
' -----------------------------------------------------------------------------
	If LastAnim <> CurrentAnim Then
		iPlayMD2Animation( Local_Player.Ent, CurrentAnim )
		LastAnim = CurrentAnim
	End If
' -----------------------------------------------------------------------------	
'	Filter Compass Heading 0 To 359
' -----------------------------------------------------------------------------
	While CameraPivotYaw > 359
		CameraPivotYaw = CameraPivotYaw - 359
	Wend
	While CameraPivotYaw < 0
		CameraPivotYaw = CameraPivotYaw +359
	Wend
'	Lets keep our heading within the limits of (0-359)
	Actual_Heading = Local_Player.Yaw + ModelYawOffset
	If Actual_Heading > 359 Then Actual_Heading = Actual_Heading - 359
	If Actual_Heading < 0 Then Actual_Heading = Actual_Heading + 359
   Last_Actual_Heading = Actual_Heading
' -----------------------------------------------------------------------------
'	Caculate New player position based on vel And yaw
' -----------------------------------------------------------------------------
   dim adjRot as single = (45-Actual_Heading)/180*PI
   dim cxsz as single = cos( adjRot )
   dim sxcz as single = sin( adjRot )
   Local_Player.X = Local_Player.X + (zVel * cxsz) + (xVel * sxcz)
   Local_Player.Z = Local_Player.Z - (xVel * cxsz) + (zVel * sxcz)
' -----------------------------------------------------------------------------
'   Calculate Terrain Height For player x And z location
' -----------------------------------------------------------------------------
	TerrainHeightY = iTerrainHeight( Terrain, Local_Player.X, Local_Player.Z )
'	If the player walks off the map limit them To Terrain Height of 0
	If TerrainHeightY < 0 Then TerrainHeightY = 0
' -----------------------------------------------------------------------------
'	CHECK For CAMERA BELOW WATER
' -----------------------------------------------------------------------------
	If iEntityY( Camera, True ) > ( WaterDepth - 5 ) And BelowWater = True then
		CameraPivotY = CameraPivotY + 10
		BelowWater = False
		iCLSColor( 128, 128, 255 )
		iShadowColor( 0, 0, 0, 128 )
      iFogColor( 128, 128, 255 )
      iFogRange( 500.0, 2000.0 )
		iEntityMaterialFlag( Local_Player.Ent, EMF_FOG_ENABLE, False )
	ElseIf iEntityY( Camera, True ) < ( WaterDepth + 5 ) And BelowWater = False then
		CameraPivotY = CameraPivotY - 10
		BelowWater = True
		iCLSColor( 49, 165, 190 )
		iShadowColor( 0, 0, 0, 0 )
      iFogColor( 49, 165, 190 )
      iFogRange( 0.0, 200.0 )
		iEntityMaterialFlag( Local_Player.Ent, EMF_FOG_ENABLE, True )
	End If
' -----------------------------------------------------------------------------
'	Re-position everything
' -----------------------------------------------------------------------------
'   dim tstcam as single = iTerrainHeight( Terrain, iEntityX(Camera),iEntityZ(Camera) )
'   if CameraPivotY < tstcam then
'      CameraPivotY = iEntityY(Camera)+tstcam
'   end if
   iPositionEntity( CameraPivot, CameraPivotX, CameraPivotY, 0 )
	iRotateEntity( Local_Player.Pivot, 0, CameraPivotYaw, 0 )
	iRotateEntity( Local_Player.Ent, 0, ModelRotation, 0 )
	iCameraTarget( Camera,Local_Player.X,Local_Player.Y+40,Local_Player.Z )
	iPositionEntity( Local_Player.Pivot, Local_Player.X, TerrainHeightY + 25, Local_Player.Z )
End sub


