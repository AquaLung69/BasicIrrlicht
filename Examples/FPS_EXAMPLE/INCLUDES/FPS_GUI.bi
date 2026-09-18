'----------------------------------------------------------------------------
'  FPS EXAMPLE GUI Author 2024 ED MUSOLINO
'	Basic-Irrlicht Wrapper coded by EM ENGINEERING 2019-2026
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
'----------------------------------------------------------------------------

' GUI COLORS
iSetElementColor( EGDC_BUTTON_TEXT, 255, 255, 255, 255 ) 		'WINDOW TEXT
iSetElementColor( EGDC_3D_SHADOW, 80, 80, 150, 225 )     		'TOP LEFT
iSetElementColor( EGDC_3D_FACE, 30, 30, 100, 225 )       		'BOTTOM RIGHT
iSetElementColor( EGDC_EDITABLE, 1, 1, 1, 255 )     				'EDITABLE TEXT
iSetElementColor( EGDC_TOOLTIP , 255, 255, 255, 255 )     		'TOOL TIP TEXT
iSetElementColor( EGDC_TOOLTIP_BACKGROUND, 80, 80, 150, 225 )  'TOOL TIP BG
iSetElementColor( EGDC_FOCUSED_EDITABLE, 255, 0, 0, 255 )		'EDITABLE BG
iColor( 255, 255, 255 )														'GENERAL TEXT COLOR

DIM shared GUIEvent as iGUI_EVENT PTR
dim shared GUI_ACTIVE as integer = false
T_PLAYER_LIST( 0 ).pName = "PLAYER-"+STR(iRAND( 100, 999) )
	
DIM SHARED snd_Button AS iSOUND_SOURCE
	snd_Button = iLoadSound( "Media\SFX\Button.ogg" )
DIM SHARED snd_Clicked AS iSOUND_SOURCE
	snd_Clicked = iLoadSound( "Media\SFX\Click.ogg" )
dim shared GAME_TITLE as iTEXTURE
	GAME_TITLE = iLoadTexture( "MEDIA\UI\FPS.png" )
dim shared SEL_COLOR as iTEXTURE
	SEL_COLOR = iLoadTexture( "MEDIA\UI\SEL_COLOR.bmp" )
dim BUTTON_HOST_IMG(1) as iTEXTURE
	BUTTON_HOST_IMG(0) = iLoadTexture( "MEDIA\UI\HOST.bmp" )
	BUTTON_HOST_IMG(1) = iLoadTexture( "MEDIA\UI\HOST_SEL.bmp" )
dim BUTTON_JOIN_IMG(1) as iTEXTURE
	BUTTON_JOIN_IMG(0) = iLoadTexture( "MEDIA\UI\JOIN.bmp" )
	BUTTON_JOIN_IMG(1) = iLoadTexture( "MEDIA\UI\JOIN_SEL.bmp" )
dim BUTTON_QUIT_IMG(1) as iTEXTURE
	BUTTON_QUIT_IMG(0) = iLoadTexture( "MEDIA\UI\QUIT.bmp" )
	BUTTON_QUIT_IMG(1) = iLoadTexture( "MEDIA\UI\QUIT_SEL.bmp" )
	
DIM shared GUI_WINDOW_HOST as iGADGET
DIM shared GUI_WINDOW_JOIN as iGADGET
DIM shared GUI_BUTTON_HOST as iGADGET
DIM shared GUI_BUTTON_JOIN as iGADGET
DIM shared GUI_BUTTON_QUIT as iGADGET
DIM shared GUI_GAME_TITLE as iGADGET

DIM shared GUI_SCROLLBAR( 6 ) as iGADGET

' AVATAR COLORS
DIM shared GUI_LIST_HEAD( 3 ) as integer
DIM shared GUI_LIST_SUIT( 3 ) as integer
for i as integer = 1 to 3
	GUI_LIST_HEAD( i ) = iRAND( 0, 192 )
	GUI_LIST_SUIT( i ) = iRAND( 128, 255 )
next

declare Sub PROCESS_GUI_MENU()

#define ID_WINDOW_HOST			101
#define ID_EDIT_SRVNAME			102
#define ID_EDIT_IP				103
#define ID_EDIT_PORT_H			104
#define ID_EDIT_PORT_J			105
#define ID_BUTTON_START			106
#define ID_BUTTON_JOIN			107
#define ID_BUTTON_CANCEL		108
#define ID_BUTTON_HOSTM			109
#define ID_BUTTON_JOINM			110
#define ID_BUTTON_QUITM			111
#define ID_EDIT_PLRNAME_H		112
#define ID_EDIT_PLRNAME_J		113
#define ID_EDIT_MAX				114
#define ID_HEAD_COLOR_R			115
#define ID_HEAD_COLOR_G			116
#define ID_HEAD_COLOR_B			117
#define ID_SUIT_COLOR_R			118
#define ID_SUIT_COLOR_G			119
#define ID_SUIT_COLOR_B			120

' MENU TITLE
GUI_GAME_TITLE = iStaticImage( GAME_TITLE, (iGraphicsWidth()/2) - (iTextureWidth(GAME_TITLE)/2), 10 )

' INSTRUCTIONS
'iStaticImage( Controls, 20, 150 )

' MENU BUTTONS
GUI_BUTTON_HOST = iCreateButton( NULL, (iGraphicsWidth()-250) , iGraphicsHeight()/3 + 50, 180, 40,  ID_BUTTON_HOSTM, "HOST A SERVER" )
	iSetButtonImage( GUI_BUTTON_HOST, BUTTON_HOST_IMG(0), EGBIS_IMAGE_UP )
	iSetButtonImage( GUI_BUTTON_HOST, BUTTON_HOST_IMG(1), EGBIS_IMAGE_UP_MOUSEOVER )
GUI_BUTTON_JOIN = iCreateButton( NULL, (iGraphicsWidth()-250) , iGraphicsHeight()/3 + 100, 180, 40,  ID_BUTTON_JOINM, "JOIN A SERVER" )
	iSetButtonImage( GUI_BUTTON_JOIN, BUTTON_JOIN_IMG(0), EGBIS_IMAGE_UP )
	iSetButtonImage( GUI_BUTTON_JOIN, BUTTON_JOIN_IMG(1), EGBIS_IMAGE_UP_MOUSEOVER )
GUI_BUTTON_QUIT = iCreateButton( NULL, (iGraphicsWidth()-250) , iGraphicsHeight()/3 + 175, 180, 40,  ID_BUTTON_QUITM, "QUIT GAME" )
	iSetButtonImage( GUI_BUTTON_QUIT, BUTTON_QUIT_IMG(0), EGBIS_IMAGE_UP )
	iSetButtonImage( GUI_BUTTON_QUIT, BUTTON_QUIT_IMG(1), EGBIS_IMAGE_UP_MOUSEOVER )

' COLOR SELECTOR SCROLLBARS
GUI_SCROLLBAR( 1 ) = iCreateScrollBar( false, iGraphicsWidth()-400, iGraphicsHeight()/3 + 90, 10, 100, ID_HEAD_COLOR_R, GUI_LIST_HEAD( 1 ), 255 )
GUI_SCROLLBAR( 2 ) = iCreateScrollBar( false, iGraphicsWidth()-390, iGraphicsHeight()/3 + 90, 10, 100, ID_HEAD_COLOR_G, GUI_LIST_HEAD( 2 ), 255 )
GUI_SCROLLBAR( 3 ) = iCreateScrollBar( false, iGraphicsWidth()-380, iGraphicsHeight()/3 + 90, 10, 100, ID_HEAD_COLOR_B, GUI_LIST_HEAD( 3 ), 255 )
GUI_SCROLLBAR( 4 ) = iCreateScrollBar( false, iGraphicsWidth()-400, iGraphicsHeight()/3 + 220, 10, 100, ID_SUIT_COLOR_R, GUI_LIST_SUIT( 1 ), 255 )
GUI_SCROLLBAR( 5 ) = iCreateScrollBar( false, iGraphicsWidth()-390, iGraphicsHeight()/3 + 220, 10, 100, ID_SUIT_COLOR_G, GUI_LIST_SUIT( 2 ), 255 )
GUI_SCROLLBAR( 6 ) = iCreateScrollBar( false, iGraphicsWidth()-380, iGraphicsHeight()/3 + 220, 10, 100, ID_SUIT_COLOR_B, GUI_LIST_SUIT( 3 ), 255 )

' HOST
GUI_WINDOW_HOST = iCreateWindow( "H O S T   S E R V E R", (iGraphicsWidth()/2) - 150, 250, 300, 210 )
	iStaticText( "PLAYER NAME", 80, 30, 125, 20, false, false, GUI_WINDOW_HOST )
	iCreateEditBox( T_PLAYER_LIST( 0 ).pName, 20, 50, 265, 20, ID_EDIT_PLRNAME_H, true, FALSE, GUI_WINDOW_HOST )
	iStaticText( "SERVER NAME", 80, 80, 125, 20, false, false, GUI_WINDOW_HOST )
	iCreateEditBox( ServerName, 20, 100, 265, 20, ID_EDIT_SRVNAME, true, FALSE, GUI_WINDOW_HOST )
	iStaticText( "MAX PLAYERS			PORT", 20, 130, 220, 20, false, false, GUI_WINDOW_HOST )
	iCreateEditBox( str(MaxPlayers), 15, 150, 80, 20, ID_EDIT_MAX, true, FALSE, GUI_WINDOW_HOST )
	iCreateEditBox( str(Server_Port), 175, 150, 80, 20, ID_EDIT_PORT_H, true, FALSE, GUI_WINDOW_HOST )
	iCreateButton( "START", 10, 180, 106, 20,  ID_BUTTON_START, "", GUI_WINDOW_HOST )
	iCreateButton( "CANCEL", 180, 180, 106, 20,  ID_BUTTON_CANCEL, "", GUI_WINDOW_HOST )
	iHideEntity( GUI_WINDOW_HOST )
	iWindowButtons( GUI_WINDOW_HOST , false, false, false )
	
