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
iGraphics3D( 1280, 720, 32, FALSE )
iAppTitle( "Render to a texture with mirror" )
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont(myfont )
iSetGadgetFont( MyFont )
dim cam as iCamera = iCreateCamera()

DIM Zumlin as iMESH
DIM Weapon as iMESH
DIM ZumTexture as iTEXTURE
DIM WeapTexture as iTEXTURE
DIM RenderTexture as iTEXTURE
DIM Cube as iENTITY
DIM StaticCamera as iCAMERA
DIM FPSCamera as iCAMERA

iColor( 255, 0, 0 )
iStaticText( "Zumlin Credit: Rowan Crawford", 605, 5, 940, 32 )
iColor( 0, 100, 255 )
iStaticText( "BASIC IRRLICHT", 605,50,760,64 )

RenderTexture = iCreateRenderTexture( 256, 256 )
iStaticImage( RenderTexture, 0, iGraphicsHeight() - iTextureHeight( RenderTexture ) )

Cube = iCreateCube()
iScaleEntity( Cube, 2, 2, 2 )
iPositionEntity( Cube, 0, 0, 100 )
iEntityTexture( Cube, RenderTexture, 0 )
iEntityMaterialFlag( Cube, EMF_LIGHTING, false )
'iEntityMaterialType( Cube, EMT_TRANSPARENT_ADD_COLOR )
iRotationAnimator( Cube, 0, 0.5, 0 )

Zumlin = iLoadMD2( "media/Zumlin/tris.md2" )
ZumTexture = iLoadTexture( "media/Zumlin/zafron.pcx" )
iEntityTexture( Zumlin, ZumTexture, 0 )
iEntityMaterialFlag( Zumlin, EMF_LIGHTING, false )
iPlayMD2Animation( Zumlin, EMAT_STAND )
Weapon = iLoadMD2( "media/Zumlin/w_blaster.md2" )
WeapTexture = iLoadTexture( "media/Zumlin/w_blaster.pcx" )
iEntityTexture( Weapon, WeapTexture, 0 )
iPlayMD2Animation( Weapon, EMAT_STAND )

StaticCamera = iCreateCamera()
iPositionEntity( StaticCamera, 50, 0, 0 )

FPSCamera = iCreateFPSCamera( 100.0, 0.1, 0 )
iPositionEntity( FPSCamera, 40, 0, 110 )
iCameraTarget( FPSCamera, 0,0,80 )

dim RenderTexture2 as iTEXTURE = iCreateRenderTexture( 256, 256 )
dim mirror as iENTITY = iCreateMirror( FPSCamera, RenderTexture2 )
iRotateEntity( mirror, 0, -130, 0 )
iPositionEntity( mirror, -100, 0, -80 )

iHidePointer()
iAmbientLight( 200, 200, 200 )
iColor( 255, 0, 0, 255 )


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
      iSetActiveCamera( StaticCamera )
      iCLSColor( 200, 50, 250, 50 )
      iRenderToTexture( RenderTexture )

      iSetActiveCamera ( FPSCamera )
      iCLSColor( 200, 200, 255, 255 )


   next
'-----------------------------------------------------------------------------
'  CODE NOT AFFECTED BY FRAME TIME HERE
'-----------------------------------------------------------------------------


'-----------------------------------------------------------------------------
   iMirrorReflect( mirror )
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

