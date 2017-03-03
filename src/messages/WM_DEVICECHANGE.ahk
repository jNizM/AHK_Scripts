; GLOBAL SETTINGS ===============================================================================================================

#NoEnv
#Persistent
#SingleInstance Force
SetBatchLines -1

OnMessage(0x0219, "WM_DEVICECHANGE")

; SCRIPT ========================================================================================================================

; ....

; FUNCTIONS =====================================================================================================================

WM_DEVICECHANGE(wParam, lParam)
{
    static init := OnMessage(0x0219, "WM_DEVICECHANGE")
    if (wParam = 0x8000) || (wParam = 0x8004) && ((NumGet(lParam+4, "UInt")) = 0x2) {
        i := 0, mask := NumGet(lParam+12, "UInt")
        while (mask > 1) && (++i < 0x1A)
            mask >>= 1
        DeviceChangeInfo(Chr(0x41 + i) ":\", wParam)
    }
}

DeviceChangeInfo(device, state)
{
    MsgBox, 0x40, % "Device Change", % device " " ((state = 0x8000) ? "plugged in" : (state = 0x8004) ? "is removed" : ""), 2
}

; ===============================================================================================================================

/*
https://msdn.microsoft.com/en-us/library/aa363480(v=vs.85).aspx    WM_DEVICECHANGE message
https://msdn.microsoft.com/en-us/library/aa363205(v=vs.85).aspx    DBT_DEVICEARRIVAL event
https://msdn.microsoft.com/en-us/library/aa363208(v=vs.85).aspx    DBT_DEVICEREMOVECOMPLETE event
https://msdn.microsoft.com/en-us/library/aa363246(v=vs.85).aspx    DEV_BROADCAST_HDR structure
https://msdn.microsoft.com/en-us/library/aa363249(v=vs.85).aspx    DEV_BROADCAST_VOLUME structure
*/