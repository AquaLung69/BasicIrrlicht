#	.----.  .--.  .----.-.----.           
#	| {_} }/ {} \{ {__-{ | }`-'
#	| {_} /  /\  .-._} | | },-.           
#	.-.---..---..-.--.-.----.-. .-.-----. 
#	{ } }}_} }}_} |  { | }`-{ {_} `-' '-'
#	| | } \| } \} '--| | }, -| { } } } {
#	`-`-' - '`-' - '`----`-`----`-' `-' `-'
#----------------------------------------------------------------------------
#	Basic-Irrlicht Wrapper by EM ENGINEERING LLC ©2019-2024
#----------------------------------------------------------------------------
# This software is provided 'as - is', without any express Or implied
# warranty.  In no event will the author(s) be held liable For any damages
# arising from the use of this software.
#----------------------------------------------------------------------------

##############################################################
#	IMPORT THE BASIC IRRLICHT LIBRARY
##############################################################
import sys
sys.path.append('../Libs') 
from basicirrlicht import *

##############################################################
#	STARTUP
##############################################################
iVSync( TRUE ) # ENABLE VERTICAL SYNC FOR FULLSCREEN TO AVOID SCREEN TEARING
iAntialias( 8 )
#iGraphics3D( 1366, 768, 32, TRUE )
#iGraphics3D( 1920, 1080, 32, TRUE )# TRUE = FULLSCREEN
iGraphics3D( 1280, 720, 32, FALSE )# FALSE = WINDOWED
#iSetLogLevel( ELL_NONE )
ver = iGetVersion()
iAppTitle( "BASIC IRRLICHT TEST WITH PYTHON SCRIPT" )
iSeedRand( iMilliSecs() )

##############################################################
#	LOAD NEW FONT
##############################################################
font = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont( font )

##############################################################
#	LIGHTS
##############################################################
iAmbientLight( 130, 130, 130 )
lightpivot = iCreateSphere( 32 )
iScaleEntity( lightpivot, 0.2, 0.2, 0.2 )
iEntityMaterialFlag( lightpivot, EMF_POINTCLOUD, TRUE )
iPositionEntity( lightpivot, 0.0, 10.0, 15.0 )
light = iCreateLight( ELT_SPOT, lightpivot )
iLightColor( light, 255, 0, 0 )
light2 = iCreateLight( ELT_SPOT, lightpivot )
iLightColor( light2, 0, 0, 255 )
iRotateEntity( light2, 0.0, 120.0, 0.0 )
iLightCastShadows( light )
light3 = iCreateLight( ELT_SPOT, lightpivot )
iLightColor( light3, 254, 254, 254 )
iRotateEntity( light3, 0.0, 240.0, 0.0 )

##############################################################
#	CAMERA
##############################################################
cam = iCreateCamera()

##############################################################
#	ZUMLIN MODEL
##############################################################
zumtex = iLoadTexture( "./MEDIA/Zumlin/zafron.pcx" )
guntex = iLoadTexture( "./MEDIA/Zumlin/w_chaingun.pcx" )
zumlin1 = iLoadMD2( "./MEDIA/Zumlin/tris.md2" )
iHWAcceleratedMeshEntity( zumlin1, 0 )
zumlin2 = iCopyEntity( zumlin1 )
iHWAcceleratedMeshEntity( zumlin2, 0 )
gun1 = iLoadMD2( "./MEDIA/Zumlin/w_chaingun.MD2", zumlin1 )
iHWAcceleratedMeshEntity( gun1, 0 )
iEntityTexture( zumlin1, zumtex )
iEntityTexture( gun1, guntex )
iPositionEntity( zumlin1, 0.0, 0.0, 65.0 )
voice = iLoadSound( "./MEDIA/Zumlin/pain100_2.ogg" )
gun2 = iLoadMD2( "./MEDIA/Zumlin/w_machinegun.MD2", zumlin2 )
iHWAcceleratedMeshEntity( gun2, 0 )
zumtex = iLoadTexture( "./MEDIA/Zumlin/ctf_b.pcx" )
guntex = iLoadTexture( "./MEDIA/Zumlin/w_machinegun.pcx" )
iEntityTexture( zumlin2, zumtex )
iEntityTexture( gun2, guntex )
iEntityMaterialType( zumlin2, EMT_SPHERE_MAP )
iPositionEntity( zumlin2, 50.0, 0.0, 65.0 )
iTurnEntity( zumlin2, 0.0, 90.0, 0.0 )
iPlayMD2Animation( zumlin2, EMAT_STAND )
iPlayMD2Animation( gun2, EMAT_STAND )
shadow1 = iEntityCastShadow( zumlin1 )
shadow2 = iEntityCastShadow( zumlin2 )
iEntityCastShadow( gun1 )
iEntityCastShadow( gun2 )
iEntityShininess( zumlin1, 255.0 )
iEntityShininess( zumlin2, 255.0 )
outline = FALSE

##############################################################
#	CUBE
##############################################################
cube = iCreateCube()
cubetex = iLoadTexture( "./MEDIA/default_texture.png" )
iEntityTexture( cube, cubetex, 0  )
iPositionEntity( cube, -25.0, 0.0, 50.0 )
iRotateEntity( cube, 23.5, 0, 0 )
shadow3 = iEntityCastShadow( cube )

##############################################################
#	WALL
##############################################################
wall = iCreateCube()
walltex = iLoadTexture( "./MEDIA/brick-wa.jpg" )
iEntityTexture( wall, walltex )
iScaleEntity( wall, 35, 15, 0.1 )
iScaleEntityTexture( wall, 4.0, 2.0 )
iPositionEntity( wall, 0.0, 4.0, 140.0 )

##############################################################
#	MUSIC
##############################################################
bgm = iPlayMusic( "./MEDIA/IrrlichtTheme.ogg" )
iSoundLoop( bgm )

##############################################################
#	LOGO'S
##############################################################
Logo  = iLoadTexture( "./MEDIA/IrrlichtLogo.png" )
biLogo = iLoadTexture( "./MEDIA/bi_logo.png" )
RN_Logo = iLoadTexture( "./MEDIA/RakNetLogo.jpg" )
GL_Logo = iLoadTexture( "./MEDIA/opengl_logo.jpg" )
IK_Logo = iLoadTexture( "./MEDIA/irrklang_small.png" )

##############################################################
#	SKYDOME
##############################################################
skytex = iLoadTexture( "./MEDIA/skydome.jpg" )
skydome = iCreateSkydome( skytex )

##############################################################
#	MAIN LOOP
##############################################################
timer = iMilliSecs()
animation = EMAT_STAND
LFPS = 0
Lfps_count = 0
fps_time = iMilliSecs()
LogicFPS = 60
FramePeriod = 1000 / LogicFPS
FrameTime = iMilliSecs() - FramePeriod
FrameElapsed = 0

iFadeIn( 3000 )
while( iRun() ):
#-----------------------------------------------------------------------------
#	CALCULATE FPS EACH FRAME
#-----------------------------------------------------------------------------
    if( iMilliSecs() - fps_time >= 1000 ):
        LFPS = Lfps_count ; Lfps_count = 0 ; fps_time = iMilliSecs()
#-----------------------------------------------------------------------------
#	FRAME TIMER TO KEEP GAME LOGIC IN SYNC
#-----------------------------------------------------------------------------
    while( TRUE ):
        FrameElapsed = iMilliSecs() - FrameTime
        if(FrameElapsed):
            break;
    FrameTicks = int( FrameElapsed / FramePeriod )
    for FrameLimit in range( FrameTicks ):
        FrameTime = FrameTime + FramePeriod ; Lfps_count += 1
#-----------------------------------------------------------------------------
#	    CODE LOGIC AFFECTED BY FRAME TIME AT THIS INDENT
#-----------------------------------------------------------------------------
        iTurnEntity( lightpivot, 0.0, 2.5, 0.0 )
        iTurnEntity( zumlin1, 0.0, -1.5, 0.0 )
        #iTurnEntity( zumlin2, 0.0, 1.5, 0.0 )
        iTurnEntity( cube, 0.0, 2.0, 0.0 )
        iTurnEntity( skydome, 0.0, 0.1, 0.0 )

#-----------------------------------------------------------------------------
#	CODE NOT AFFECTED BY FRAME TIME AT THIS INDENT
#-----------------------------------------------------------------------------
    if( iMilliSecs() > timer+1800 ):
        timer = iMilliSecs()
        if( animation == EMAT_STAND ):
            animation = EMAT_POINT
            channel = iPlaySound( voice )
            iSoundVolume( channel, 0.3 )
            iEntityMaterialFlag( zumlin2, EMF_WIREFRAME, TRUE )
            iHideEntity( shadow2 )
            outline = TRUE
        else:
            animation = EMAT_STAND
            iEntityMaterialFlag( zumlin2, EMF_WIREFRAME, FALSE )
            iShowEntity( shadow2 )
            outline = FALSE
        
        iPlayMD2Animation( zumlin1, animation )
        iPlayMD2Animation( gun1, animation )

#-----------------------------------------------------------------------------
    iUpdateScene()    
    iRenderScene()
    if (outline): iOutlineMesh( zumlin2, 2.0, 0, 50, 150 )
#-----------------------------------------------------------------------------	
#	2D STUFF AFTER EVERY 3D RENDER
#-----------------------------------------------------------------------------
    iDrawTexture( IK_Logo, 40, iGraphicsHeight() - iTextureHeight( Logo ) - iTextureHeight( RN_Logo ) - iTextureHeight( IK_Logo ) - 30 )
    iDrawTexture( RN_Logo, 30, iGraphicsHeight() - iTextureHeight( Logo ) - iTextureHeight( RN_Logo )- 20 )
    iDrawTexture( Logo, 10, iGraphicsHeight() - iTextureHeight( Logo )- 10 )
    iDrawTexture( GL_Logo, iGraphicsWidth() - (40 + iTextureWidth( GL_Logo ) ), iGraphicsHeight() - iTextureHeight( GL_Logo ) - iTextureHeight( Logo )- 10 )
    iDrawTexture( biLogo, iGraphicsWidth() - (10 + iTextureWidth( biLogo ) ), iGraphicsHeight() - iTextureHeight( Logo ) )	
    iColor(255,255,0,200)
    iText(10,10,  "THIS IS A BASIC_IRRLICHT TEST USING PYTHON SCRIPT")
    iText(10,50, "PRIMITIVES RENDERED: "+str( iTrisRendered() ) )
    iText(10,70,  "ENGINE FPS: "+str( iFPS() ) )
    iText(10,90,  "LOGIC FPS: "+str( LFPS ))
    iText(10,130,  "BASIC IRRLICHT "+ver+" contains the following:")
    iText(10,150, " IRRLICHT3D for OPENGL 2D & 3D GRAPHICS")
    iText(10,170, " IRRKLANG for 2D & 3D SOUND")
    iText(10,190, " RAKNET for NETWORK PLAY")
    iColor(0,255,0)
    iText(10,230, "*ESCAPE KEY TO EXIT")

#-----------------------------------------------------------------------------
    iRenderGUI()
    iFlip()
    if( iKeyHit( KEY_F12 ) ):
        iScreenShot();
    if( iKeyHit( KEY_ESCAPE ) ):
        break;

##############################################################
#	END
##############################################################
iEndGraphics()
quit()