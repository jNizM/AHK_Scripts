; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force

; GUI ===========================================================================================================================

Gui, +LastFound
Gui, Margin, 10, 10
Gui, Color, FFFFFF
Gui, Add, Radio, w100 vRB1, Radio1
Gui, Add, Radio, xm y+10 w100 vRB2, Radio2
Gui, Add, CheckBox, w100 vCB, CheckBox
Gui, Add, Edit, xm w100 h30
Gui, Add, Button, xm y+2 w100 vPB, Button
Gui, Show, w200 h200
WinSet, Redraw
return

; FUNCTIONS =====================================================================================================================

CtlColorBtns()
{
    static init := OnMessage(0x0135, "CtlColorBtns")
    return DllCall("gdi32.dll\CreateSolidBrush", "uint", 0xFFFFFF, "uptr")
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp