; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force

OnExit, EOF

; SCRIPT ========================================================================================================================

SessionChange(true)
return

; FUNCTIONS =====================================================================================================================

SessionChange(notify := true)
{
    static WTS_CURRENT_SERVER      := 0
    static NOTIFY_FOR_ALL_SESSIONS := 1

    if (notify) {
        if !(DllCall("wtsapi32.dll\WTSRegisterSessionNotificationEx", "ptr", WTS_CURRENT_SERVER, "ptr", A_ScriptHwnd, "uint", NOTIFY_FOR_ALL_SESSIONS))
            throw Exception("WTSRegisterSessionNotificationEx", -1)
        OnMessage(0x02B1, "WM_WTSSESSION_CHANGE")
    } else {
        OnMessage(0x02B1, "")
        if !(DllCall("wtsapi32.dll\WTSUnRegisterSessionNotificationEx", "ptr", WTS_CURRENT_SERVER, "ptr", A_ScriptHwnd))
            throw Exception("WTSUnRegisterSessionNotificationEx", -1)
    }
    return true
}

WM_WTSSESSION_CHANGE(wParam, lParam)
{
    static WTS_SESSION_UNLOCK := 0x8
    if (wParam = WTS_SESSION_UNLOCK)
        CallFuncOnSessionChange("Yeay! It works! =)")
}

CallFuncOnSessionChange(msg)
{
    MsgBox % msg
}

; EXIT ==========================================================================================================================

EOF:
SessionChange(false)
ExitApp


/*
WM_WTSSESSION_CHANGE                 ; http://msdn.com/library/aa383828(vs.85,en-us)
wParam                               ; Status code describing the reason the session state change notification was sent. This parameter can be one of the following values.

WTS_CONSOLE_CONNECT        := 0x1    ; The session identified by lParam was connected to the console terminal or RemoteFX session.
WTS_CONSOLE_DISCONNECT     := 0x2    ; The session identified by lParam was disconnected from the console terminal or RemoteFX session.
WTS_REMOTE_CONNECT         := 0x3    ; The session identified by lParam was connected to the remote terminal.
WTS_REMOTE_DISCONNECT      := 0x4    ; The session identified by lParam was disconnected from the remote terminal.
WTS_SESSION_LOGON          := 0x5    ; A user has logged on to the session identified by lParam.
WTS_SESSION_LOGOFF         := 0x6    ; A user has logged off the session identified by lParam.
WTS_SESSION_LOCK           := 0x7    ; The session identified by lParam has been locked.
WTS_SESSION_UNLOCK         := 0x8    ; The session identified by lParam has been unlocked.
WTS_SESSION_REMOTE_CONTROL := 0x9    ; The session identified by lParam has changed its remote controlled status. To determine the status, call GetSystemMetrics and check the SM_REMOTECONTROL metric.
WTS_SESSION_CREATE         := 0xA    ; Reserved for future use.
WTS_SESSION_TERMINATE      := 0xB    ; Reserved for future use.
*/