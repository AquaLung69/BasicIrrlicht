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
# Permission is granted To anyone To use this software For any purpose,
# including commercial applications, And To alter it And redistribute it
# freely, subject To the following restrictions:
# 1. The Origin of this software must Not be misrepresented; you must Not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgement in the product documentation would be
#    appreciated but is Not required.
# 2. Altered source versions must be clearly marked as such, And must Not be
#    misrepresented as being the original software.
# 3. This notice may Not be removed Or altered from any source distribution.
#----------------------------------------------------------------------------

##############################################################
#	IMPORT THE BASIC IRRLICHT LIBRARY
##############################################################
import sys
sys.path.append('../Libs') 
from basicirrlicht import *

#iVSync( TRUE )
iAntialias( 2 )
iGraphics3D( 1280, 720, 32, FALSE )
#iSetLogLevel( ELL_NONE )
iAppTitle( "GEOMETRY TEST PYTHON" )
font = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont( font )

cam = iCreateCamera()
iCLSColor( 100, 100, 150 )
iAmbientLight( 130, 130, 130 )
pivot = iCreatePivot()
iEntityParent( cam, pivot )
iPositionEntity( cam, 0.0, 10.0, -30.0 )
iPositionEntity( pivot, 0.0, 20.0, -50.0 )

lightpivot = iCreatePivot()
light = iCreateLight( ELT_SPOT, lightpivot )
lightsphere = iCreateSphere( 8, light )
iEntityMaterialFlag( lightsphere, EMF_LIGHTING, FALSE )
iScaleEntity( lightsphere, 0.2, 0.2, 0.2 )
iPositionEntity( light, 0, 50, -50 )
iRotateEntity( light, 45, 0, 0 )
iLightCastShadows( light )
iRotationAnimator( lightpivot, 0.0, -2.0, 0.0 )

GeoResolution = 32
cube = iCreateCube()
iEntityColor( cube, 0, 0 ,255 )
sphere = iCreateSphere( GeoResolution )
iEntityColor( sphere, 0, 255 ,0 )
cylinder = iCreateCylinder( GeoResolution )
iEntityColor( cylinder, 255, 255 ,0 )
cone = iCreateCone( GeoResolution )
iEntityColor( cone, 255, 0 ,0 )
plane = iCreatePlane()
iEntityColor( plane, 0, 80 ,80 )

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
#iEntityMaterialFlag( cone, EMF_WIREFRAME, TRUE )
#iEntityMaterialFlag( sphere, EMF_WIREFRAME, TRUE )
#iEntityMaterialFlag( cylinder, EMF_WIREFRAME, TRUE )
#iEntityMaterialFlag( cube, EMF_WIREFRAME, TRUE )
#iEntityMaterialFlag( plane, EMF_WIREFRAME, TRUE )
expd = 0.0
dx = 0.4

GFPS = 0
Gfps_count = 0
LFPS = 0
Lfps_count = 0
fps_time = iMilliSecs()
LogicFPS = 60
FramePeriod = 1000 / LogicFPS
FrameTime = iMilliSecs() - FramePeriod
FrameElapsed = 0
while( iRun() ):
#-----------------------------------------------------------------------------
#	CALCULATE FPS EACH FRAME
#-----------------------------------------------------------------------------
    Gfps_count += 1
    if( iMilliSecs() - fps_time >= 1000 ):
        GFPS = Gfps_count ; Gfps_count = 0
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
        if( expd > 10.0 ):
            dx = -0.4
        elif( expd < 0.0 ):
            dx = 0.4
        expd = expd + dx




#-----------------------------------------------------------------------------
#	CODE NOT AFFECTED BY FRAME TIME AT THIS INDENT
#-----------------------------------------------------------------------------
    iPositionEntity( cone, 0.0, 9.0 - (expd), 0.0 )
    iPositionEntity( sphere, 0.0, 9.0 - (expd), 0.0 )
    iPositionEntity( cylinder, 0.0, 9.0 - (expd), 0.0 )



#-----------------------------------------------------------------------------
    iUpdateScene()    
    iRenderScene()
#-----------------------------------------------------------------------------	
#	2D STUFF AFTER EVERY 3D RENDER
#-----------------------------------------------------------------------------
    iColor( 255, 255, 255 )
    iText(10,10,  "MAIN LOOP FPS: "+str( GFPS ))
    iText(10,30,  "LOGIC FPS: "+str( LFPS ))
    iText(10,50,  "PRIMITIVES RENDERED: "+str( iTrisRendered() ) )
    iColor( 0, 255, 0 )
    iText(10,230, "*ESCAPE KEY TO EXIT")

#-----------------------------------------------------------------------------
    #iRenderGUI()
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
