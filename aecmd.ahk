/*
+++++++++++++++++++++++++++++++++++++++++++++++

Last update := 4/feb/2022 8:50 PM
Version:=1.0

+++++++++++++++++++++++++++++++++++++++++++++++
*/

#NoEnv
#NoTrayIcon
#SingleInstance, Force
#WinActivateForce
SendMode Input
SetWorkingDir %A_ScriptDir%

Gui, Add, Text, x25 y10 w200 h50 , Render AEP`n(File Format same as set in After effects)
Gui, Add, Edit, x25 y99 w97 h19 , 
Gui, Add, Edit, x25 y129 w97 h19 , 
Gui, Add, Button, x127 y179 w89 h31 , Add_File
Gui, Add, Text, x127 y101 w96 h23 , First frame
Gui, Add, Text, x128 y131 w97 h24 , End frame
Gui, Font, S10, Consolas

; Generated using SmartGUI Creator for SciTE
Gui, Show, w240 h250, aecmd
return


ButtonAdd_File:
GuiControlGet, Edit1
GuiControlGet, Edit2
;;gets the First and End frame inputs.
;;~ -------------------------------------------------------------------------------------
	Run, cmd.exe, %A_ScriptDir%
	WinWaitActive, ahk_class ConsoleWindowClass

	Send, aerender -project{Space}
	Sleep 500
	MsgBox, 4096, Add .AEP file, Drag and drop your .AEP file in Command Prompt.`nThen press OK button
	MsgBox, 4096, Add .AEP file, Are you sure about that?`nclick OK.
	InputBox,Comp,Enter Composition Name,
	Sleep 500
	WinActivate, ahk_class ConsoleWindowClass
	Send,{Space}-comp "%Comp%"
	Send,{Space}-s %Edit1% -e %Edit2% -output{Space}
	Sleep 500
	MsgBox, 4096, Output folder,Drag and drop your Output folder`nThen press OK button
	MsgBox, 4096, Output folder, Are you sure about that?`nclick OK.
	WinActivate, ahk_class ConsoleWindowClass
	Send,\%Comp%
Return


GuiClose:
ExitApp