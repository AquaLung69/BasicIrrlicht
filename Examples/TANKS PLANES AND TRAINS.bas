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
iAppTitle( "TANKS PLANES AND TRAINS" )
dim myfont as iFont = iLoadFont( "./MEDIA/8bitFont.xml")
iSetFont(myfont )
dim cam as iCamera = iCreateFPSCamera()
iCLSColor( 128, 128, 128 )
iPositionEntity( Cam, 0, 200, -300 )
iRotateEntity( Cam, -90, 0, 0 )

' TANK 1
dim shared TankPivot1 as iENTITY
TankPivot1 = iCreatePivot()
dim body1 as iENTITY = iCreateCube( TankPivot1 )
iEntityColor( body1, 60, 80, 30 )'0, 100, 50 )
iScaleEntity( body1, 1.5, 0.5, 2 )
dim torret1 as iENTITY = iCreateSphere( 12, TankPivot1 )
iEntityColor( torret1, 70, 90, 40 )
iPositionEntity( torret1, 0, 3, 0 )
dim cannon1 as iENTITY = iCreateCylinder( 4, torret1 )
iRotateEntity( cannon1, 90, 0, 0 )
iEntityColor( cannon1, 1, 1, 1 )
iScaleEntity( cannon1, 0.2, 2, 0.2 )
iPositionEntity( cannon1, 0, 1.5, 8 )
iPositionEntity( TankPivot1, 0, 0, 140 ) 
iRotationAnimator( TankPivot1, 0, 2, 0 )

' TANK2
dim shared TankPivot2 as iENTITY
TankPivot2 = iCreatePivot()
dim body2 as iENTITY = iCreateCube( TankPivot2 )
iEntityColor( body2, 30, 20, 180 )
iScaleEntity( body2, 1.5, 0.5, 2 )
dim torret2 as iENTITY = iCreateSphere( 12, TankPivot2 )
iEntityColor( torret2, 40, 30, 190 )
iPositionEntity( torret2, 0, 3, 0 )
dim cannon2 as iENTITY = iCreateCylinder( 4, torret2 )
iRotateEntity( cannon2, 90, 0, 0 )
iEntityColor( cannon2, 1, 1, 1 )
iScaleEntity( cannon2, 0.2, 2, 0.2 )
iPositionEntity( cannon2, 0, 1.5, 8 )
iPositionEntity( TankPivot2, -50, 0, 140 )
iRotationAnimator( TankPivot2, 0, -2, 0 )

' PLANE
dim shared PPivot as iENTITY
PPivot = iCreatePivot()
dim PlanePivot as iENTITY = iCreatePivot(PPivot)
dim as iENTITY fuselugeF, fuselugeB, wingF, wingB, rudder, canopy, prop
fuselugeF = iCreateCylinder( 4, PlanePivot )
iRotateEntity( fuselugeF, 90, 0, 0 )
iScaleEntity( fuselugeF, 1, 4, 1 )
iEntityColor( fuselugeF, 60, 80, 30 )
fuselugeB = iCreateCone( 4, fuselugeF )
iRotateEntity( fuselugeB, -180, 0, 0 )
iPositionEntity( fuselugeB, 0, -8, 0 )
iScaleEntity( fuselugeB, 1, .6, 1 )
iEntityColor( fuselugeB, 60, 80, 30 )
wingF = iCreateCylinder( 8, PlanePivot )
iPositionEntity( wingF, 0, -2, 2 )
iScaleEntity( wingF, 10, 0.05, 1.8 )
iEntityColor( wingF, 70, 90, 40 )
wingB = iCreateCylinder( 8, PlanePivot )
iPositionEntity( wingB, 0, 0, -36 )
iScaleEntity( wingB, 3.5, 0.03, 0.8 )
iEntityColor( wingB, 70, 90, 40 )
rudder = iCreateCone( 4, PlanePivot )
iRotateEntity( rudder, -20, 0, 0 )
iPositionEntity( rudder, 0, 5.5, -40 )
iScaleEntity( rudder, 0.1, 1.5, 1 )
iEntityColor( rudder, 60, 80, 30 )
canopy = iCreateSphere( 6, PlanePivot )
iPositionEntity( canopy, 0, 2.8, 0 )
iScaleEntity( canopy, 0.6, 1, 2 )
iEntityColor( canopy, 25, 25, 25 )
prop = iCreateCylinder( 6, fuselugeF )'iCreateCube( fuselugeF )	'iCreateQuad( 10, fuselugeF )
'iEntityMaterialFlag( Prop, EMF_BACK_FACE_CULLING, false )
iPositionEntity( prop, 0, 5.2, 0 )
iScaleEntity( prop, 2, 0.01, 0.11 )
iEntityColor( prop, 25, 25, 25 )
iRotationAnimator( prop, 0, -40, 0 )

iPositionEntity( PlanePivot, 100, 0, 140 )
iPositionEntity( Cam, 0, 50, -180 )
'iRotationAnimator( PlanePivot, 0, -3, 0 )
iRotateEntity( PlanePivot, -10, -180, 0 )'-90
'iPointEntity( Cam, PlanePivot )
'iEntityParent( Cam, fuselugeF )
'iPositionEntity( Cam, 0, 0, -1 )

' TRAIN
dim shared TEPivot as iENTITY
TEPivot = iCreatePivot()
dim as iENTITY TE1, TE2
TE1 = iCreateCube( TEPivot )
iEntityColor( TE1, 0, 0, 255 )
iScaleEntity( TE1, 1, 1.5, 5 )
iPositionEntity( TEPivot, 0, 0, -60 )
TE2 = iCreateCube( TEPivot )
iEntityColor( TE2, 0, 0, 100 )
iScaleEntity( TE2, 1.5, 1.5, 2 )
iPositionEntity( TE2, 0, 1, 10 )

dim shared TC1Pivot as iENTITY
TC1Pivot = iCreatePivot()
dim as iENTITY TC1 
TC1 = iCreateCube( TC1Pivot )
iEntityColor( TC1, 255, 0, 0 )
iScaleEntity( TC1, 1, 1.5, 5 )
iPositionEntity( TC1Pivot, 0, 0, -115 )

dim shared TC2Pivot as iENTITY
TC2Pivot = iCreatePivot()
dim as iENTITY TC2 
TC2 = iCreateCube( TC2Pivot )
iEntityColor( TC2, 0, 255, 0 )
iScaleEntity( TC2, 1, 0.5, 5 )
iPositionEntity( TC2Pivot, 0, -5, -170 )

dim shared TC3Pivot as iENTITY
TC3Pivot = iCreatePivot()
dim as iENTITY TC3 
TC3 = iCreateCube( TC3Pivot )
iEntityColor( TC3, 255, 255, 0 )
iScaleEntity( TC3, 1, 1.5, 5 )
iPositionEntity( TC3Pivot, 0, 0, -225 )


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
		iMoveEntity( TankPivot1, 0, 0, 1.0 )
		'iMoveEntity( PlanePivot, 0, 0, 8 )
		'iTurnEntity( PPivot, 0, -1, 0 )
		
		

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

