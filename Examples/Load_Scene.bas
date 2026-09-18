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
'iGraphics3D( 1366, 768, 32, TRUE )
'iGraphics3D( 1920, 1080, 32, TRUE )
iGraphics3D( 1280, 720, 32, false )
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont(myfont )
iAppTitle( "LOAD SCENE FREEBASIC" )
dim cam as iCamera = iCreateCamera(0,true)
iAmbientLight( 130, 130, 130 )
dim pivot as iEntity = iCreatePivot()
iEntityParent( cam, pivot )
iPositionEntity( cam, 0.0, 5.0, -50.0 )
iLoadScene( "./ExampleScene.irr" )


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
        iTurnEntity( pivot, 0.0, 1.0, 0.0 )
        
    next
'-----------------------------------------------------------------------------
'	CODE NOT AFFECTED BY FRAME TIME HERE
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
