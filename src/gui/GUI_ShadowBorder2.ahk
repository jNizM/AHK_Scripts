; GLOBAL SETTINGS ===============================================================================================================

#NoEnv
#SingleInstance Force
SetBatchLines -1

; GUI ===========================================================================================================================

Gui, -Caption +hWndhMyGUI +LastFound
FrameShadow(hMyGUI)
Gui, Color, FFFFFF

Gui, Show, w400 h300, % "Borderless Window with Shadow"
return

; FUNCTIONS =====================================================================================================================

FrameShadow(handle)
{
    DllCall("dwmapi.dll\DwmIsCompositionEnabled", "int*", DwmEnabled)
    if !(DwmEnabled)
        DllCall("user32.dll\SetClassLongPtr", "ptr", handle, "int", -26, "ptr", DllCall("user32.dll\GetClassLongPtr", "ptr", handle, "int", -26) | 0x20000)
    else {
        VarSetCapacity(MARGINS, 16, 0) && NumPut(1, NumPut(1, NumPut(1, NumPut(1, MARGINS, "int"), "int"), "int"), "int")
        DllCall("dwmapi.dll\DwmSetWindowAttribute", "ptr", handle, "uint", 2, "ptr*", 2, "uint", 4)
        DllCall("dwmapi.dll\DwmExtendFrameIntoClientArea", "ptr", handle, "ptr", &MARGINS)
    }
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