' JOIN
GUI_WINDOW_JOIN = iCreateWindow( "J O I N   S E R V E R", (iGraphicsWidth()/2) - 200, 250, 400, 160 )
	iStaticText( "PLAYER NAME", 80, 30, 125, 20, false, false, GUI_WINDOW_JOIN )
	iCreateEditBox( T_PLAYER_LIST( 0 ).pName, 20, 50, 265, 20, ID_EDIT_PLRNAME_J, true, FALSE, GUI_WINDOW_JOIN )
	iStaticText( "    IP				        PORT", 45, 80, 280, 20, false, false, GUI_WINDOW_JOIN )
	iCreateEditBox( STR(IP), 10, 100, 250, 20, ID_EDIT_IP, true, FALSE, GUI_WINDOW_JOIN )
	iCreateEditBox( str(Server_Port), 275, 100, 80, 20, ID_EDIT_PORT_J, true, FALSE, GUI_WINDOW_JOIN )
	iCreateButton( "JOIN", 10, 130, 106, 20, ID_BUTTON_JOIN, "", GUI_WINDOW_JOIN )
	iCreateButton( "CANCEL", 280, 130, 106, 20, ID_BUTTON_CANCEL, "", GUI_WINDOW_JOIN )
	iHideEntity( GUI_WINDOW_JOIN )
	iWindowButtons( GUI_WINDOW_JOIN , false, false, false )
	
sub PROCESS_GUI_MENU()
   while iGUIEventAvailable()
      GUIEvent = iReadGUIEvent()

		' PROCESS NOTIFY WINDOWS HERE
      select case GUIEvent->thisevent
         
			case EGET_MESSAGEBOX_OK       'EMBF_OK
            ExitApp = true
				iFlushMouse()
				exit select
				
			case EGET_MESSAGEBOX_CANCEL   'EMBF_CANCEL
            iHidePointer()
            iMoveMouse( GFX_WIDTH/2, GFX_HEIGHT/2 )
            iCameraInput( Camera, true )
            GUI_ACTIVE = false
				iFlushMouse()
				exit select

			case EGET_BUTTON_CLICKED
				iSoundVolume( iPlaySound( snd_Clicked ), 1.0 )
				exit select
				
		end select
		
		' PROCESS FPS CUSTOM WINDOWS HERE
      select case GUIEvent->id

			case ID_HEAD_COLOR_R
            If GUIEvent->thisevent = EGET_SCROLL_BAR_CHANGED then
					GUI_LIST_HEAD( 1 ) = GUIEvent->x
            End If

			case ID_HEAD_COLOR_G
            If GUIEvent->thisevent = EGET_SCROLL_BAR_CHANGED then
					GUI_LIST_HEAD( 2 ) = GUIEvent->x
            End If

			case ID_HEAD_COLOR_B
            If GUIEvent->thisevent = EGET_SCROLL_BAR_CHANGED then
					GUI_LIST_HEAD( 3 ) = GUIEvent->x
            End If

			case ID_SUIT_COLOR_R
            If GUIEvent->thisevent = EGET_SCROLL_BAR_CHANGED then
					GUI_LIST_SUIT( 1 ) = GUIEvent->x
            End If

			case ID_SUIT_COLOR_G
            If GUIEvent->thisevent = EGET_SCROLL_BAR_CHANGED then
					GUI_LIST_SUIT( 2 ) = GUIEvent->x
            End If

			case ID_SUIT_COLOR_B
            If GUIEvent->thisevent = EGET_SCROLL_BAR_CHANGED then
					GUI_LIST_SUIT( 3 ) = GUIEvent->x
            End If

			case ID_EDIT_PLRNAME_H
				T_PLAYER_LIST( 0 ).pName = *iGetElementText( ID_EDIT_PLRNAME_H )
				exit select

			case ID_EDIT_PLRNAME_J
				T_PLAYER_LIST( 0 ).pName = *iGetElementText( ID_EDIT_PLRNAME_J )
				exit select
							
			case ID_EDIT_SRVNAME
				ServerName = *iGetElementText( ID_EDIT_SRVNAME )
				exit select
				
         case ID_EDIT_IP
				IP = *iGetElementText( ID_EDIT_IP )
				exit select
				
			case ID_EDIT_PORT_H
				Server_Port = valint( *iGetElementText( ID_EDIT_PORT_H ) )
				exit select

			case ID_EDIT_PORT_J
				Server_Port = valint( *iGetElementText( ID_EDIT_PORT_J ) )
				exit select
							
			case ID_EDIT_MAX
				MaxPlayers = valint( *iGetElementText( ID_EDIT_MAX ) )
