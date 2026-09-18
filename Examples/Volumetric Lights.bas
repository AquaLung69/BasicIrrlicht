'	.----.  .--.  .----.-.----.           
'	| {_} }/ {} \{ {__-{ | }`-'
'	| {_} /  /\  .-._} | | },-.           
'	.-.---..---..-.--.-.----.-. .-.-----. 
'	{ } }}_} }}_} |  { | }`-{ {_} `-' '-'
'	| | } \| } \} '--| | }, -| { } } } {
'	`-`-' - '`-' - '`----`-`----`-' `-' `-'
'----------------------------------------------------------------------------
'	GAME_TEMPLATE by EM ENGINEERING LLC ©2019-2024
'----------------------------------------------------------------------------
' This software is provided 'as - is', without any express Or implied
' warranty.  In no event will the author(s) be held liable For any damages
' arising from the use of this software.
'----------------------------------------------------------------------------

'##############################################################
'#	IMPORT LIBRARY'S
'##############################################################
#Include once "..\Libs\BasicIrrlicht.bi"

dim shared Exit_App as boolean = false
DIM SHARED GFX_WIDTH AS UINTEGER : GFX_WIDTH = 1366
DIM SHARED GFX_HEIGHT AS UINTEGER : GFX_HEIGHT = 768

'-------------------------------------------------------------
'	START ENGINE
'-------------------------------------------------------------
iVSync( TRUE )
'iAntialias( 2 )
iGraphics3D( GFX_WIDTH, GFX_HEIGHT, 32, FALSE )
iAppTitle( "VOLUMETRIC LIGHT" )

'-------------------------------------------------------------
'	LOAD FONT
'-------------------------------------------------------------
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont( myfont )
iSetGadgetFont( myfont )

'-------------------------------------------------------------
'	CREATE A CAMERA
'-------------------------------------------------------------
dim Camera as iCamera = iCreateFPSCamera(100, .1)
iCLSColor( 0, 0, 0 )

'-------------------------------------------------------------
'	SOME NET STUFF FOR THE MENU SYSTEM
'-------------------------------------------------------------
dim shared net_select as uinteger = 0
DIM SHARED PlayerName AS string
	PlayerName = "PLAYER-"+STR(iRAND( 100, 999) )
DIM SHARED ServerName AS string
	ServerName = "GAME_SERVER"
DIM SHARED MaxPlayers AS UINTEGER
	MaxPlayers = 10
DIM SHARED IP AS STRING
	IP = "127.0.0.1"
DIM SHARED Server_Port AS UINTEGER
	Server_Port = 5009

'-------------------------------------------------------------
'	MISC
'-------------------------------------------------------------
iAmbientLight( 130, 130, 130 )
dim pivot as iEntity = iCreatePivot()
iEntityParent( Camera, pivot )
iPositionEntity( Camera, 0.0, 25.0, -20.0 )

'-------------------------------------------------------------
'	Volumetric Light
'-------------------------------------------------------------
dim VolLight as iLIGHT = iCreateVolumetricLight( 255, 242, 0, 240, 134, 80 )', T_PLAYER_LIST( 0 ).gunOrb )
iScaleEntity( VolLight, 15, 15, 15 )
iEntityColor( VolLight, 255, 200, 0 )
iPositionEntity( VolLight, 0, 0, 0 )
iEntityMaterialFlag( VolLight, EMF_BACK_FACE_CULLING, false )

'dim shared tex as iTEXTURE
'tex = iLoadTexture( "Media/GFX/sun.tga" )
'iEntityTexture( VolLight, tex )

iTextureAnimator( VolLight, "Media/portal", ".bmp", 5, 30, True )
'iTextureAnimator( VolLight, "Media/GFX/lava/lava_0", ".png", 32, 30, True )
'iTextureAnimator( VolLight, "Media/GFX/water/water", ".png", 32, 30, True )

iEntityMaterialType( VolLight, EMT_TRANSPARENT_ALPHA_CHANNEL_REF )	'EMT_TRANSPARENT_ADD_COLOR  EMT_TRANSPARENT_ALPHA_CHANNEL
iRotationAnimator( VolLight, 0, 15, 0 )


'#############################################################
'	MAIN LOOP
'#############################################################
dim LFPS as Integer = 0
dim Lfps_count as Integer = 0
dim fps_time as Integer = iMilliSecs()
dim LogicFPS as uInteger = 6
dim FramePeriod as Integer = 1000 / LogicFPS
dim FrameTime as Integer = iMilliSecs() - FramePeriod
dim FrameElapsed as Integer = 0
dim FrameLimit as Integer = 0
dim FrameTicks as Integer = 0

while( iRun() and (not Exit_App) ):
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
		'iPositionTexture( tex, iRAND( 1, 5 ), iRAND( 1, 5 ) )
		'iScaleEntity( VolLight, SIN( iMillisecs() * 0.005)*45, 10, sin( iMillisecs() * 0.005)*45 )

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
   iText( 10, 10,  "ENGINE FPS: "+str( iFPS() ) )
   iText( 10, 30,  "LOGIC FPS: "+str( LFPS ) )
	iText( 10, 50, "ENGINE RUNTIME: " + STR(iRuntime()) )
   iText( 10, 70,  "PRIMITIVES RENDERED: "+str( iTrisRendered() ) )
   iColor( 0, 255, 0 )
   iText(10,230, "*ESCAPE KEY TO EXIT")

'-----------------------------------------------------------------------------
   iRenderGUI()
   iFlip()
   if iKeyHit( KEY_F12 ) then
      iScreenShot()
   end if

   if iKeyHit( KEY_ESCAPE ) then
      Exit_App = true
   end if
	
wend
'#############################################################
'	END
'#############################################################
iEndGraphics()
end

