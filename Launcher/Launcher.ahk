#Requires AutoHotkey v2.0
#NoTrayIcon

;@Ahk2Exe-Set FileVersion, 1.0
;@Ahk2Exe-Set ProductVersion, 1.0.0.0
;@Ahk2Exe-Set CompanyName, Pikakid98

MyGui := Gui()

; call dark mode for window title + menu
SetWindowAttribute(MyGui)

; call dark mode for controls
SetWindowTheme(MyGui)

#include .Cmpl8r\DarkMode.scriptlet

MyGui.Title := "Game Gallery Launcher"

myGui.OnEvent("Close", myGui_Close)
myGui_Close(thisGui) {
	FileDelete A_Temp "\GameGallery.ini"
	ExitApp
}

MyRadio := MyGui.AddRadio("vMyRadioGroup cwhite", "Compile")
MyRadio.OnEvent("Click", MyBtn_op1)

MyRadio2 := MyGui.AddRadio("vMyRadioGroup2 cwhite", "Edit")
MyRadio2.OnEvent("Click", MyBtn_op2)

MyBtn := MyGui.AddButton("Default w80", "OK")
MyBtn.OnEvent("Click", MyBtn_Click)

MyBtn_op1(*)
{
	IniWrite "Compile", ".Cmpl8r\GameGallery.ini", "launch", "RunOrEdit"
}

MyBtn_op2(*)
{
	IniWrite "Text", ".Cmpl8r\GameGallery.ini", "launch", "RunOrEdit"
}

MyBtn_Click(*) {
	WhatToRun := IniRead(".Cmpl8r\GameGallery.ini", "launch", "RunOrEdit")

	if WhatToRun := IniRead(".Cmpl8r\GameGallery.ini", "launch", "RunOrEdit", "")
	{
		MyGui.Hide()
		
		RunWait '"' "Data\" WhatToRun "-in-ator.exe" '"' " " '"' CompileScript '"'
		
		if WhatToRun := IniRead(".Cmpl8r\GameGallery.ini", "launch", "RunOrEdit", "") {
			if not (PID := ProcessExist("Text-in-ator.exe")) {
				if DirExist(A_Temp "\Cmpl8rTE") {
					DirDelete A_Temp "\Cmpl8rTE", 1
					}
				}
			}
		MyGui.Show()
	} else {
		MsgBox "Error! Please select an option", "Error!"
	}
}

MyGui.Show("w150")