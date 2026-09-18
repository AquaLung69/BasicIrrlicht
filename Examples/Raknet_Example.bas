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

const PLAYER_COUNT = 100
Type Player
   Alive as boolean = false
	ID as Integer
	RID as Integer
End Type
dim shared Players( PLAYER_COUNT ) as Player


iGraphics3D( 800, 600, 32, false )
iSeedRand( iMilliSecs() )

' Message ID constants
Const ID_CHAT as ubyte = 140
Const ID_CHAT_REPLY as ubyte = 141
Const ID_FORWARD as ubyte = 142

' Misc variables
dim shared PlayerCount as Integer = 0
dim shared serverPort as Integer = 50000
dim shared isServer as Boolean
dim SEND_TIMER as integer = iMilliSecs()
dim shared nbPlayerMax as uinteger = 32
dim shared YourName as string



' First, let's display the current RN-LIB.DLL version
Print "Version: "+str( *iRN_Version() )

' Initialize the Raknet Wrapper
iRN_Init()

' Request user input
dim sel as string
Input "(S)erver or (C)lient?  ", sel 
If ucase(sel) <> "S" then
	Input "ScreenName: ", YourName 
Else
	YourName = "Server"
End If


' IF STARTING SERVER:
If Ucase(sel) = "S" Then
	isServer = True
	' Let's start a Server
	dim ok as integer = iRN_StartServer( nbPlayerMax, serverPort, "" )
	' And test results...
	Select case ok
		Case 0
			Print"CAN'T START SERVER!"
			iRN_Shutdown(100)
			print "CAN'T START SERVER!"
         Do:Loop Until Inkey$ <> ""
         end
		Case -1
			Print "SERVER STARTUP FAILED!"
			iRN_Shutdown(100)
			print "SERVER STARTUP FAILED!"
         Do:Loop Until Inkey$ <> ""
         end
		case else		'RETURNS PEERID
			Print"SERVER CREATED SUCCESSFULLY!!!"
			Print "PING: "
			iRN_PingHost( "scud.sytes.net", 50000 )
			iRN_PingHost( "127.0.0.1", 50000 )
			iRN_PingHost( "127.0.0.1", 50000 )
	End Select
Else
'	STARTING CLIENT
	isServer = False
	dim ip as string = "127.0.0.1"
	' Let's start a client
	dim ok as integer = iRN_StartClient()
	' And test results...
	Select case ok
		Case 0
			Print"CAN'T START CLIENT!"
			
		Case -1
			Print"CLIENT STARTUP FAILED!"
         Do:Loop Until Inkey$ <> ""
         end
		Case True
			Print "CLIENT STARTED CORRECTLY!!!"
	End Select	
	' Let's attempt a connection to the server
	ok = iRN_Connect( ip, serverPort, "", True )
	' And test results...
	Select case ok
		Case True
			Print"CONNECTION TO SERVER SUCCESS! : "+str( ok )
		Case False
			Print"CONNECTION TO SERVER FAILED! : "+str( ok )
			iRN_Shutdown(100)
			print "Can't Connect!"
         Do:Loop Until Inkey$ <> ""
         end
	End Select
EndIf

' MAIN LOOP

