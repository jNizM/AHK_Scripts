; GLOBAL SETTINGS ===============================================================================================================

#NoEnv
#SingleInstance Force
SetBatchLines -1

; GUI ===========================================================================================================================

OnMessage(0x0111, "ON_EN_SETFOCUS")

Gui, Margin, 10, 10
Gui, Add, Edit, xm ym w150 0x800, % "Edit 1"
Gui, Add, Edit, xm y+5 w150 0x800, % "Edit 2"
Gui, Add, Edit, xm y+5 w150 0x800, % "Edit 3"
Gui, Add, Edit, xm y+5 w150 0x800, % "Edit 4"
Gui, Add, Edit, xm y+5 w150 0x800, % "Edit 5"
Gui, Show, AutoSize
return

; FUNCTIONS =====================================================================================================================

ON_EN_SETFOCUS(wParam, lParam)
{
    static EM_SETSEL   := 0x00B1
    static EN_SETFOCUS := 0x0100
    critical
    if ((wParam >> 16) = EN_SETFOCUS) {
        DllCall("user32\HideCaret", "ptr", lParam)
        DllCall("user32\PostMessage", "ptr", lParam, "uint", EM_SETSEL, "ptr", -1, "ptr", 0)
    }
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp