global xcoord = 2013
global ycoord = 1298
 ; editmark
global debu = 0
global del = 100
global needle := "(0x)[BC].[BC].[BC]."
#Persistent



Return

#ifWinActive ahk_exe Risk of Rain 2.exe 

:*:scrapconfig::
	if (debu = 0) {
		debu = 1
		SetTimer, DebugLoop, %del%
		PixelGetColor, shoot, xcoord, ycoord
		ToolTip, x:%xcoord%`ny:%ycoord%`n%shoot%, xcoord, ycoord, 3
	} else {
		debu = 0
		FileRead, self, %A_ScriptFullPath%
		self := SubStr(self, InStr(self, "editmark"))
		FileDelete, %A_ScriptFullPath%
		FileAppend, global xcoord = %xcoord%`nglobal ycoord = %ycoord%`n `; %self%, %A_ScriptFullPath%
		ToolTip,,,,3
	}
	
Return

DebugLoop:
	if (debu = 1){
		PixelGetColor, shoot, xcoord, ycoord
		ToolTip, x:%xcoord%`ny:%ycoord%`n%shoot%, xcoord, ycoord, 3
	} else {
	SetTimer, DebugLoop, off
	}
Return

LButton::
SetTimer, FireLoop, 500
Return

FireLoop:
	SetTimer, FireLoop, off
	if GetKeyState("LButton", "P")
	{
		PixelGetColor, shoot, xcoord, ycoord
		FoundPos := RegExMatch(shoot, needle)
		; ToolTip, %shoot%||%FoundPos%||%needle%, xcoord, ycoord, 1
		if (FoundPos != 0){
			Send r
			; ToolTip, Reloading, 925, 510, 2
			; SetTimer, ToolLoop, 500
			SetTimer, FireLoop, 500
		} else {
		SetTimer, FireLoop, %del%
		}
		 
		
	}
Return

ToolLoop:
	SetTimer, ToolLoop, off
	ToolTip,,,,2
Return

#If debu = 1

Up::
	ycoord-- 
	PixelGetColor, shoot, xcoord, ycoord
	ToolTip, x:%xcoord%`ny:%ycoord%`n%shoot%, xcoord, ycoord, 3
Return

Down::
	ycoord++
	PixelGetColor, shoot, xcoord, ycoord
	ToolTip, x:%xcoord%`ny:%ycoord%`n%shoot%, xcoord, ycoord, 3
Return

Left::
	xcoord--
	PixelGetColor, shoot, xcoord, ycoord
	ToolTip, x:%xcoord%`ny:%ycoord%`n%shoot%, xcoord, ycoord, 3
Return

Right::
	xcoord++
	PixelGetColor, shoot, xcoord, ycoord
	ToolTip, x:%xcoord%`ny:%ycoord%`n%shoot%, xcoord, ycoord, 3
Return