While iRun and (Not iKeyHit( KEY_1 ))
	' MESSAGES TO SEND AS CLIENT
   dim ChatMsg as string
	If Not isServer then
		If iKeyHit( KEY_RETURN ) then
			ChatMsg = "My CHAT message..."+str( iRand(1,1000) )
			iRN_SendByte( ID_CHAT )
			iRN_SendInt( iRN_GetTime() )
			iRN_SendString( YourName )
			iRN_SendString( ChatMsg )
			dim rflt1 as single = Rnd*999.9
			iRN_SendFloat( rflt1 )
			dim rint as integer = iRand(-1000,-1)
			iRN_SendInt( rint )
			iRN_SendMessage( RN_BROADCAST, RN_HIGH_PRIORITY, RN_UNRELIABLE, 0, False) 'BROADCAST IS ALWAYS TRUE WHEN SENDING FROM CLIENT!
			Print "You Said: " + ChatMsg+"  INT: "+str(iRN_GetTime())+"  FLOAT: "+str(rflt1)+"  -INT: "+str(rint)
			
			
			SEND_TIMER = iMilliSecs()
		End If
		If iKeyHit( KEY_SPACE ) then
			ChatMsg = "Forward to other clients!"+str( iRand(1,1000) )
			iRN_SendByte( ID_FORWARD )
			iRN_SendString( ChatMsg )
			iRN_SendMessage( RN_BROADCAST, RN_HIGH_PRIORITY, RN_UNRELIABLE, 0, False)
		End If
	
	' MESSAGE TO SEND AS SERVER
	ElseIf iKeyHit( KEY_RETURN ) then
			iRN_SendByte( ID_CHAT )
			iRN_SendInt( 999 )
			iRN_SendString( "SERVER" )
			iRN_SendString( "BROADCAST MESSAGE" )
			iRN_SendMessage( RN_BROADCAST, RN_MEDIUM_PRIORITY, RN_RELIABLE, 0, True ) 
	EndIf
	

	' Let's check the message queue
	While iRN_CheckMessages()	'if this is true, messages exist in the queue
		
		dim UserIndex as integer = iRN_GetPlayerID() ' Grab the player ID for this message

		dim  msgType as ubyte = iRN_GetByte()		' Get the message ID
		
		Print "** PACKET FROM*** PlayerID: "+str(UserIndex)+"   Avg Ping: "+str(iRN_GetAveragePing(UserIndex))
		
		' Let's respond to the specific message received
		Select case msgType
			
			' These first several message ID's are internal to Raknet		
			Case ID_REMOTE_DISCONNECTION_NOTIFICATION
				Print("Another client has disconnected.")
				
			Case ID_REMOTE_CONNECTION_LOST
				Print("Another client has lost the connection.")
				
			Case ID_REMOTE_NEW_INCOMING_CONNECTION
				Print("Another client has connected.")
				
			Case ID_CONNECTION_REQUEST_ACCEPTED
				Print("Our connection request has been accepted.")
				
			Case ID_NEW_INCOMING_CONNECTION
				If isServer then
					PlayerCount = PlayerCount + 1
					for i as integer = 0 to PLAYER_COUNT
                  if Players(i).Alive = false then
                     Players(i).Alive = true
                     Players(i).ID = PlayerCount
                     Players(i).RID = iRN_GetPlayerID()
                     exit for  
                  end if
               next
				End If
				Print("A connection is incoming.")
				
			Case ID_NO_FREE_INCOMING_CONNECTIONS
				Print("The server is full.")
				
			Case ID_DISCONNECTION_NOTIFICATION
				If (isServer) then
					Print("A client has disconnected.")
					dim RID as integer = iRN_GetPlayerID()
					for i as integer = 0 to PLAYER_COUNT
						If Players(i).RID = RID Then
							PlayerCount = PlayerCount - 1
                     Players(i).RID = 0
                     Players(i).Alive = false
							exit for
						End If
					Next
				Else
					Print("We have been disconnected.")
				EndIf
				
			Case ID_CONNECTION_LOST
				If (isServer) then
					Print("A client lost the connection.")
				Else
					Print("Connection lost.")
				EndIf

			Case ID_CONNECTION_ATTEMPT_FAILED
				Print("CONNECTION UNSUCCESSFULL!")

			Case ID_UNCONNECTED_PING
				Print( "ID_UNCONNECTED_PING" )
				
			Case ID_UNCONNECTED_PONG
				Print( "ID_UNCONNECTED_PONG: " + str(iRN_GetInt()) )
			
			' From here we check for user created message ID's	
			Case ID_CHAT
				dim ntime as integer = iRN_GetInt()
				dim UserName as string = *iRN_GetString()
				dim ChatMessage as string = *iRN_GetString()
				dim rflt as single = iRN_GetFloat()
				dim nint as integer = iRN_GetInt()
				Print "PLAYER COUNT: "+str(iRN_GetTotalConnections() )
				Print UserName + ": " + ChatMessage + "  INT: "+str(ntime)+"  FLOAT: "+str(rflt)+"  -INT: "+str(nint)
'				If (isServer) Then
'					RN_SendTimeStamp()
'					Print "PACKET SENT @: "+RN_GetTime()
'					RN_SendByte( ID_CHAT_REPLY )  
'					RN_SendString( "SERVER REPLY!" )
'					RN_SendMessage( UserIndex, RN_MEDIUM_PRIORITY, RN_RELIABLE, 0, False) 	'				
'				EndIf
				
			Case ID_CHAT_REPLY
				If (Not isServer) then
					dim PacketTime as integer = iRN_GetTimeStamp()
					dim message as string = *iRN_GetString()
					Print Message+"  PacketTime= "+str(PacketTime)+"   LOCAL TIME: "+str(iRN_GetTime())
				End If	
				
			Case ID_FORWARD
				'If we are the server, forward this message to all clients.
				If (isServer) Then
					Print "Forward Message.. "+str(iRN_ForwardMessage())
					iRN_SendMessage( UserIndex, RN_MEDIUM_PRIORITY, RN_RELIABLE, 0, True)
					
				Else
					' If client, just print the string
					Print @iRN_GetString()
				End If
						
			case else
				' We received an undefined message ID
				Print("Message with identifier " + str(msgType) + " has arrived.") 
				For i as integer = 1 To 10
					Print iRN_GetByte()
				Next
				

		End Select
	
		' Clear this message from the queue
		iRN_ClearMessage()

	Wend

'	If (isServer) Then
'		If (systemAddressClient1)  DrawText("Ping: " + RN_GetAveragePing(peer, systemAddressClient1) + "/" + RN_GetLowestPing(peer,systemAddressClient1) + "/" + RN_GetLastPing(peer,systemAddressClient1), 20, GraphicsHeight()*0.6)
'		If (stat) Then
'			DrawText("stat = " + RN_StatisticsGetTotalBitsSent(stat) + " Bits (" + (RN_StatisticsGetTotalBitsSent(stat) / 8) + " Bytes) /" + RN_StatisticsGetPacketsReceived(stat), 20, GraphicsHeight() * 0.65) 
'		EndIf
'	EndIf

	
	sleep( 1 )
	
Wend

' Close connection and shutdown Raknet.
iRN_CloseConnection(True)
iRN_Shutdown(300)


End









































