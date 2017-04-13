; GLOBAL SETTINGS ===============================================================================================================

#NoEnv
#SingleInstance Force
SetBatchLines -1

; GUI ===========================================================================================================================

Gui, -Caption +hWndhMyGUI +LastFound
ShadowBorder(hMyGUI)

Gui, Show, w400 h300, % "Borderless Window with Shadow"
return

; FUNCTIONS =====================================================================================================================

ShadowBorder(handle)
{
    DllCall("user32.dll\SetClassLongPtr", "ptr", handle, "int", -26, "ptr", DllCall("user32.dll\GetClassLongPtr", "ptr", handle, "int", -26, "uptr") | 0x20000)
}

WM_LBUTTONDOWN(wParam, lParam, msg, hWnd)
{
    static init := OnMessage(0x0201, "WM_LBUTTONDOWN")
    global hMyGUI
    if (hwnd = hMyGUI)
        DllCall("user32.dll\PostMessage", "ptr", hMyGUI, "uint", 0x00A1, "ptr", 2, "ptr", 0)
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp
