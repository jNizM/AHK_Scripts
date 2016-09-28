; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines -1

; ===============================================================================================================================

global BkColor   := 0x5F67FA    ; Background Color | BGR (BLUE - GREEN - RED)
global TxColor   := 0xFFFFFF    ; Text Color       | BGR (BLUE - GREEN - RED)

OnMessage(0x0138, "WM_CTLCOLOR")    ; WM_CTLCOLORSTATIC
;OnMessage(0x0133, "WM_CTLCOLOR")    ; WM_CTLCOLOREDIT

; GUI ===========================================================================================================================

Gui, Add, Edit, w100,       % "ReadWrite"
Gui, Add, Edit, w100 0x800, % "ReadOnly"
Gui, Add, Edit, w100,       % "ReadWrite"
Gui, Add, Edit, w100 0x800, % "ReadOnly"
Gui, Show, w200 h200
Gui, +LastFound
WinSet, Redraw
return

; FUNCTIONS =====================================================================================================================

WM_CTLCOLOR(wParam, lParam, hwnd)
{
    static hBrush := ""
    if (hBrush = "")
        SetEnv, hBrush, % DllCall("gdi32.dll\CreateSolidBrush", "uint", BkColor, "ptr")

    WinGetClass, Class, ahk_id %lParam%

    if (Class = "Edit")
	{
        DllCall("gdi32.dll\SetTextColor", "ptr", wParam, "uint", TxColor)
        , DllCall("gdi32.dll\SetBkColor", "ptr", wParam, "uint", BkColor)
        , DllCall("gdi32.dll\SetBkMode", "ptr", wParam, "int", 2)
        return hBrush
    }
    if (Class = "Static")
        DllCall("gdi32.dll\SetTextColor", "ptr", wParam, "uint", TxColor)
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp