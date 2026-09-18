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


#iVSync( TRUE )
iAntialias( 2 )
iGraphics3D( 1366, 768, 32, FALSE )
iAppTitle( "BASIC IRRLICHT LOOP TEMPLATE PYTHON" )
myfont = iLoadFont( "MEDIA/8bitFont.xml")
iSetFont( myfont )
cam = iCreateCamera()




##############################################################
#	MAIN LOOP
##############################################################
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
        FrameTime = FrameTime + FramePeriod
        Lfps_count += 1
#-----------------------------------------------------------------------------
#	    CODE LOGIC AFFECTED BY FRAME TIME AT THIS INDENT
#-----------------------------------------------------------------------------

        
#-----------------------------------------------------------------------------
#	CODE NOT AFFECTED BY FRAME TIME AT THIS INDENT
#-----------------------------------------------------------------------------


#-----------------------------------------------------------------------------
    iUpdateScene()    
    iRenderScene()
#-----------------------------------------------------------------------------	
#	2D STUFF AFTER EVERY 3D RENDER
#-----------------------------------------------------------------------------
    iColor( 255, 255, 255 )
    iText( 10, 10,  "ENGINE FPS: "+str( iFPS() ))
    iText( 10, 30,  "LOGIC FPS: "+str( LFPS ))
    iText( 10, 50,  "PRIMITIVES RENDERED: "+str( iTrisRendered() ) )
    iColor( 0, 255, 0 )
    iText( 10, 230, "*ESCAPE KEY TO EXIT")

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
