; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines -1

; GUI ===========================================================================================================================

Gui +LastFound
hWnd := WinExist()

hMenu := DllCall("user32.dll\GetSystemMenu", "ptr", hWnd, "int", FALSE, "ptr") 
nCnt := DllCall("user32.dll\GetMenuItemCount", "ptr", hMenu) 
DllCall("user32.dll\RemoveMenu", "ptr", hMenu, "uint", nCnt-6, "uint", 0x0400) 
DllCall("user32.dll\DrawMenuBar", "ptr", hWnd) 

Gui, Add, Text,, % "Sample Text"

Gui, Show, w400 h300, Unmoveable GUI!
return

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp