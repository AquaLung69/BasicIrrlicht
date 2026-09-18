#BasicIrrlicht

FPS EXAMPLE
<img src="https://i.postimg.cc/26d9bgZb/FPSExample-Thumb.jpg)))" alt="Project Screenshot" width="500">

BasicIrrlicht.dll is a wrapper for use with FreeBasic and limited testing
with Python.  Currently the Wrapper is 32 bit only and therefore requires
a 32 bit compiler (Freebasic or Python).

	With access to Irrlicht, Irrklang and Raknet!
	Includes .bi for FreeBasic and a Python Lib!
	
	NOTES:
	* Compiled against Irrlicht 1.9.0(svn6568), Irrklang 1.6.0 and Raknet 4.081
	* Wrapper is currently 32bit and Wind0ws only.
	* TESTED WITH FreeBASIC 1.10.1 (32 bit).
	* TESTED WITH Python 3.14.7 (32 bit) on win32
	
	REQUIREMENTS:
	* Wind0ws		* Have had it working through WINE on Linux
	* FreeBasic
	* Freebasic BasicIrrlicht.bi Lib - Included
	* Python Lib with lmited support - Included *Needs synced with .bi lib, many
		changes and commands missing.
	* 32 bit Visual C++ Redistributable for Visual Studio 2017, check TOOLS folder.

	Q&A:
	----
	Q: Is the wrapper bug free?
	A: NO!
	
	Q: Does the wrapper need improvements?
	A: YES!

	Q: Can I modify the included game source 'FPS EXAMPLE'?
	A: Yes!  Optimize it, modify it, learn from it, use it as reference
		in your own game, etc. Keep in mind that it was progessivly written
		to test command in the library as the library was being written and
		is not a good code structure for use in writing games.  It sort of
		evolved into a "mini-game" over time.
	
	Q: Are you still working on the project?
	A: Yes, as time permits around family and health.

	Q: Are you planning on compiling a 64bit version and\or for Linux?
	A: I would love to, that is a long term goal of mine. Love Linux. We will see...

	Q: Why no physics support?
	A: Maybe in the future, currently this needs to be done through software.
	
	Q: Why Irrlicht Engine?
	A: Because it easy to use and fast and I've always liked it.
	
	Q: Why Irrklang, why not something free like OpenAL, etc?
	A: Irrlicht and Irrklang, it's like peanut butter and jelly, they just go together.
	
	Q: How many commands are available in the wrapper?
	A: Currently, around 541, open the BasicIrrlichtDoc.md file in a Notepad++ for
		command reference.

	Q: Is the source for the wrapper available?
	A: Currently, no.


Enjoy,

Ed Musolino
