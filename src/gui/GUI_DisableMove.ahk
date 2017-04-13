; GLOBAL SETTINGS ===============================================================================================================

#NoEnv
#SingleInstance Force
SetBatchLines -1

; GUI ===========================================================================================================================

Gui, +LastFound +hwndhMyGUI
GuiDisableMove(hMyGUI)

Gui, Show, w400 h300, % "disable gui move"
return

; FUNCTIONS =====================================================================================================================

GuiDisableMove(handle)
{
    hMenu := DllCall("user32\GetSystemMenu", "ptr", handle, "int", false, "ptr")
    DllCall("user32\RemoveMenu", "ptr", hMenu, "uint", 0xf010, "uint", 0x0)
    return DllCall("user32\DrawMenuBar", "ptr", handle)
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp