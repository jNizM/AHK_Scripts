; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines -1

OnMessage(0x0201, "WM_LBUTTONDOWN")

; ===============================================================================================================================
Gui, Add, GroupBox,     x10  y10   w200 h80  Section                           , % "Radio"
Gui, Add, Radio,        x18  ys+20           Checked                           , % "Radio1 "
Gui, Add, Radio,        x18  y+5                                               , % "Radio 2"
Gui, Add, Radio,        x18  y+5             +0x8000000                        , % "Radio 3"
; ===============================================================================================================================
Gui, Add, GroupBox,     x215 y10   w200 h80  Section                           , % "Checkbox"
Gui, Add, Checkbox,     x223 ys+20           Checked                           , % "Checkbox 1"
Gui, Add, Checkbox,     x223 y+5                                               , % "Checkbox 2"
Gui, Add, Checkbox,     x223 y+5             +0x8000000                        , % "Checkbox 3"
; ===============================================================================================================================
Gui, Add, GroupBox,     x10  y95   w200 h100 Section                           , % "Text"
Gui, Add, Text,         x18  ys+20 w180 h21  0x200                             , % "Text 1"
Gui, Add, Text,         x18  y+5   w180 h21  0x201 border                      , % "Text 2"
Gui, Add, Text,         x18  y+5   w180 h21  0x202                             , % "Text 3"
; ===============================================================================================================================
Gui, Add, GroupBox,     x215 y95   w200 h100 Section                           , % "Edit"
Gui, Add, Edit,         x223 ys+20 w180      hwndEdit1                         ,
DllCall("user32.dll\SendMessage", "Ptr", Edit1, "UInt", 0x1501, "Ptr", True, "Str", "Placeholder", "Ptr")
Gui, Add, Edit,         x223 y+5   w180      0x800                             , % "Edit 2"
Gui, Add, Edit,         x223 y+5   w180      hwndEdit3                         , % "Edit 3"
CtlColors.Attach(Edit3, "FA675F", "FFFFFF")
; ===============================================================================================================================
Gui, Add, GroupBox,     x420 y10   w200 h185 Section                           , % "TreeView"
Gui, Add, TreeView,     x428 ys+20 w180 r9
P1     := TV_Add("First parent")
P1C1   := TV_Add("Parent 1's first child", P1)
P2     := TV_Add("Second parent")
P2C1   := TV_Add("Parent 2's first child", P2)
P2C2   := TV_Add("Parent 2's second child", P2)
P2C2C1 := TV_Add("Child 2's first child", P2C2)
; ===============================================================================================================================
Gui, Add, GroupBox,     x625 y10   w200 h185 Section                           , % "MonthCalc"
Gui, Add, MonthCal,     x633 ys+20
; ===============================================================================================================================
Gui, Add, GroupBox,     x830  y10    w200 h490 Section                         , % "Rect / Frame / Etched / Sunken"
Gui, Add, Text,         x838  ys+20  w75  h1   0x4                             ; Horizontal Line (small)   >   SS_BLACKRECT
Gui, Add, Text,         x838  y+2    w75  h5   0x4                             ; Horizontal Line (big)     >   SS_BLACKRECT
Gui, Add, Text,         x838  y+2    w1   h75  0x4                             ; Vertical   Line (small)   >   SS_BLACKRECT
Gui, Add, Text,         x841  yp     w5   h75  0x4                             ; Vertical   Line (big)     >   SS_BLACKRECT
Gui, Add, Text,         x948  ys+20  w75  h7   0x7                             ; Horizontal Frame          >   SS_BLACKFRAME
Gui, Add, Text,         x948  y+2    w7   h75  0x7                             ; Vertical   Frame          >   SS_BLACKFRAME
Gui, Add, Text,         x838  ys+115 w75  h1   0x5                             ; Horizontal Line (small)   >   SS_GRAYRECT
Gui, Add, Text,         x838  y+2    w75  h5   0x5                             ; Horizontal Line (big)     >   SS_GRAYRECT
Gui, Add, Text,         x838  y+2    w1   h75  0x5                             ; Vertical   Line (small)   >   SS_GRAYRECT
Gui, Add, Text,         x841  yp     w5   h75  0x5                             ; Vertical   Line (big)     >   SS_GRAYRECT
Gui, Add, Text,         x948  ys+115 w75  h7   0x8                             ; Horizontal Frame          >   SS_GRAYFRAME
Gui, Add, Text,         x948  y+2    w7   h75  0x8                             ; Vertical   Frame          >   SS_GRAYFRAME
Gui, Add, Text,         x838  ys+210 w75  h1   0x6                             ; Horizontal Line (small)   >   SS_WHITERECT
Gui, Add, Text,         x838  y+2    w75  h5   0x6                             ; Horizontal Line (big)     >   SS_WHITERECT
Gui, Add, Text,         x838  y+2    w1   h75  0x6                             ; Vertical   Line (small)   >   SS_WHITERECT
Gui, Add, Text,         x841  yp     w5   h75  0x6                             ; Vertical   Line (big)     >   SS_WHITERECT
Gui, Add, Text,         x948  ys+210 w75  h7   0x9                             ; Horizontal Frame          >   SS_WHITEFRAME
Gui, Add, Text,         x948  y+2    w7   h75  0x9                             ; Vertical   Frame          >   SS_WHITEFRAME
Gui, Add, Text,         x838  ys+305 w75  h1   0x10                            ; Horizontal Line (small)   >   SS_ETCHEDHORZ
Gui, Add, Text,         x838  y+8    w1   h75  0x11                            ; Vertical   Line (small)   >   SS_ETCHEDVERT
Gui, Add, Text,         x948  ys+305 w75  h7   0x12                            ; Horizontal Frame          >   SS_ETCHEDFRAME
Gui, Add, Text,         x948  y+2    w7   h75  0x12                            ; Vertical   Frame          >   SS_ETCHEDFRAME
Gui, Add, Text,         x838  ys+400 w75  h1   0x1000                          ; Horizontal Line (small)   >   SS_SUNKEN
Gui, Add, Text,         x838  y+8    w1   h75  0x1000                          ; Vertical   Line (small)   >   SS_SUNKEN
Gui, Add, Text,         x948  ys+400 w75  h7   0x1000                          ; Horizontal Frame          >   SS_SUNKEN
Gui, Add, Text,         x948  y+2    w7   h75  0x1000                          ; Vertical   Frame          >   SS_SUNKEN
; ===============================================================================================================================
Gui, Add, GroupBox,     x10  y200  w405 h140 Section                           , % "ListView"
Gui, Add, ListView,     x18  ys+20 w185 r5   LV0x1                             , % "LV 1|LV 2|LV 3"
loop 5
    LV_Add("", "Entry 1", "Entry 2", "Entry 3")
loop 3
    LV_ModifyCol(A_Index, 60)
Gui, Add, ListView,     x223 yp    w185 r5                                     , % "LV 1|LV 2|LV 3"
loop 6
    LV_Add("", "Entry 1", "Entry 2", "Entry 3")
loop 3
    LV_ModifyCol(A_Index, 60)
; ===============================================================================================================================
Gui, Add, GroupBox,     x420 y200  w405 h140 Section                           , % "ListBox"
Gui, Add, ListBox,      x428 ys+20 w180 r8                                     , % "LB 1|LB 2|LB 3|LB 4|LB 5|LB 6|LB 7|LB 8"
Gui, Add, ListBox,      x633 yp    w180 r8                                     , % "LB 1|LB 2|LB 3||LB 4|LB 5|LB 6|LB 7|LB 8|LB 9"
; ===============================================================================================================================
Gui, Add, GroupBox,     x10  y345  w200 h100 Section                           , % "DropDownList"
Gui, Add, DropDownList, x18  ys+20                                             , % "DDL 1|DDL 2|DDL 3"
Gui, Add, DropDownList, x18  y+5                                               , % "DDL 1||DDL 2|DDL 3"
Gui, Add, DropDownList, x18  y+5             +0x8000000                        , % "DDL 1||DDL 2|DDL 3"
; ===============================================================================================================================
Gui, Add, GroupBox,     x215 y345  w200 h100 Section                           , % "ComboBox"
Gui, Add, ComboBox,     x223 ys+20                                             , % "CB 1|CB 2|CB 3"
Gui, Add, ComboBox,     x223 y+5                                               , % "CB 1||CB 2|CB 3"
Gui, Add, ComboBox,     x223 y+5             +0x8000000                        , % "CB 1||CB 2|CB 3"
; ===============================================================================================================================
Gui, Add, GroupBox,     x420 y345  w200 h100 Section                           , % "Slider"
Gui, Add, Slider,       x428 ys+25 w180                                        , % "33"
Gui, Add, Slider,       x428 y+1   w180      ToolTip -Theme                    , % "66"
; ===============================================================================================================================
Gui, Add, GroupBox,     x625 y345  w200 h100 Section                           , % "Progress"
Gui, Add, Progress,     x633 ys+25 w150                                        , % "25"
Gui, Add, Progress,     x633 y+5   w150      BackgroundC0C0C0                  , % "50"
Gui, Add, Progress,     x633 y+5   w150      -Smooth                           , % "75"
Gui, Add, Progress,     x+10 ys+25 h58       CE93500 BackgroundC0C0C0 Vertical , % "50"
; ===============================================================================================================================
Gui, Add, GroupBox,     x10  y450  w270 h50  Section                           , % "Button"
Gui, Add, Button,       x18  ys+20 w80       0x1                               , % "Button 1"
Gui, Add, Button,       x+5  yp    w80                                         , % "Button 2"
Gui, Add, Button,       x+5  yp    w80       +0x8000000                        , % "Button 3"
; ===============================================================================================================================
Gui, Add, GroupBox,     x285 y450  w270 h50  Section                           , % "DateTime"
Gui, Add, DateTime,     x293 ys+20                                             , % "LongDate"
; ===============================================================================================================================
Gui, Add, GroupBox,     x560 y450  w170 h50  Section                           , % "Custom (ClassSysIPAddress32)"
Gui, Add, Custom,       x568 ys+20 w150 r1   ClassSysIPAddress32 hwndhIPControl
IPCtrlSetAddress(hIPControl, "127.0.0.1")
; ===============================================================================================================================
Gui, Add, GroupBox,     x735 y450  w90  h50  Section                           , % "Image"
Gui, Add, Picture,      x750 ys+15           Icon1                             , % "cmd.exe"
; ===============================================================================================================================
Gui, Add, StatusBar
SB_SetParts(150, 150, 150)
; ===============================================================================================================================
Gui, Show, AutoSize
Gui, +LastFound
WinSet, Redraw
return

; ===============================================================================================================================

WM_LBUTTONDOWN(wParam, lParam)
{
    MouseGetPos,,, MouseWin, ClassNN, 1
    MouseGetPos,,,, CtrlHwnd, 2
    SB_SetText("ClassNN:  " ClassNN, 1)
    SB_SetText("Control hWnd:  " CtrlHwnd, 2)
    SB_SetText("Gui hWnd:  " MouseWin, 3)
}

IPCtrlSetAddress(hControl, ipaddress) ; http://ahkscript.org/docs/commands/GuiControls.htm#Custom
{
    static WM_USER := 0x400
    static IPM_SETADDRESS := WM_USER + 101

    ; Pack the IP address into a 32-bit word for use with SendMessage.
    ipaddrword := 0
    Loop, Parse, ipaddress, .
        ipaddrword := (ipaddrword * 256) + A_LoopField
    DllCall("user32.dll\SendMessage", "Ptr", hControl, "UInt", IPM_SETADDRESS, "Ptr", 0, "Ptr", ipaddrword, "Ptr")
}

Class CtlColors ; by just me
{
    static Attached := {}
    static HandledMessages := {Edit: 0, ListBox: 0, Static: 0}
    static WM_CTLCOLOR := {Edit: 0x0133, ListBox: 0x134, Static: 0x0138}
    static HTML := {AQUA: 0xFFFF00, BLACK: 0x000000, BLUE: 0xFF0000, FUCHSIA: 0xFF00FF, GRAY: 0x808080, GREEN: 0x008000
                , LIME: 0x00FF00, MAROON: 0x000080, NAVY: 0x800000, OLIVE: 0x008080, PURPLE: 0x800080, RED: 0x0000FF
                , SILVER: 0xC0C0C0, TEAL: 0x808000, WHITE: 0xFFFFFF, YELLOW: 0x00FFFF}
    static SYSCOLORS := {Edit: "", ListBox: "", Static: ""}
    static ErrorMsg := ""
    static InitClass := CtlColors.ClassInit()

    __New() {
        if (This.InitClass == "!DONE!") {
            This["!Access_Denied!"] := True
            return False
        }
    }

    __Delete() {
        if This["!Access_Denied!"]
            return
        This.Free()
    }

    ClassInit() {
        CtlColors := New CtlColors
        return "!DONE!"
    }

    CheckBkColor(ByRef BkColor, Class) {
        This.ErrorMsg := ""
        if (BkColor != "") && !(This.HTML.HasKey(BkColor)) && !(RegExMatch(BkColor, "^[[:xdigit:]]{6}$")) {
            This.ErrorMsg := "Invalid parameter BkColor: " . BkColor
            return False
        }
        BkColor := BkColor = "" ? This.SYSCOLORS[Class] : This.HTML.HasKey(BkColor) ? This.HTML[BkColor]
                : "0x" . SubStr(BkColor, 5, 2) . SubStr(BkColor, 3, 2) . SubStr(BkColor, 1, 2)
        return True
    }

    CheckTxColor(ByRef TxColor) {
        This.ErrorMsg := ""
        if (TxColor != "") && !(This.HTML.HasKey(TxColor)) && !(RegExMatch(TxColor, "i)^[[:xdigit:]]{6}$")) {
            This.ErrorMsg := "Invalid parameter TextColor: " . TxColor
            return False
        }
        TxColor := TxColor = "" ? "" : This.HTML.HasKey(TxColor) ? This.HTML[TxColor]
                : "0x" . SubStr(TxColor, 5, 2) . SubStr(TxColor, 3, 2) . SubStr(TxColor, 1, 2)
        return True
    }

    Attach(HWND, BkColor, TxColor := "") {
        static ClassNames := {Button: "", ComboBox: "", Edit: "", ListBox: "", Static: ""}

        if (This.SYSCOLORS.Edit = "") {
            This.SYSCOLORS.Static := DllCall("user32.dll\GetSysColor", "Int", 15, "UInt")
            This.SYSCOLORS.Edit := DllCall("user32.dll\GetSysColor", "Int", 5, "UInt")
            This.SYSCOLORS.ListBox := This.SYSCOLORS.Edit
        }
        This.ErrorMsg := ""
        if (BkColor = "") && (TxColor = "") {
            This.ErrorMsg := "Both parameters BkColor and TxColor are empty!"
            return False
        }
        if !(CtrlHwnd := HWND + 0) || !(DllCall("user32.dll\IsWindow", "UPtr", HWND, "UInt")) {
            This.ErrorMsg := "Invalid parameter HWND: " . HWND
            return False
        }
        if (This.Attached.HasKey(HWND)) {
            This.ErrorMsg := "Control " . HWND . " is already registered!"
            return False
        }
        Hwnds := [CtrlHwnd], Classes := ""
        WinGetClass, CtrlClass, ahk_id %CtrlHwnd%
        This.ErrorMsg := "Unsupported control class: " . CtrlClass
        if !(ClassNames.HasKey(CtrlClass))
            return False
        ControlGet, CtrlStyle, Style, , , ahk_id %CtrlHwnd%
        if (CtrlClass = "Edit")
            Classes := ["Edit", "Static"]
        else if (CtrlClass = "Button") {
            if (CtrlStyle & 0x8) || (CtrlStyle & 0x2)
                Classes := ["Static"]
            else
                return False
        }
        else if (CtrlClass = "ComboBox") {
            VarSetCapacity(CBBI, 40 + (A_PtrSize * 3), 0), NumPut(40 + (A_PtrSize * 3), CBBI, 0, "UInt")
            DllCall("user32.dll\GetComboBoxInfo", "Ptr", CtrlHwnd, "Ptr", &CBBI)
            Hwnds.Insert(NumGet(CBBI, 40 + (A_PtrSize * 2, "UPtr")) + 0)
            Hwnds.Insert(Numget(CBBI, 40 + A_PtrSize, "UPtr") + 0)
            Classes := ["Edit", "Static", "ListBox"]
        }
        if !(IsObject(Classes))
            Classes := [CtrlClass]
        if !(This.CheckBkColor(BkColor, Classes[1]))
            return False
        if !(This.CheckTxColor(TxColor))
            return False
        for I, V In Classes {
            if (This.HandledMessages[V] = 0)
                OnMessage(This.WM_CTLCOLOR[V], "CtlColors_OnMessage")
            This.HandledMessages[V] += 1
        }
        Brush := DllCall("gdi32.dll\CreateSolidBrush", "UInt", BkColor, "UPtr")
        for I, V In Hwnds
            This.Attached[V] := {Brush: Brush, TxColor: TxColor, BkColor: BkColor, Classes: Classes, Hwnds: Hwnds}
        DllCall("user32.dll\InvalidateRect", "Ptr", HWND, "Ptr", 0, "Int", 1)
        This.ErrorMsg := ""
        return True
    }

    Change(HWND, BkColor, TxColor := "") {
        This.ErrorMsg := "", HWND += 0
        if !(This.Attached.HasKey(HWND))
            return This.Attach(HWND, BkColor, TxColor)
        CTL := This.Attached[HWND]
        if !(This.CheckBkColor(BkColor, CTL.Classes[1]))
            return False
        if !(This.CheckTxColor(TxColor))
            return False
        if (BkColor <> CTL.BkColor) {
            if (CTL.Brush) {
                DllCall("gdi32.dll\DeleteObject", "Prt", CTL.Brush)
                This.Attached[HWND].Brush := 0
            }
            Brush := DllCall("gdi32.dll\CreateSolidBrush", "UInt", BkColor, "UPtr")
            This.Attached[HWND].Brush := Brush, This.Attached[HWND].BkColor := BkColor
        }
        This.Attached[HWND].TxColor := TxColor, This.ErrorMsg := ""
        DllCall("user32.dll\InvalidateRect", "Ptr", HWND, "Ptr", 0, "Int", 1)
        return True
    }

    Detach(HWND) {
        This.ErrorMsg := "", HWND += 0
        if (This.Attached.HasKey(HWND)) {
            CTL := This.Attached[HWND].Clone()
            if (CTL.Brush)
                DllCall("gdi32.dll\DeleteObject", "Prt", CTL.Brush)
            for I, V In CTL.Classes {
                if (This.HandledMessages[V] > 0) {
                    This.HandledMessages[V] -= 1
                    if This.HandledMessages[V] = 0
                        OnMessage(This.WM_CTLCOLOR[V], "")
                }
            }
            for I, V In CTL.Hwnds
                This.Attached.Remove(V, "")
            DllCall("user32.dll\InvalidateRect", "Ptr", HWND, "Ptr", 0, "Int", 1)
            CTL := ""
            return True
        }
        This.ErrorMsg := "Control " . HWND . " is not registered!"
        return False
    }

    Free() {
        for K, V In This.Attached
            DllCall("gdi32.dll\DeleteObject", "Ptr", V.Brush)
        for K, V In This.HandledMessages {
            if (V > 0) {
                OnMessage(This.WM_CTLCOLOR[K], "")
                This.HandledMessages[K] := 0
            }
        }
        This.Attached := {}
        return True
    }

    IsAttached(HWND) {
        return This.Attached.HasKey(HWND)
    }
}

CtlColors_OnMessage(HDC, HWND) {
    Critical
    if CtlColors.IsAttached(HWND) {
        CTL := CtlColors.Attached[HWND]
        if (CTL.TxColor != "")
            DllCall("gdi32.dll\SetTextColor", "Ptr", HDC, "UInt", CTL.TxColor)
        DllCall("gdi32.dll\SetBkColor", "Ptr", HDC, "UInt", CTL.BkColor)
        return CTL.Brush
    }
}

; ===============================================================================================================================

GuiClose:
GuiEscape:
ExitApp