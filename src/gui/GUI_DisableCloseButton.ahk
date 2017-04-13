; GLOBAL SETTINGS ===============================================================================================================

#NoEnv
#SingleInstance Force
SetBatchLines -1

; GUI ===========================================================================================================================

Gui, +LastFound +hwndhMyGUI
GuiDisableCloseButton(hMyGUI)

Gui, Show, w400 h300, % "disable close button"
return

; FUNCTIONS =====================================================================================================================

GuiDisableCloseButton(handle)
{
    hMenu := DllCall("user32\GetSystemMenu", "ptr", handle, "int", false, "ptr")
    DllCall("user32\EnableMenuItem", "ptr", hMenu, "uint", 0xf060, "uint", 0x3)
    return DllCall("user32\DrawMenuBar", "ptr", handle)
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp