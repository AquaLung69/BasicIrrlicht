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


DIM GUIEvent as iGUI_EVENT PTR
DIM guiStatic as iGADGET
DIM guiEdit as iGADGET
DIM guiPassword as iGADGET
DIM guiWindow as iGADGET
DIM guiListbox as iGADGET
DIM redBackground as integer = 255
DIM greenBackground as integer = 255
DIM imageTexture as iTEXTURE
DIM fileName as string
DIM displayString as wstring * 32
DIM BitmapFont as iFONT

#define MY_GUI_BUTTON_FILE      101
#define MY_GUI_BUTTON_WINDOW    102
#define MY_GUI_BUTTON_QUIT      103
#define MY_GUI_BUTTON_CLOSE     104
#define MY_GUI_SCROLLBAR_RED    105
#define MY_GUI_SCROLLBAR_GREEN  106
#define MY_GUI_LISTBOX          107
#define MY_GUI_CHECKBOX         108
#define MY_GUI_EDITBOX          109
#define MY_GUI_PASSWORD         110
#define MY_GUI_FILEOPEN         111

iVSync( TRUE )
iAntialias( 2 )
iGraphics3d( 512, 256, 32, FALSE )
iAppTitle( "GUI EXAMPLE" )

dim myfont as iFont = iLoadFont( "./MEDIA/SegoeUI_12.xml")
iSetFont( myfont )
iSetGadgetFont( myfont )

' set the colors used by GUI controls
iSetElementColor( EGDC_3D_FACE, 192, 255, 255, 255 )
iSetElementColor( EGDC_BUTTON_TEXT, 0, 64, 64, 255 )

' add a static text object to the graphical user interface. The text will be
' drawn inside the defined rectangle, the box will not have a border and the
' text will not be wrapped around if it runs off the end
guiStatic = iStaticText( _
                   "Test GUI", _     ' Text to display
                   4,0,252,16, _        ' Size
                   false, _ ' no border around the text
                   false )    ' text does not wrap

' add a button to the graphical user interface
iCreateButton( "Select File", _      ' Text on the button
                          16, 16, 96, 16, _                ' Size
                          MY_GUI_BUTTON_FILE, _ ' ID of the button
                          "Select a bitmap" )   ' label when over button

' add a couple of more buttons to the graphical user interface
iCreateButton( "Open a window", 128, 16, 106, 16,  MY_GUI_BUTTON_WINDOW )
iCreateButton( "Clear GUI", 240, 16, 96, 16,  MY_GUI_BUTTON_QUIT )

' add a horizontal scroll bar to the graphical user interface
iCreateScrollBar( true, _
                 32, 48, 288, 16, _       ' Size
                 MY_GUI_SCROLLBAR_RED, _  ' ID of the button
                 255, _                   ' The position of the scrollbar
                 255 )                    ' The maximum value of the scrollbar

' add a vertical scroll bar to the graphical user interface
iCreateScrollBar( false, _
                 16, 64, 16, 176, _         ' Size
                 MY_GUI_SCROLLBAR_GREEN, _  ' ID of the button
                 255, _                     ' The position of the scrollbar
                 255 )                      ' The maximum value of the scrollbar

' add a listbox to the display
guiListbox = iCreateListBox( 48, 64, 272, 64, _
                            MY_GUI_LISTBOX, _
                            false, true )

' add three items to the listbox
iAddGadgetItem( guiListbox, "Engine" )
iAddGadgetItem( guiListbox, "Axle" )
iAddGadgetItem( guiListbox, "Transmission" )

' select item 1 oranges
iSelectGadgetItem( guiListbox, 1 )

' add a normal editbox to the display
guiEdit = iCreateEditBox( "Editable text", _
                         48,128, 272,16, _
                         MY_GUI_EDITBOX, _
                         true, false )

' add a password editbox to the display
guiPassword = iCreateEditBox( "Hidden Password", _
               48,144, 272,16, _
               MY_GUI_PASSWORD, _
               true, _
               true )

' add a checkbox to the display
iCreateCheckBox( "Clickable Option", _
                48,160, 272,16, _
                MY_GUI_CHECKBOX, _
                1 )

' Let the GUI system handle the events
'IrrGUIEvents( 1 )
iCLSColor( 150, 150, 150 )
iColor( 255, 255, 0 )
' while the scene is still running
WHILE iRun() 'and not iKeyHit( KEY_ESCAPE )
    iCLSColor( 255-redBackground, 255-greenBackground, 255 )

    ' draw the Graphical User Interface
    iUpdateScene()
    iRenderScene()
    iRenderGUI()

    ' if there are GUI events available
    If iGUIEventAvailable() then

        ' read the GUI event out 
        GUIEvent = iReadGUIEvent()

        ' process the particular control
        select case GUIEvent->id
        
        case MY_GUI_BUTTON_FILE
            ' if the button has been pressed
            If GUIEvent->thisevent = EGET_BUTTON_CLICKED then
                ' open a file open dialog
                iRequestFile( "Select an image file", MY_GUI_FILEOPEN, true  )
            End If

        case MY_GUI_BUTTON_WINDOW
            ' if the button has been pressed
            If GUIEvent->thisevent = EGET_BUTTON_CLICKED then
                ' open a small modal window
                guiWindow = iCreateWindow( "Window", 80, 80, 180, 164 )
                ' with a button that can close the window
                iCreateButton( "Close me", 16, 32, 68, 36, 104, "", guiWindow )
            End If

        case MY_GUI_BUTTON_QUIT
            ' if the button has been pressed
            If GUIEvent->thisevent = EGET_BUTTON_CLICKED then
                ' all GUI elements from the display
                iGUIClear()
                ' let the system handle mouse and key events now
                'IrrGUIEvents( 0 )
            End If

        case MY_GUI_BUTTON_CLOSE
            ' if the button has been pressed
            If GUIEvent->thisevent = EGET_BUTTON_CLICKED then
                ' remove the window and its child button from the display
                iFreeGadget( guiWindow )
            End If

        case MY_GUI_SCROLLBAR_RED
            ' if the position of the scrollbar has been changed
            If GUIEvent->thisevent = EGET_SCROLL_BAR_CHANGED then
                ' set the red value of the background color
                redBackground = GUIEvent->x
            End If

        case MY_GUI_SCROLLBAR_GREEN
            ' if the position of the scrollbar has been changed
            If GUIEvent->thisevent = EGET_SCROLL_BAR_CHANGED then
                ' set the red value of the background color
                greenBackground = GUIEvent->x
            End If

        case MY_GUI_LISTBOX
            ' if the listbox selection has changed
            If GUIEvent->thisevent = EGET_LISTBOX_CHANGED then
                ' change the text to show which item is selected
                if GUIEvent->x = 0 then iSetGadgetText( guiStatic, "Selected Engine" )
                if GUIEvent->x = 1 then iSetGadgetText( guiStatic, "Selected Axle" )
                if GUIEvent->x = 2 then iSetGadgetText( guiStatic, "Selected Transmission" )
            End If

        case MY_GUI_EDITBOX
            ' if the editbox contents have changed
            If GUIEvent->thisevent = EGET_EDITBOX_CHANGED then
                ' set the static text object to the contents of the edit box
                iSetGadgetText( guiStatic, iGetGadgetText( guiEdit ))
            End If

        case MY_GUI_PASSWORD
            ' if the password editbox contents have changed
            If GUIEvent->thisevent = EGET_EDITBOX_CHANGED then
                ' set the static text object to the contents of the edit box
                iSetGadgetText( guiStatic, iGetGadgetText( guiPassword ))
            End If

        case MY_GUI_CHECKBOX
            ' if the checkbox state has changed
            If GUIEvent->thisevent = EGET_CHECKBOX_CHANGED then
                ' set the static text object to represent the checkbox state
                if GUIEvent->x = 0 then
                    iSetGadgetText( guiStatic, "Checkbox is Cleared" )
                else
                    iSetGadgetText( guiStatic, "Checkbox is Checked" )
                End if
            End If

        case MY_GUI_FILEOPEN
            ' if the event was from a file being selected
            imageTexture = 0
            If GUIEvent->thisevent = EGET_FILE_SELECTED then
                imageTexture = iLoadTexture( Str(*iGetLastSelectedFile() ))
                if imageTexture then
                    iStaticImage( imageTexture, 352, 16, true, 140 )
                end if
            End If

        case else
           print "NOT PROCESSED ID: "+str( GUIEvent->id )+"  TYPE: "+str( GUIEvent->thisevent )
        End Select
    End if

    iFlip()
WEND

iEndGraphics()
end

