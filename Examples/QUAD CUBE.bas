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

'iVSync( TRUE )
'iAntialias( 2 )
iGraphics3D( 1366, 768, 32, FALSE )
iAppTitle( "QUAD CUBE" )
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont(myfont )
dim cam as iCamera = iCreateCamera()
iCLSColor( 100, 100, 100 )

dim BK as iTexture = iLoadTexture( "Media/irrklang_small.png" )
dim FR as iTexture = iLoadTexture( "Media/IrrlichtLogo.png" )
dim LF as iTexture = iLoadTexture( "Media/RakNetLogo.jpg" )
dim RT as iTexture = iLoadTexture( "Media/opengl_logo.jpg" )
dim TP as iTexture = iLoadTexture( "Media/RakNetLogo.jpg" )
dim BT as iTexture = iLoadTexture( "Media/opengl_logo.jpg" )

dim cubepivotbase as iENTITY = iCreatePivot()
dim cubepivot as iENTITY = iCreatePivot( cubepivotbase )
dim quad_BK as iENTITY = iCreateQuad( 5, cubepivot )
dim quad_FR as iENTITY = iCreateQuad( 5, cubepivot )
dim quad_RT as iENTITY = iCreateQuad( 5, cubepivot )
dim quad_LF as iENTITY = iCreateQuad( 5, cubepivot )
dim quad_TP as iENTITY = iCreateQuad( 5, cubepivot )
dim quad_BT as iENTITY = iCreateQuad( 5, cubepivot )


iEntityTexture( quad_FR, FR )
iRotateEntity( quad_FR, -90, 180, 0 )
iPositionEntity( quad_FR, 0, 0, 2.5 )

iEntityTexture( quad_BK, BK )
iRotateEntity( quad_BK, -90, 0, 0 )
iPositionEntity( quad_BK, 0, 0, -2.5 )

iEntityTexture( quad_RT, RT )
iRotateEntity( quad_RT, -90, -90, 0 )
iPositionEntity( quad_RT, 2.5, 0, 0 )

iEntityTexture( quad_LF, LF )
iRotateEntity( quad_LF, -90, 90, 0 )
iPositionEntity( quad_LF, -2.5, 0, 0 )

iRotateEntity( quad_TP, 0, 0, 0 )
iPositionEntity( quad_TP, 0, 2.5, 0 )

iRotateEntity( quad_BT, 180, 0, 0 )
iPositionEntity( quad_BT, 0, -2.5, 0 )

iPositionEntity( cubepivotbase, 0 , 0, 20 )
iRotationAnimator( cubepivot, 1, 2, 0 )
iRotateEntity( cubepivotbase, 45, 0, 0 )

iEntityColor( quad_TP, 0, 255, 0 )
iEntityColor( quad_BT, 255,0, 0 )
'iWriteMesh( cubepivot, EMWT_IRR_MESH, "Cube.irrm" )
'iScaleEntity( sky, -5, -5, -5 )
'iFlipEntityMesh( sky )

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
		'iTurnEntity( cubepivot, 0, 0, 1 )


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
   iText(10,10,  "ENGINE FPS: "+str( iFPS() ))
   iText(10,30,  "LOGIC FPS: "+str( LFPS ))
   iText(10,50,  "PRIMITIVES RENDERED: "+str( iTrisRendered() ) )
   iColor( 0, 255, 0 )
   iText(10,230, "*ESCAPE KEY TO EXIT")


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

