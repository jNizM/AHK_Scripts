; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines -1

; GUI ===========================================================================================================================

Gui +LastFound
hWnd := WinExist()

RemoveMenu(hWnd)

Gui, Add, Text,, % "Sample Text"

Gui, Show, w400 h300, Unmoveable GUI!
return

; FUNCTIONS =====================================================================================================================


RemoveMenu(handle)
{
    hMenu  := DllCall("user32\GetSystemMenu", "ptr", handle, "int", false, "ptr")
    mCount := DllCall("user32\GetMenuItemCount", "ptr", hMenu)
    DllCall("user32\RemoveMenu", "ptr", hMenu, "uint", mCount - 6, "uint", 0x0400)
    DllCall("user32\DrawMenuBar", "ptr", handle)
    return true
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp