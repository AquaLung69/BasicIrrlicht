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
iAppTitle( "BUMP MAPPING" )
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont(myfont )
dim cam as iCamera = iCreateCamera()

DIM ModelMesh as iMESH
DIM DiffuseTexture as iTEXTURE
DIM BumpTexture as iTEXTURE
DIM EntityNormal as iENTITY
DIM EntityParallax as iENTITY
DIM OurCamera as iCAMERA
DIM Light as iENTITY

ModelMesh = iGetEntityMesh( iCreateSphere( 64 ) )'iLoadMesh( "media/sphere.obj" )
iScaleMesh( ModelMesh, 2.5, 2.5, 2.5 )
DiffuseTexture = iLoadTexture( "media/Earth.jpg" )
BumpTexture = iLoadTexture( "media/earthbump.bmp" )
iNormalMapTexture( BumpTexture, 9.0 )

EntityNormal = iStaticMeshForNormalMapping( ModelMesh )
iPositionEntity( EntityNormal, -15, 0, 30 )
EntityParallax = iStaticMeshForNormalMapping( ModelMesh )
iPositionEntity( EntityParallax, 15, 0, 30 )
 
iEntityMaterialType ( EntityNormal, EMT_NORMAL_MAP_SOLID )
iEntityMaterialType ( EntityParallax, EMT_PARALLAX_MAP_SOLID )
iEntityMaterialFlag( EntityNormal, EMF_LIGHTING, true )
iEntityMaterialFlag( EntityParallax, EMF_LIGHTING, true )

iEntityTexture( EntityNormal, DiffuseTexture, 0 )
iEntityTexture( EntityNormal, BumpTexture, 1 )
iEntityTexture( EntityParallax, DiffuseTexture, 0 )
iEntityTexture( EntityParallax, BumpTexture, 1 )

iRotationAnimator( EntityNormal, 0, 0.3, 0 )
iRotationAnimator( EntityParallax, 0, 0.3, 0 )

Light = iCreateLight( ELT_POINT )
iPositionEntity( Light, 00, 100, -50 )
iLightColor( Light, 250, 40, 40 )
iLightRadius( Light, 600.0 )
iFlyCircleAnimator( Light, 0,0,0, 100, 0.002 )
iAmbientLight( 255, 255, 255 )

iHidePointer()
'iCameraCLSColor( 128, 128, 128 )

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
   iText( iGraphicsWidth()/3.4, 30, "NORMAL_MAP", true )
   iText( iGraphicsWidth()/1.4, 30, "PARALLAX_MAP", true )
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

