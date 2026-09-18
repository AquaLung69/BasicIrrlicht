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

iVSync( false )
iAntialias( 16 )
iGraphics3D( 1280, 720, 32, false )
iAppTitle( "SHADER MATERIAL" )
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont(myfont )
dim cam as iCamera = iCreateFPSCamera( 200, 0.0 )
iPositionEntity( Cam, 0, 0, 200 )

DIM ShaderEntity as iENTITY
DIM NoShaderEntity as iENTITY
DIM EntityTexture as iTEXTURE
DIM Material as iMATERIAL
DIM Light as iENTITY
DIM EmittedLevel as uinteger = 0
DIM EmittedDirection as integer = 1
DIM vert_shader as iSHADER ptr = NULL
DIM MeshTexture as iTEXTURE
DIM LightLevel(0 to 3) as single = { 1.0, 0.0, 1.0, 1.0 }
DIM change as single = 0.01

' -----------------------------------------------------------------------------
' SKYBOX
' -----------------------------------------------------------------------------
dim SKUP as iTexture = iLoadTexture( "Media/irrlicht2_UP.jpg" )
dim SKDN as iTexture = iLoadTexture( "Media/irrlicht2_DN.jpg" )
dim SKLF as iTexture = iLoadTexture( "Media/irrlicht2_LF.jpg" )
dim SKRT as iTexture = iLoadTexture( "Media/irrlicht2_RT.jpg" )
dim SKFR as iTexture = iLoadTexture( "Media/irrlicht2_FT.jpg" )
dim SKBK as iTexture = iLoadTexture( "Media/irrlicht2_BK.jpg" )
dim sky as iEntity = iCreateSkybox( SKUP, SKDN, SKLF, SKRT, SKFR, SKBK )
iEntityMaterialFlag( sky, EMF_FOG_ENABLE, false )
iEntityMaterialFlag( sky, EMF_LIGHTING, true )


MeshTexture = iLoadTexture( "media/Sky/SKDN.bmp" )
ShaderEntity = iCreateSphere( 64 )
iScaleEntity( ShaderEntity, 12.0, 12.0, 12.0 )
iPositionEntity( ShaderEntity, -80, 0, 0 )
NoShaderEntity = iCreateSphere( 64 )
iScaleEntity( NoShaderEntity, 12.0, 12.0, 12.0 )
iPositionEntity( NoShaderEntity, 80, 0, 0 )
iEntityMaterialFlag( NoShaderEntity, EMF_LIGHTING, true )

Light = iCreateLight( ELT_POINT )
dim spot as iENTITY = iCreateSphere( 16, Light )
iEntityColor( spot, 255 ,255, 0 )
iPositionEntity( Light, -150, 120, 50 )
iLightRadius( Light, 300.0 )
iLightColor( Light, 155, 155, 155 )
iAmbientLight( 50, 50, 50 )


vert_shader = iLoadShaderMaterial( "media/Shaders/arb_example_vert.txt", NULL, EMT_SOLID )
if vert_shader <> 0 then
    ' set up shader constants for the example vertex shader provided with Irrlicht
    ' most of the parameters are based on the small number of preset constants
    ' built into the wrapper library
    iCreateAddressedVSC( vert_shader, 0, INVERSE_WORLD, NULL, 0 )
    iCreateAddressedVSC( vert_shader, 4, WORLD_VIEW_PROJECTION, NULL, 0 )
    iCreateAddressedVSC( vert_shader, 8, CAMERA_POSITION, NULL, 0 )
    iCreateAddressedVSC( vert_shader, 9, NO_PRESET, @LightLevel(0), 4 )
    iCreateAddressedVSC( vert_shader, 10, TRANSPOSED_WORLD, NULL, 0 )

    ' apply the shader to one of the objects
    iEntityShaderMaterialType( ShaderEntity, vert_shader->material_type )
    iEntityTexture( ShaderEntity, MeshTexture, 0 )

    ' apply a preset material to the other for comparison
    iEntityMaterialType( NoShaderEntity, EMT_SOLID )
    iEntityTexture( NoShaderEntity, MeshTexture, 0 )
    iEntityMaterialFlag( NoShaderEntity, EMF_LIGHTING, true )
else
    print "No shader returned"
end if

iHidePointer()

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
      LightLevel(1) += change
      if LightLevel(1) < 0.0 then
          LightLevel(1) = 0.0
          change = 0.01
      elseif LightLevel(1) > 2.0 then
          LightLevel(1) = 2.0
          change = -0.01
      end if


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
   iText(10,90, "*ESCAPE KEY TO EXIT")


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

