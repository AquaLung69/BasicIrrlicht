'	.----.  .--.  .----.-.----.           
'	| {_} }/ {} \{ {__-{ | }`-'
'	| {_} /  /\  .-._} | | },-.           
'	.-.---..---..-.--.-.----.-. .-.-----. 
'	{ } }}_} }}_} |  { | }`-{ {_} `-' '-'
'	| | } \| } \} '--| | }, -| { } } } {
'	`-`-' - '`-' - '`----`-`----`-' `-' `-'
'----------------------------------------------------------------------------
'  NET MESSAGES Author 2024 ED MUSOLINO
'	Basic-Irrlicht Wrapper by EM ENGINEERING LLC ©2024-2026
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

'##############################################################################
'	MESSAGE ID DEFINITIONS
'##############################################################################
'----------------------------------------------------------------------------
'	RAKNET USER MESSAGE TYPES	134 To 255
'	NOTE: Max String SEND \ GET LENGTH OF 254 !!
'----------------------------------------------------------------------------

declare SUB NET_SEND( target AS INTEGER, priority AS INTEGER, reliability AS INTEGER, broadcast as boolean = TRUE )

DIM SHARED NetQueueOut AS INTEGER = 0
DIM SHARED NetQueueIn AS INTEGER = 0
DIM SHARED TPacketsOut AS INTEGER = 0
DIM SHARED TPacketsIn AS INTEGER = 0



'	LOGIN MESSAGE ID'S
const NET_LOGIN_REQUEST as ubyte			   = 140
const NET_LOGIN_REPLY as ubyte		      = 141
'const NET_CONNECT as ubyte					   = 142
const NET_DISCONNECT as ubyte				   = 143
const NET_MAP_SIZE as ubyte			      = 144
const NET_MAP_OBJECT as ubyte		   	   = 145
const NET_SYNC_COMPLETE as ubyte	   	   = 146
const NET_PLAYER_CONNECT as ubyte	      = 147
const NET_PLAYER_DISCONNECT as ubyte      = 148
''const NET_GAME_INFO_REQUEST as ubyte     = 149
''const NET_GAME_INFO_REPLY as ubyte       = 150

''	GAME MESSAGE ID'S
const NET_POS_UPDATE as ubyte				   = 160
const NET_BAN as ubyte						   = 161
const NET_KICK as ubyte						   = 162
const NET_CHAT as ubyte						   = 163
const NET_STATS_UPDATE as ubyte	         = 164
const NET_GLOBAL_SNAPSHOT as ubyte        = 165
const NET_CREATE_PICKUP as ubyte			   = 166
const NET_REMOVE_PICKUP as ubyte			   = 167
const NET_GUNSHOT as ubyte  	      		= 168
const NET_DAMAGE as ubyte	      		   = 169
const NET_DEATH as ubyte	      		   = 170
const NET_ALIVE as UBYTE						= 171

const NET_PING as ubyte	 		     		   = 254
const NET_PONG as ubyte	  		    		   = 255

'===================================================
' MESSAGE STRING NAMES FOR INFO\DEBUGGING
dim shared NET_MSG_NAME(134 to 255) as string
' SET FULL RANGE TO IT'S VALUE
for i as integer = 134 to 255
   NET_MSG_NAME( i ) = str( i )
next
' CUSTOMIZE OUR MESSAGE ID NAMES
NET_MSG_NAME(140) = "NET_LOGIN_REQUEST"
NET_MSG_NAME(141) = "NET_LOGIN_REPLY"
'NET_MSG_NAME(142) = "NET_CONNECT"
NET_MSG_NAME(143) = "NET_DISCONNECT"
NET_MSG_NAME(144) = "NET_MAP_SIZE"
NET_MSG_NAME(145) = "NET_MAP_OBJECT"
NET_MSG_NAME(146) = "NET_SYNC_COMPLETE"
NET_MSG_NAME(147) = "NET_PLAYER_CONNECT"
NET_MSG_NAME(148) = "NET_PLAYER_DISCONNECT"
''NET_MSG_NAME(149) = "NET_GAME_INFO_REQUEST"
''NET_MSG_NAME(150) = "NET_GAME_INFO_REPLY"

NET_MSG_NAME(160) = "NET_POS_UPDATE"
NET_MSG_NAME(161) = "NET_BAN"
NET_MSG_NAME(162) = "NET_KICK"
NET_MSG_NAME(163) = "NET_CHAT"
NET_MSG_NAME(164) = "NET_STATS_UPDATE"
NET_MSG_NAME(165) = "NET_GLOBAL_SNAPSHOT"
NET_MSG_NAME(166) = "NET_CREATE_PICKUP"
NET_MSG_NAME(167) = "NET_REMOVE_PICKUP"
NET_MSG_NAME(168) = "NET_GUNSHOT"
NET_MSG_NAME(169) = "NET_DAMAGE"
NET_MSG_NAME(170) = "NET_DEATH"
NET_MSG_NAME(171) = "NET_ALIVE"

NET_MSG_NAME(254) = "NET_PING"
NET_MSG_NAME(255) = "NET_PONG"

'===================================================

'-----------------------------------------------------------------------------
'	SIMPLIFY iSendMessage
'-----------------------------------------------------------------------------
SUB NET_SEND( target AS INTEGER, priority AS INTEGER, reliability AS INTEGER, broadcast as boolean = TRUE )
	iRN_SendMessage( target, priority, reliability, 0, broadcast )
	NetQueueOut += 1
END SUB



