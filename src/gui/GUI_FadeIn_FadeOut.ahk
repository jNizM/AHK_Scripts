; GLOBAL SETTINGS ===============================================================================================================

#NoEnv
#SingleInstance Force
SetBatchLines -1

; ===============================================================================================================================

global AW_BLEND := 0x00080000
global AW_HIDE  := 0x00010000

; GUI ===========================================================================================================================

Gui, +hwndhMyGUI
Gui, Margin, 5, 5
Gui, Add, Button, xm+20 ym+50 w150 h50 gFade, Fade Out/In
Gui, Show, w200 h170
return

; SCRIPT ========================================================================================================================

Fade:
    DllCall("user32\AnimateWindow", "ptr", hMyGUI, "uint", 1000, "uint", AW_BLEND|AW_HIDE)    ; Fade Out
    sleep 1000
    DllCall("user32\AnimateWindow", "ptr", hMyGUI, "uint", 1000, "uint", AW_BLEND)            ; Fade In
return

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp