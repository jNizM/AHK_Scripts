; ===============================================================================================================================
; Get a list of all open local IPv4 ports
; ===============================================================================================================================

GetTcpPortTable()
{
    static hIPHLPAPI := DllCall("LoadLibrary", "str", "iphlpapi.dll", "ptr"), table := []
    VarSetCapacity(MIB_TCPTABLE, 4 + (s := (20 * 32)), 0)
    while (DllCall("iphlpapi\GetTcpTable", "ptr", &MIB_TCPTABLE, "uint*", s, "uint", 1) = 122)
        VarSetCapacity(MIB_TCPTABLE, 4 + s, 0)

    LocalPort := []
    loop % NumGet(MIB_TCPTABLE, 0, "uint") {
        o := 4 + ((A_Index - 1) * 20)
        LocalPort.Push((((MIB_TCPROW := NumGet(MIB_TCPTABLE, o + 8, "uint")) & 0xff00) >> 8) | ((MIB_TCPROW & 0xff) << 8))
    }
    return LocalPort
}

; ===============================================================================================================================

for i, v in GetTcpPortTable()
    MsgBox % v

ExitApp