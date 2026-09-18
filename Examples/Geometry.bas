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
iAntialias( 16 )
iGraphics3D( 1280, 720, 32, FALSE )
'iSetLogLevel( ELL_NONE )
iAppTitle( "GEOMETRY TEST FREEBASIC" )
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont(myfont )

dim cam as iCamera = iCreateCamera()
iCLSColor( 100, 100, 150 )
iAmbientLight( 130, 130, 130 )
dim pivot as iEntity = iCreatePivot()
iEntityParent( cam, pivot )
iPositionEntity( cam, 0.0, 10.0, -30.0 )
iPositionEntity( pivot, 0.0, 20.0, -50.0 )

dim lightpivot as iEntity = iCreatePivot()
dim light as iLight = iCreateLight( ELT_SPOT, lightpivot )
dim lightsphere as iEntity = iCreateSphere( 8, light )
iEntityMaterialFlag( lightsphere, EMF_LIGHTING, FALSE )
iScaleEntity( lightsphere, 0.2, 0.2, 0.2 )
iPositionEntity( light, 0, 50, -50 )
iRotateEntity( light, 45, 0, 0 )
iLightCastShadows( light )
iRotationAnimator( lightpivot, 0.0, -2.0, 0.0 )

dim GeoResolution as Integer = 32
dim cube as iEntity = iCreateCube()
iEntityColor( cube, 0, 0 ,255 )
dim sphere as iEntity = iCreateSphere( GeoResolution )
iEntityColor( sphere, 0, 255 ,0 )
dim cylinder as iEntity = iCreateCylinder( GeoResolution )
iEntityColor( cylinder, 255, 255 ,0 )
dim cone as iEntity = iCreateCone( GeoResolution )
iEntityColor( cone, 255, 0 ,0 )
dim plane as iEntity = iCreatePlane()
iEntityColor( plane, 0, 80, 80 )

iPositionEntity( cube, 0, 0, 0 )
iPositionEntity( cylinder, 0, 10, 0 )
iPositionEntity( sphere, 0, 10, 0 )
iPositionEntity( cone, 0, 10, 0 )
iPositionEntity( plane, 0, -5, 0 )
iEntityParent( cylinder, cube )
iEntityParent( sphere, cylinder )
iEntityParent( cone, sphere )
iEntityCastShadow( cone )
iEntityCastShadow( sphere )
iEntityCastShadow( cylinder )
iEntityCastShadow( cube )
'iEntityMaterialFlag( cone, EMF_WIREFRAME, TRUE )
'iEntityMaterialFlag( sphere, EMF_WIREFRAME, TRUE )
'iEntityMaterialFlag( cylinder, EMF_WIREFRAME, TRUE )
'iEntityMaterialFlag( cube, EMF_WIREFRAME, TRUE )
'iEntityMaterialFlag( plane, EMF_WIREFRAME, TRUE )

dim expd as single = 0.0
dim dx as single = 0.4

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
'     CODE LOGIC AFFECTED BY FRAME TIME HERE
'-----------------------------------------------------------------------------
      if expd > 10.0 then
         dx = -0.4
      elseif expd < 0.0 then
         dx = 0.4
      end if
      expd = expd + dx
   
   
   next
'-----------------------------------------------------------------------------
'  CODE NOT AFFECTED BY FRAME TIME HERE
'-----------------------------------------------------------------------------
   iPositionEntity( cone, 0.0, 9.0 - (expd), 0.0 )
   iPositionEntity( sphere, 0.0, 9.0 - (expd), 0.0 )
   iPositionEntity( cylinder, 0.0, 9.0 - (expd), 0.0 )



'-----------------------------------------------------------------------------
   iUpdateScene()    
   iRenderScene()
'-----------------------------------------------------------------------------	
'	2D STUFF AFTER EVERY 3D RENDER
'-----------------------------------------------------------------------------
   iColor( 255, 255, 255 )
   iText(10,10,  "MAIN LOOP FPS: "+str( iFPS() ))
   iText(10,30,  "LOGIC FPS: "+str( LFPS ))
   iText(10,50,  "PRIMITIVES RENDERED: "+str( iTrisRendered() ) )
   iColor( 0, 255, 0 )
   iText(10,230, "*ESCAPE KEY TO EXIT")

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
