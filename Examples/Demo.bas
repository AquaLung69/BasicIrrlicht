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

'#############################################################
'	IMPORT THE BASIC IRRLICHT LIBRARY
'#############################################################
#Include once "..\Libs\BasicIrrlicht.bi"

'#############################################################
'	STARTUP
'#############################################################
'iVSync( TRUE ) ' ENABLE VERTICAL SYNC FOR FULLSCREEN TO AVOID SCREEN TEARING
iAntialias( 2 )
'iGraphics3D( 1366, 768, 32, TRUE )
'iGraphics3D( 1920, 1080, 32, TRUE )' TRUE = FULLSCREEN
iGraphics3D( 1280, 720, 32, FALSE )' FALSE = WINDOWED
'iSetLogLevel( ELL_NONE )
dim ver as string = *iGetVersion()
iAppTitle( "BASIC IRRLICHT TEST WITH FREE BASIC" )
iSeedRand( iMilliSecs() )

'#############################################################
'	LOAD NEW FONT
'#############################################################
dim shared as iFont font
font = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont( font )

'#############################################################
'	LIGHTS
'#############################################################
iAmbientLight( 130, 130, 130 )
dim lightpivot as iEntity = iCreateSphere( 32 )
iScaleEntity( lightpivot, 0.2, 0.2, 0.2 )
iEntityMaterialFlag( lightpivot, EMF_POINTCLOUD, TRUE )
iPositionEntity( lightpivot, 0.0, 10.0, 15.0 )
dim light as iLight = iCreateLight( ELT_SPOT, lightpivot )
iLightColor( light, 255, 0, 0 )
dim light2 as iLight= iCreateLight( ELT_SPOT, lightpivot )
iLightColor( light2, 0, 0, 255 )
iRotateEntity( light2, 0.0, 120.0, 0.0 )
iLightCastShadows( light )
dim light3 as iLight = iCreateLight( ELT_SPOT, lightpivot )
iLightColor( light3, 254, 254, 254 )
iRotateEntity( light3, 0.0, 240.0, 0.0 )

'#############################################################
'	CAMERA
'#############################################################
dim cam as iCamera = iCreateCamera()

'#############################################################
'	ZUMLIN MODEL
'#############################################################
dim zumtex as iTexture = iLoadTexture( "./MEDIA/Zumlin/zafron.pcx" )
dim guntex as iTexture = iLoadTexture( "./MEDIA/Zumlin/w_chaingun.pcx" )
dim zumlin1 as iEntity = iLoadMD2( "./MEDIA/Zumlin/tris.md2" )
iHWAcceleratedMeshEntity( zumlin1, 0 )
dim zumlin2 as iEntity = iCopyEntity( zumlin1 )
iHWAcceleratedMeshEntity( zumlin2, 0 )
dim gun1 as iEntity = iLoadMD2( "./MEDIA/Zumlin/w_chaingun.MD2", zumlin1 )
iHWAcceleratedMeshEntity( gun1, 0 )
iEntityCastShadow( gun1 )
iEntityTexture( zumlin1, zumtex )
iEntityTexture( gun1, guntex )
iPositionEntity( zumlin1, 0.0, 0.0, 75.0 )
dim voice as iSound = iLoadSound( "./MEDIA/Zumlin/pain100_2.ogg" )
dim gun2 as iEntity = iLoadMD2( "./MEDIA/Zumlin/w_machinegun.MD2", zumlin2 )
iHWAcceleratedMeshEntity( gun2, 0 )
iEntityCastShadow( gun2 )
zumtex = iLoadTexture( "./MEDIA/Zumlin/ctf_b.pcx" )
guntex = iLoadTexture( "./MEDIA/Zumlin/w_machinegun.pcx" )
iEntityTexture( zumlin2, zumtex )
iEntityTexture( gun2, guntex )
iEntityMaterialType( zumlin2, EMT_SPHERE_MAP )
iPositionEntity( zumlin2, 50.0, 0.0, 75.0 )
iTurnEntity( zumlin2, 0.0, 90.0, 0.0 )
iPlayMD2Animation( zumlin2, EMAT_STAND )
iPlayMD2Animation( gun2, EMAT_STAND )
dim shadow1 as iEntity = iEntityCastShadow( zumlin1 )
dim shadow2 as iEntity = iEntityCastShadow( zumlin2 )
iEntityShininess( zumlin1, 255.0 )
iEntityShininess( zumlin2, 255.0 )
dim outline as Boolean = false

'#############################################################
'	CUBE
'#############################################################
dim cube as iEntity = iCreateCube()
dim cubetex as iTexture = iLoadTexture( "./MEDIA/default_texture.png" )
iEntityTexture( cube, cubetex )
iPositionEntity( cube, -25.0, 0.0, 50.0 )
iRotateEntity( cube, 23.5, 0, 0 )
dim shadow3 as iEntity = iEntityCastShadow( cube )

'#############################################################
'	WALL
'#############################################################
dim wall as iEntity = iCreateCube()
dim walltex as iTexture = iLoadTexture( "./MEDIA/brick-wa.jpg" )
iEntityTexture( wall, walltex )
iScaleEntity( wall, 35, 15, 0.1 )
iScaleEntityTexture( wall, 4.0, 2.0 )
iPositionEntity( wall, 0.0, 4.0, 140.0 )

'#############################################################
'	MUSIC
'#############################################################
dim bgm as iSOUND = iPlayMusic( "./MEDIA/IrrlichtTheme.ogg" )
iSoundLoop( bgm )
dim channel as iSOUND

'#############################################################
'	LOGO'S
'#############################################################
dim Logo as iTexture  = iLoadTexture( "./MEDIA/IrrlichtLogo.png" )
dim biLogo as iTexture = iLoadTexture( "./MEDIA/bi_logo.png" )
dim RN_Logo as iTexture = iLoadTexture( "./MEDIA/RakNetLogo.jpg" )
dim GL_Logo as iTexture = iLoadTexture( "./MEDIA/opengl_logo.jpg" )
dim IK_Logo as iTexture = iLoadTexture( "./MEDIA/irrklang_small.png" )

'#############################################################
'	SKYDOME
'#############################################################
dim skytex as iTexture = iLoadTexture( "./MEDIA/skydome.jpg" )
dim skydome as iEntity = iCreateSkydome( skytex )



'#############################################################
'	MAIN LOOP
'#############################################################
dim mytimer as Integer = iMilliSecs()
dim animation as EMD2_ANIMATION_TYPE = EMAT_STAND
dim LFPS as Integer = 0
dim Lfps_count as Integer = 0
dim fps_time as Integer = iMilliSecs()
dim LogicFPS as uInteger = 60
dim FramePeriod as Integer = 1000 / LogicFPS
dim FrameTime as Integer = iMilliSecs() - FramePeriod
dim FrameElapsed as Integer = 0
dim FrameLimit as Integer = 0
dim FrameTicks as Integer = 0

iFadeIn( 3000 )
while( iRun() and (not iKeyHit( KEY_ESCAPE )) ):
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
        iTurnEntity( lightpivot, 0.0, 2.5, 0.0 )
        iTurnEntity( zumlin1, 0.0, -1.5, 0.0 )
        'iTurnEntity( zumlin2, 0.0, 1.5, 0.0 )
        iTurnEntity( cube, 0.0, 2.0, 0.0 )
        iTurnEntity( skydome, 0.0, 0.1, 0.0 )
    next
'-----------------------------------------------------------------------------
'	CODE NOT AFFECTED BY FRAME TIME HERE
'-----------------------------------------------------------------------------
    if iMilliSecs() > mytimer+1800 then
        mytimer = iMilliSecs()
        if animation = EMAT_STAND then
            animation = EMAT_POINT
            channel = iPlaySound( voice )
            iSoundVolume( channel, 0.3 )
            'iEntityMaterialFlag( zumlin2, EMF_WIREFRAME, TRUE )
            'iHideEntity( shadow2 )
            outline = true
        else:
            animation = EMAT_STAND
            'iEntityMaterialFlag( zumlin2, EMF_WIREFRAME, FALSE )
            'iShowEntity( shadow2 )
            outline = false
        end if
        iPlayMD2Animation( zumlin1, animation )
        iPlayMD2Animation( gun1, animation )
    end if
    
'-----------------------------------------------------------------------------
    iUpdateScene()    
    iRenderScene()
    if outline then iOutlineMesh( zumlin2, 5.0, 0, 50, 150 )

'-----------------------------------------------------------------------------	
'	2D STUFF AFTER EVERY 3D RENDER
'-----------------------------------------------------------------------------
    iDrawTexture( IK_Logo, 40, iGraphicsHeight() - iTextureHeight( Logo ) - iTextureHeight( RN_Logo ) - iTextureHeight( IK_Logo ) - 30 )
    iDrawTexture( RN_Logo, 30, iGraphicsHeight() - iTextureHeight( Logo ) - iTextureHeight( RN_Logo )- 20 )
    iDrawTexture( Logo, 10, iGraphicsHeight() - iTextureHeight( Logo )- 10 )
    iDrawTexture( GL_Logo, iGraphicsWidth() - (40 + iTextureWidth( GL_Logo ) ), iGraphicsHeight() - iTextureHeight( GL_Logo ) - iTextureHeight( Logo )- 10 )
    iDrawTexture( biLogo, iGraphicsWidth() - (10 + iTextureWidth( biLogo ) ), iGraphicsHeight() - iTextureHeight( Logo ) )	
    iColor(255,255,0,200)
    iText(10,10,  "THIS IS A BASIC IRRLICHT TEST WITH FREE BASIC")
    iText(10,50, "PRIMITIVES RENDERED: "+str( iTrisRendered() ) )
    iText(10,70,  "ENGINE FPS: "+str( iFPS() ) )
    iText(10,90,  "LOGIC FPS: "+str( LFPS ))
    iText(10,130,  "BASIC IRRLICHT "+ver+" contains the following:")
    iText(10,150, " IRRLICHT3D for OPENGL 2D & 3D GRAPHICS")
    iText(10,170, " IRRKLANG for 2D & 3D SOUND")
    iText(10,190, " RAKNET for NETWORK PLAY")
    iColor(0,255,0)
    iText(10,230, "*ESCAPE KEY TO EXIT")

'-----------------------------------------------------------------------------
    iRenderGUI()
    iFlip()
    if iKeyHit( KEY_F12 ) then
        iScreenShot()
    end if
'    if( iKeyHit( KEY_ESCAPE ) ):
'        break;
wend
'#############################################################
'	END
'#############################################################
iEndGraphics()
end