'				T_PLAYER_BUFFER = MaxPlayers + 1
'				reDim T_PLAYER_LIST( T_PLAYER_BUFFER ) As T_PLAYER
'				redim T_DEATH_LIST( T_PLAYER_BUFFER ) As T_DEATH
'				T_EXPLOSION_BUFFER = T_PLAYER_BUFFER * 2
'				redim T_EXPLOSION_LIST( 1 To T_EXPLOSION_BUFFER ) As T_EXPLOSION
				exit select

			case ID_BUTTON_START
				'ADD START_GAME HERE CAUSE ESCAPE FROM CHAT IS FALSELY ACTIVATING
				If GUIEvent->thisevent = EGET_BUTTON_CLICKED and ( Not START_GAME ) then
					T_PLAYER_LIST( 0 ).pState = SLOT_ALIVE
					'T_PLAYER_LIST( 0 ).pName = "**SERVER**"
					Is_Server = true
					IF INITIALIZE_NETWORK() THEN
						START_GAME = true
						iHideEntity( GUI_WINDOW_HOST )
						iHideEntity( GUI_GAME_TITLE )
						iHideEntity( GUI_BUTTON_HOST )
						iHideEntity( GUI_BUTTON_JOIN )
						iHideEntity( GUI_BUTTON_QUIT )
						for i as integer = 1 to 6
							iHideEntity( GUI_SCROLLBAR( i ) )
						next i
					ELSE
						iRN_Shutdown( 500 )
						net_Select = 0
					END IF
				end if
				exit select
					
			case ID_BUTTON_JOIN
				If GUIEvent->thisevent = EGET_BUTTON_CLICKED and ( Not START_GAME ) then
					T_PLAYER_LIST( 0 ).pState = SLOT_ALIVE
					'T_PLAYER_LIST( 0 ).pName = "PLAYER-"+STR(iRAND( 100, 999) )
					Is_Server = false
					IF INITIALIZE_NETWORK() THEN
						net_Select = 4
						PRINT("PROCESSING LOGON NETWORK")
						iHideEntity( GUI_WINDOW_JOIN )
						iHideEntity( GUI_GAME_TITLE )
						iHideEntity( GUI_BUTTON_HOST )
						iHideEntity( GUI_BUTTON_JOIN )
						iHideEntity( GUI_BUTTON_QUIT )
						for i as integer = 1 to 6
							iHideEntity( GUI_SCROLLBAR( i ) )
						next i
					ELSE
						iRN_Shutdown( 500 )
						net_Select = 0
						iShowEntity( GUI_WINDOW_JOIN )
						iShowEntity( GUI_GAME_TITLE )
					END IF
				end if
				exit select
				
			case ID_BUTTON_CANCEL
				If GUIEvent->thisevent = EGET_BUTTON_CLICKED then
					iHideEntity( GUI_WINDOW_HOST )
					iHideEntity( GUI_WINDOW_JOIN )
					iFlushMouse()
				end if
				exit select
				
			case ID_BUTTON_HOSTM
				if GUIEvent->thisevent = EGET_ELEMENT_HOVERED then iSoundVolume( iPlaySound( snd_Button ), 0.6 )
				If GUIEvent->thisevent = EGET_BUTTON_CLICKED then
					iShowEntity( GUI_WINDOW_HOST )
					iActivateGadget( GUI_WINDOW_HOST )
				end if
				exit select
				
			case ID_BUTTON_JOINM
				if GUIEvent->thisevent = EGET_ELEMENT_HOVERED then iSoundVolume( iPlaySound( snd_Button ), 0.6 )
				If GUIEvent->thisevent = EGET_BUTTON_CLICKED then
					iShowEntity( GUI_WINDOW_JOIN )
					iActivateGadget( GUI_WINDOW_JOIN )
				end if
				exit select
				
			case ID_BUTTON_QUITM	
				if GUIEvent->thisevent = EGET_ELEMENT_HOVERED then iSoundVolume( iPlaySound( snd_Button ), 0.6 )
				If GUIEvent->thisevent = EGET_BUTTON_CLICKED then
					GUI_ACTIVE = true
					iShowPointer()
					iNotify( "EXIT GAME", "ARE YOU SURE YOU WANT TO QUIT AND EXIT?", EMBF_OK+EMBF_CANCEL )
				end if
				exit select
								
      end select
   wend
  iFlushMouse()
  if net_select = 4 then PROCESS_LOGON_NETWORK()
end sub



