; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force

global ClrFailure := "FF0033|FF0033"
global ClrWarning := "FFFF66|FFFF66"
global ClrOk      := "00CC33|00CC33"
global GuiW       := 500
global GuiH       := 400

; GUI ===========================================================================================================================

Gui, +LastFound +hwndhMain
Gui, Margin, 0, 0

Gui, Add, Pic, % "xm ym+" GuiH-4 " w" GuiW " h4 0x4E hwndHPIC1"
CreateDIB(HPIC1, ClrOk, 1, 1, 5, 5)

Gui, Show, w%GuiW% h%GuiH%, % "GUI Concept"

SetTimer, ChangeBorder
return

ChangeBorder:
    CreateDIB(HPIC1, ClrOk, 1, 1, 5, 5)
    sleep 1000
    CreateDIB(HPIC1, ClrWarning, 1, 1, 5, 5)
    sleep 1000
    CreateDIB(HPIC1, ClrFailure, 1, 1, 5, 5)
    sleep 1000
    CreateDIB(HPIC1, ClrWarning, 1, 1, 5, 5)
    sleep 1000
    CreateDIB(HPIC1, ClrOk, 1, 1, 5, 5)
return

; FUNCTIONS =====================================================================================================================

CreateDIB(hWnd, PixelData, W, H, ResizeW := 0, ResizeH := 0, Gradient := 1) ; by SKAN | modified by jNizM
{
    WB := Ceil((W * 3) / 2) * 2, VarSetCapacity(BMBITS, WB * H + 1, 0), P := &BMBITS
    loop, parse, PixelData, |
        P := Numput("0x" A_LoopField, P+0, 0, "uint") - (W & 1 && Mod(A_Index * 3, W * 3) = 0 ? 0 : 1)

    hBitmap := DllCall("gdi32.dll\CreateBitmap", "int", W, "int", H, "uint", 1, "uint", 24, "ptr", 0, "ptr")
    hBM := DllCall("user32.dll\CopyImage", "ptr", hBitmap, "uint", 0, "int", 0, "int", 0, "uint", 0x2008, "ptr")
    DllCall("gdi32.dll\SetBitmapBits", "ptr", hBM, "uint", WB * H, "ptr", &BMBITS)

    if !(Gradient+0)
        hBM := DllCall("user32.dll\CopyImage", "ptr", hBM, "uint", 0, "int", 0, "int", 0, "uint", 0x0008, "ptr")
    hBM := DllCall("user32.dll\CopyImage", "ptr", hBM, "int", 0, "int", ResizeW, "int", ResizeH, "int", 0x200C, "ptr")

    DllCall("user32.dll\SendMessage", "ptr", hWnd, "uint", 0x0172, "ptr", 0, "ptr", hBM, "ptr")
    return True, DllCall("gdi32.dll\DeleteObject", "ptr", hBitmap)
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp