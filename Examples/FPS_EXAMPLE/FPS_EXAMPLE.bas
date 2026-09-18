'	.----.  .--.  .----.-.----.           
'	| {_} }/ {} \{ {__-{ | }`-'
'	| {_} /  /\  .-._} | | },-.           
'	.-.---..---..-.--.-.----.-. .-.-----. 
'	{ } }}_} }}_} |  { | }`-{ {_} `-' '-'
'	| | } \| } \} '--| | }, -| { } } } {                                  
'	`-`-' - '`-' - '`----`-`----`-' `-' `-'
'----------------------------------------------------------------------------
'  FPS EXAMPLE Author 2024 ED MUSOLINO
'	Basic-Irrlicht Wrapper by EM ENGINEERING LLC ©2019-2026
'----------------------------------------------------------------------------
' This software is provided 'as - is', without any express Or implied
' warranty.  In no event will the author(s) be held liable For any damages
' arising from the use of this software.
' Permission is granted To anyone To use this software For any purpose,
' including commercial applications, And To alter it And redistribute it
' freely, subject To the following restrictions:
' 1. The Origin of this software must Not be misrepresented; you must Not
'    claim that you wrote the original software. If you use this software
'    in a product, an acknowledgement in the product documentation would be
'    appreciated but is Not required.
' 2. Altered source versions must be clearly marked as such, And must Not be
'    misrepresented as being the original software.
' 3. This notice may Not be removed Or altered from any source distribution.
' This program is distributed in the hope that it will be useful.
'----------------------------------------------------------------------------
' TODO:
'	Correct kills and deaths processed twice. In FIRE_WEAPON and Received GUNSHOT.
'	Add pickup awards send to server and then re-broadcast.
'	Send a player Stat report twice a second.
'	Reworking death and respawn code...
'	Reworking scoring\damage code...
'	Updating net play....


'	DONE:
'	Added avatar scarring based on health.
'	Added option for CARTOON OUTLINE of avatars at close distance.
'	Added a NAME SPRITE above remote avatar at close distance.

'-----------------------------------------------------------------------------
'	INCLUDE THE BASIC IRRLICHT LIBRARY & OTHERS
'-----------------------------------------------------------------------------
#include once "../BASE_LIBS/BasicIrrlicht.bi"
#include once "INCLUDES/NET_MSG_DEFS.bi"

' USEFULL COMMAND
' iEntityDebug( ENTITY, EDS_BBOX )
' iNormalMapTexture( buildTex, 9.0 )
' iSaveTexture( buildTex, "Media/GFX/BuildingD3.bmp" )

'-----------------------------------------------------------------------------
'	CONSTANTS
'-----------------------------------------------------------------------------  
Const VSYNC 					= 1				'TRUE OR ONE TO ENABLE VERTICAL SYNC
Const SHADOWS 					= 1				'TRUE OR ONE TO ENABLE STENCILE SHADOWS
const TEXTURES_ON				= 1				'TRUE OR ONE TO ENABLE TEXTURING
const CARTOON_OUTLINE		= 1				'TRUE OR ONE TO OUTLINE AVATAR

Const SCREENX 					= 1366			'SCREEN WIDTH
Const SCREENY 					= 768				'SCREEN HEIGHT
'Const SCREENX 					= 1920			'SCREEN WIDTH
'Const SCREENY 					= 1080			'SCREEN HEIGHT

Const ANTIALIAS 				= 4				'ANTIALIAS LEVEL WHEN IN FULLSCREEN MODE
Const FULLSCREEN 				= 0				'TRUE OR 1 TO ENABLE FULLSCREEN
Const POS_UPDATE_FREQ		= 50				'PLAYER POSITION PACKET IN MilliSecs 20X
Const MAX_HEALTH				= 100
Const MAX_ARMOR				= 100
Const MAX_AMMO_CARTRIDGE	= 30
Const MAX_AMMO					= 100
Const GROUND_HEIGHT			= 0				'SURFACE
Const PLAYER_HEIGHT			= 19.0
Const GRAVITY					= -20.0
Const GRND_RESISTENCE		= 0.899
Const AIR_RESISTENCE			= 0.999
Const MAX_VELOCITY			= 1.2
Const ACCELERATION			= 0.05
Const GUN_RECOIL				= 1
Const GUN_RANGE				= 800
Const STEP_TIME				= 270
const VIEW_DISTANCE			= 500				'SHADOW DISTANCE
Const GUN_DELAY				= 10				'RATE OF FIRE
'-----------------------------------------------------------------------------
Const SKY_R						= 135
const SKY_G						= 206
const SKY_B						= 235
Const HUD_R						= 1
const HUD_G						= 255
const HUD_B						= 1
Const SLOT_FREE         	= 0
Const SLOT_ALIVE        	= 1
Const SLOT_DEAD         	= 2
const target_PLAYER			= 1
const target_PLAYER_HEAD	= 2
const target_SURFACE			= 3
const target_BUILDING		= 4
const MAX_NETMSG_PER_CYCLE = 200				'NETWORK MESSAGES PROCESSED PER ENGINE CYCLE
const SND_DISTANCE			= 50.0

'DIM Name_Height as single = 35
'	IrrGetScreenCoordinatesFrom3DPosition( x, y, Name_Height )
'	iText( nax-15, nay-8, "MY NAME" )	'Irr2DFontDraw ( BitmapFont, "ZUMLIN", x-15, y-8, x+35, y )
	
	
Dim Shared Is_Server As Boolean = False
Dim Shared ServerName As String
	ServerName = "SKYSCRAPER_SERVER"
Dim Shared MaxPlayers As Integer
	MaxPlayers = 10
Dim Shared IP As String
	IP = "127.0.0.1" 				'TEST, GET FROM GUI
Dim Shared Server_Port As Integer
	Server_Port = 5009

Dim Shared MAP_SIZE As Integer 		= 1000 	'2000
Dim Shared MAP_SEGMENTS As Integer 	= 200
Dim Shared BUILDING_COUNT As Integer
	BUILDING_COUNT = (MAP_SIZE/MAP_SEGMENTS) * 2
'IF BUILDING_COUNT > (MAP_SIZE/MAP_SEGMENTS) * 2 THEN BUILDING_COUNT = (MAP_SIZE/MAP_SEGMENTS) * 2


'-----------------------------------------------------------------------------
'	CUSTOM TYPES
'-----------------------------------------------------------------------------
Dim Shared T_PLAYER_TOTAL As Integer = 0
dim shared T_PLAYER_BUFFER as integer
	T_PLAYER_BUFFER = MaxPlayers + 1
Type T_PLAYER
      pState As Integer = SLOT_FREE
      pid As Integer = -1
      PName As String = ""
		pTeam as integer = 1
      pSex As Integer = 1
      pEnt As iENTITY = NULL
      pHead As iENTITY = NULL
      pBody As iENTITY = NULL
      pFeet As iENTITY = NULL
      pWeaponPivot As iENTITY = NULL
      pWeaponEnt(1 To 2) As iENTITY
		pHeadColor( 3 ) as integer
		pSuitColor( 3 ) as integer
      pHealth As Integer
      pArmor As Integer
      pKills As Integer
      pDeaths As Integer
      pCartridge As Integer
      pAmmoBelt As Integer
      X As Single
      Y As Single
      Z As Single
      Yaw As Single
      Pitch As Single
      xVel As Single
      zVel As Single
      xAcc As Single
      zAcc As Single
      PacketX As Single
      PacketY As Single
      PacketZ As Single
      PacketxVel As Single
      PacketzVel As Single
      PacketxAcc As Single
      PacketzAcc As Single
      LastPacketTimestamp As Integer
      StepTimer As Integer
      SplineID As Integer
      SplineInitialized As Boolean = False
      Selector(1 To 2) As iTRI_SELECTOR
      FlashSprite As iSPRITE
      FlashTimer As Integer
		Light as iLIGHT
		NameSprite As iSPRITE
End Type
Dim Shared T_PLAYER_LIST( T_PLAYER_BUFFER ) As T_PLAYER

'-----------------------------------------------------------------------------
dim shared T_BUIDLING_BUFFER as integer
	T_BUIDLING_BUFFER = BUILDING_COUNT + 1
Type T_BUIDLING
      Ent As iENTITY = NULL
      X As Single
      Y As Single
      Z As Single
      Yaw As Single
		Scale as Integer
End Type
Dim Shared T_BUIDLING_LIST( T_BUIDLING_BUFFER ) As T_BUIDLING

'-----------------------------------------------------------------------------
Dim Shared T_DEATH_TOTAL As Integer = 0
Type T_DEATH
   active As Boolean = False
   pid As Integer
   dtimer As Integer
End Type
Dim Shared T_DEATH_LIST( T_PLAYER_BUFFER ) As T_DEATH

'-----------------------------------------------------------------------------
Dim Shared T_EXPLOSION_TOTAL As Integer = 0
dim shared T_EXPLOSION_BUFFER as integer
	T_EXPLOSION_BUFFER = T_PLAYER_BUFFER * 2
Type T_EXPLOSION
	Sprite   As iSPRITE
   Scale    As Single
	TimeOut  As Integer
	Emitter	As iENTITY
End Type
Dim Shared T_EXPLOSION_LIST( 1 To T_EXPLOSION_BUFFER ) As T_EXPLOSION

'-----------------------------------------------------------------------------
Dim Shared T_PICKUP_TOTAL As Integer = 0
Dim Shared T_PICKUP_NET_ID As Integer = 0
Const T_PICKUP_BUFFER = 40
dim shared MAX_PICKUP as integer = 5	'20
Type T_PICKUP
	Net_ID	as integer
   pType    As Integer
	Ent      As iENTITY
	TimeOut  As Integer
   X        As Integer
   Y        As Integer
   Z        As Integer
   Yaw      As Integer
End Type
Dim Shared T_PICKUP_LIST( 1 To T_PICKUP_BUFFER ) As T_PICKUP

'-----------------------------------------------------------------------------
Dim Shared T_CHAT_TOTAL As Integer = 0
Const T_CHAT_BUFFER = 32
Type T_CHAT
   ID          As String
   Message     As String
   msgColor    As Integer
   msgType     As Integer
End Type
Dim Shared T_CHAT_LIST( 0 To T_CHAT_BUFFER ) As T_CHAT
'-----------------------------------------------------------------------------
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	DECLARATIONS
'-----------------------------------------------------------------------------
Declare Sub ADD_CHAT( ID As String, msg As String, mType As Integer=1, snd As Boolean = True )
Declare Sub ADD_PLAYER( PlayerName AS STRING, PlayerID AS INTEGER, Team as integer )
Declare Sub ADD_TO_MAP( ent As iENTITY, height As Single )
declare sub CHAT_CONSOLE() 
Declare Sub CREATE_EXPLOSION( x As Single, y As Single, z As Single, tType as integer )
declare function CREATE_NAME_SPRITE( PlayerName as string ) as iSPRITE
Declare Sub CREATE_MODEL( p AS T_PLAYER, shade as Boolean = true )
Declare Sub CREATE_PICKUP( nid as integer, pType As Integer, x As Single, z As Single, tmo as integer = 0 )
Declare Function CREATE_PORTAL() As iENTITY
Declare Sub DEATH( death_pid As Integer, killedby_pid As Integer )
Declare Sub DISPLAY_STATS()
Declare Sub DRAW_CHAT()
declare function FIND_PICKUP( nid as integer ) as integer
Declare Function FIND_PLAYER( pid As Integer ) As Integer
Declare SUB FIRE_WEAPON( pid as integer, Obj as iENTITY )
Declare Function INITIALIZE_NETWORK() As Boolean
Declare Sub MAIN_MENU()
Declare Sub NETPLAYER_POS_UPDATE( PlayerID As Integer, Timestamp As Integer )
Declare Sub PLAYER_CONTROLS( ByVal obj As iCAMERA )
Declare Sub PROCESS_COLLISIONS()
Declare Sub PROCESS_LOGON_NETWORK()
Declare Sub PROCESS_NETWORK()
declare function REMOVE_PICKUP( nid as integer, pid as integer ) as boolean
Declare Function REMOVE_PLAYER( PlayerID As Integer ) As Boolean
Declare Sub SEND_POS_UPDATE()
Declare Sub SHUTDOWN()
Declare Sub UPDATE_DEATH()
Declare Sub UPDATE_EXPLOSIONS()
Declare Sub UPDATE_NET_PLAYERS( dt As Integer )
Declare Sub UPDATE_PICKUPS()
declare sub UPDATE_SCARRS( pid as integer )
declare SUB UPDATE_SHADOWS()

'-----------------------------------------------------------------------------
'	INITIALIZE ENGINE
'-----------------------------------------------------------------------------
Dim Shared DEBUG As Boolean = False
iAntialias( ANTIALIAS )
iVSync( VSYNC )
iGraphics3D( SCREENX, SCREENY, 32, FULLSCREEN )
iSeedRand( iMilliSecs() )
iAppTitle( "FPS EXAMPLE 'SKY SCRAPER' ( BASIC IRRLICHT MULTIPLAYER FPS )  AUTHOR 2024 ED MUSOLINO" )
'iDopplerEffect( 1.0, 1000 )
iSetLogLevel( ELL_DEBUG )

'dim ConvTex as iTEXTURE = iLoadTexture( "Media/GFX/glassb.jpg" )
'iNormalMapTexture( ConvTex, 9.0 )
'iSaveTexture( ConvTex, "Media/GFX/ConvTex.bmp" )
'-----------------------------------------------------------------------------
'	FONT
'-----------------------------------------------------------------------------
Dim Shared Digital As iFONT
	Digital = iLoadFont ( "Media/Font/8bitFont.xml" )
iSetFont( Digital )
iSetGadgetFont( Digital )

'-----------------------------------------------------------------------------
'	SOME VARIABLES
'-----------------------------------------------------------------------------
dim shared chatting as integer = False
dim shared PrevKey as integer = 0
Dim Shared CURSOR_TIMER As Integer
	CURSOR_TIMER = iMilliSecs()
Dim Shared CHAT_TIMER As Integer
	CHAT_TIMER = iMilliSecs()
dim shared OutgoingChat as string	'*64
dim shared Cursor as string*8 = " "
Dim Shared net_select As Integer = 0
Dim Shared MyAvatar As iENTITY
Dim Shared DebugColl As iENTITY
Dim Shared EMPTY_TIMER As Integer
Dim Shared dStartTime As Integer
	dStartTime = iMilliSecs()
Dim Shared DeltaTime As Single = 0.0
Dim Shared falling As Boolean = False
Dim Shared SurfaceType As iENTITY = NULL
Dim Shared PickupCol As Integer
Dim shared tex_Ammo as iTEXTURE
	tex_Ammo = iLoadtexture( "Media/GFX/p_Ammo.bmp" )
Dim shared tex_Health as iTEXTURE
	tex_Health = iLoadtexture( "Media/GFX/p_Health.bmp" )
Dim shared tex_Armor as iTEXTURE
	tex_Armor = iLoadtexture( "Media/GFX/p_Armor.bmp" )
Dim Shared lBoot As Boolean = False
Dim Shared Headshot As Integer
	Headshot = iMilliSecs() - 1100
Dim Shared LastYaw As Single = 0.0
Dim Shared CamZoom As Single = 0.0
Dim Shared fmaxZoom As Single = 4.0
Dim Shared cam_pitch As Single= 0.0, cam_yaw As Single= 0.0
Dim Shared ExitApp As integer = 0
Dim Shared GFX_WIDTH As Integer : GFX_WIDTH = iGraphicsWidth()
Dim Shared GFX_HEIGHT As Integer : GFX_HEIGHT = iGraphicsHeight()
Dim Shared As iENTITY MapArray( (MAP_SIZE/MAP_SEGMENTS)+1, (MAP_SIZE/MAP_SEGMENTS)+1 )
' MARK MAP BLOCKS USED THAT WE DON'T WANT TO PLACE OBJECTS
For x As Integer = 0 To MAP_SIZE/MAP_SEGMENTS
	For y As Integer = 0 To MAP_SIZE/MAP_SEGMENTS
		If x = 0 Or x = MAP_SIZE/MAP_SEGMENTS Or y = 0 Or y = MAP_SIZE/MAP_SEGMENTS Then
			MapArray( x, y ) = 1
		End If
	Next y
Next x
Dim Shared CloudX As Single = 0.0
Dim Shared ShowGUI As Boolean = True
Dim Shared Controls As iTEXTURE
	Controls = iLoadTexture( "Media/UI/Controls.bmp" )
	iMaskTexture( Controls, 255, 0, 255 )
dim shared NET_SYNC_COMPLETE_WAIT as integer = false
Dim Shared NET_POS_TIMER As Integer
	NET_POS_TIMER = iMilliSecs()
Dim Shared START_GAME As integer = False
Dim Shared TOTAL_BUILDINGS As Integer = 0
Dim Shared smoke_Tex As iTEXTURE
	smoke_Tex = iLoadTexture( "Media/GFX/smoke.jpg" )
	iMaskTexture( smoke_Tex, 0, 0, 0 )
Dim Shared boots As iTEXTURE
	boots = iLoadTexture( "Media/GFX/Boots.bmp" )
	iMaskTexture( boots, 255, 255, 255 )
Dim Shared face As iTEXTURE
	face = iLoadTexture( "Media/GFX/Face2.bmp" )
Dim Shared teleport_delay_TIMER As Integer
	teleport_delay_TIMER = iMilliSecs()		'250

dim shared tex_Combined as iTEXTURE
dim shared as iTEXTURE tex_FaceMaster
	tex_FaceMaster = iLoadTexture( "MEDIA/GFX/Face2.bmp")
dim shared Scarring( 5 ) as iTEXTURE
for i as integer = 0 to 4
	Scarring( i ) = iLoadTexture( "Media/GFX/SCARRING/Stage_"+str( i )+".bmp" )
next i
dim shared Scarr_Stage as integer = 0
dim shared DevTex as iTEXTURE
	DevTex = iLoadTexture( "MEDIA/GFX/water.jpg" )

'-----------------------------------------------------------------------------
'	WORLD COLLISION GROUP
'-----------------------------------------------------------------------------
Dim Shared coll_World As iMETA_SELECTOR
	coll_World = iCreateMetaSelector()

'-----------------------------------------------------------------------------
'	READ IN PARTICLE DEFINITIONS
'-----------------------------------------------------------------------------
Const PARTICLE_DEF_COUNT	= 5
Const prtcl_PORTAL			= 1
Const prtcl_SPARK				= 2
Const prtcl_SMOKE				= 3
Const prtcl_BLOOD				= 4
Const prtcl_MIST				= 5
Dim Shared particle_Def( 1 To PARTICLE_DEF_COUNT ) As iPARTICLE_SETTINGS
Restore particles
For i As Integer = 1 To PARTICLE_DEF_COUNT
   With particle_Def( i )
      Read .min_box_x, .min_box_y, .min_box_z
      Read .max_box_x, .max_box_y, .max_box_z
      Read .direction_x, .direction_y, .direction_z
      Read .min_paritlcles_per_second, .max_paritlcles_per_second
      Read .min_start_color_red, .min_start_color_green, .min_start_color_blue
      Read .max_start_color_red, .max_start_color_green, .max_start_color_blue
      Read .min_lifetime, .max_lifetime
      Read .min_start_sizeX, .min_start_sizeY, .max_start_sizeX, .max_start_sizeY
      Read .max_angle_degrees
   End With
Next i

'-----------------------------------------------------------------------------
'	SOUNDS
'-----------------------------------------------------------------------------
Dim shared Theme As iSOUND
DIM shared Ambience AS iSOUND
Dim Shared snd_Chat As iSOUND_SOURCE
	snd_Chat = iLoadSound( "Media/SFX/Chat.ogg" )
Dim Shared snd_Button_Click As iSOUND_SOURCE
	snd_BUTTON_CLICK = iLoadSound( "Media/SFX/Click.ogg" )
Dim Shared snd_ScreenShot As iSOUND_SOURCE
	snd_ScreenShot = iLoadSound( "Media/SFX/ScreenShot.ogg" )
Dim Shared snd_Health As iSOUND_SOURCE
	snd_Health = iLoadSound( "Media/SFX/Health.ogg" )
Dim Shared snd_Armor As iSOUND_SOURCE
	snd_Armor = iLoadSound( "Media/SFX/Armor.ogg" )
Dim Shared snd_Respawn As iSOUND_SOURCE
Dim Shared chnl_Respawn As iSOUND
	snd_Respawn = iLoadSound( "Media/SFX/Respawn.ogg" )
Dim Shared snd_HurtM(1 To 3) As iSOUND_SOURCE
	snd_HurtM(1) = iLoadSound( "Media/SFX/m_hurt1.ogg" )
	snd_HurtM(2) = iLoadSound( "Media/SFX/m_hurt2.ogg" )
	snd_HurtM(3) = iLoadSound( "Media/SFX/m_die.ogg" )
Dim Shared snd_Flesh As iSOUND_SOURCE
	snd_Flesh = iLoadSound( "Media/SFX/FleshHit.ogg" )
Dim Shared snd_Zoom As iSOUND_SOURCE
	snd_Zoom = iLoadSound( "Media/SFX/Zoom.ogg" )
Dim Shared chnl_Zoom As iSOUND
Dim Shared snd_Ammo As iSOUND_SOURCE
	snd_Ammo = iLoadSound( "Media/SFX/Ammo.ogg" )
Dim Shared PickupTimer As Integer
	PickupTimer = iMilliSecs()  '1000
DIM SHARED SnapshotTimer AS Integer
	SnapshotTimer = iMilliSecs()	'10000
' RELOAD
Dim Shared snd_Reload As iSOUND_SOURCE
	snd_Reload = iLoadSound( "Media/SFX/Reload.ogg" )
' FOOTSTEPS
Dim Shared sndStoneSteps( 1 To 4 ) As iSOUND_SOURCE
For i As Integer = 1 To 4
   sndStoneSteps( i ) = iLoadSound( "Media/SFX/Grass"+Str(i)+".ogg" )
Next i

'-----------------------------------------------------------------------------
'  BUILDING
'-----------------------------------------------------------------------------
' BUILDING
Dim Shared Building As iENTITY
Building = iCreateCube()
dim buildTex as iTEXTURE = iLoadTexture( "Media/GFX/Wall.bmp" )
dim buildTexD as iTEXTURE = iLoadTexture( "Media/GFX/GlassD.bmp" )
if TEXTURES_ON then
	iEntityMaterialType( Building, EMT_DETAIL_MAP )
	iEntityMaterialFlag( Building, EMF_FOG_ENABLE, True )
	iEntityTexture( Building, BuildTex, 0 )
	iEntityTexture( Building, BuildTexD, 1 )
	iScaleTexture( Building, 5.1, 11.1 )
	iScaleTexture( Building, 5.1, 11.1, 0, 1 )
end if
iHideEntity( Building )

'-----------------------------------------------------------------------------
'	GUN
'-----------------------------------------------------------------------------
Dim Shared Gun_Delay_Counter As Integer = 0
Dim Shared ReloadStage As Integer = 0
Dim Shared FlashSprite As iSPRITE
FlashSprite = iLoadSprite( "Media/GFX/particlewhite1.bmp", false )
iHideEntity( FlashSprite )
Dim Shared snd_Gun As iSOUND_SOURCE
snd_Gun = iLoadSound( "Media/SFX/Gun.ogg" )
Dim Shared snd_Dryfire As iSOUND_SOURCE
snd_Dryfire = iLoadSound( "Media/SFX/Dryfire.ogg" )

'-----------------------------------------------------------------------------
'	CAMERA
'-----------------------------------------------------------------------------
Dim Shared Camera As iCAMERA
Camera = iCreateFPSCamera( 300.0, 0.0, 0, True )	'ZERO OUT MOVEMENT AND USE OUR OWN CONTROLS
iCameraRange( Camera, 1.0, 4000.0 )
iSetCameraAspectRatio( Camera, 16.0/9.0)
iFogType( EFT_FOG_LINEAR )
iFogRange( 100.0, 600.0 ) 									'ONLY USED WITH EFT_FOG_LINEAR
iFogColor( SKY_R, SKY_G, SKY_B )
iShadowColor( SKY_R-135, SKY_G-135, SKY_B-135, 50 )
iRotateEntity( Camera, 0, 0, 0 )
iHideEntity( Camera )
' GUN TARGETING ENTITY
Dim Shared targetEnt As iENTITY
targetEnt = iCreatePivot( Camera )
iMoveEntity( targetEnt, 0, 0, GUN_RANGE )				'GUN MAX RANGE

'-----------------------------------------------------------------------------
'	*Must be here because of some global dependencies above
'-----------------------------------------------------------------------------
#include once "INCLUDES/FPS_GUI.bi"


'-----------------------------------------------------------------------------
'	PRE-CACHE MODEL CREATION TO PREVENT IN-GAME SLOWNESS WHEN JOINING
'-----------------------------------------------------------------------------
FOR i AS INTEGER = 1 TO T_PLAYER_BUFFER
   CREATE_MODEL( T_PLAYER_LIST( i ) )
	iHideEntity( T_PLAYER_LIST( i ).pEnt )
next i

'-----------------------------------------------------------------------------
'	CREATE LOCAL PLAYER: ALWAYS T_PLAYER_LIST( 0 )
'-----------------------------------------------------------------------------
With T_PLAYER_LIST( 0 )
   .pEnt					= iCreatePivot( Camera )
'   .X						= 100
'   .Y						= GROUND_HEIGHT + PLAYER_HEIGHT + 1
'   .Z						= MAP_SIZE - 100
   .Yaw					= 0
   .Pitch				= 0
   .pCartridge			= MAX_AMMO_CARTRIDGE
   .pAmmoBelt			= MAX_AMMO
   .pHealth				= MAX_HEALTH
   .pArmor				= MAX_ARMOR/3
   .pKills				= 0
   .pDeaths				= 0
	.xVel					= 0
	.zVel					= 0
	.pWeaponPivot		= iCreatePivot( .pEnt )
   .pWeaponEnt(1)		= iCreateCylinder( 16, .pWeaponPivot )
   iRotateEntity( .pWeaponEnt(1), -90, 0, 0 )
   iEntityMaterialFlag( .pWeaponEnt(1), EMF_FOG_ENABLE, True )
   iEntityMaterialFlag( .pWeaponEnt(1), EMF_LIGHTING, True )
   iPositionEntity( .pWeaponEnt(1), 1.5, -1.0, 1.6 )
   iScaleEntity( .pWeaponEnt(1),0.05,0.2,0.05 )
   dim sil as iENTITY = iCreateCylinder( 16, .pWeaponEnt(1) )
   iScaleEntity( sil,1.1, .3, 1.1 )
   iMoveEntity( sil, 0, -2.8, 0 )
   iEntityColor( sil, 35, 35, 35 )
   iEntityColor( .pWeaponEnt(1), 25, 25, 25 )
	iPositionEntity( Camera, .X, .Y, .Z, true )
   .StepTimer				= iMilliSecs()		'320
   .LastPacketTimestamp = iRN_GetTime()
   .FlashSprite			= iCopyEntity( FlashSprite )
   .FlashTimer				= iMilliSecs() 	'100
   iScaleSprite( .FlashSprite, 2.5, 1.5 )
	.Light = iCreateLight( ELT_POINT, .FlashSprite )
	'iRotateEntity( .Light, 0, 0, -180 )
	iMoveEntity( .Light, 0, -1, -8 )
	iLightRadius( .Light, 2.15 )
	iLightColor( .Light, 255, 128, 0 )
	ihideEntity( .Light )
'	iEntityDebug( .Light, EDS_FULL ) : iMoveEntity( .Light, 0, 0, 6 )
   ' LOCAL PLAYER COLLISION ENTITY FOR DETECTING PICKUPS
   .pFeet					= iCreateCube( .pEnt )
   iEntityColor( .pFeet, 0, 0, 0 )
   iScaleEntity( .pFeet, 0.5, 2.4, 0.5 )
   iPositionEntity( .pFeet, 0, -9, 0 )
   .Selector(1)			= iCreateBoxSelector( .pFeet )
	.Selector(2)			= .Selector(1)
END WITH

'-----------------------------------------------------------------------------
' ENVIRONMENT
'-----------------------------------------------------------------------------
' SUN
dim Sun as iSPRITE = iCreateSprite( false )
iScaleSprite( Sun, 250, 250 )
iEntityColor( Sun, 255, 255, 0 )
iEntityMaterialType( Sun, EMT_TRANSPARENT_ADD_COLOR )
iTextureAnimator( Sun, "MEDIA/GFX/particlewhite", ".bmp", 2, 100, true )

' LIGHT
iAmbientLight( 50, 50, 50 )
DIM Light AS iLIGHT
Light = iCreateLight( ELT_POINT, Sun )
iLightRadius( Light, 850 * (MAP_SIZE/1000) )
if SHADOWS then iLightCastShadows( Light )
iLightColor( Light, 20, 20, 0 )
iRotateEntity( Light, -45, 0, 0 )
iLightRange( Light, 1.0, 1.0, 1.0 ) '?

' FLARE
dim shared Flare as iENTITY
dim shared FlareTexture as iTEXTURE
FlareTexture = iLoadTexture( "Media/GFX/flares.jpg" )
Flare = iCreateLensFlare( FlareTexture, Sun )
iLensFlareScale( Flare, 2, 0.5 )

' SKY
iCLSColor( SKY_R, SKY_G, SKY_B )
dim shared Sky as iENTITY
Sky = iCreateSphere( 32 )
iEntityMaterialFlag( Sky, EMF_FOG_ENABLE, True )
iFlipEntityMesh( Sky )
iScaleEntity( Sky, 500* (MAP_SIZE/1000), 500, 500* (MAP_SIZE/1000) )
iEntityColor( Sky, SKY_R, SKY_G, SKY_B )

' CLOUD LAYER
dim shared as iTEXTURE Clouds
Clouds = iLoadTexture( "MEDIA/GFX/Clouds.jpg" )
dim shared as iENTITY CloudLayer
CloudLayer = iCreateQuad( 100 )
iEntityMaterialType( CloudLayer, EMT_TRANSPARENT_ADD_COLOR )
iEntityMaterialFlag( CloudLayer, EMF_BACK_FACE_CULLING, false )
iEntityMaterialFlag( CloudLayer, EMF_FOG_ENABLE, false )
iScaleEntity( CloudLayer, 100, 1, 100 )
iEntityTexture( CloudLayer, Clouds )
iPositionEntity( CloudLayer, 500, 250, 500 )
iScaleTexture( CloudLayer, 4, 4 )

' SURFACE
dim shared as iTEXTURE Surf
dim shared as iTEXTURE SurfD
Surf = iLoadTexture( "MEDIA/GFX/detailmap3.jpg" )
SurfD = iLoadTexture( "MEDIA/GFX/detailmap3D.jpg" )
DIM shared Surface AS iTERRAIN
Surface = iLoadTerrain( "Media/GFX/SurfaceHM.bmp" )
if TEXTURES_ON then
	iEntityMaterialType( Surface, EMT_DETAIL_MAP )
	iEntityMaterialFlag( Surface, EMF_LIGHTING, true )
	iEntityMaterialFlag( Surface, EMF_NORMALIZE_NORMALS, true )
	iEntityTexture( Surface, Surf, 0 )
	iEntityTexture( Surface, SurfD, 1 )
	iScaleTexture( Surface, 190, 190 )	'160
	iScaleTexture( Surface, 90, 90, 0, 1 )
end if
iScaleEntity( Surface, 100.0, 1.0, 100.0 )
iPositionEntity( Surface, -2500, GROUND_HEIGHT, -2500 )
iEntityColor( Surface, 144, 88, 72 )
' TERRAIN COLLISION LOD : 0(BEST) to 3, else crash! Using 3 since surface is flat.
iMetaAddSelector( coll_World, iCreateTerrainSelector( Surface, 3 ) )

' BORDER FENCE
dim fence_BK as iENTITY = iCreateCube()
iScaleEntity( fence_BK, Map_Size/10, 10, 1 )
iPositionEntity( fence_BK, MAP_SIZE/2, 0, -1  )
iEntityColor( fence_BK, 100, 100, 100 )
dim fence_FR as iENTITY = iCreateCube()
iScaleEntity( fence_FR, Map_Size/10, 10, 1 )
iPositionEntity( fence_FR, MAP_SIZE/2, 0, MAP_SIZE+1 )
iEntityColor( fence_FR, 100, 100, 100 )
dim fence_RT as iENTITY = iCreateCube()
iScaleEntity( fence_RT, 1, 10, Map_Size/10 )
iPositionEntity( fence_RT, MAP_SIZE+1, 0, MAP_SIZE/2 )
iEntityColor( fence_RT, 100, 100, 100 )
dim fence_LF as iENTITY = iCreateCube()
iScaleEntity( fence_LF, 1, 10, Map_Size/10 )
iPositionEntity( fence_LF, -1, 0, MAP_SIZE/2 )
iEntityColor( fence_LF, 100, 100, 100 )
iMetaAddSelector( coll_World, iCreateBoxSelector( fence_FR ) )
iMetaAddSelector( coll_World, iCreateBoxSelector( fence_BK ) )
iMetaAddSelector( coll_World, iCreateBoxSelector( fence_LF ) )
iMetaAddSelector( coll_World, iCreateBoxSelector( fence_RT ) )
dim FenceTex as iTEXTURE = iLoadTexture( "Media/GFX/Wall.jpg" )
iEntityMaterialType ( fence_FR, EMT_DETAIL_MAP )
iEntityMaterialType ( fence_BK, EMT_DETAIL_MAP )
iEntityMaterialType ( fence_LF, EMT_DETAIL_MAP )
iEntityMaterialType ( fence_RT, EMT_DETAIL_MAP )
iEntityMaterialFlag( fence_FR, EMF_FOG_ENABLE, true )
iEntityMaterialFlag( fence_BK, EMF_FOG_ENABLE, true )
iEntityMaterialFlag( fence_LF, EMF_FOG_ENABLE, true )
iEntityMaterialFlag( fence_RT, EMF_FOG_ENABLE, true )
if TEXTURES_ON then
	iEntityTexture( fence_FR, FenceTex, 0 )
	iEntityTexture( fence_BK, FenceTex, 0 )
	iEntityTexture( fence_LF, FenceTex, 0 )
	iEntityTexture( fence_RT, FenceTex, 0 )
	iEntityTexture( fence_FR, SurfD, 1 )
	iEntityTexture( fence_BK, SurfD, 1 )
	iEntityTexture( fence_LF, SurfD, 1 )
	iEntityTexture( fence_RT, SurfD, 1 )
	iScaleTexture( fence_FR, 20*(MAP_SIZE/1000), 4, 0, 0 )
	iScaleTexture( fence_BK, 20*(MAP_SIZE/1000), 4, 0, 0 )
	iScaleTexture( fence_LF, 20*(MAP_SIZE/1000), 4, 0, 0 )
	iScaleTexture( fence_RT, 20*(MAP_SIZE/1000), 4, 0, 0 )
	iScaleTexture( fence_FR, 20*(MAP_SIZE/1000), 4, 0, 1 )
	iScaleTexture( fence_BK, 20*(MAP_SIZE/1000), 4, 0, 1 )
	iScaleTexture( fence_LF, 20*(MAP_SIZE/1000), 4, 0, 1 )
	iScaleTexture( fence_RT, 20*(MAP_SIZE/1000), 4, 0, 1 )
end if

'-----------------------------------------------------------------------------
' CAMERA WORLD COLLISION ANIMATOR
'-----------------------------------------------------------------------------
iAddCollisionAnimator( coll_World, Camera, false, 0.001 )
iEntityGravity( Camera, 0, GRAVITY, 0 )
iEntityRadius( Camera, 5.0, PLAYER_HEIGHT, 5.0 )
 
'-----------------------------------------------------------------------------
'  CREATE PORTALS, 1 IN EACH OF 4 QUADRANTS
'-----------------------------------------------------------------------------
DIM shared portal( 1 TO 4 ) AS iENTITY
dim ms AS INTEGER = MAP_SIZE / MAP_SEGMENTS
DIM portal_x( 1 TO 4 ) AS INTEGER
DIM portal_y( 1 TO 4 ) AS INTEGER
portal_x( 1 ) = 1 		: portal_y( 1 ) = 1
portal_x( 2 ) = 1 		: portal_y( 2 ) =  ms - 1
portal_x( 3 ) =  ms - 1 : portal_y( 3 ) = 1
portal_x( 4 ) =  ms - 1 : portal_y( 4 ) =  ms - 1
FOR i AS INTEGER = 1 TO 4
   portal(i) = CREATE_PORTAL() 
   MapArray( portal_x( i ), portal_y( i ) ) = portal(i)
   iPositionEntity( portal(i), portal_x( i ) * MAP_SEGMENTS,_
	iEntityY( portal(i) ), portal_y( i ) * MAP_SEGMENTS )
NEXT i

'-----------------------------------------------------------------------------
'	SHOW MAIN MENU
'-----------------------------------------------------------------------------
iPositionEntity( Sun, MAP_SIZE/2, MAP_SIZE/2, MAP_SIZE+100 )'500
MAIN_MENU()
iPositionEntity( Sun, -100, 1000, -100 )

'-----------------------------------------------------------------------------
'  INITIAL MESSAGES
'-----------------------------------------------------------------------------
dim introChatCount as integer = 5
dim introChat(0 to introChatCount, 1 ) as string*64
dim introChatCounter as integer = 0
dim introChatTimer as integer = iMilliSecs()  '500
introChat( 0, 0 ) = "SYSTEM" : introChat( 0, 1 ) = "- THIS IS BASIC IRRLICHT !"
introChat( 1, 0 ) = "SYSTEM" : introChat( 1, 1 ) = "- NOTHING FANCY, JUST...."
introChat( 2, 0 ) = "SYSTEM" : introChat( 2, 1 ) = "- A MULTIPLAYER FPS EXAMPLE"
introChat( 3, 0 ) = "SYSTEM" : introChat( 3, 1 ) = "- IMPLEMENTING IRRLICHT 1.9,"
introChat( 4, 0 ) = "SYSTEM" : introChat( 4, 1 ) = "- IRRKLANG AND RAKNET !"

'-----------------------------------------------------------------------------
'	AMBIENT SOUND
'-----------------------------------------------------------------------------
Theme = iPlayMusic( "MEDIA/SFX/war-is-coming-103662.ogg")	'Royalty Free Music BY Musictown
iSoundLoop( Theme )
iSoundVolume( Theme, 0.15 )
Ambience = iPlayMusic( "MEDIA/SFX/AmbientWind.ogg" )
iSoundLoop( Ambience )
iSoundVolume( Ambience, 0.8 )

'-----------------------------------------------------------------------------
'	GUN FX
'-----------------------------------------------------------------------------
DIM SHARED snd_Ricochet AS iSOUND_SOURCE
snd_Ricochet = iLoadSound( "Media/SFX/Ricochet.ogg" )
DIM SHARED ExplosionSprite AS iSprite
ExplosionSprite = iLoadSprite( "MEDIA/GFX/fireball.bmp" )
iHideEntity( ExplosionSprite )

'-----------------------------------------------------------------------------
'  SERVER?: CREATE BUILDINGS
'-----------------------------------------------------------------------------
IF Is_Server THEN
   FOR i AS INTEGER = 1 TO BUILDING_COUNT
      ' BUILDINGS
      T_BUIDLING_LIST( i ).Ent = iCopyEntity( Building, Surface )
		if SHADOWS then iEntityCastShadow( T_BUIDLING_LIST( i ).Ent )
      iShowEntity( T_BUIDLING_LIST( i ).Ent )
      DIM rd2 AS INTEGER = iRand( 6, 10 )
      T_BUIDLING_LIST( i ).Scale = rd2
      iRotateEntity( T_BUIDLING_LIST( i ).Ent, 0, iRand( 0, 359 ), 0 )
      iScaleEntity( T_BUIDLING_LIST( i ).Ent, rd2, rd2*4, rd2 )
      ADD_TO_MAP( T_BUIDLING_LIST( i ).Ent, iMeshHeight(T_BUIDLING_LIST( i ).Ent)*(rd2*2)-1 )
      iMetaAddSelector( coll_World, iCreateBoxSelector( T_BUIDLING_LIST( i ).Ent ) )
		T_BUIDLING_LIST( i ).X = iEntityX(T_BUIDLING_LIST( i ).Ent)
		T_BUIDLING_LIST( i ).Y = iEntityY(T_BUIDLING_LIST( i ).Ent)
		T_BUIDLING_LIST( i ).Z = iEntityZ(T_BUIDLING_LIST( i ).Ent)
		T_BUIDLING_LIST( i ).Yaw = iEntityYaw(T_BUIDLING_LIST( i ).Ent)
		if TEXTURES_ON then
			iEntityColor( T_BUIDLING_LIST( i ).Ent, SKY_R, SKY_G, SKY_B )
		else
			iEntityColor( T_BUIDLING_LIST( i ).Ent, 150, 150, 150 )	
		end if
   NEXT i
END IF

'-----------------------------------------------------------------------------
'  WEAPON SIGHT
'-----------------------------------------------------------------------------
DIM Sight AS iTEXTURE = iLoadTexture( "Media/GFX/Crosshair.bmp" )
iMaskTexture( Sight, 0, 0, 0 )

'=============================================================================
'-----------------------------------------------------------------------------
'  MAIN LOOP
'-----------------------------------------------------------------------------
'=============================================================================
DIM LFPS AS INTEGER = 0
DIM LFPS_count AS INTEGER = 0
DIM fps_time AS INTEGER = iMilliSecs()
CONST LogicFPS as integer = 60
CONST FramePeriod AS INTEGER = 1000 / LogicFPS
DIM FrameTime AS INTEGER = iMilliSecs() - FramePeriod
DIM FrameElapsed AS INTEGER = 0
DIM FrameLimit AS INTEGER = 0
DIM FrameTicks AS INTEGER = 0
dim shared Connections as integer = 0

iHidePointer()
iMoveMouse( GFX_WIDTH / 2, GFX_HEIGHT / 2 )
iPlaySound( snd_Respawn )
iShowEntity( Camera )

WHILE iRun() AND ( NOT ExitApp )
	if IS_SERVER then Connections = iRN_GetTotalConnections()
'-----------------------------------------------------------------------------
'	CALCULATE FPS EACH FRAME
'-----------------------------------------------------------------------------
   DeltaTime = iMillisecs() - dStartTime
   dStartTime = iMillisecs()
   IF iMilliSecs() - fps_time > 1000 THEN
      TPacketsIn = NetQueueIn : NetQueueIn = 0
      TPacketsOut = NetQueueOut : NetQueueOut = 0
      LFPS = Lfps_count : LFPS_count = 1 : fps_time = iMilliSecs()
   END IF
'-----------------------------------------------------------------------------
'	FRAME TIMER TO KEEP GAME LOGIC IN SYNC
'-----------------------------------------------------------------------------
   DO
      FrameElapsed = iMilliSecs() - FrameTime
   LOOP UNTIL FrameElapsed
   FrameTicks = FrameElapsed / FramePeriod
   FOR FrameLimit = 1 TO FrameTicks
      FrameTime = FrameTime + FramePeriod
      LFPS_count += 1
'-----------------------------------------------------------------------------
'	   LOGIC CODE AFFECTED BY FRAME TIME HERE!
'-----------------------------------------------------------------------------
      if GUI_ACTIVE then	'and ( not CHATTING )
         PROCESS_GUI_MENU()
      else
         IF iWindowFocused() and T_PLAYER_LIST( 0 ).pState = SLOT_ALIVE THEN
            iCameraInput( Camera, true )
            iHidePointer()
            PLAYER_CONTROLS( Camera )
         ELSE
            iCameraInput( Camera, false )
            iShowPointer()
         END IF
      end if
		
		' RESET DEAD LOCAL PLAYER
      if T_PLAYER_LIST( 0 ).pState = SLOT_DEAD and iKeyHit( KEY_SPACE ) then
         with T_PLAYER_LIST( 0 )
            iPlaySound( snd_Respawn )
            .pState = SLOT_ALIVE
				' PLACE PLAYER	 CHANGE FOLLOWING TO SPAWN TELEPORT ON SERVER AND SEND
				dim rp as integer
				rp = iRand(1,4)
				.X = iEntityX( Portal( rp ) )
				.Z = iEntityZ( Portal( rp ) )
				'iHideEntity( .pEnt )
				'iEntityParent( .pEnt, Camera )
            iRotateEntity( .pEnt, 0, 0, 0 )
            iPositionEntity( .pEnt, 0, 0, 0 )
				iPositionEntity( Camera, .X, .Y, .Z, true )
				dim tmppvt as iENTITY = iCreatePivot()
				iPositionEntity( tmppvt, Map_Size/2, Player_Height, Map_Size/2 )
				iPointEntity( Camera, tmppvt )
				iFreeEntity( tmppvt )
				.zVel = 5
				if not iSoundPlaying( chnl_Respawn ) then chnl_Respawn = iPlaySound( snd_Respawn )
            if iFadeReady() then
               iFadeColor( 1, 1, 1 )
               iFadeIn( 2000 )
				end if
				teleport_delay_TIMER = iMilliSecs()
				'iShowEntity( .pEnt )
            .pCartridge = MAX_AMMO_CARTRIDGE
            .pAmmoBelt = MAX_AMMO
            .pHealth = MAX_HEALTH
            .pArmor = MAX_ARMOR/3
				iRN_SendByte( NET_ALIVE )
				iRN_SendInt( .pid )
				iRN_SendInt( .pState )
				if IS_SERVER then
					NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE, TRUE )
				else
					NET_SEND( RN_HOST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE, false )
				end if
          end with
			 iFlushMouse()
			 iFlushKeys()
      end if
		
      CloudX += .0002
      iPositionTexture( CloudLayer, CloudX, 0.0 )
      UPDATE_PICKUPS()
      UPDATE_NET_PLAYERS( DeltaTime )
      UPDATE_DEATH()
      UPDATE_EXPLOSIONS()
		UPDATE_SHADOWS()
		
		' LET'S DO SOME SERVER STUFF HERE
		if Is_Server then
			IF ( iMilliSecs() > SnapshotTimer + 10000 ) THEN
					SnapshotTimer = iMilliSecs()
					iRN_SendByte( NET_GLOBAL_SNAPSHOT )
					iRN_SendFloat( iEntityYaw( SKY ) )
					NET_SEND( RN_BROADCAST, RN_HIGH_PRIORITY, RN_UNRELIABLE )
			END IF
			IF ( iMilliSecs() > PickupTimer + 1000 ) and T_PICKUP_TOTAL <= MAX_PICKUP then
				dim r as integer = iRand(1,20)
				dim rtype as integer = 0
				if r > 19 then
					rtype = iRAND(2,3)
				elseif r > 17 then
					rtype = 2
				else
					rtype = 1
				end if
				dim x as integer = iRand(50,MAP_SIZE-50)
				dim y as integer = iRand(50,MAP_SIZE-50)
				T_PICKUP_NET_ID += 1
				CREATE_PICKUP( T_PICKUP_NET_ID, rtype, x, y )
				iRN_SendByte( NET_CREATE_PICKUP )
				iRN_SendInt( T_PICKUP_NET_ID )
				iRN_SendInt( rtype )
				iRN_SendInt( x )
				iRN_SendInt( y )
				iRN_SendInt( 0 )
				NET_SEND( RN_BROADCAST, RN_HIGH_PRIORITY, RN_RELIABLE )
				PickupTimer = iMilliSecs()
			END IF
		end if
      IF iKeyHit( KEY_F11 ) THEN DEBUG = NOT DEBUG
      IF iKeyHit( KEY_F12 ) THEN
         iScreenShot( "Screenshots" )
         iSoundVolume( iPlaysound( snd_ScreenShot ), 1.0 )
         if iFadeReady() then
            iFadeColor( 255, 255, 255 )
            iFadeIn( 100 )
         end if
      end if
      IF iKeyDown( KEY_LCONTROL ) and iKeyHit( KEY_Z ) THEN ShowGUI = NOT ShowGUI
      IF (iMilliSecs() > introChatTimer + 500 ) and introChatCounter < introChatCount then
         introChatTimer = iMilliSecs()
			dim col as integer
			if introChat( introChatCounter, 0 ) = "SERVER" then col = 2 : else col = 1
         ADD_CHAT( introChat( introChatCounter, 0 ), introChat( introChatCounter, 1 ), col )
         introChatCounter += 1
      end if

			
''TESTPLAYER MOVEMENT
'		if T_PLAYER_LIST( 1 ).pEnt then
'			T_PLAYER_LIST( 1 ).zVel = MAX_VELOCITY	'1.0
'			T_PLAYER_LIST( 1 ).yaw = T_PLAYER_LIST( 1 ).yaw + 1
'		end if


'-----------------------------------------------------------------------------
	NEXT
'-----------------------------------------------------------------------------
'  CODE RUNNING AT ENGINE FPS GOES HERE!
'-----------------------------------------------------------------------------
	If CHATTING Then
		CHAT_CONSOLE()
	end if

   PROCESS_COLLISIONS()  '*MUST BE REAL TIME WITH ENGINE FPS, NOT WITH LOGIC LOOP!
   PROCESS_NETWORK()
   IF iMilliSecs() >= ( NET_POS_TIMER + POS_UPDATE_FREQ ) THEN
      NET_POS_TIMER = iMilliSecs()
      SEND_POS_UPDATE()
   END IF
	
'	HIDE LENS FLARE WHEN CAMERA IS BEHIND WORLD OBJECT (SHOOT A RAY FROM THE SUN TO THE CAMERA)
	if not iEntityVisible( Sun, Camera, coll_World ) then
   	iHideEntity( Flare )
	Else
		iShowEntity( Flare )
	End If



   
'-----------------------------------------------------------------------------
   iUpdateScene()	
	iRenderScene()

	' SHOW OR HIDE NAME SPRITE	AND CARTOON OUTLINE IF ENABLED
   FOR i AS INTEGER = 1 TO T_PLAYER_TOTAL
		WITH T_PLAYER_LIST( i )
			if .pState <> SLOT_DEAD then
				if iEntityDistance( .pEnt, T_PLAYER_LIST( 0 ).pEnt ) < 250 then
					iShowEntity( .NameSprite )
					if CARTOON_OUTLINE then
						iOutlineMesh( .pHead, 4.0, 0, 0, 0 )
						iOutlineMesh( .pBody, 4.0, 0, 0, 0 )
					end if
				else
					iHideEntity( .NameSprite )
				end if
			end if
		end with
	next

'-----------------------------------------------------------------------------	
'	2D STUFF AFTER EVERY 3D RENDER
'-----------------------------------------------------------------------------
   If ShowGUI Then
      iColor( 255, 255, 255 )
      iText( GFX_WIDTH - 180, GFX_HEIGHT - 40, "NETMSG PS" )
      iText( GFX_WIDTH - 120, GFX_HEIGHT - 20, str( TPacketsIn )+" <-IN OUT-> "+str( TPacketsOut ), true )	
      iText( GFX_WIDTH/2, 10, "HEADING", True )
      iText( GFX_WIDTH/2, 30, Str(Int(iEntityYaw(Camera))), True )
      iText( GFX_WIDTH/1.28, 10, "X COORD", True )
      iText( GFX_WIDTH/1.28, 30, Str(Int(iEntityX(Camera))), True )
      iText( GFX_WIDTH/1.12, 10, "Z COORD", True )
      iText( GFX_WIDTH/1.12, 30, Str(Int(iEntityZ(Camera))), True )
		iText( 20, 10, "ROUNDS:" )
      iText( 140, 10, Str(T_PLAYER_LIST( 0 ).pAmmoBelt ) )
      iText( 20, 30, "MAGAZINE:" )
      iText( 140, 30, Str(T_PLAYER_LIST( 0 ).pCartridge ) )
      iText( 20, 50, "HEALTH:" )
      iText( 140, 50, Str(T_PLAYER_LIST( 0 ).pHealth) )
      iText( 20, 70, "ARMOR:" )
      iText( 140, 70, Str(T_PLAYER_LIST( 0 ).pArmor) )
      If T_PLAYER_LIST( 0 ).pState = SLOT_DEAD Then
         iColor( 255, 0, 0 )
         iText( GFX_WIDTH/2, 100, "< Y O U R  D E A D !!  HIT SPACE TO RESPAWN >", True )
			iColor( 255, 255, 255 )
      End If
      If DEBUG Then
         iText( GFX_WIDTH-280, 90, "SERVER IP: "+IP+"  NET PID: "+Str(T_PLAYER_LIST( 0 ).pid), True )
         iText( GFX_WIDTH-280, 110, "MY IP: "+str( *iRN_GetMyIP() )+"  RN GUID: "+Str( *iRN_GetMyGUID() ), True )
			iText( GFX_WIDTH-180, 130, "ENGINE FPS: " + Str(iFPS()), True )
         iText( GFX_WIDTH-180, 150, "LOGIC FPS: "+Str(LFPS), True )
         iText( GFX_WIDTH-280, 190, "ENGINE RUNTIME: " + Str(iRunTime()) )
         iText( GFX_WIDTH-260, 210, "*-ARRAY BUFFERS-*" )
         iText( GFX_WIDTH-280, 230, "T_PICKUP: "+Str(T_PICKUP_TOTAL)+" OF "+Str(T_PICKUP_BUFFER) )
         iText( GFX_WIDTH-280, 250, "T_PLAYER: "+Str(T_PLAYER_TOTAL+1)+" OF "+Str(T_PLAYER_BUFFER-1) )
         iText( GFX_WIDTH-280, 270, "T_CHAT: "+Str(T_CHAT_TOTAL)+" OF "+Str(T_CHAT_BUFFER) )
         iText( GFX_WIDTH-280, 290, "T_EXPLOSION: "+Str(T_EXPLOSION_TOTAL)+" OF "+Str(T_EXPLOSION_BUFFER) )
         iText( 10, 90, "PRIMITIVES DRAWN: "+Str( iTrisRendered() ) )
         iText( 10, 110, "PLAYER P: "+Str(Int(T_PLAYER_LIST( 0 ).Pitch))+" Y: "+Str(Int(T_PLAYER_LIST( 0 ).Yaw))+" R: "+Str(Int(iEntityRoll(Camera))) )
         iText( 10, 130, "PLAYER X: "+Str(Int(iEntityX(Camera)))+"  Y: "+Str(Int(iEntityY(Camera)))+"  Z: "+Str(Int(iEntityZ(Camera))) )
         iText( 10, 150, "PLAYER xVEL: "+Str(T_PLAYER_LIST( 0 ).xVel)+"  PLAYER zVEL: "+Str(T_PLAYER_LIST( 0 ).zVel) )
         iText( 10, 170, "PLAYER xACC: "+Str(T_PLAYER_LIST( 0 ).xAcc)+"  PLAYER zACC: "+Str(T_PLAYER_LIST( 0 ).zAcc) )
         iText( 10, 190, "CAMERA TARGET X: "+Str(Int(iCamTargetX(Camera)))+"  Y: "+Str(Int(iCamTargetY(Camera)))+"  Z: "+Str(Int(iCamTargetZ(Camera))) )
         iText( 10, 230, "GUN DELAY: "+Str(Gun_Delay_Counter) )
         iText( 10, 250, "FALLING: "+Str(falling))
         iText( 10, 270, "PROJECTILE COLLISION ENTITY: "+Str(DebugColl) )
         iText( 10, 290, "CAMERA COLLISION COUNT: "+Str(iCountCollisions(Camera)) )
         iText( 10, 310, "PICKUP COLLISION COUNT: "+Str(PickupCol) )
         iText( 10, 330, "CAMERA COLLISION ENT: "+Str(iGetCameraCollisionEntity(Camera)) )
         iText( 10, 350, "MOUSE  X: "+Str(iMouseX())+"  Y: "+Str(iMouseY())+"  Zspeed: "+Str(iMouseZSpeed()) )
         iText( 10, 370, "TOTAL SPLINES: "+Str(iGetTotalSplines()) )
         iText( 10, 390, "STEP TIMER: "+Str(T_PLAYER_LIST( 0 ).StepTimer) )
			iText( 10, 410, "BUILDING COUNT: "+Str(BUILDING_COUNT) )
			iLine3D(iEntityX(T_PLAYER_LIST( 0 ).pWeaponEnt(1), True), iEntityY(T_PLAYER_LIST( 0 ).pWeaponEnt(1), True),_
                  iEntityZ(T_PLAYER_LIST( 0 ).pWeaponEnt(1), True), iCamTargetX(Camera), iCamTargetY(Camera),_
                  iCamTargetZ(Camera))
      End If
		iColor( HUD_R, HUD_G, HUD_B )
      DRAW_CHAT()
      If Not GUI_ACTIVE Then iDrawTexture( Sight, (GFX_WIDTH/2)-iTextureWidth(Sight)/2, (GFX_HEIGHT/2)-iTextureHeight(Sight)/2 )
   End If
	If iKeyDown( KEY_TAB ) Then DISPLAY_STATS()
   If iKeyDown( KEY_F1 ) Then iDrawTexture( Controls, 120, 150 )
   If iKeyHit( KEY_ESCAPE ) And ( not GUI_ACTIVE ) and ( not CHATTING ) Then
      GUI_ACTIVE = True
      iCameraInput( Camera, False )
      iShowPointer()
      iNotify( "EXIT GAME", "ARE YOU SURE YOU WANT TO QUIT AND EXIT?", EMBF_OK+EMBF_CANCEL )
		iFlushMouse()
   End If
   If iMilliSecs() < Headshot + 1000 Then
		iColor( 255, 0, 0 )
		iText( GFX_WIDTH/2, 100, "H E A D   S H O T ! !", True )
	End If

	
'TEST
'   If iKeyHit( KEY_8 ) Then
'      Is_Server = False
'      ADD_PLAYER( "RAND"+Str(iRAND(100,999)), 20, 1 )
'      Is_Server = True
'      With T_PLAYER_LIST( 20 )
'         .PacketX = .X
'         .PacketY = .Y
'         .PacketZ = .Z
'         .LastPacketTimestamp = iMilliSecs()
'         Sleep( 50 )
'      End With
'   End If
'   If iKeyHit( KEY_9 ) Then
'      T_PLAYER_LIST( 20 ).pState = SLOT_DEAD
'      DEATH( 20, 0 )
'   End If


'	if iKeyHit( KEY_UP ) then bpos += 1
'	if iKeyHit( KEY_DOWN ) then bpos -= 1
'	with T_BUIDLING_LIST( 1 )
'		iPositionEntity( .Ent, iEntityX( .Ent ), bpos, iEntityZ( .Ent ) )
'	end with
	
'-----------------------------------------------------------------------------   
	iRenderGUI()   'REQUIRED TO RENDER SCREEN FADER AND GUI ELEMENTS
   iFlip()
Wend
'-----------------------------------------------------------------------------
'  MAIN LOOP END
'-----------------------------------------------------------------------------
SHUTDOWN()
End



'=============================================================================
'=============================================================================
'-----------------------------------------------------------------------------
'  FUNCTIONS
'-----------------------------------------------------------------------------
'=============================================================================
'=============================================================================

'-----------------------------------------------------------------------------
' ADD CHAT MESSAGE
'-----------------------------------------------------------------------------
Sub ADD_CHAT( ID As String, msg As String, mType As Integer=1, snd As Boolean = True )
   DIM m AS T_CHAT
   T_CHAT_TOTAL += 1
   If T_CHAT_TOTAL > T_CHAT_BUFFER Then
      Dim ii As Integer = 1
      For i As Integer = T_CHAT_BUFFER - 15 To T_CHAT_BUFFER
         Swap T_CHAT_LIST( ii ), T_CHAT_LIST( i )
         ii += 1
      Next
      For i As Integer = 15 To T_CHAT_BUFFER
         With T_CHAT_LIST(i)
            .ID = ""
            .Message = ""
            .msgType = 0
         End With
      Next
      T_CHAT_TOTAL = 16
   End If
'   if T_CHAT_COUNT > 2 then
'      for d as integer = 2 to T_CHAT_COUNT
'         'T_CHAT_LIST( d-1 ) = T_CHAT_LIST( d )
'         swap T_CHAT_LIST( d-1 ),T_CHAT_LIST( d )
'      next
'      T_CHAT_COUNT -= 1   
'   end if
   T_CHAT_LIST(T_CHAT_TOTAL).ID = ID
   T_CHAT_LIST(T_CHAT_TOTAL).Message = msg
   T_CHAT_LIST(T_CHAT_TOTAL).msgType = mType
   If snd Then
      iSoundVolume( iPlaySound( snd_Chat ), 0.2 )
   END IF
END SUB

'-----------------------------------------------------------------------------
' ADD PLAYER
'-----------------------------------------------------------------------------
SUB ADD_PLAYER( PlayerName AS STRING, PlayerID AS INTEGER, Team as integer )
	if T_PLAYER_TOTAL < T_PLAYER_BUFFER then
		T_PLAYER_TOTAL += 1
		WITH T_PLAYER_LIST( T_PLAYER_TOTAL  )
			.pState = SLOT_ALIVE
			.pName = PlayerName
			.PID = PlayerID
			.pHeadColor( 1 ) = iRN_GetInt()
			.pHeadColor( 2 ) = iRN_GetInt()
			.pHeadColor( 3 ) = iRN_GetInt()
			.pSuitColor( 1 ) = iRN_GetInt()
			.pSuitColor( 2 ) = iRN_GetInt()
			.pSuitColor( 3 ) = iRN_GetInt()
			.SplineID = iCreateSpline()
			.X = 100
			.Y = GROUND_HEIGHT + PLAYER_HEIGHT
			.Z = MAP_SIZE - 150
			.Yaw = 0
			.pCartridge = MAX_AMMO_CARTRIDGE
			.pAmmoBelt = MAX_AMMO
			.pHealth = iRN_GetInt()	'MAX_HEALTH
			.pArmor = iRN_GetInt()	'MAX_ARMOR/3
			.pKills = iRN_GetInt()	'0
			.pDeaths = iRN_GetInt()	'0
			.StepTimer = iMilliSecs()   '320
			.LastPacketTimestamp = iRN_GetTime() 'SET DEFAULT TIME FOR NEW PLAYER
			.FlashSprite = iCopyEntity( FlashSprite )
			.FlashTimer = iMilliSecs() '100
			iScaleSprite( .FlashSprite, 15, 15 )
			.Light = iCreateLight( ELT_POINT, .FlashSprite )
			iMoveEntity( .Light, 0, 0, -8 )
			iLightRadius( .Light, 2.15 )
			iLightColor( .Light, 255, 128, 0 )
			ihideEntity( .Light )
			.NameSprite = CREATE_NAME_SPRITE( PlayerName )
			iScaleSprite( .NameSprite, 20, 5 )
			iEntityParent( .NameSprite, .pBody )
			iPositionEntity( .NameSprite, 0, 10, 0 )
			iEntityMaterialFlag( .NameSprite, EMF_LIGHTING, false )
			iEntityMaterialFlag( .NameSprite, EMF_FOG_ENABLE, false )
			iEntityMaterialFlag( .NameSprite, EMF_BACK_FACE_CULLING, false )
			' PLAYER COLLISIONS
			.Selector(1) = iCreateTriSelector( .pHead )
			.Selector(2) = iCreateTriSelector( .pBody )
			' PLAYER POSITION  
			iPositionEntity( .pEnt, .X, .Y, .Z )
			iRotateEntity( .pEnt, 0, .Yaw, 0 )
			iShowEntity( .pEnt )
			'iShowEntity( .pFeet )
			iEntityColor( .pHead, 255-.pHeadColor( 1 ), 255-.pHeadColor( 2 ), 255-.pHeadColor( 3 ) )
			iEntityColor( .pBody, 255-.pSuitColor( 1 ), 255-.pSuitColor( 2 ), 255-.pSuitColor( 3 ) )
			
			IF Is_Server = true THEN
				MAX_PICKUP = 5 * T_PLAYER_TOTAL
				' INITIALIZE PLAYER
				.Yaw					= 0
				.Pitch				= 0
				.pCartridge			= MAX_AMMO_CARTRIDGE
				.pAmmoBelt			= MAX_AMMO
				.pHealth				= MAX_HEALTH
				.pArmor				= MAX_ARMOR/3
				.pKills				= 0
				.pDeaths				= 0
				.xVel					= 0
				.zVel					= 0	'THIS VALUE PUSHES US OUT OF THE PORTAL ON SPAWN

				' PLACE PLAYER
				dim rp as integer
				rp = iRand(1,4)
				.X = iEntityX( Portal( rp ) )
				.Y = GROUND_HEIGHT + PLAYER_HEIGHT
				.Z = iEntityZ( Portal( rp ) )
				.zVel = 5

				' SEND PLAYER MAP DIMENSIONS AND OBJECTS
				iRN_SendByte( NET_MAP_SIZE )
				iRN_SendInt( .PID )
				iRN_SendInt( MAP_SIZE )
				iRN_SendInt( BUILDING_COUNT )
				NET_SEND( PlayerID, RN_HIGH_PRIORITY, RN_RELIABLE, false )
				SLEEP( 10, 1 )
				' SEND SKY SYNC
				iRN_SendByte( NET_GLOBAL_SNAPSHOT )
				iRN_SendFloat( iEntityYaw( SKY ) )
				NET_SEND( .PID, RN_HIGH_PRIORITY, RN_RELIABLE, false )

				' SEND NEW PLAYER EXISTING PLAYERS
				FOR p AS INTEGER = 0 TO T_PLAYER_TOTAL
					if T_PLAYER_LIST( p ).pid <> PlayerID then
						PRINT("SENDING PLAYER: "+STR(p)+" NAME: "+T_PLAYER_LIST( p ).pName)
						iRN_SendByte( NET_PLAYER_CONNECT )
						iRN_SendInt( T_PLAYER_LIST( p ).pid )
						iRN_SendString( T_PLAYER_LIST( p ).pName )
						iRN_SendInt( T_PLAYER_LIST( p ).pTeam )
						iRN_SendInt( T_PLAYER_LIST( p ).pHeadColor( 1 ) )
						iRN_SendInt( T_PLAYER_LIST( p ).pHeadColor( 2 ) )
						iRN_SendInt( T_PLAYER_LIST( p ).pHeadColor( 3 ) )
						iRN_SendInt( T_PLAYER_LIST( p ).pSuitColor( 1 ) )
						iRN_SendInt( T_PLAYER_LIST( p ).pSuitColor( 2 ) )
						iRN_SendInt( T_PLAYER_LIST( p ).pSuitColor( 3 ) )
						iRN_SendInt( T_PLAYER_LIST( p ).pHealth ) 
						iRN_SendInt( T_PLAYER_LIST( p ).pArmor )
						iRN_SendInt( T_PLAYER_LIST( p ).pKills )
						iRN_SendInt( T_PLAYER_LIST( p ).pDeaths )
						NET_SEND( PlayerID, RN_HIGH_PRIORITY, RN_RELIABLE, false )
					end if
				NEXT p           

				' SEND EXISTING PLAYERS THE NEW PLAYER
				iRN_SendByte( NET_PLAYER_CONNECT )
				iRN_SendInt( .pid )
				iRN_SendString( .pName )
				iRN_SendInt( .pTeam )
				iRN_SendInt( .pHeadColor( 1 ) )
				iRN_SendInt( .pHeadColor( 2 ) )
				iRN_SendInt( .pHeadColor( 3 ) )
				iRN_SendInt( .pSuitColor( 1 ) )
				iRN_SendInt( .pSuitColor( 2 ) )
				iRN_SendInt( .pSuitColor( 3 ) )
				iRN_SendInt( .pHealth ) 
				iRN_SendInt( .pArmor )
				iRN_SendInt( .pKills )
				iRN_SendInt( .pDeaths )
				NET_SEND( RN_BROADCAST, RN_HIGH_PRIORITY, RN_RELIABLE )

				' BUILDINGS
				FOR i AS INTEGER = 1 TO BUILDING_COUNT
					with T_BUIDLING_LIST( i )
						iRN_SendByte( NET_MAP_OBJECT )
						iRN_SendInt( 2 )
						iRN_SendInt( i )
						iRN_SendFloat( .X )
						iRN_SendFloat( .Y )
						iRN_SendFloat( .Z )
						iRN_SendInt( .Yaw )
						iRN_SendInt( .Scale )
						NET_SEND( PlayerID, RN_HIGH_PRIORITY, RN_RELIABLE, false )
					end with
				NEXT i  

				' SEND EXISTING PICKUPS
				FOR i AS INTEGER = 1 TO T_PICKUP_TOTAL
					WITH T_PICKUP_LIST( i )
						iRN_SendByte( NET_CREATE_PICKUP )
						iRN_SendInt( .Net_ID )
						iRN_SendInt( .pType )
						iRN_SendInt( .x )
						iRN_SendInt( .z )
						iRN_SendInt( iMilliSecs() - .timeout )
						NET_SEND( PlayerID, RN_HIGH_PRIORITY, RN_RELIABLE, false )
					END WITH
				NEXT i
				
				' BROADCAST NEW PLAYER INFO AND SPAWN POINT
'               iSendByte( NET_LOGIN_REPLY )
'               NET_SEND( .pid, RN_MEDIUM_PRIORITY, RN_RELIABLE )

				' SEND WELCOME MESSAGE
				iRN_SendByte( NET_CHAT )
				iRN_SendInt( 0 )
				iRN_SendString( "WELCOME TO "+ServerName+" !" )
				NET_SEND( .pid, RN_MEDIUM_PRIORITY, RN_RELIABLE_ORDERED, false )
			
			END IF
			
			UPDATE_SCARRS( .pid )
			Add_Chat( "SERVER", .pName+" has joined the game! PID: "+STR(PlayerID), 2 )
		END WITH
	end if
END SUB

'-----------------------------------------------------------------------------
' KEEPS DYNAMIC ENTITIES FROM OVERLAPPING ON THE MAP
'-----------------------------------------------------------------------------
SUB ADD_TO_MAP( ent AS iENTITY, height AS SINGLE )
   DIM r1 AS INTEGER
   DIM r2 AS INTEGER
   DIM ms AS INTEGER = MAP_SIZE / MAP_SEGMENTS
   do
      r1 = iRand( 0, ms )
      r2 = iRand( 0, ms )
      IF MapArray( r1, r2 ) = 0 THEN
         MapArray( r1, r2 ) = ent
         iPositionEntity( ent, r1 * MAP_SEGMENTS, height, r2 * MAP_SEGMENTS )
         exit do
         IF iKeyHit( KEY_ESCAPE ) THEN EXIT do
      END IF
   loop
END SUB

'-----------------------------------------------------------------------------
' ACCEPT CHAT INPUT
'-----------------------------------------------------------------------------
sub CHAT_CONSOLE() 
	dim key as integer

	If iMilliSecs() > CHAT_TIMER + 140 or PrevKey = 0 then 
		CHAT_TIMER = iMilliSecs()
		PrevKey = 0
		key = iGetKey()
	End If
	if key <> PrevKey then
		If (( key >= 32 ) And ( key <= 222 )) then	' or ( (key > 187 ) and ( key < 222 ) ) then		126
			'print"KEY: "+str(key)
			iPlaySound( snd_BUTTON_CLICK )
			OutgoingChat = OutgoingChat + chr( key )
			PrevKey = key
			CHAT_TIMER = iMilliSecs()
		End If
		If (key = 8) and ( OutgoingChat > "" ) Then		'BACKSPACE -> DELETE A CHARACTER
			iPlaySound( snd_BUTTON_CLICK )
			OutgoingChat = Left( OutgoingChat, len( OutgoingChat ) - 1 )	
			PrevKey = key
			CHAT_TIMER = iMilliSecs()
		end if
	end if
	If key = 13 Then											'ENTER
		If Trim( OutgoingChat ) > "" then
    		iRN_SendByte( NET_CHAT )
			iRN_SendInt( T_PLAYER_LIST( 0 ).pid )
			iRN_SendString( OutgoingChat )
		   NET_SEND( RN_BROADCAST, RN_MEDIUM_PRIORITY, RN_RELIABLE_ORDERED )
			ADD_CHAT( "YOU", OutgoingChat, 3 ) 
		End If
		chatting = False
		OutgoingChat = ""
		iFlushKeys()
		iFlushMouse()
	End If
	If iMilliSecs() > CURSOR_TIMER + 250 then
		CURSOR_TIMER = iMilliSecs()
		If Cursor = " " Then Cursor = "_" Else Cursor = " "
	End If
End sub

'-----------------------------------------------------------------------------
' CREATE EXPLOSION
'-----------------------------------------------------------------------------
SUB CREATE_EXPLOSION( x AS SINGLE, y AS SINGLE, z AS SINGLE, tType as integer )
	if T_EXPLOSION_TOTAL < T_EXPLOSION_BUFFER then
		T_EXPLOSION_TOTAL += 1
		WITH T_EXPLOSION_LIST( T_EXPLOSION_TOTAL )
			.TimeOut = 10
			.Sprite = iCopyEntity( ExplosionSprite )
			.Scale = 2.0
			.Emitter = iCreatePivot()
			iPositionEntity( .Emitter, x, y, z )
			iShowEntity( .Sprite )
			iPositionEntity( .Sprite, x, y, z )
			select case tType
				case target_SURFACE
					iHideEntity( .Sprite )
					iSetSoundDistance( iEmitSound( snd_Flesh, .Emitter ), SND_DISTANCE )
					' DEBRIS PARTICLES
					DIM debrisPS AS iPARTICLE_SYSTEM
					DIM debrisEmitter AS iEMITTER
					debrisPS = iCreateParticleSystem( false )
					iPositionEntity( debrisPS, x, y, z)
					debrisEmitter = iCreateParticleEmitter( debrisPS, particle_Def( prtcl_BLOOD ) )
					iEntityMaterialFlag( debrisPS, EMF_FOG_ENABLE, false )
					iEntityMaterialFlag( debrisPS, EMF_LIGHTING, true )
					iEntityColor( debrisPS, 144, 98, 72 )
					iCreateGravityAffector( debrisPS, 0.0, -0.1, 0.0, 1000 )
					iCreateFadeOutAffector( debrisPS, 100, 0, 0, 0 )
					iCreateStopAffector( debrisPS, 300, debrisEmitter )
					iDeletionAnimator( debrisPS, 2500  )
					' DUST PARTICLES
					DIM dustPS AS iPARTICLE_SYSTEM
					DIM dustEmitter AS iEMITTER
					dustPS = iCreateParticleSystem( false )
					iPositionEntity( dustPS, x, GROUND_HEIGHT+0.1, z)
					dustEmitter = iCreateParticleEmitter( dustPS, particle_Def( prtcl_MIST ) )
					iEntityMaterialType( dustPS, EMT_TRANSPARENT_ADD_COLOR )
					iEntityMaterialFlag( dustPS, EMF_FOG_ENABLE, false )
					iEntityMaterialFlag( dustPS, EMF_LIGHTING, true )
					iEntityTexture( dustPS, smoke_tex )
					iEntityColor( dustPS, 124, 78, 52 )
					iCreateFadeOutAffector( dustPS, 100, 0, 0, 0 )
					iCreateStopAffector( dustPS, 300, dustEmitter )
					iDeletionAnimator( dustPS, 2500  )
					exit select
				
				case target_BUILDING		'WALL
					'iEmitSound( snd_Ricochet, .Emitter )
					iSetSoundDistance( iEmitSound( snd_Ricochet, .Emitter ), SND_DISTANCE )
					' SMOKE PARTICLES
					DIM smokePS AS iPARTICLE_SYSTEM
					DIM smokeEmitter AS iEMITTER
					smokePS = iCreateParticleSystem( false )
					iPositionEntity( smokePS, x, y, z)
					smokeEmitter = iCreateParticleEmitter( smokePS, particle_Def( prtcl_SMOKE ) )
					iEntityMaterialType( smokePS, EMT_TRANSPARENT_ADD_COLOR )
					iEntityMaterialFlag( smokePS, EMF_FOG_ENABLE, false )
					iEntityMaterialFlag( smokePS, EMF_LIGHTING, false )
					iEntityTexture( smokePS, smoke_tex )
					iCreateFadeOutAffector( smokePS, 100, 0, 0, 0 )
					iCreateStopAffector( smokePS, 300, smokeEmitter )
					iDeletionAnimator( smokePS, 2500  )
					' SPARK PARTICLES
					DIM sparkPS AS iPARTICLE_SYSTEM
					DIM sparkEmitter AS iEMITTER
					sparkPS = iCreateParticleSystem( false )
					iPositionEntity( sparkPS, x, y-10, z)
					sparkEmitter = iCreateParticleEmitter( sparkPS, particle_Def( prtcl_SPARK ) )
					iEntityMaterialType( sparkPS, EMT_TRANSPARENT_ADD_COLOR )
					iEntityMaterialFlag( sparkPS, EMF_FOG_ENABLE, false )
					iEntityMaterialFlag( sparkPS, EMF_LIGHTING, false )
					iEntityColor( sparkPS, 255, 128, 0 )
					iCreateFadeOutAffector( sparkPS, 100, 0, 0, 0 )
					iCreateStopAffector( sparkPS, 400, sparkEmitter )
					iDeletionAnimator( sparkPS, 2500  )
					exit select

				case target_PLAYER, target_PLAYER_HEAD
					iHideEntity( .Sprite )
					'iEmitSound( snd_Flesh, .Emitter )
					iSetSoundDistance( iEmitSound( snd_Flesh, .Emitter ), SND_DISTANCE )
					' BLOOD PARTICLES
					DIM bloodPS AS iPARTICLE_SYSTEM
					DIM bloodEmitter AS iEMITTER
					bloodPS = iCreateParticleSystem( false )
					iPositionEntity( bloodPS, x, y, z)
					bloodEmitter = iCreateParticleEmitter( bloodPS, particle_Def( prtcl_BLOOD ) )
					iEntityMaterialFlag( bloodPS, EMF_FOG_ENABLE, false )
					iEntityMaterialFlag( bloodPS, EMF_LIGHTING, true )
					iEntityColor( bloodPS, 255, 0, 0 )
					iCreateGravityAffector( bloodPS, 0.0, -0.1, 0.0, 1000 )
					iCreateFadeOutAffector( bloodPS, 100, 0, 0, 0 )
					iCreateStopAffector( bloodPS, 300, bloodEmitter )
					iDeletionAnimator( bloodPS, 2500  )
				 ' BLOOD MIST PARTICLES
					DIM mistPS AS iPARTICLE_SYSTEM
					DIM mistEmitter AS iEMITTER
					mistPS = iCreateParticleSystem( false )
					iPositionEntity( mistPS, x, y, z)
					mistEmitter = iCreateParticleEmitter( mistPS, particle_Def( prtcl_MIST ) )
					iEntityMaterialType( mistPS, EMT_TRANSPARENT_ADD_COLOR )
					iEntityMaterialFlag( mistPS, EMF_FOG_ENABLE, false )
					iEntityMaterialFlag( mistPS, EMF_LIGHTING, true )
					iEntityTexture( mistPS, smoke_tex )
					iEntityColor( mistPS, 255, 0, 0 )
					iCreateFadeOutAffector( mistPS, 100, 0, 0, 0 )
					iCreateStopAffector( mistPS, 300, mistEmitter )
					iDeletionAnimator( mistPS, 2500  )
					exit select
			end select
		END WITH
	end if
END SUB

SUB CREATE_MODEL( p AS T_PLAYER, shade as Boolean = true )
   WITH p
      ' AVATAR GEOMETRY
      .pEnt = iCreatePivot()
      .pHead = iCreateSphere( 32, .pEnt )
      .pBody = iCreateSphere( 16, .pEnt )
		iEntityTexture( .pHead, Face )
      iScaleEntity( .pBody, 1, 2, 0.8 )
      iPositionEntity( .pBody, 0, -10, 0 )
		.pWeaponPivot = iCreatePivot( .pEnt )
		iPositionEntity( .pWeaponPivot, 5, -6, 0 )
		.pWeaponEnt(1) = iCreateCylinder( 16, .pWeaponPivot )
		iRotateEntity( .pWeaponEnt(1), -90, 0, 0 )
		iPositionEntity( .pWeaponEnt(1), 0.0, 0.0, 4.6 )
		iScaleEntity( .pWeaponEnt(1), 0.2, 1.0, 0.2 )	
		.pWeaponEnt(2) = iCreateCylinder( 16, .pWeaponEnt(1) )
		iScaleEntity( .pWeaponEnt(2),1.1, .3, 1.1 )
		iMoveEntity( .pWeaponEnt(2), 0, -2.8, 0 )
		iEntityColor( .pWeaponEnt(2), 35, 35, 35 )
		iEntityColor( .pWeaponEnt(1), 25, 25, 25 )
      iEntityMaterialFlag( .phead, EMF_FOG_ENABLE, true )
      iEntityMaterialFlag( .pBody, EMF_FOG_ENABLE, true )
      iEntityMaterialFlag( .pWeaponEnt(1), EMF_FOG_ENABLE, True )
		iEntityMaterialFlag( .pWeaponEnt(2), EMF_FOG_ENABLE, True )
		.pFeet = iCreateCube( .pEnt )
		iEntityTexture( .pFeet, boots )
		iPositionTexture( .pFeet, 0, 10 )
		iEntityColor( .pFeet, 124, 78, 52 )
		iScaleEntity( .pFeet, 0.53, 0.8, 0.53 )
		iPositionEntity( .pFeet, 0, -15, 0 )
		iEntityMaterialFlag( .pFeet, EMF_FOG_ENABLE, True )		
		if SHADOWS then
			iEntityCastShadow( .pHead )
			iEntityCastShadow( .pBody )
			iEntityCastShadow( .pFeet )
			iEntityCastShadow( .pWeaponEnt(1) )
			iEntityCastShadow( .pWeaponEnt(2) )
		end if
   END WITH
END SUB

'-----------------------------------------------------------------------------
' CREATE NAME SPRITE
'-----------------------------------------------------------------------------
function CREATE_NAME_SPRITE( PlayerName as string ) as iSPRITE
	dim Sprite as iSPRITE
	dim rtex as iTEXTURE = iCreateRenderTexture( 128, 16 )
	iRenderTargetTexture( rtex )
	iCLSColor( 0, 0, 0 )
	iColor( 255, 0, 0, 255 )
	iUpdateScene()
	iText( 64, 2, PlayerName, True )
	iRenderTargetTexture( NULL )
	Sprite = iCreateSprite( true )
	iEntityTexture( Sprite, rtex )
	rtex = null
	return Sprite
end function

'-----------------------------------------------------------------------------
' CREATE PICKUP
'-----------------------------------------------------------------------------
SUB CREATE_PICKUP( nid as integer, pType AS INTEGER, x AS SINGLE, z AS SINGLE, tmo as integer = 0 )
	if T_PICKUP_TOTAL < T_PICKUP_BUFFER then
		T_PICKUP_TOTAL += 1
		WITH T_PICKUP_LIST( T_PICKUP_TOTAL )
			.Net_ID = nid
			.pType = ptype
			.Ent = iCreateCube()
			.x = x
			.y = GROUND_HEIGHT + 10
			.z = z
			.yaw = 0
			if tmo then
				.Timeout = iMilliSecs() - tmo
			else
				.Timeout = iMilliSecs()
			end if
			iScaleEntity( .Ent, .5, .5, .5 )
			iPositionEntity( .ent, .x, .y, .z )
			iRotateEntity( .Ent, 0, .yaw, 0 )
			select case .pType
				case 1      'AMMO
					if TEXTURES_ON then iEntityTexture( .Ent, tex_Ammo )
					iEntityColor( .Ent, 255, 255, 1 )
				case 2      'HEALTH
					if TEXTURES_ON then iEntityTexture( .Ent, tex_Health )
					iEntityColor( .Ent, 255, 1, 1 )
				case else   'ARMOR
					if TEXTURES_ON then iEntityTexture( .Ent, tex_Armor )
					iEntityColor( .Ent, 1, 1, 255 )
			end select
			iEntityMaterialFlag( .Ent, EMF_FOG_ENABLE, True )
			if SHADOWS then iEntityCastShadow( .Ent )
			iRotationAnimator( .Ent, 0, 2, 0 )
		END WITH
	end if
END SUB

'-----------------------------------------------------------------------------
' CREATES AND RETURNS A PORTAL
'-----------------------------------------------------------------------------
FUNCTION CREATE_PORTAL() AS iENTITY
   DIM portalPS AS iPARTICLE_SYSTEM
   DIM portalEmitter AS iEMITTER
   
   DIM PortalDevice AS iENTITY = iCreateSphere( 4 )
   iEntityMaterialFlag( PortalDevice, EMF_FOG_ENABLE, true )
	if TEXTURES_ON then
		iEntityTexture( PortalDevice, DevTex )
		iPositionTexture( PortalDevice, 0, -.5 )
	end if
   iPositionEntity( PortalDevice, 0, GROUND_HEIGHT+.1, 0 )
   iRotationAnimator( PortalDevice, 0, -2, 0 )
   iEntityColor( PortalDevice, 60, 60, 100 )
	
   dim PortalCyn as iENTITY = iCreateCylinder( 8, PortalDevice )
   iPositionEntity( PortalCyn, 0, 29, 0 )
   iScaleEntity( PortalCyn, 6, 4, 4 ) 'iScaleEntity( PortalCyn, 3, 5, 3 ) 
	iRotationAnimator( PortalCyn, 10, 0, 0 )
	iEntityAlpha( PortalCyn, 255 )
   iEntityMaterialType( PortalCyn, EMT_TRANSPARENT_ADD_COLOR )
   iEntityMaterialFlag( PortalCyn, EMF_BACK_FACE_CULLING, false )
   iTextureAnimator( PortalCyn, "MEDIA/GFX/portal", ".bmp", 7, 30, true )'
   iEntityColor( PortalCyn, 120, 0, 255 )
   iRotateEntity( PortalCyn, 0, 0, 90 )
	iCreateBoxSelector( PortalCyn )
	
   ' PORTAL PARTICLE SYSTEM
   portalPS = iCreateParticleSystem( False, PortalDevice )
   iPositionEntity( portalPS, 0, -2, 0 )
   iScaleEntity( portalPS, 5, 8, 5 )
   portalEmitter = iCreateParticleEmitter( portalPS, particle_Def( prtcl_PORTAL ) )
	iEntityMaterialType( portalPS, EMT_TRANSPARENT_ADD_COLOR )
   iEntityMaterialFlag( portalPS, EMF_FOG_ENABLE, false )
	iEntityMaterialFlag( portalPS, EMF_LIGHTING, false )
   iCreateFadeOutAffector( portalPS, 200, 0, 0, 0 )

   RETURN PortalDevice
END FUNCTION

'-----------------------------------------------------------------------------
' FIRE WEAPON
'-----------------------------------------------------------------------------
SUB FIRE_WEAPON( pid as integer, Obj as iENTITY )
	dim as single SX, SY, SZ, EX, EY, EZ
	SX = iEntityX( Obj, true )
	SY = iEntityY( Obj, true )
	SZ = iEntityZ( Obj, true )
	EX = iEntityX( targetEnt, true )
	EY = iEntityY( targetEnt, true )
	EZ = iEntityZ( targetEnt, true )

	dim CollisionEntity as iENTITY = iLinePick( SX, SY, SZ, EX, EY, EZ )
	DebugColl = CollisionEntity
	dim TargetType as integer = 0	'1=player, 2=player head, 3=ground, 4=building
	dim HitPid as integer

	' WAS IT A PLAYER
	FOR p AS INTEGER = 1 TO T_PLAYER_TOTAL 
		WITH T_PLAYER_LIST( p )
			IF .pHead = CollisionEntity or .pBody = CollisionEntity THEN
				TargetType = target_PLAYER
				if .pHead = CollisionEntity then
					Headshot = iMillisecs()
					TargetType = target_PLAYER_HEAD
				end if
				HitPid = .pid
				'iEmitSound( snd_HurtM( iRAND(1,2) ), .pEnt )
				iSetSoundDistance( iEmitSound( snd_HurtM( iRAND(1,2) ), .pEnt ), SND_DISTANCE )
				EXIT FOR
			END IF                     
		END WITH
	next p

	if TargetType = 0 then
			HitPid = -99	'?needed
		if Surface = CollisionEntity then
			TargetType = target_SURFACE
		else
			TargetType = target_BUILDING	'or WALL
		end if
	end if
	
	iRN_SendByte( NET_GUNSHOT )
	iRN_SendInt( T_PLAYER_LIST( 0 ).pid )
	iRN_SendInt( HitPid ) ' -99 = GROUND OR BUILDING HIT
	iRN_SendInt( TargetType )
	iRN_SendFloat( iPickedX() )
	iRN_SendFloat( iPickedY() )
	iRN_SendFloat( iPickedZ() )
	
	if IS_SERVER then
		NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE, TRUE )
		select case TargetType
			case target_PLAYER, target_PLAYER_HEAD
				DIM hp AS INTEGER = FIND_PLAYER( HitPid )
				if hp <> -1 then
					with T_PLAYER_LIST( hp )
						' CALCULATE DAMAGES AND REWARDS
						Dim DamageA as integer = 0
						Dim DamageH as integer = 0
						if .pArmor > 0 and iRAND(1,5) > 2 then
							DamageA = -5
							.pArmor += DamageA
							print "ARMOR CALC (GF): "+str( .pArmor )
						else
							DamageH = -2 * TargetType	'??
							.pHealth += DamageH
							print "HEALTH CALC (GF): "+str( .pHealth )
						end if

						IF .pArmor < 1 THEN
							.pArmor = 0
						END IF
						IF .pHealth < 1 THEN
							.pHealth = 0
							'.pDeaths += 1
							T_PLAYER_LIST( 0 ).pKills += 1
							' SEND DEATH
							print "DEATH SENT (GF)..."
							iRN_SendByte( NET_DEATH )
							iRN_SendInt( HitPid )
							iRN_SendInt( pid )
							NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE )
							DEATH( HitPid, pid )
						end if
						
						dim Scarr_Stage as integer = 0
						dim tex_Combined as iTEXTURE
						select case .pHealth
							case 90 to 100
								Scarr_Stage = 0
							case 70 to 89
								Scarr_Stage = 1
							case 50 to 69
								Scarr_Stage = 2
							case 30 to 49
								Scarr_Stage = 3
							case 0 to 29
								Scarr_Stage = 4
						end select
						print "Scarr_Stage_Sent: "+str( Scarr_Stage )
						
						tex_Combined = iCopyTexture( tex_FaceMaster )
						iTextureBlend( tex_Combined, Scarring( Scarr_Stage ), 0, 0, 3 )
						iEntityTexture( .pHead, tex_Combined, 0 )
						iEntityTexture( .pBody, Scarring( Scarr_Stage ), 0 )

						' SEND DAMAGE
						print "DAMAGE SENT (GF)..."
						iRN_SendByte( NET_DAMAGE )
						iRN_SendInt( pid )
						iRN_SendInt( HitPid )
						iRN_SendInt( T_PLAYER_LIST( 0 ).pKills )
						iRN_SendInt( .pArmor )
						iRN_SendInt( .pHealth )
						iRN_SendInt( Scarr_Stage )
						NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE )
					end with
					exit select
				end if
			exit select
		end select
	else
		NET_SEND( RN_HOST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE, false ) 
	end if

	CREATE_EXPLOSION( iPickedX(), iPickedY(), iPickedZ(), TargetType )
END SUB

'-----------------------------------------------------------------------------
' PLAYER DEATH
'-----------------------------------------------------------------------------
SUB DEATH( death_pid as integer, killedby_pid as integer )
   DIM hp AS INTEGER = FIND_PLAYER( death_pid )
	DIM kp AS INTEGER = FIND_PLAYER( killedby_pid )

   IF hp <> -1 THEN
		T_DEATH_TOTAL += 1
		if T_DEATH_TOTAL < T_PLAYER_BUFFER then
			WITH T_PLAYER_LIST( hp )
				iEmitSound( snd_HurtM(3), .pEnt )
				.pState = SLOT_DEAD
				'.pDeaths += 1
				T_DEATH_LIST( T_DEATH_TOTAL ).active = true
				T_DEATH_LIST( T_DEATH_TOTAL ).pid = .pid
				T_DEATH_LIST( T_DEATH_TOTAL ).dtimer = iMilliSecs()   '4000
				if kp <> -1 then
					ADD_CHAT( "SERVER", .pName + " killed by "+T_PLAYER_LIST( kp ).pName+"!", 2 )
					'T_PLAYER_LIST( kp ).pKills += 1
				end if
				.SplineInitialized = false
			END WITH
		end if
   END IF  
END SUB

'-----------------------------------------------------------------------------
' UPDATE_DEATH
'-----------------------------------------------------------------------------
SUB UPDATE_DEATH()
	FOR i AS INTEGER = 0 TO T_DEATH_TOTAL
      if T_DEATH_LIST( i ).active = true then
         DIM p AS INTEGER = FIND_PLAYER( T_DEATH_LIST( i ).pid )
         if p = -1 then exit sub
         if (iMilliSecs() > T_DEATH_LIST( i ).dtimer + 4000 ) then
            with T_DEATH_LIST( i )
               .active = false
               .pid = -1
               .dtimer = EMPTY_TIMER
					
					
					if T_PLAYER_LIST( p ).pid <> T_PLAYER_LIST( 0 ).pid then
						iRotateEntity( T_PLAYER_LIST( p ).pEnt, 0, 0, 0 )
						iPositionEntity( T_PLAYER_LIST( p ).pEnt, T_PLAYER_LIST( p ).X, T_PLAYER_LIST( p ).Y, T_PLAYER_LIST( p ).Z )
						iHideEntity( T_PLAYER_LIST( p ).pEnt )
					'else
					'	iRotateEntity( T_PLAYER_LIST( p ).pEnt, 0, 0, 0 )
					'	iPositionEntity( T_PLAYER_LIST( p ).pEnt, 0, 0, 0 )
					end if
					'iHideEntity( T_PLAYER_LIST( p ).pEnt )
					'T_PLAYER_LIST( p ).pState = SLOT_ALIVE						'TESTING
					
					
					swap T_DEATH_LIST( p ), T_DEATH_LIST( T_DEATH_TOTAL )
					T_DEATH_TOTAL -= 1
            end with
         else
            with T_PLAYER_LIST( p )
               iTurnEntity( .pEnt, 0, -20, 0 )
               iMoveEntity( .pEnt, 0, -.4, 0 )
            end with
         end if
      end if
   next   
end sub

'-----------------------------------------------------------------------------
' DISPLAY STATS
'-----------------------------------------------------------------------------
SUB DISPLAY_STATS()
   dim xpos as integer = GFX_WIDTH/2 - 283
   iText(xpos, 140, "NAME                KILLS             DEATHS" )
   FOR i AS INTEGER = 0 TO T_PLAYER_TOTAL
		WITH T_PLAYER_LIST( i )
			iText(xpos, 160+(i*15), .pName )
			iText(xpos + 270, 160+(i*15), STR(.pKills) )
			iText(xpos + 490, 160+(i*15), STR(.pDeaths) )
		END WITH
   NEXT i
END SUB

'-----------------------------------------------------------------------------
' DRAW CHAT MESSAGES
'-----------------------------------------------------------------------------
SUB DRAW_CHAT()
   dim cLimit as integer = 0
   if T_CHAT_TOTAL < 10 then
      cLimit = 0
   else
      cLimit = T_CHAT_TOTAL - 10 ' LIMIT DISPLAY TO 10 LINES
   end if
   dim counter as integer = 0
   FOR i AS INTEGER = cLimit TO T_CHAT_TOTAL
      IF T_CHAT_LIST( T_CHAT_TOTAL - i ).ID <> "" THEN
         dim Chat as string = "<"+T_CHAT_LIST( T_CHAT_TOTAL - counter ).ID+">  "+T_CHAT_LIST( T_CHAT_TOTAL - counter ).Message
         ' DRAW MESSAGE
			select case T_CHAT_LIST( T_CHAT_TOTAL - counter ).msgType
				case 1
					iColor( 255, 255, 255, 225 )	'white
				case 2
					iColor( 255, 155, 180, 225 )		'red
				case 3
					iColor( 0, 255, 0, 225 )		'green
				case 4
					iColor( 0, 162, 232, 225 )		'blue
			end select
         iText( 11, (GFX_HEIGHT-36) - (counter * 15), Chat )
         counter += 1
      END IF
   NEXT i
	iColor( 255, 242, 0, 225 )
	If CHATTING Then
		iText( 11, GFX_HEIGHT - 20, "CHAT: " + OutgoingChat + Cursor )
	else
		iText( 11, GFX_HEIGHT - 20, " * PRESS ENTER TO CHAT *" )
	end if
END SUB

'-----------------------------------------------------------------------------
' FIND PICKUP
'-----------------------------------------------------------------------------
function FIND_PICKUP( nid as integer ) as integer
   FOR i AS INTEGER = 0 TO T_PICKUP_TOTAL
         IF T_PICKUP_LIST( i ).Net_ID = nid THEN
            RETURN i
         END IF
   NEXT i
   RETURN -1   
end function

'-----------------------------------------------------------------------------
' FIND A PLAYER'S INDEX IN LIST
'-----------------------------------------------------------------------------
FUNCTION FIND_PLAYER( PlayerID AS INTEGER ) AS INTEGER
   FOR i AS INTEGER = 0 TO T_PLAYER_TOTAL
         IF T_PLAYER_LIST( i ).pid = PlayerID THEN
            RETURN i
         END IF
   NEXT i
   RETURN -1   
END FUNCTION

'-----------------------------------------------------------------------------
' INITIALIZE RAKNET NETWORK
'-----------------------------------------------------------------------------
FUNCTION INITIALIZE_NETWORK() AS Boolean
   DIM result AS INTEGER = 0
	PRINT( "Initializing Raknet..." )
	IF iRN_Init() THEN
		PRINT( "Raknet Initialization OK." )
		IF Is_Server THEN
         '-----------------
         ' SERVER INIT
         '-----------------
         T_PLAYER_LIST( 0 ).pid = 0
         PRINT( "Starting Server Session..." )
         result = iRN_StartServer( MaxPlayers, Server_Port, "" )
         IF result = 1 THEN
            IP = *iRN_GetMyIP()
            PRINT( "Server Started Successfully." )
            PRINT( "Listening for connections on: IP: "+IP+" PORT: "+STR(Server_Port) )
            RETURN( True )
         ELSEIF result = 0 THEN
            PRINT( "Could not start the Server!" )
            RETURN( False )
         ELSEIF result = -1 THEN
            PRINT( "Server startup failed, port may be in use!" )
            RETURN( False )
         End If
      ELSE
         '-----------------
         ' CLIENT INIT
         '-----------------
         PRINT( "Starting Client Session..." )
         result = iRN_StartClient()
         IF result <> 1 THEN
            PRINT( "Client Network Failed!" )   
            RETURN ( false )
         END IF
         PRINT( "Client Network Initialized!" )
         PRINT( "Connecting to: IP: "+IP+" PORT: "+STR(Server_Port) )
         result = iRN_Connect( IP, Server_Port, "", true )
         IF result = 0 THEN
            PRINT( "Connection Failed!" )
            RETURN( False )
         ELSE
            PRINT( "Connection Accepted!" )
            iRN_SendByte( NET_LOGIN_REQUEST )
            iRN_SendString( T_PLAYER_LIST( 0 ).pName )
				iRN_SendInt( T_PLAYER_LIST( 0 ).pTeam )
				iRN_SendInt( GUI_LIST_HEAD( 1 ) )
				iRN_SendInt( GUI_LIST_HEAD( 2 ) )
				iRN_SendInt( GUI_LIST_HEAD( 3 ) )
				iRN_SendInt( GUI_LIST_SUIT( 1 ) )
				iRN_SendInt( GUI_LIST_SUIT( 2 ) )
				iRN_SendInt( GUI_LIST_SUIT( 3 ) )
				NET_SEND( RN_HOST, RN_HIGH_PRIORITY, RN_RELIABLE )
            PRINT( "SENT NET_LOGIN_REQUEST" )            
            RETURN( true )
         END IF
      END IF
	ELSE
		PRINT( "Could not initialize Network Environment!" )
		RETURN( False )
	End If	
END FUNCTION

'-----------------------------------------------------------------------------
'	GAME MENU
'-----------------------------------------------------------------------------
SUB MAIN_MENU()
	for i as integer = 1 to 4
		iHideEntity( Portal( i ) )
	next i
   iMasterVolume( 1 )
   DIM MenuCam AS iENTITY = iCreateCamera()
	'iPositionEntity( MenuCam, 0, 30, 0 )
	'iRotateEntity( MenuCam, 100, 0, -40 )
   DIM AVATAR_PIVOT AS iENTITY = iCreatePivot()
   dim as T_PLAYER AVATAR
   CREATE_MODEL( AVATAR, false )
   iEntityParent( AVATAR.pEnt, AVATAR_PIVOT )
	iRotateEntity( AVATAR.pFeet, -180, 0, 0 )
   iPositionEntity( AVATAR_PIVOT, 0, -1, 40 ) '0, -1, 40 )

   ' PLATFORM
   dim PlatformBase as iEntity = iCreateCylinder(16)
	iEntityTexture( PlatformBase, DevTex )
   iPositionEntity( PlatformBase, 0, -22, 40 ) '0, -22, 40 )
   iScaleEntity( PlatformBase, 3, 0.2 , 3 )

   ' CUBE OF LIBS IN BASIC IRRLICHT
   dim LF as iTexture = iLoadTexture( "Media/irrklang_small.png" )
   dim RT as iTexture = iLoadTexture( "Media/IrrlichtLogo.png" )
   dim FR as iTexture = iLoadTexture( "Media/RakNetLogo.jpg" )
   dim BK as iTexture = iLoadTexture( "Media/opengl_logo.jpg" )
   dim cubepivotbase as iENTITY = iCreatePivot()
   dim cubepivot as iENTITY = iCreatePivot( cubepivotbase )
   dim quad_LF as iENTITY = iCreateQuad( 5, cubepivot )
	iEntityMaterialFlag( quad_LF, EMF_LIGHTING, false )
   dim quad_RT as iENTITY = iCreateQuad( 5, cubepivot )
	iEntityMaterialFlag( quad_RT, EMF_LIGHTING, false )
   dim quad_FR as iENTITY = iCreateQuad( 5, cubepivot )
	iEntityMaterialFlag( quad_FR, EMF_LIGHTING, false )
   dim quad_BK as iENTITY = iCreateQuad( 5, cubepivot )
	iEntityMaterialFlag( quad_BK, EMF_LIGHTING, false )
	dim quad_FB as iENTITY = iCreateQuad( 5, cubepivot )
   iPositionEntity( quad_FB, 0, 5, 0 )
	iEntityMaterialType( quad_FB, EMT_TRANSPARENT_ADD_COLOR   )
	iEntityMaterialFlag( quad_FB, EMF_BACK_FACE_CULLING, false )
	iEntityMaterialFlag( quad_FB, EMF_LIGHTING, false )
	iTextureAnimator( quad_FB, "Media/UI/FBHorse/horse0", ".jpg", 10, 50, true )
   iRotateEntity( quad_FB, -90, 90, 0 )

	dim quad_FBT as iENTITY = iCreateQuad( 5, cubepivot )
	DIM FBTheme AS iSOUND_SOURCE = iLoadSound( "MEDIA/SFX/Freebasic.ogg" )
	dim FBT as iTexture = iLoadTexture( "Media/UI/FBHorse/FreeBasic.bmp" )
	iEntityMaterialType( quad_FBT, EMT_TRANSPARENT_ADD_COLOR )
	iEntityMaterialFlag( quad_FBT, EMF_BACK_FACE_CULLING, false )
	iEntityMaterialFlag( quad_FBT, EMF_LIGHTING, false )
	iEntityTexture( quad_FBT, FBT )
   iRotateEntity( quad_FBT, -90, 90, 0 )
   iPositionEntity( quad_FBT, 0, 9, 0 )
	
   iEntityTexture( quad_LF, LF )
   iRotateEntity( quad_LF, -90, 0, 0 )
   iPositionEntity( quad_LF, 0, 0, -2.5 )
   iEntityTexture( quad_RT, RT )
   iRotateEntity( quad_RT, -90, 180, 0 )
   iPositionEntity( quad_RT, 0, 0, 2.5 )
   iEntityTexture( quad_FR, FR )
   iRotateEntity( quad_FR, -90, -90, 0 )
   iPositionEntity( quad_FR, 2.5, 0, 0 )
   iEntityTexture( quad_BK, BK )
   iRotateEntity( quad_BK, -90, 90, 0 )
   iPositionEntity( quad_BK, -2.5, 0, 0 )
   iPositionEntity( cubepivotbase, -30 , -15, 30 )
   iRotateEntity( cubepivotbase, 15, 0, 15 )
   iRotationAnimator( cubepivot, 0, 1, 0 )
   iScaleEntity( cubepivot, 1.3, 1, 1.3 )
	iEmitSound( FBTheme, QUAD_FB )'cubepivotbase )

	' IRRLICHT FLAG
   dim Flag as iENTITY = iCreateWater( "Media/IrrlichtLogo.png", NULL, 2.0, 400.0, 10.0, MenuCam )
   iPositionEntity( Flag, 0.0, 0.8, 2.1 )
   iRotateEntity( Flag, -90, 0, 0 )
   iScaleEntity( Flag, 0.015, 0.005, 0.005 )
	iEntityMaterialFlag( Flag, EMF_LIGHTING, false )

   Theme = iPlayMusic( "MEDIA/SFX/IrrlichtTheme.ogg")
   iSoundLoop( Theme )
   iSoundVolume( Theme, 0.5 )
	
   ' BASIC IRRLICHT LOGO
   dim BI as iTexture = iLoadTexture( "MEDIA/bi_logo.png")
   iHideEntity( Surface )
   iFadeIn( 5000 )
   WHILE IRun() AND (NOT START_GAME)
      DeltaTime = iMillisecs() - dStartTime
      dStartTime = iMillisecs()        
      if iMouseDown( MOUSE_RIGHT ) then
         iHidePointer()
			iRotateEntity( AVATAR_PIVOT, 0, iEntityYaw( AVATAR_PIVOT ) + iMouseXSpeed(), 0 )
      else
         iShowPointer()
         iTurnEntity( AVATAR_PIVOT, 0, -0.1 * DeltaTime, 0 )
      end if
      IF iKeyHit( KEY_F12 ) THEN
         iScreenShot( "Screenshots" )
         iSoundVolume( iPlaysound( snd_Button ), 1.0 )
         if iFadeReady() then
            iFadeColor( 255, 255, 255 )
            iFadeIn( 100 )
         end if
      end if
      CloudX += .00001 * DeltaTime
      iPositionTexture( CloudLayer,CloudX, 0.0 )
		
      iUpdateScene()
      iRenderScene()

		if CARTOON_OUTLINE then
			iOutlineMesh( AVATAR.pHead, 4.0, 0, 0, 0 )
			iOutlineMesh( AVATAR.pBody, 4.0, 0, 0, 0 )
		end if
		
      iDrawTexture( BI, GFX_WIDTH - (10 + iTextureWidth( BI ) ), GFX_HEIGHT - (10 + iTextureHeight( BI )) )	
		if not Net_Select = 4 then
			iDrawTexture( Controls, 20, 150 )
			iDrawTexture( SEL_COLOR, iGraphicsWidth()-480, iGraphicsHeight()/3 + 20 )
		end if
		
      iColor( 255, 255, 255, 255 )
      iText( 10, 5, "ENGINE FPS: " + STR(iFPS()) )
      iText( 10, 20, "ENGINE RUNTIME: " + STR(iRuntime()) )
      iText( 10, 35, "MOUSE X: "+STR(iMouseX()) )
      iText( 10, 50, "MOUSE Y: "+STR(iMouseY()) )
      iText( GFX_WIDTH/2, GFX_HEIGHT-80, "FPS EXAMPLE AUTHOR 2024 ED MUSOLINO", true )
		iText( GFX_WIDTH/2, GFX_HEIGHT-60, "BASICIRRLICHT (c)2019 EM-ENGINEERING, LLC", true )
      iText( GFX_WIDTH/2, GFX_HEIGHT-40, "MUSIC:  IRRLICHT THEME SONG", TRUE )

      if iKeyHit( KEY_ESCAPE ) and ( not GUI_ACTIVE ) then
         GUI_ACTIVE = true
         iShowPointer()
         iNotify( "EXIT GAME", "ARE YOU SURE YOU WANT TO QUIT AND EXIT?", EMBF_OK+EMBF_CANCEL )
			iFlushMouse()
      end if

		' TEST
		If iKeyHit( KEY_6 ) Then
			print( "PORT: "+*iGetElementText( ID_EDIT_PORT_J ) )
		end if

	if iKeyHit( KEY_O ) then
		Scarr_Stage += 1
		if Scarr_Stage > 4 then Scarr_Stage = 4
		tex_Combined = iCopyTexture( tex_FaceMaster )
		iTextureBlend( tex_Combined, Scarring( Scarr_Stage ), 0, 0, 3 )
		iEntityTexture( AVATAR.pHead, tex_Combined, 0 )
		iEntityTexture( AVATAR.pBody, Scarring( Scarr_Stage ), 0 )
	end if
	if iKeyHit( KEY_P ) then
		Scarr_Stage -= 1
		if Scarr_Stage < 0 then Scarr_Stage = 0
		tex_Combined = iCopyTexture( tex_FaceMaster )
		iTextureBlend( tex_Combined, Scarring( Scarr_Stage ), 0, 0, 3 )
		iEntityTexture( AVATAR.pHead, tex_Combined, 0 )
		iEntityTexture( AVATAR.pBody, Scarring( Scarr_Stage ), 0 )
	end if
	
	
      iRenderGUI()
		PROCESS_GUI_MENU()
		iEntityColor( AVATAR.pHead, 255-GUI_LIST_HEAD( 1 ), 255-GUI_LIST_HEAD( 2 ), 255-GUI_LIST_HEAD( 3 ) )
		iEntityColor( AVATAR.pBody, 255-GUI_LIST_SUIT( 1 ), 255-GUI_LIST_SUIT( 2 ), 255-GUI_LIST_SUIT( 3 ) )
		
		if Net_Select = 4 then
			iRotateEntity( MenuCam, 90, 0, -180 )
			iHideEntity( Flag )
			iColor( 255, 0, 0 )
			iTEXT( GFX_WIDTH/2, GFX_HEIGHT/2, "CONNECTING.......", true )
		end if
		
      iFlip()
		
      IF ExitApp then
         SHUTDOWN()
			'sleep(1000)
         end
      END IF
    WEND

   ' CLEAN UP
	' LET'S SET ALPHA TO ZERO FOR OUR AVATAR, IT WILL BE INVISIBLE TO US BUT STILL RENDER SHADOWS
	iEntityParent( AVATAR.pEnt, NULL )
	iEntityAlpha( AVATAR.pEnt, 0.0 )
	iEntityAlpha( AVATAR.pFeet, 0.0 )
	iEntityAlpha( AVATAR.pWeaponEnt(1), 0.0 )
	iEntityAlpha( AVATAR.pWeaponEnt(2), 0.0 )

	dim rp as integer
	rp = iRand(1,4)
	with T_PLAYER_LIST( 0 )
		.X = iEntityX( Portal( rp ) )
		.Y = GROUND_HEIGHT + PLAYER_HEIGHT
		.Z = iEntityZ( Portal( rp ) )
		.zVel = 5
		.pHeadColor( 1 ) = GUI_LIST_HEAD( 1 )
		.pHeadColor( 2 ) = GUI_LIST_HEAD( 2 )
		.pHeadColor( 3 ) = GUI_LIST_HEAD( 3 )
		.pSuitColor( 1 ) = GUI_LIST_SUIT( 1 )
		.pSuitColor( 2 ) = GUI_LIST_SUIT( 2 )
		.pSuitColor( 3 ) = GUI_LIST_SUIT( 3 )
		iPositionEntity( Camera, .X, .Y, .Z )
		iEntityParent( AVATAR.pEnt, .pEnt )
		iMoveEntity( AVATAR.pEnt, 0, 0, -1 )
	end with

   iFreeEntity( PlatformBase )
   iFreeEntity( cubepivotbase )
   iFreeAllAnimators( AVATAR_PIVOT )
   iFreeEntity( AVATAR_PIVOT )
   iStopSound( Theme )
   iSetActiveCamera( Camera )
   iFreeEntity( MenuCam )
   iFadeColor( 0, 0, 0 )
   iShowEntity( Surface )
	for i as integer = 1 to 4
		iShowEntity( Portal( i ) )
	next i
   iFadeIn( 4000 )
END SUB

'-----------------------------------------------------------------------------
' NETPLAYER POSITION UPDATE
'-----------------------------------------------------------------------------
SUB NETPLAYER_POS_UPDATE( PlayerID AS INTEGER, Timestamp AS INTEGER )
	DIM dt AS INTEGER
	DIM AS SINGLE x0, x1, x2, x3
   DIM AS SINGLE y0, y1, y2, y3
	DIM AS SINGLE z0, z1, z2, z3
	IF (PlayerID <> T_PLAYER_LIST( 0 ).pid) then
      DIM p AS INTEGER = FIND_PLAYER( PlayerID )
      IF p <> -1 and (T_PLAYER_LIST( p ).pState <> SLOT_DEAD ) THEN
         WITH T_PLAYER_LIST( p )
            ' ONLY PROCESS NEWER POSITION PACKETS!
            IF Timestamp > .LastPacketTimestamp THEN
               .PacketX				= iRN_GetFloat()
               .PacketY				= iRN_GetFloat()
               .PacketZ				= iRN_GetFloat()
               .Yaw              = iRN_GetFloat()
               .Pitch            = iRN_GetFloat()
					.PacketxVel			= iRN_GetFloat()
					.PacketzVel			= iRN_GetFloat()
               'PACKET DELTA TIME
               dt = iRN_GetTime() - Timestamp
               dim FREQUENCY as single = POS_UPDATE_FREQ / 3
               dim dtFREQUENCY as single = dt + POS_UPDATE_FREQ               

               ' STARTING POINT
               x0 = .x
               y0 = .y
               z0 = .z
               ' CONTROL POINT 1
               x1 = iExtrapolatePoint( FREQUENCY, x0, 0, 0, MAX_VELOCITY )	'.xVel
               y1 = iExtrapolatePoint( FREQUENCY, y0, 0, 0, GRAVITY )
               z1 = iExtrapolatePoint( FREQUENCY, z0, 0, 0, MAX_VELOCITY )	'.zVel
               ' END POINT
               x3 = iExtrapolatePoint( dtFREQUENCY, .PacketX, 0, 0, MAX_VELOCITY )	'.PacketxVel
               y3 = iExtrapolatePoint( dtFREQUENCY, .PacketY, 0, 0, GRAVITY )
               z3 = iExtrapolatePoint( dtFREQUENCY, .PacketZ, 0, 0, MAX_VELOCITY )	'.PacketzVel
               ' CONTROL POINT 2
               x2 = iExtrapolatePoint( FREQUENCY, x3, 0, 0, MAX_VELOCITY ) 	'-.PacketxVel
               y2 = iExtrapolatePoint( FREQUENCY, y3, 0, 0, GRAVITY )
               z2 = iExtrapolatePoint( FREQUENCY, z3, 0, 0, MAX_VELOCITY )		'-.PacketzVel

					' INITIALIZE THE SPLINE
               iInit3DSpline( .SplineID, x0, y0, z0, x1, y1, z1, x2, y2, z2, x3, y3, z3 )
               .LastPacketTimestamp = Timestamp
               .SplineInitialized = True
            END IF
         END WITH
      END IF
   END IF
END SUB

'-----------------------------------------------------------------------------
'	PLAYER CONTROLS & MOVEMENT
'-----------------------------------------------------------------------------
SUB PLAYER_CONTROLS( BYVAL obj AS iCamera )
   WITH T_PLAYER_LIST( 0 )
      DIM moving AS Boolean = false
      dim Friction as single = AIR_Resistence
      .xAcc = 0.0
      .zAcc = 0.0
		
		' CHAT
		if not chatting then
			If iKeyHit( KEY_RETURN ) Then
				CHATTING = True
				iPlaySound( snd_BUTTON_CLICK )
				iFlushKeys()
			End If
			if not falling or iCollidedEntity( Camera ) <> NULL then
				Friction = GRND_Resistence
				IF iKeyDown( KEY_W ) THEN	.zAcc = ACCELERATION	 : moving = true 
				IF iKeyDown( KEY_S ) THEN	.zAcc = -ACCELERATION : moving = true
				IF iKeyDown( KEY_D ) THEN	.xAcc = ACCELERATION  : moving = true
				IF iKeyDown( KEY_A ) THEN	.xAcc = -ACCELERATION : moving = true
			end if
		end if
		
      ' UPDATE MOVEMENT VELOCITIES
      IF .xAcc <> 0.0 THEN
         .xVel = .xVel + .xAcc
         IF ABS( .xVel ) > MAX_VELOCITY THEN .xVel = SGN( .xVel ) * MAX_VELOCITY
      ELSE
      ' APPLY FRICTION
         .xVel = .xVel * Friction
         IF ABS( .xVel ) < 0.1 THEN
            .xVel = 0.0
         ELSEif not falling then
            moving = true
         END IF
      END IF	
      IF .zAcc <> 0.0 THEN
         .zVel = .zVel + .zAcc
         IF ABS( .zVel ) > MAX_VELOCITY THEN .zVel = SGN( .zVel ) * MAX_VELOCITY
      ELSE
      ' APPLY FRICTION
         .zVel = .zVel * Friction
         IF ABS( .zVel ) < 0.1 THEN
            .zVel = 0.0
         ELSEif not falling then
            moving = true
         END IF
      END IF
      ' FREE FALLING DYNAMICS
      if falling then
         dim cxsz as single = cos( LastYaw )
         dim sxcz as single = sin( LastYaw )
         .x = .x + (.zVel * cxsz) + (.xVel * sxcz)
         .z = .z - (.xVel * cxsz) + (.zVel * sxcz)
         iPositionEntity( obj, .x, iEntityY( obj ), .z )  
      else
         iMoveEntity( obj, .xVel, 0, .zVel )
         LastYaw = (90-.Yaw)/180*PI         
      end if
      ' STORE CURRENT STATE      
      .X = iEntityX( obj )
      .Y = iEntityY( obj )
      .Z = iEntityZ( obj )
      .Yaw = iEntityYaw( obj )
      .Pitch = iEntityPitch( obj )
      ' FOOTSTEPS
      IF moving then
         IF (iMilliSecs() > .StepTimer + STEP_TIME ) THEN
            .StepTimer = iMilliSecs()
				
			 ' DUST PARTICLE SYSTEM
				DIM dustPS AS iPARTICLE_SYSTEM
				DIM dustEmitter AS iEMITTER
				dustPS = iCreateParticleSystem( false )
				iPositionEntity( dustPS, .x, GROUND_HEIGHT+0.1, .z)
				dustEmitter = iCreateParticleEmitter( dustPS, particle_Def( prtcl_MIST ) )
				iEntityMaterialType( dustPS, EMT_TRANSPARENT_ADD_COLOR )
				iEntityMaterialFlag( dustPS, EMF_FOG_ENABLE, true )
				iEntityMaterialFlag( dustPS, EMF_LIGHTING, true )
				iEntityTexture( dustPS, smoke_tex )
				iEntityColor( dustPS, 124, 78, 52 )
				iCreateFadeOutAffector( dustPS, 100, 0, 0, 0 )
				iCreateStopAffector( dustPS, 300, dustEmitter )
				iDeletionAnimator( dustPS, 2500  )
            iEmitSound( sndStoneSteps( iRand(1,4) ), obj )
         END IF
		END IF
      ' CHECK MUZZLE FLASH
      IF iMilliSecs() > .FlashTimer + 100 THEN
			'.Pitch += GUN_RECOIL - 1
         iHideEntity( .FlashSprite )
			iHideEntity( .Light )
         iPositionEntity( .pWeaponEnt(1), 1.5, -1.0, 1.6 )
      end if
      ' SHOOT
      Gun_Delay_Counter += 1
      IF iMouseHit( MOUSE_LEFT ) OR iMouseDown( MOUSE_LEFT ) THEN
         IF Gun_Delay_Counter >= GUN_DELAY THEN 
            IF ReloadStage = 0 AND .pCartridge > 0 THEN
               iEntityParent( .FlashSprite, .pWeaponEnt(1) )
               iPositionEntity( .FlashSprite, 3, -7, 0 )
               .FlashTimer = iMilliSecs() 
               'HIDE OUR OWN COLLISION ENTITY SO WE DON'T CAUSE THE COLLISION!
               iHideEntity( .pFeet )
               FIRE_WEAPON( .pid, Camera )'.WeaponEnt(1) )
					.Pitch -= GUN_RECOIL
					iRotateEntity( Obj, .Pitch, .Yaw, 0 )
               iShowEntity( .pFeet )
               iShowEntity( .FlashSprite )
					iShowEntity( .Light )
               iPositionEntity( .pWeaponEnt(1), 1.5, -1.0, 1.5 )
               iSoundVolume( iEmitSound( snd_Gun, .pWeaponEnt(1) ), .3 )
               .pCartridge -= 1
               Gun_Delay_Counter = 0
            ELSE
               Gun_Delay_Counter = 0
               IF ReloadStage = 0 THEN
                  iEmitSound( snd_Dryfire, .pWeaponEnt(1) )
               END IF
            END IF	
         ELSE
         END IF
      END IF
      ' CHECK FOR RELOAD
      IF (iKeyHit( KEY_R )) and ReloadStage = 0 AND .pAmmoBelt >_
            0 AND .pCartridge < MAX_AMMO_CARTRIDGE THEN
         ReloadStage = 1
         iSoundVolume( iPlaySound( snd_Reload ), 0.3 )
      END IF
      ' PROCESS RELOAD
      IF ReloadStage > 0 THEN
         ReloadStage += 5
         IF ReloadStage > 355 THEN
            ReloadStage = 0
            IF .pAmmoBelt > MAX_AMMO_CARTRIDGE THEN
               .pAmmoBelt -= MAX_AMMO_CARTRIDGE - .pCartridge
               .pCartridge += MAX_AMMO_CARTRIDGE - .pCartridge
            ELSE
               DIM calc AS INTEGER = MAX_AMMO_CARTRIDGE - .pCartridge
               IF calc > .pAmmoBelt THEN  '=> ??
                  calc = .pAmmoBelt 
                  .pAmmoBelt = 0
                  .pCartridge += calc
               ELSE
                  .pCartridge += calc
                  .pAmmoBelt -= calc               
               END IF
            END IF
            iRotateEntity( .pWeaponPivot, 0, 0, 0 )
         ELSE
            iRotateEntity( .pWeaponPivot, 15, 0, 0 )
         END IF
      END IF
   END WITH
   ' CAMERA ZOOM EFFECT
   If iMouseHit( MOUSE_RIGHT ) then
      chnl_Zoom = iPlaySound( snd_Zoom )
   elseIf iMouseDown( MOUSE_RIGHT ) Then 
      If CamZoom < fmaxZoom Then CamZoom = CamZoom + 0.1
      if CamZoom > fmaxZoom then CamZoom = fmaxZoom
      iSetCameraFOV( Camera, PI / (2.5 + CamZoom) )
   Else
      If CamZoom > fmaxZoom - 0.01 and (not iSoundPlaying( chnl_Zoom )) Then chnl_Zoom = iPlaySound( snd_Zoom )
      If CamZoom > 0.0 Then
         CamZoom = CamZoom - 0.1
         if CamZoom < 0.0 then CamZoom = 0.0
         iSetCameraFOV( Camera, PI / (2.5 + CamZoom) )
      end if
   End If   
END SUB

'-----------------------------------------------------------------------------
' PROCESS COLLISIONS
'-----------------------------------------------------------------------------
SUB PROCESS_COLLISIONS()
   ' PICKUP COLLISIONS
   FOR i AS INTEGER = 1 TO T_PICKUP_TOTAL
      WITH T_PICKUP_LIST( i )
			if iEntitiesCollided( T_PLAYER_LIST( 0 ).pFeet, .Ent ) then
				dim Clear_Pickup as Boolean = false
				PickupCol = PickupCol + 1
				'SELECT TYPE AND PROCESS REWARD
				select case .pType
					case 1   'AMMO
						if T_PLAYER_LIST( 0 ).pAmmoBelt < MAX_AMMO then
							Clear_Pickup = true
							'T_PLAYER_LIST( 0 ).pAmmoBelt += 30
							'if  T_PLAYER_LIST( 0 ).pAmmoBelt > MAX_AMMO then T_PLAYER_LIST( 0 ).pAmmoBelt = MAX_AMMO
							iPlaySound( snd_Ammo )
						end if
					Case 2   'HEALTH
						if T_PLAYER_LIST( 0 ).pHealth < MAX_HEALTH then
							Clear_Pickup = true
							'T_PLAYER_LIST( 0 ).pHealth += 30
							'if  T_PLAYER_LIST( 0 ).pHealth > MAX_HEALTH then T_PLAYER_LIST( 0 ).pHealth = MAX_HEALTH
							iPlaySound( snd_Health )
						end if  
					case 3   'ARMOR
						if T_PLAYER_LIST( 0 ).pArmor < MAX_ARMOR then
							Clear_Pickup = true
							'T_PLAYER_LIST( 0 ).pArmor += 30
							'if  T_PLAYER_LIST( 0 ).pArmor > MAX_ARMOR then T_PLAYER_LIST( 0 ).pArmor = MAX_ARMOR                  
							iPlaySound( snd_Armor )
						end if
				end select

				'DELETE PICKUP ?
				if Clear_Pickup then
					if iFadeReady() then
						iFadeColor( 255, 255, 255 )
						iFadeIn( 100 )
					end if
					'UPDATE NET PLAYERS (SERVER)
					iRN_SendByte( NET_REMOVE_PICKUP )
					iRN_SendInt( T_PICKUP_LIST( i ).Net_ID )
					iRN_SendInt( T_PLAYER_LIST( 0 ).pid )
					NET_SEND( RN_HOST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE_ORDERED )
					
					REMOVE_PICKUP( T_PICKUP_LIST( i ).Net_ID, T_PLAYER_LIST( 0 ).pid )	'DELETED ON SERVER NETMSG ALSO, CLEAR HERE SO NO MULTI AWARDS
				end if
				exit for
			END IF
      END WITH
   NEXT i

	' TELEPORT COLLISIONS
	FOR i AS INTEGER = 1 TO 4
		if iEntitiesCollided( T_PLAYER_LIST( 0 ).pFeet, Portal( i ) ) then
			if iMilliSecs() > teleport_delay_TIMER + 2000 then
				dim rp as integer
				do
					rp = iRand(1,4)
				loop until rp <> i
				T_PLAYER_LIST( 0 ).X = iEntityX( Portal( rp ) ) '+10.0
				T_PLAYER_LIST( 0 ).Z = iEntityZ( Portal( rp ) ) '+10.0
				iHideEntity( T_PLAYER_LIST( 0 ).pEnt )
				iPositionEntity( Camera, T_PLAYER_LIST( 0 ).X, T_PLAYER_LIST( 0 ).Y, T_PLAYER_LIST( 0 ).Z, true )
				dim tmppvt as iENTITY = iCreatePivot()
				iPositionEntity( tmppvt, Map_Size/2, Player_Height, Map_Size/2 )
				iPointEntity( Camera, tmppvt )
				iFreeEntity( tmppvt )
				T_PLAYER_LIST( 0 ).zVel = 5
				if not iSoundPlaying( chnl_Respawn ) then chnl_Respawn = iPlaySound( snd_Respawn )
            if iFadeReady() then
               iFadeColor( 1, 1, 1 )
               iFadeIn( 2000 )
				end if
				teleport_delay_TIMER = iMilliSecs()
				iShowEntity( T_PLAYER_LIST( 0 ).pEnt )
			end if
			exit for
		end if
	next i

   ' LOCAL PLAYER STATE FOR PLAYER_CONTROLS IN LOGIC LOOP
   falling = iEntityFalling( Camera )
   SurfaceType = iCollidedEntity( Camera )
END SUB

'-----------------------------------------------------------------------------
' PROCESS LOGON NETWORK MESSAGE QUEUE
'-----------------------------------------------------------------------------
SUB PROCESS_LOGON_NETWORK()
   DIM Msg_ID AS UBYTE
	WHILE iRN_CheckMessages()
		NetQueueIn += 1
		Msg_ID = iRN_GetByte()
      SELECT CASE Msg_ID

         CASE NET_MAP_SIZE
            T_PLAYER_LIST( 0 ).pid = iRN_GetInt()
            MAP_SIZE = iRN_GetInt()
            BUILDING_COUNT = iRN_GetInt()
            PRINT( "NET_MAP_SIZE: "+str( MAP_SIZE )+"  BUILDING COUNT: "+str( BUILDING_COUNT ) )
            EXIT SELECT

         CASE NET_MAP_OBJECT
            DIM typ AS INTEGER = iRN_GetInt()
            SELECT CASE typ
               CASE 2   ' BUILDING
						TOTAL_BUILDINGS += 1 
                  DIM index AS INTEGER = iRN_GetInt()
						dim SX as single = iRN_GetFloat()
						dim SY as single = iRN_GetFloat()
						dim SZ as single = iRN_GetFloat()
						Dim Syaw as Integer = iRN_GetInt()
                  DIM scale AS INTEGER = iRN_GetInt()
						T_BUIDLING_LIST( index ).Ent = iCopyEntity( Building, Surface )
						if SHADOWS then iEntityCastShadow( T_BUIDLING_LIST( index ).Ent )
                  iShowEntity( T_BUIDLING_LIST( index ).Ent )
                  iPositionEntity( T_BUIDLING_LIST( index ).Ent, SX, SY, SZ )
                  iRotateEntity( T_BUIDLING_LIST( index ).Ent, 0, SYAW, 0 )
                  iScaleEntity( T_BUIDLING_LIST( index ).Ent, scale, scale*4, scale )
                  iMetaAddSelector( coll_World, iCreateBoxSelector( T_BUIDLING_LIST( index ).Ent ) )  
						if TEXTURES_ON then
							iEntityColor( T_BUIDLING_LIST( index ).Ent, SKY_R, SKY_G, SKY_B )
						else
							iEntityColor( T_BUIDLING_LIST( index ).Ent, 150, 150, 150 )	
						end if                
						EXIT SELECT
            END SELECT
				EXIT SELECT

         CASE NET_PLAYER_CONNECT
            DIM PlayerID AS INTEGER = iRN_GetInt()
            DIM PlayerName AS STRING = *iRN_GetString()
				dim Team as integer = iRN_GetInt()
            PRINT("LOGIN NETWORK: ADD A PLAYER "+STR(PlayerID)+" my pid: "+STR(T_PLAYER_LIST( 0 ).pid))					
            IF PlayerID <> T_PLAYER_LIST( 0 ).pid THEN
               ADD_PLAYER( PlayerName, PlayerID, Team )
            END IF
            EXIT SELECT

         CASE NET_LOGIN_REPLY
            PRINT( "NET_LOGIN_REPLY MY PID:" + STR(T_PLAYER_LIST( 0 ).pid) )
            START_GAME = true
				net_select = 0
            EXIT SELECT  

         CASE NET_GLOBAL_SNAPSHOT
				iRotateEntity( SKY, 0, iRN_GetFloat(), 0 )	' iEntityYaw( SKY ) )
            EXIT SELECT

			case NET_REMOVE_PICKUP
				dim nidx as integer = iRN_GetInt()
				dim ppid as integer = iRN_GetInt()
				REMOVE_PICKUP( nidx, ppid )
				EXIT SELECT

			CASE NET_CREATE_PICKUP
				dim as integer nidx, t, x, z, tmo
				nidx = iRN_GetInt()
				t = iRN_GetInt()
				x = iRN_GetInt()
				z = iRN_GetInt()
				tmo = iRN_GetInt()
				CREATE_PICKUP( nidx, t, x, z, tmo )
				EXIT SELECT

			CASE NET_CHAT
				if DEBUG then ADD_CHAT( "DEBUG", "NET_CHAT RECEIVED C!", 3 )
				DIM pid AS INTEGER = iRN_GetInt()
				DIM tempchat AS STRING = *iRN_GetString()
				if pid = 0 then
					ADD_CHAT( "SERVER" + ": ", tempchat, 2 )
				else
					DIM p AS INTEGER = FIND_PLAYER( pid )
					if p <> -1 then 
						if T_PLAYER_LIST( p ).pid <> T_PLAYER_LIST( 0 ).pid then
							ADD_CHAT( TRIM(T_PLAYER_LIST( p ).pName) + ": ", tempchat, 4 )
						end if
					END if
				end if
				EXIT SELECT

         CASE ELSE
            PRINT( "[PROCESS_LOGON_NETWORK]: UNPROCESSED PACKET#: "+NET_MSG_NAME( Msg_ID ) )
      END SELECT
      iRN_ClearMessage()
      ' IS LOGON COMPLETE?
      IF TOTAL_BUILDINGS = BUILDING_COUNT and START_GAME = false and NET_SYNC_COMPLETE_WAIT = false THEN
         print( "SENDING NET_SYNC_COMPLETE" )
         iRN_SendByte( NET_SYNC_COMPLETE )
         iRN_SendInt( T_PLAYER_LIST( 0 ).pid )
         NET_SEND( RN_HOST, RN_HIGH_PRIORITY, RN_RELIABLE )
			NET_SYNC_COMPLETE_WAIT = true
      END IF
   WEND
END SUB

'-----------------------------------------------------------------------------
' PROCESS GAME NETWORK MESSAGE QUEUE
'-----------------------------------------------------------------------------
SUB PROCESS_NETWORK()
   dim MessagesProcessed as integer = 0
   DIM Msg_ID AS UBYTE
   DIM PlayerID AS INTEGER
	WHILE iRN_CheckMessages()
      NetQueueIn += 1
      MessagesProcessed += 1
		Msg_ID = iRN_GetByte()
		PlayerID = iRN_GetPlayerID()
		IF Is_Server THEN
   '***************************************************************************
   '     SERVER NETWORK
   '***************************************************************************
         SELECT CASE Msg_ID
   '***************************************************************************
   '			RAKNET MESSAGES
   '***************************************************************************
            CASE ID_NEW_INCOMING_CONNECTION
               if DEBUG then ADD_CHAT( "DEBUG", "A player is connecting!", 3 )
               EXIT SELECT

            CASE ID_DISCONNECTION_NOTIFICATION
               if DEBUG then ADD_CHAT( "DEBUG", "A player disconnected!", 3 )
               EXIT SELECT

            CASE ID_CONNECTION_LOST
               if DEBUG then ADD_CHAT( "DEBUG", "A player lost connection!  PID: "+str(PlayerID), 3 )
					REMOVE_PLAYER( PlayerID )
               EXIT SELECT
   '***************************************************************************
   '			GAME MESSAGES
   '***************************************************************************
            CASE NET_LOGIN_REQUEST
               DIM PlayerName AS STRING = *iRN_GetString()
					dim Team as integer = iRN_GetInt()
               ADD_PLAYER( PlayerName, PlayerID, Team )
               iPlayMusic( "Media/SFX/PlayerArrived.ogg" )
               EXIT SELECT

            CASE NET_DISCONNECT
               PRINT( "NET_DISCONNECT PID: "+STR( PlayerID ))
               iRN_SendByte( NET_PLAYER_DISCONNECT )
               iRN_SendInt( PlayerID )
					NET_SEND( RN_BROADCAST, RN_HIGH_PRIORITY, RN_RELIABLE )
               REMOVE_PLAYER( PlayerID )
               iPlayMusic( "Media/SFX/PlayerDeparted.ogg" )					
               EXIT SELECT

            CASE NET_POS_UPDATE
					IF Connections > 1 THEN
						iRN_ForwardMessage()
                  NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_UNRELIABLE_SEQUENCED )
					END IF
               DIM ts AS INTEGER = iRN_GetTimeStamp()
               DIM pid AS INTEGER = iRN_GetInt()
               NETPLAYER_POS_UPDATE( pid, ts ) 
               EXIT SELECT      

            CASE NET_CHAT
               IF Connections > 1 THEN
                  iRN_ForwardMessage()
                  NET_SEND( RN_BROADCAST, RN_HIGH_PRIORITY, RN_RELIABLE_ORDERED )
               END IF
					if DEBUG then ADD_CHAT( "DEBUG", "NET_CHAT RECEIVED(S)!", 3 )
               DIM pid AS INTEGER = iRN_GetInt()
					DIM tempchat AS STRING = *iRN_GetString()
               DIM p AS INTEGER = FIND_PLAYER( PlayerID )
               ADD_CHAT( TRIM(T_PLAYER_LIST( p ).pName) + ": ", tempchat, 4 )
               EXIT SELECT

            CASE NET_SYNC_COMPLETE
               iRN_SendByte( NET_LOGIN_REPLY )
					NET_SEND( PlayerID, RN_HIGH_PRIORITY, RN_RELIABLE, false )
               EXIT SELECT

            CASE NET_GUNSHOT
               IF Connections > 1 THEN
                  iRN_ForwardMessage()
                  NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE )
               END IF
					if DEBUG then print "GUNSHOT(S): "+str( iMilliSecs() )
					DIM pid AS INTEGER = iRN_GetInt()
					dim HitPid as integer = iRN_GetInt()
					dim TargetType as integer = iRN_GetInt()
					dim destX as single = iRN_GetFloat()
					dim destY as single = iRN_GetFloat()
					dim destZ as single = iRN_GetFloat()
					DIM p AS INTEGER = FIND_PLAYER( pid )
					'DIM hp AS INTEGER = FIND_PLAYER( HitPid )
					IF p <> -1 THEN
						with T_PLAYER_LIST( p )
							iEntityParent( .FlashSprite, .pWeaponEnt(1) )
							iPositionEntity( .FlashSprite, 3, -7, 0 )
							iShowEntity( .Flashsprite )
							iShowEntity( .Light )
							.FlashTimer = iMilliSecs()
						end with
					end if
					
					select case TargetType
						case target_SURFACE		' GROUND
							CREATE_EXPLOSION( destX, destY, destZ, target_SURFACE )
							EXIT SELECT

						case target_PLAYER, target_PLAYER_HEAD
							DIM hp AS INTEGER = FIND_PLAYER( HitPid )
							if hp <> -1 then
									with T_PLAYER_LIST( hp )
										if HitPid = T_PLAYER_LIST( 0 ).pid then
											iPlaySound( snd_HurtM( iRAND(1,2) ) )
											iFadeColor( 255, 0, 0 )
											iFadeIn( 500 )
										else
											iEmitSound( snd_HurtM( iRAND(1,2) ), .pEnt )
										end if
										CREATE_EXPLOSION( destX, destY, destZ, target_PLAYER )
										' CALCULATE DAMAGES AND REWARDS
										Dim DamageA as integer = 0
										Dim DamageH as integer = 0
										if .pArmor > 0 and iRAND(1,5) > 2 then
											DamageA = -5
											.pArmor += DamageA
											print "ARMOR CALC: "+str( .pArmor )
										else
											DamageH = -2 * TargetType	'??
											.pHealth += DamageH
											print "HEALTH CALC: "+str( .pHealth )
										end if

										IF .pArmor < 1 THEN
											.pArmor = 0
										END IF
										IF .pHealth < 1 THEN
											.pHealth = 0
											.pDeaths += 1
											T_PLAYER_LIST( p ).pKills += 1
											' SEND DEATH
											print "DEATH SENT..."
											iRN_SendByte( NET_DEATH )
											iRN_SendInt( HitPid )
											iRN_SendInt( pid )
											iRN_SendInt( .pDeaths )
											NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE )
											DEATH( HitPid, pid )
										end if
										' SEND DAMAGE
										print "DAMAGE SENT..."
										dim Scarr_Stage as integer = 0
										dim tex_Combined as iTEXTURE
										select case .pHealth
											case 90 to 100
												Scarr_Stage = 0
											case 70 to 89
												Scarr_Stage = 1
											case 50 to 69
												Scarr_Stage = 2
											case 30 to 49
												Scarr_Stage = 3
											case 0 to 29
												Scarr_Stage = 4
										end select
										print "Scarr_Stage_Sent: "+str( Scarr_Stage )
										
										if .pid <> T_PLAYER_LIST( 0 ).pid then
											tex_Combined = iCopyTexture( tex_FaceMaster )
											iTextureBlend( tex_Combined, Scarring( Scarr_Stage ), 0, 0, 3 )
											iEntityTexture( .pHead, tex_Combined, 0 )
											iEntityTexture( .pBody, Scarring( Scarr_Stage ), 0 )
										end if
							
										iRN_SendByte( NET_DAMAGE )
										iRN_SendInt( pid )
										iRN_SendInt( HitPid )
										iRN_SendInt( T_PLAYER_LIST( p ).pKills )
										iRN_SendInt( .pArmor )
										iRN_SendInt( .pHealth )
										iRN_SendInt( Scarr_Stage )
										NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE )
									end with
									exit select
								'end if
							end if
							exit select
						case else
							CREATE_EXPLOSION( destX, destY, destZ, target_BUILDING )
					end select
					exit select
				
				case NET_ALIVE			
					DIM pid AS INTEGER = iRN_GetInt()
					DIM p AS INTEGER = FIND_PLAYER( pid )
					if T_PLAYER_LIST( p ).pid <> T_PLAYER_LIST( 0 ).pid then
                  iRN_ForwardMessage()
                  NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE )
						T_PLAYER_LIST( p ).pState = iRN_GetInt()
						tex_Combined = iCopyTexture( tex_FaceMaster )
						iTextureBlend( tex_Combined, Scarring( 0 ), 0, 0, 3 )
						iEntityTexture( T_PLAYER_LIST( p ).pHead, tex_Combined, 0 )
						iEntityTexture( T_PLAYER_LIST( p ).pBody, Scarring( 0 ), 0 )
						iShowEntity( T_PLAYER_LIST( p ).pEnt )
					end if
					exit select
					
				case NET_REMOVE_PICKUP
					if Connections > 1 then
						iRN_ForwardMessage()
						NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_RELIABLE )
					end if
					dim nidx as integer = iRN_GetInt()
					dim ppid as integer = iRN_GetInt()
					REMOVE_PICKUP( nidx, ppid )
					exit select

            CASE ELSE
               PRINT( "[PROCESS_SERVER_NETWORK]: UNPROCESSED PACKET#: "+NET_MSG_NAME( Msg_ID ) )
         END SELECT
      ELSE
   '***************************************************************************
   '     CLIENT NETWORK
   '***************************************************************************
         SELECT CASE Msg_ID
            CASE ID_DISCONNECTION_NOTIFICATION, ID_CONNECTION_LOST
               ADD_CHAT( "SYSTEM" , "CONNECTION TO SERVER LOST!", 2 )
               iRN_CloseConnection( True )
               EXIT SELECT
            ' GAME MESSAGES

            CASE NET_PLAYER_CONNECT
               dim pid as integer = iRN_GetInt()
               DIM PlayerName AS STRING = *iRN_GetString()
					dim Team as integer = iRN_GetInt()
               PRINT("NETWORK: ADD A PLAYER")					
               IF PlayerID <> T_PLAYER_LIST( 0 ).pid THEN
                  ADD_PLAYER( PlayerName, pid, Team )
                  iPlayMusic( "Media/SFX/PlayerArrived.ogg" )
               END IF
               EXIT SELECT

            CASE NET_PLAYER_DISCONNECT
               dim p as integer = iRN_GetInt()
               REMOVE_PLAYER( p )
               iPlayMusic( "Media/SFX/PlayerDeparted.ogg" )
               EXIT SELECT

            CASE NET_CHAT
					if DEBUG then ADD_CHAT( "DEBUG", "NET_CHAT RECEIVED(C)!", 3 )
               DIM pid AS INTEGER = iRN_GetInt()
               DIM tempchat AS STRING = *iRN_GetString()
               if pid = 0 then
						ADD_CHAT( "SERVER", tempchat, 2 ) 'ADD_CHAT( "SERVER" + ": ", tempchat, 2 )
					else
						DIM p AS INTEGER = FIND_PLAYER( pid )
						if p <> -1 then 
							if T_PLAYER_LIST( p ).pid <> T_PLAYER_LIST( 0 ).pid then
								ADD_CHAT( TRIM(T_PLAYER_LIST( p ).pName) + ": ", tempchat, 4 )
							end if
						END if
					end if
               EXIT SELECT

            CASE NET_POS_UPDATE
               DIM ts AS INTEGER = iRN_GetTimeStamp()
               DIM pid AS INTEGER = iRN_GetInt()
               NETPLAYER_POS_UPDATE( pid, ts )
               EXIT SELECT 

            CASE NET_GLOBAL_SNAPSHOT
               iRotateEntity( SKY, 0, iRN_GetFloat(), 0 )
               EXIT SELECT

            CASE NET_CREATE_PICKUP
               dim as integer n, t, x, y, tmo
					n = iRN_GetInt()
               t = iRN_GetInt()
               x = iRN_GetInt()
               y = iRN_GetInt()
					tmo = iRN_GetInt()
               CREATE_PICKUP( n, t, x, y, tmo )
               EXIT SELECT

            CASE NET_GUNSHOT
					if DEBUG then print "GUNSHOT(C): "+str( iMilliSecs() )
					DIM pid AS INTEGER = iRN_GetInt()
					dim HitPid as integer = iRN_GetInt()
					dim TargetType as integer = iRN_GetInt()
					dim destX as single = iRN_GetFloat()
					dim destY as single = iRN_GetFloat()
					dim destZ as single = iRN_GetFloat()
					DIM p AS INTEGER = FIND_PLAYER( pid )
					IF p <> -1 THEN
						with T_PLAYER_LIST( p )
							iEntityParent( .FlashSprite, .pWeaponEnt(1) )
							iPositionEntity( .FlashSprite, 3, -7, 0 )
							iShowEntity( .Flashsprite )
							iShowEntity( .Light )
							.FlashTimer = iMilliSecs()
						end with
					end if
					
					select case TargetType
						case target_SURFACE
							CREATE_EXPLOSION( destX, destY, destZ, target_SURFACE )
							EXIT SELECT
						
						case target_PLAYER, target_PLAYER_HEAD
							DIM hp AS INTEGER = FIND_PLAYER( HitPid )
							if hp <> -1 then
								if HitPid = T_PLAYER_LIST( 0 ).pid then
									iPlaySound( snd_HurtM( iRAND(1,2) ) )
									CREATE_EXPLOSION( destX, destY, destZ, target_PLAYER )
									iFadeColor( 255, 0, 0 )
									iFadeIn( 500 )
									EXIT SELECT
								else
									with T_PLAYER_LIST( hp )
										iEmitSound( snd_HurtM( iRAND(1,2) ), .pEnt )
										CREATE_EXPLOSION( destX, destY, destZ, target_PLAYER )
									end with
								end if
							end if
							exit select
						
						case else
							CREATE_EXPLOSION( destX, destY, destZ, target_BUILDING )
						
					end select
					exit select

            case NET_DAMAGE
               DIM pid AS INTEGER = iRN_GetInt()
					DIM hpid AS INTEGER = iRN_GetInt()
					dim Kills as integer = iRN_GetInt()
					dim parmor as integer = iRN_GetInt()
					dim phealth as integer = iRN_GetInt()
               DIM p AS INTEGER = FIND_PLAYER( pid )
               DIM hp AS INTEGER = FIND_PLAYER( hpid )

					if p <> -1 then
						T_PLAYER_LIST( p ).pKills = Kills
					end if

               if hp <> -1 then
						With T_PLAYER_LIST( hp )
							.pArmor = parmor
							.pHealth = phealth
							IF .pHealth < 1 THEN
								.pHealth = 0
							end if
							IF .pArmor < 1 THEN
								.pArmor = 0
							end if
							
							dim Scarr_Stage as integer = iRN_GetInt()
							print "Scarr_Stage Received: "+str( Scarr_Stage )
							if .pid <> T_PLAYER_LIST( 0 ).pid then
								dim tex_Combined as iTEXTURE
								tex_Combined = iCopyTexture( tex_FaceMaster )
								iTextureBlend( tex_Combined, Scarring( Scarr_Stage ), 0, 0, 3 )
								iEntityTexture( .pHead, tex_Combined, 0 )
								iEntityTexture( .pBody, Scarring( Scarr_Stage ), 0 )
							end if
						end with
					end if
					exit select

            case NET_DEATH
               DIM hpid AS INTEGER = iRN_GetInt()
               DIM kbpid AS INTEGER = iRN_GetInt()
					
					DIM hp AS INTEGER = FIND_PLAYER( hpid )
               DIM kp AS INTEGER = FIND_PLAYER( kbpid )
               if hp <> -1 and kp <> -1 then
						T_PLAYER_LIST( hp ).pDeaths = iRN_GetInt()
						DEATH( hpid, kbpid )
					else
						print "DEATH PLAYER(S) NOT FOUND: KILLED: "+str( hpid )+" : KILLED BY: "+str( kbpid )
					end if
               EXIT SELECT

				case NET_ALIVE			
					DIM pid AS INTEGER = iRN_GetInt()
					DIM p AS INTEGER = FIND_PLAYER( pid )
					dim tex_Combined as iTEXTURE
					if T_PLAYER_LIST( p ).pid <> T_PLAYER_LIST( 0 ).pid then
						T_PLAYER_LIST( p ).pState = iRN_GetInt()
						tex_Combined = iCopyTexture( tex_FaceMaster )
						iTextureBlend( tex_Combined, Scarring( 0 ), 0, 0, 3 )
						iEntityTexture( T_PLAYER_LIST( p ).pHead, tex_Combined, 0 )
						iEntityTexture( T_PLAYER_LIST( p ).pBody, Scarring( 0 ), 0 )
						iShowEntity( T_PLAYER_LIST( p ).pEnt )
					end if
					exit select

				case NET_REMOVE_PICKUP
					dim nidx as integer = iRN_GetInt()
					dim ppid as integer = iRN_GetInt()
					REMOVE_PICKUP( nidx, ppid )
					EXIT SELECT
					
            CASE ELSE
               PRINT( "[PROCESS_CLIENT_NETWORK]: UNPROCESSED PACKET#: "+NET_MSG_NAME( Msg_ID ) )
         END SELECT         
      END IF
		iRN_ClearMessage()	
		IF MessagesProcessed > MAX_NETMSG_PER_CYCLE THEN EXIT WHILE 'LIMIT MESSAGES PROCESSED PER ENGINE CYCLE
	WEND	
END SUB

'-----------------------------------------------------------------------------
' REMOVE PICKUP
'-----------------------------------------------------------------------------
function REMOVE_PICKUP( nid as integer, pid as integer ) as boolean
   DIM pu AS INTEGER = FIND_PICKUP( nid )
   DIM p AS INTEGER = FIND_PLAYER( pid )
	dim Award as integer = 30

	IF pu <> -1 THEN
      WITH T_PICKUP_LIST( pu )
			' EMIT THE SOUND
			select case .pType
				case 1   'AMMO
					iEmitSound( snd_Ammo, .Ent )
					if p <> -1 then
						T_PLAYER_LIST( p ).pAmmoBelt += 30
						if  T_PLAYER_LIST( p ).pAmmoBelt > MAX_AMMO then T_PLAYER_LIST( p ).pAmmoBelt = MAX_AMMO
					end if
					exit select
				case 2	'HEALTH
					iEmitSound( snd_Health, .Ent )
					if p <> -1 then
						T_PLAYER_LIST( p ).pHealth += 30
						if  T_PLAYER_LIST( p ).pHealth > MAX_HEALTH then T_PLAYER_LIST( p ).pHealth = MAX_HEALTH
						UPDATE_SCARRS( T_PLAYER_LIST( p ).pid )
					end if
					exit select
				case 3	'ARMOR
					iEmitSound( snd_Armor, .Ent )
					if p <> -1 then
						T_PLAYER_LIST( p ).pArmor += 30
						if  T_PLAYER_LIST( p ).pArmor > MAX_ARMOR then T_PLAYER_LIST( p ).pArmor = MAX_ARMOR
					end if
					exit select
				
				
				
			end select
			iFreeAllAnimators( .Ent )
			iFreeEntity( .Ent )
			.Ent = NULL
			.Timeout = 0
			swap T_PICKUP_LIST( pu ), T_PICKUP_LIST( T_PICKUP_TOTAL )
			T_PICKUP_TOTAL -= 1
			Return TRUE
		end with
   end If
	
   Return false
end function

'-----------------------------------------------------------------------------
' REMOVE PLAYER
'-----------------------------------------------------------------------------
FUNCTION REMOVE_PLAYER( PlayerID AS INTEGER ) AS Boolean
   DIM p AS INTEGER = FIND_PLAYER( PlayerID )
   IF p <> -1 THEN
      WITH T_PLAYER_LIST( p )
         ADD_CHAT( "SERVER", .pName + " has left the game! PID: "+STR(.pid), 2 )
			.pState = SLOT_FREE
         .pid = -1
         .pName = ""
         iFreeSpline( .SplineID )
			iFreeEntity( .Light )
			iRemoveEntitySelector( .pHead, .Selector(1) )' = iCreateTriSelector( .pHead )
			iRemoveEntitySelector( .pBody, .Selector(2) )' = iCreateTriSelector( .pBody )
			iHideEntity( .pEnt )
			'iHideEntity( .pFeet )
         swap T_PLAYER_LIST( p ), T_PLAYER_LIST( T_PLAYER_TOTAL )
         T_PLAYER_TOTAL -= 1
         RETURN true
      END WITH
   END IF
   RETURN false
END FUNCTION

'-----------------------------------------------------------------------------
' SEND A POSITIONAL UPDATE
'-----------------------------------------------------------------------------
SUB SEND_POS_UPDATE()
	if T_PLAYER_LIST( 0 ).pState <> SLOT_DEAD then
		with T_PLAYER_LIST( 0 )
			iRN_SendTimeStamp()
			iRN_SendByte( NET_POS_UPDATE )
			iRN_SendInt( .pid )
			iRN_SendFloat( .x )
			iRN_SendFloat( .y )
			iRN_SendFloat( .z )
			iRN_SendFloat( .Yaw )
			iRN_SendFloat( .Pitch ) 
			iRN_SendFloat( .xVel)
			iRN_SendFloat( .zVel) 
			NET_SEND( RN_BROADCAST, RN_IMMEDIATE_PRIORITY, RN_UNRELIABLE )
		end with
	end if
END SUB

'-----------------------------------------------------------------------------
' SHUTDOWN GAME
'-----------------------------------------------------------------------------
SUB SHUTDOWN()
	iRN_SendByte( NET_DISCONNECT )
	NET_SEND( RN_BROADCAST, RN_HIGH_PRIORITY, RN_RELIABLE )
	if ( not Is_Server ) then iRN_CloseConnection()
	iRN_Shutdown( 1000 )
   iDeleteMetaSelector( coll_World )
   'iClearScene() 'CRASHES SOMETIMES
   iEndGraphics()
END SUB

'-----------------------------------------------------------------------------
' UPDATE EXPLOSIONS
'-----------------------------------------------------------------------------
SUB UPDATE_EXPLOSIONS()
   FOR i AS INTEGER = 1 TO T_EXPLOSION_TOTAL
      WITH T_EXPLOSION_LIST( i )
			.TimeOut -= 1
			.Scale += 1.0
			IF .Scale > 3 THEN
				.Scale = 3
			END IF
			IF .TimeOut <= 0 THEN
				iFreeEntity( .Sprite )
				.Sprite = NULL
				iFreeEntity( .Emitter )
				swap T_EXPLOSION_LIST( i ), T_EXPLOSION_LIST( T_EXPLOSION_TOTAL )
				T_EXPLOSION_TOTAL -= 1
				exit for
			ELSE
				iScaleSprite( .sprite, .Scale, .Scale )
			END IF
      END WITH
   NEXT i  
END SUB

'-----------------------------------------------------------------------------
' UPDATE NETWORK PLAYER POSITIONS
'-----------------------------------------------------------------------------
SUB UPDATE_NET_PLAYERS( dt AS INTEGER )
	DIM TimeSince AS integer = 0'.0
	DIM SplineTime AS single = 0.0
	DIM curTime AS INTEGER = iRN_GetTime()
   FOR i AS INTEGER = 1 TO T_PLAYER_TOTAL
		WITH T_PLAYER_LIST( i )
			if ( .SplineInitialized ) and ( .pState <> SLOT_DEAD )then
				TimeSince = curTime - .LastPacketTimestamp
				IF ( TimeSince < POS_UPDATE_FREQ ) THEN
					' USE SPLINE
					SplineTime = TimeSince / POS_UPDATE_FREQ
					.x		= iGetSplineX( .SplineID, SplineTime )
					.y		= iGetSplineY( .SplineID, SplineTime )
					.z		= iGetSplineZ( .SplineID, SplineTime )
					.xVel = .PacketxVel
					.zVel = .PacketzVel
				ELSE
					' DEAD RECONING
					dim adjRot as single = (90-.Yaw)/180*PI
					dim cxsz as single = cos( adjRot )
					dim sxcz as single = sin( adjRot )
					.z = .z - (.xVel * cxsz) + (.zVel * sxcz)
					.y = .y
					.x = .x + (.zVel * cxsz) + (.xVel * sxcz)
				END IF
				' FOOTSTEPS
				IF (INT(.x) <> INT(iEntityX(.pEnt))) OR (INT(.z) <> INT(iEntityZ(.pEnt))) THEN
					IF (iMilliSecs() > .StepTimer + STEP_TIME ) THEN
						lBoot = not lBoot
					 ' DUST PARTICLE SYSTEM
						DIM dustPS AS iPARTICLE_SYSTEM
						DIM dustEmitter AS iEMITTER
						dustPS = iCreateParticleSystem( false )
						iPositionEntity( dustPS, .x, GROUND_HEIGHT+0.1, .z)
						dustEmitter = iCreateParticleEmitter( dustPS, particle_Def( prtcl_MIST ) )
						iEntityMaterialType( dustPS, EMT_TRANSPARENT_ADD_COLOR )
						iEntityMaterialFlag( dustPS, EMF_FOG_ENABLE, false )
						iEntityMaterialFlag( dustPS, EMF_LIGHTING, true )
						iEntityTexture( dustPS, smoke_tex )
						iEntityColor( dustPS, 124, 78, 52 )
						iCreateFadeOutAffector( dustPS, 100, 0, 0, 0 )
						iCreateStopAffector( dustPS, 300, dustEmitter )
						iDeletionAnimator( dustPS, 2500  )
						iEmitSound(sndStoneSteps( iRand(1,4)), .pEnt )
						.StepTimer = iMilliSecs()
					' SHOW FEET
						iRotateEntity( .pFeet, 0, 0, 0 )		
						if lBoot then
							iPositionTexture( .pFeet, 0, -0.05 ) : 
						else
							iPositionTexture( .pFeet, 0.5, -0.05 )
						end if
					end if
				else
					' ELSE HIDE FEET
					iRotateEntity( .pFeet, -180, 0, 0 )
					iPositionTexture( .pFeet, 0, 0 )
				end if
				
				' SET PLAYER POSITION AND ROTATION
				iPositionEntity( .pEnt, .x, .y, .z )
				iRotateEntity( .pEnt, 0, .Yaw, 0 )
				
				' PITCH REMOTE PLAYER HEAD AND WEAPON
				dim headPitch as integer
				if .Pitch > 18 and .Pitch < 100 then
					headPitch = 18
				elseif .Pitch < 306 and .Pitch > 270 then
					headPitch = 306
				else
					headPitch = .Pitch
				end if
				iRotateEntity( .pHead, headPitch, 0, 0 )
				iRotateEntity( .pWeaponPivot, .Pitch, 0, 0 )
				
				' HIDE MUZZLE FASH IF EXPIRED
				IF iMilliSecs() > .FlashTimer + 100 THEN
					iHideEntity( .FlashSprite )
					iHideEntity( .Light )
				end if
			end if
		END WITH
   NEXT i
END SUB 

'-----------------------------------------------------------------------------
' UPDATE PICKUPS
'-----------------------------------------------------------------------------
SUB UPDATE_PICKUPS()
   FOR i AS INTEGER = 1 TO T_PICKUP_TOTAL
      WITH T_PICKUP_LIST( i )
			' DELETE IT IF TIMER IS EXPIRED
			IF iMilliSecs() > .TimeOut + 30000 THEN
				iFreeAllAnimators( .Ent )
				iFreeEntity( .Ent )
				.Ent = NULL
				.Timeout = 0
				swap T_PICKUP_LIST( i ), T_PICKUP_LIST( T_PICKUP_TOTAL )
				T_PICKUP_TOTAL -= 1
				exit for
			end if
			if iEntityDistance( .Ent, CAMERA ) > VIEW_DISTANCE then
				iHideEntity( .Ent )
				goto skipit		'HIDE UNTIL IN VIEW
			else
				iShowEntity( .Ent )
			end if
			IF iMillisecs() > .TimeOut + 25000 then
				if iRAND(1,3) < 3 then
					iShowEntity( .Ent )
				else
					iHideEntity( .Ent )
				end if
			end if
			skipit:
      END WITH
   NEXT i
END SUB

'-----------------------------------------------------------------------------
' UPDATE SCARRS
'-----------------------------------------------------------------------------
sub UPDATE_SCARRS( pid as integer )
	dim Scarr_Stage as integer = 0
	dim tex_Combined as iTEXTURE
	dim p as integer = FIND_PLAYER( pid )
	if p <> -1 then
		with T_PLAYER_LIST( p )
			select case .pHealth
				case 90 to 100
					Scarr_Stage = 0
				case 70 to 89
					Scarr_Stage = 1
				case 50 to 69
					Scarr_Stage = 2
				case 30 to 49
					Scarr_Stage = 3
				case 0 to 29
					Scarr_Stage = 4
			end select
			tex_Combined = iCopyTexture( tex_FaceMaster )
			iTextureBlend( tex_Combined, Scarring( Scarr_Stage ), 0, 0, 3 )
			iEntityTexture( .pHead, tex_Combined, 0 )
			iEntityTexture( .pBody, Scarring( Scarr_Stage ), 0 )
		end with
	end if
end sub

'-----------------------------------------------------------------------------
' UPDATE SHADOWS
'-----------------------------------------------------------------------------
SUB UPDATE_SHADOWS()
	dim shad1 as iENTITY
	dim shad2 as iENTITY
	dim shad3 as iENTITY
	dim shad4 as iENTITY
	dim shad5 as iENTITY
	dim i AS INTEGER

	if Shadows then
		' BUILDINGS
		FOR i = 1 TO BUILDING_COUNT
			with T_BUIDLING_LIST( i )
				shad1 = iGetEntityShadow( .Ent )
				if iEntityDistance( .Ent, T_PLAYER_LIST( 0 ).pEnt ) > VIEW_DISTANCE then
					iHideEntity( shad1 )
				else
					iShowEntity( shad1 )
				end if
			end with
		next i
		' OTHER PLAYERS
		FOR i = 1 TO T_PLAYER_TOTAL
			with T_PLAYER_LIST( i )
				shad1 = iGetEntityShadow( .pHead )
				shad2 = iGetEntityShadow( .pBody )
				shad3 = iGetEntityShadow( .pFeet )
				shad4 = iGetEntityShadow( .pWeaponEnt(1) )
				shad5 = iGetEntityShadow( .pWeaponEnt(2) )
				if iEntityDistance( .pEnt, CAMERA ) > VIEW_DISTANCE then
					iHideEntity( shad1 )
					iHideEntity( shad2 )
					iHideEntity( shad3 )
					iHideEntity( shad4 )
					iHideEntity( shad5 )
				else
					iShowEntity( shad1 )
					iShowEntity( shad2 )
					iShowEntity( shad3 )
					iShowEntity( shad4 )
					iShowEntity( shad5 )
				end if
			end with
		next i
	end if
end sub

'=============================================================================
'-----------------------------------------------------------------------------
'  PARTICLE DEFINITION DATA
'-----------------------------------------------------------------------------
'=============================================================================
'  PARTICLE DEFINITION DATA FIELDS  
'   min_box_x->single, min_box_y->single, min_box_z->single
'   max_box_x->single, max_box_y->single, max_box_z->single
'   direction_x->single, direction_y->single, direction_z->single
'   min_paritlcles_per_second->uinteger, max_paritlcles_per_second->uinteger
'   min_start_color_red->integer, min_start_color_green->integer, min_start_color_blue->integer
'   max_start_color_red->integer, max_start_color_green->integer, max_start_color_blue->integer
'   min_lifetime->uinteger, max_lifetime->uinteger
'   min_start_sizeX->single, min_start_sizeY->single
'   max_start_sizeX->single, max_start_sizeY->single
'   max_angle_degrees->integer

particles:
' PORTAL
DATA -2, 0, -2,      2, 5, 2,          0, 0.005, 0,			500, 1000,_
      160, 16, 200,	200, 18, 255,    	900, 1000,				0.2, 0.2,_
      0.5, 0.5,      90.0
' SPARK
DATA -1, 5, -1,      2, 10, 2,         0.0, -0.01, 0.0,		50, 50,_
      64, 34, 0,     255, 80, 0,       500, 2000,				0.1, 0.1,_
      0.5, 0.5,      0.0
' SMOKE
DATA -1, 1, -1,      1, 2, 1,          0.0, 0.01, 0.0,		20, 30,_
      0, 0, 0,       255, 255, 255,    1000, 2000,				10.5, 10.5,_
      20.5, 20.5,    0.0
' BLOOD
DATA -7, 5, -7,      7, 10, 7,         0.0, 0.01, 0.0,		500, 1000,_
      64, 34, 0,     255, 80, 0,       500, 2000,				0.1, 0.1,_
      0.5, 0.5,      100.0
' MIST
DATA -1, 1, -1,      1, 2, 1,          0.0, -0.001, 0.0,		20, 30,_
      0, 0, 0,       255, 255, 255,    500, 1000,				5.5, 5.5,_
      10.5, 10.5,    0.0






















