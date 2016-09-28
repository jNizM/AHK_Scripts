; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines -1

DISK := NtQuerySystemInformation()

; GUI ===========================================================================================================================

OnMessage(0x0111, "WM_COMMAND")

Gui, Margin, 5, 5
Gui, Font, s12 bold, MS Shell Dlg 2
Gui, Add, Text, xm ym w238 0x201, % "Disk I/O Stats"
Gui, Font, s9 normal, MS Shell Dlg 2
Gui, Add, Text, xm y+5 w240 h1 0x10

Gui, Add, Text, xm y+5 w50 h22 0x200, % "Read"
Gui, Add, Edit, x+5 yp w140 h22 0x802 vIORTC, % FormatNumber(DISK.ReadTransferCount)
Gui, Add, Text, x+2 yp w40 h22 0x200, % "bytes"
Gui, Add, Edit, xm+55 y+5 w140 0x802 vIOROC, % FormatNumber(DISK.ReadOperationCount)
Gui, Add, Text, x+2 yp w40 h22 0x200, % "calls"

Gui, Add, Text, xm y+5 w50 h21 0x200, % "Write"
Gui, Add, Edit, x+5 yp w140 0x802 vIOWTC, % FormatNumber(DISK.WriteTransferCount)
Gui, Add, Text, x+2 yp w40 h22 0x200, % "bytes"
Gui, Add, Edit, xm+55 y+5 w140 0x802 vIOWOC, % FormatNumber(DISK.WriteOperationCount)
Gui, Add, Text, x+2 yp w40 h22 0x200, % "calls"

Gui, Add, Text, xm y+5 w50 h21 0x200, % "Other"
Gui, Add, Edit, x+5 yp w140 0x802 vIOOTC, % FormatNumber(DISK.OtherTransferCount)
Gui, Add, Text, x+2 yp w40 h22 0x200, % "bytes"
Gui, Add, Edit, xm+55 y+5 w140 0x802 vIOOOC, % FormatNumber(DISK.OtherOperationCount)
Gui, Add, Text, x+2 yp w40 h22 0x200, % "calls"

Gui, Show, AutoSize, % "Disk I/O Stats"
SetTimer, REFRESH, 1000
return

; SCRIPT ========================================================================================================================

REFRESH:
    DISK := NtQuerySystemInformation()
    GuiControl,, IORTC, % FormatNumber(DISK.ReadTransferCount)
    GuiControl,, IOROC, % FormatNumber(DISK.ReadOperationCount)
    GuiControl,, IOWTC, % FormatNumber(DISK.WriteTransferCount)
    GuiControl,, IOWOC, % FormatNumber(DISK.WriteOperationCount)
    GuiControl,, IOOTC, % FormatNumber(DISK.OtherTransferCount)
    GuiControl,, IOOOC, % FormatNumber(DISK.OtherOperationCount)
return

; FUNCTIONS =====================================================================================================================

WM_COMMAND(wParam, lParam)    ; by just me
{
    Critical
    if ((wParam >> 16) = 0x0100)
    {
        DllCall("user32.dll\HideCaret", "Ptr", lParam)
        DllCall("user32.dll\PostMessage", "Ptr", lParam, "UInt", 0x00B1, "Ptr", -1, "Ptr" , 0)
    }
}

NtQuerySystemInformation()    ; http://msdn.com/library/ms724509(vs.85,en-us)
{
    static hModule := DllCall("LoadLibrary", "Str", "ntdll.dll", "Ptr")
    static SYSTEM_INFORMATION_CLASS := 0x2    ; SYSTEM_PERFORMANCE_INFORMATION
    size := VarSetCapacity(buf, 0, 0)
    DllCall("ntdll\NtQuerySystemInformation", "Int", SYSTEM_INFORMATION_CLASS, "Ptr", &buf, "UInt", 0, "UInt*", size)
    size := VarSetCapacity(buf, size, 0)
    if (DllCall("ntdll\NtQuerySystemInformation", "Int", SYSTEM_INFORMATION_CLASS, "Ptr", &buf, "UInt", size, "UInt*", 0) != 0)
        return "*" ErrorLevel
    IORet := {}
    IORet.ReadTransferCount   := NumGet(buf,  8, "UInt64")    ; IoReadTransferCount
    IORet.WriteTransferCount  := NumGet(buf, 16, "UInt64")    ; IoWriteTransferCount
    IORet.OtherTransferCount  := NumGet(buf, 24, "UInt64")    ; IoOtherTransferCount
    IORet.ReadOperationCount  := NumGet(buf, 32, "UInt")      ; IoReadOperationCount
    IORet.WriteOperationCount := NumGet(buf, 36, "UInt")      ; IoWriteOperationCount
    IORet.OtherOperationCount := NumGet(buf, 40, "UInt")      ; IoOtherOperationCount
    return IORet
}

FormatNumber(num, locale := 0x0400)    ; http://msdn.com/library/dd318110(vs.85,en-us)
{
    size := DllCall("GetNumberFormat", "UInt", locale, "UInt", 0, "Str", num, "Ptr", 0, "Ptr", 0, "Int", 0)
    VarSetCapacity(buf, size * (A_IsUnicode ? 2 : 1), 0)
    DllCall("GetNumberFormat", "UInt", locale, "UInt", 0, "Str", num, "Ptr", 0, "Str", buf, "Int", size)
    return SubStr(buf, 1, StrLen(buf) - 3)
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp