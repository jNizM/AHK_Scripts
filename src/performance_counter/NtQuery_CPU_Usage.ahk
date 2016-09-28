; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines -1

global CPU_CNT := NtQuerySystemInformation().MaxIndex()

; GUI ===========================================================================================================================

OnMessage(0x0111, "WM_COMMAND")

Gui, Margin, 5, 5
Gui, Font, s12 bold, MS Shell Dlg 2
Gui, Add, Text, xm ym w195 0x201, % "CPU Usages"
Gui, Font, s9 normal, MS Shell Dlg 2
Gui, Add, Text, xm y+5 w197 h1 0x10

loop % CPU_CNT
{
    Gui, Add, Text, xm y+5 w80 h22 0x200, % "CPU Core #" A_Index
    Gui, Add, Edit, x+5 yp w87 h22 0x802 vCPU_CORE_%A_Index%
    Gui, Add, Text, x+2 yp w20 h22 0x200, % "%"
}
Gui, Add, Text, xm y+5 w197 h1 0x10

Gui, Add, Text, xm y+5 w80 h22 0x200, % "CPU Overall"
Gui, Add, Edit, x+5 yp w87 h22 0x802 vCPU_CORE_ALL
Gui, Add, Text, x+2 yp w20 h22 0x200, % "%"

Gui, Show, AutoSize, % "CPU Usages"
SetTimer, REFRESH, 500
return

; SCRIPT ========================================================================================================================

REFRESH:
    LOAD := NtQuerySystemInformation()
    loop % CPU_CNT
        GuiControl,, CPU_CORE_%A_Index%, % Round(LOAD[A_Index], 2)
    GuiControl,, CPU_CORE_ALL, % Round(GetSystemTimes(), 2)
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
    static hModule := DllCall("LoadLibrary", "Str", "ntdll.dll", "Ptr"), LI := {}
    static SYSTEM_INFORMATION_CLASS := 0x8    ; SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION
    size := VarSetCapacity(buf, 0, 0)
    DllCall("ntdll\NtQuerySystemInformation", "Int", SYSTEM_INFORMATION_CLASS, "Ptr", &buf, "UInt", 0, "UInt*", size)
    size := VarSetCapacity(buf, size, 0)
    if (DllCall("ntdll\NtQuerySystemInformation", "Int", SYSTEM_INFORMATION_CLASS, "Ptr", &buf, "UInt", size, "UInt*", 0) != 0)
        return "*" ErrorLevel
    CI := {}, Offset := 0, CPU_COUNT := size / 48
    loop % CPU_COUNT
    {
        CI[A_Index, "IT"] := NumGet(buf, Offset +  0, "UInt64")    ; IdleTime
        CI[A_Index, "KT"] := NumGet(buf, Offset +  8, "UInt64")    ; KernelTime
        CI[A_Index, "UT"] := NumGet(buf, Offset + 16, "UInt64")    ; UserTime
        Offset += 48
    }
    CPU_USAGE := {}
    loop % CPU_COUNT
        CPU_USAGE[A_Index] := 100 - (CI[A_Index].IT - LI[A_Index].IT) / (CI[A_Index].KT - LI[A_Index].KT + CI[A_Index].UT - LI[A_Index].UT) * 100
    return CPU_USAGE, LI := CI
}

GetSystemTimes()    ; http://msdn.com/library/ms724400(vs.85,en-us)
{
    static LIT := "", LKT := "", LUT := ""
    CIT := CKT := CUT := ""
    if !(DllCall("GetSystemTimes", "Int64*", CIT, "Int64*", CKT, "Int64*", CUT))
        return "*" A_LastError
    IDL := CIT - LIT, KER := CKT - LKT, USR := CUT - LUT, SYS := KER + USR
    return ((SYS - IDL) * 100 / SYS), LIT := CIT, LKT := CKT, LUT := CUT
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp