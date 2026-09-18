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

DIM shared Terrain as iTerrain
DIM TerrainTexture0 as iTexture
DIM TerrainTexture1 as iTexture
DIM Camera as iCamera
DIM BitmapFont as iFont

'iVSync( TRUE )
iAntialias( 4 )
iGraphics3D( 1366, 768, 32, false )
iAppTitle( "TERRAIN TEST FOR BASIC IRRLICHT" )
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont(myfont )

' -----------------------------------------------------------------------------
'	CAMERA
' -----------------------------------------------------------------------------
Camera = iCreateFPSCamera( 100.0, 3.0, NULL )
iPositionEntity( Camera, 3942.8, 1102.7, 5113.9 )
iRotateEntity( Camera, 0, 180, 0 )
iCameraRange( Camera, 1, 10000 )
iFogType( EFT_FOG_LINEAR )
iFogRange( 100, 10000 )
iFogDensity( 0.5 )
iFogColor( 177, 208, 253 )
iCLSColor( 240, 255, 255 )

' -----------------------------------------------------------------------------
' SKYBOX
' -----------------------------------------------------------------------------
dim SKUP as iTexture = iLoadTexture( "Media/SKY/SKUP.bmp" )
dim SKDN as iTexture = iLoadTexture( "Media/SKY/SKDN.bmp" )
dim SKLF as iTexture = iLoadTexture( "Media/SKY/SKLF.bmp" )
dim SKRT as iTexture = iLoadTexture( "Media/SKY/SKRT.bmp" )
dim SKFR as iTexture = iLoadTexture( "Media/SKY/SKFR.bmp" )
dim SKBK as iTexture = iLoadTexture( "Media/SKY/SKBK.bmp" )
dim sky as iEntity = iCreateSkybox( SKUP, SKDN, SKLF, SKRT, SKFR, SKBK )
iEntityMaterialFlag( sky, EMF_FOG_ENABLE, false )
iEntityMaterialFlag( sky, EMF_LIGHTING, false )

' -----------------------------------------------------------------------------
' TERRAIN
' -----------------------------------------------------------------------------
Terrain = iLoadTerrain( "./Media/Terrain/HeightMap.jpg" )
iScaleEntity( Terrain, 80.0, 10.0, 80.0 )
iEntityMaterialFlag( Terrain, EMF_NORMALIZE_NORMALS, true )
TerrainTexture0 = iLoadTexture( "./Media/Terrain/ColorMap4.bmp" )
TerrainTexture1 = iLoadTexture( "./Media/Terrain/Detail.jpg" )
iEntityMaterialType( Terrain, EMT_DETAIL_MAP )
iEntityTexture( Terrain, TerrainTexture0, 0 )
iEntityTexture( Terrain, TerrainTexture1, 1 )
iScaleTerrainTexture( Terrain, 1.0, 400.0, TERRAIN_NORMAL )
iEntityMaterialFlag( Terrain, EMF_LIGHTING, false )
iEntityMaterialType( Terrain, EMT_LIGHTMAP )
iEntityMaterialFlag( Terrain, EMF_FOG_ENABLE, true )
iPositionEntity( Terrain, 0, -450, 0 )

' -----------------------------------------------------------------------------
'	TREES
' -----------------------------------------------------------------------------
dim i as Integer
dim xl as Integer
dim yl as Integer
dim new_tree as iEntity
dim tree_mod as iEntity = iLoadMeshEntity( ".\Media\Trees\tree4.b3d" )
iScaleEntity( tree_mod, 1.3, 2.6, 1.3 )
iEntityMaterialFlag( tree_mod, EMF_FOG_ENABLE, True )
iEntityMaterialFlag( tree_mod, EMF_LIGHTING, True )
for i = 1 to 150
   new_tree = iCopyEntity( tree_mod )
   DO 
      xl = iRand( 15000, 35000)
      yl = iRand( 15000, 35000)
      'print "Height: ";iTerrainHeight( Terrain, xl, yl )
   loop until iTerrainHeight( Terrain, xl, yl ) > 215
   iPositionEntity( new_tree, xl, iTerrainHeight( terrain, xl, yl )-5, yl )
   iRotateEntity( new_tree, 0, iRand(0,359), 0 )
next
iHideEntity( tree_mod )

dim tree_mod2 as iEntity = iLoadMeshEntity( ".\Media\Trees\tree2.b3d" )
iScaleEntity( tree_mod2, 1.3, 1.6, 1.3 )
iEntityMaterialFlag( tree_mod2, EMF_FOG_ENABLE, True )
iEntityMaterialFlag( tree_mod2, EMF_LIGHTING, True )
for i = 1 to 150
   new_tree = iCopyEntity( tree_mod2 )
   DO 
      xl = iRand( 15000, 35000)
      yl = iRand( 15000, 35000)
   loop until iTerrainHeight( terrain, xl, yl ) > 215
   iPositionEntity( new_tree, xl, iTerrainHeight( terrain, xl, yl )-5, yl )
   iRotateEntity( new_tree, 0, iRand(0,359), 0 )
next
iHideEntity( tree_mod2 )

' -----------------------------------------------------------------------------
' WATER
' -----------------------------------------------------------------------------
dim Water as iEntity = iCreateWater( "./media/Terrain/water.png", "Media/Terrain/cloud01.png", 0.2, 1200.0, 0.2, null )
iScaleEntity( Water, 1500.0, 1.0, 1500.0 )
iEntityColor( Water, 177, 208, 253 )
iEntityMaterialFlag( Water, EMF_FOG_ENABLE, true )
iPositionEntity( Water, 0.0, 170.0, 0.0 )
iEntityMaterialType( Water, EMT_REFLECTION_2_LAYER )  'EMT_REFLECTION_2_LAYER EMT_TRANSPARENT_ADD_COLOR   EMT_SOLID  EMT_SOLID_2_LAYER
iEntityMaterialFlag( Water, EMF_BACK_FACE_CULLING, false )


'#############################################################
'	MAIN LOOP
'#############################################################
dim tpos as single = 0.0
iHidePointer()
iAmbientlight( 255, 255, 255 )
iPositionEntity( Camera, 24953, 550, 17996 )

dim LFPS as Integer = 0
dim Lfps_count as Integer = 0
dim fps_time as Integer = iMilliSecs()
dim LogicFPS as uInteger = 60
dim FramePeriod as Integer = 1000 / LogicFPS
dim FrameTime as Integer = iMilliSecs() - FramePeriod
dim FrameElapsed as Integer = 0
dim FrameLimit as Integer = 0
dim FrameTicks as Integer = 0

while( iRun() and (not iKeyHit( KEY_ESCAPE )) ):
'-----------------------------------------------------------------------------
'	CALCULATE FPS EACH FRAME
'-----------------------------------------------------------------------------
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
      tpos += 0.000001
      iPositionTexture( Water, tpos, tpos)


   next
'-----------------------------------------------------------------------------
'  CODE NOT AFFECTED BY FRAME TIME HERE
'-----------------------------------------------------------------------------


'-----------------------------------------------------------------------------
   iUpdateScene()    
   iRenderScene()
'-----------------------------------------------------------------------------	
'	2D STUFF AFTER EVERY 3D RENDER
'-----------------------------------------------------------------------------
   iColor( 255, 255, 255 )
   iText( 10, 10, "ENGINE FPS: "+str(iFPS()) )
   iText( 10, 30,  "LOGIC FPS: "+str( LFPS ) )
   iText( 10, 50,  "PRIMITIVES RENDERED: "+str( iTrisRendered() ) )
   iText( 10, 70, "CAM YAW: "+str(iEntityYaw(Camera)) )
   iText( 10, 90, "CAM PITCH: "+str(iEntityPitch(Camera)) )
   iText( 10, 110, "CAM X: "+str(iEntityX(Camera)) )
   iText( 10, 130, "CAM Y: "+str(iEntityY(Camera)) )
   iText( 10, 150, "CAM Z: "+str(iEntityZ(Camera)) )
   iColor( 0, 255, 0 )
   iText( 10, 230, "*ESCAPE KEY TO EXIT" )


'-----------------------------------------------------------------------------
   'iRenderGUI()
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

