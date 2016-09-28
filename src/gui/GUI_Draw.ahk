; GLOBAL SETTINGS ===============================================================================================================

;#Warn
#NoEnv
#SingleInstance Force
SetBatchLines -1

; ===============================================================================================================================

OnMessage(0x0202, "WM_LBUTTONUP")
OnMessage(0x0201, "WM_LBUTTONDOWN")
OnMessage(0x0200, "WM_MOUSEMOVE")

XStart := 0
YStart := 0
fDraw := false

; GUI ===========================================================================================================================

Gui, +LastFound
hwnd := WinExist()
Gui, Show, w800 h600, Gui_Draw
return

; FUNCTIONS =====================================================================================================================

WM_LBUTTONDOWN() 
{
    global
    fDraw := true
    MouseGetPos, XStart, YStart, hwnd
}

WM_LBUTTONUP() 
{
    global
    if (fDraw)
    {
        MouseGetPos, XEnd, YEnd, hwnd
        hdc := DllCall("user32.dll\GetDC", "ptr", hwnd, "ptr")
        DllCall("gdi32.dll\MoveToEx", "ptr", hdc, "int", XStart, "int", YStart, "ptr", 0)
        DllCall("gdi32.dll\LineTo", "ptr", hdc, "int", XEnd, "int", YEnd)
        DllCall("user32.dll\ReleaseDC", "ptr", hWnd, "ptr", hdc)
    }
    fDraw := false
}

WM_MOUSEMOVE()
{
    global
    if (fDraw)
    {
        MouseGetPos, XEnd, YEnd, hwnd
        hdc := DllCall("user32.dll\GetDC", "ptr", hwnd, "ptr")
        DllCall("gdi32.dll\MoveToEx", "ptr", hdc, "int", XStart, "int", YStart, "ptr", 0)
        DllCall("gdi32.dll\LineTo", "ptr", hdc, "int", XEnd, "int", YEnd)
        DllCall("user32.dll\ReleaseDC", "ptr", hWnd, "ptr", hdc)
        XStart := XEnd
        YStart := YEnd
    }
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp