; ===============================================================================================================================
; Get Computers MAC address (media access control address)
; ===============================================================================================================================

GetMacAddress(delimiter := ":", case := False)
{
    if (DllCall("iphlpapi.dll\GetAdaptersInfo", "ptr", 0, "UIntP", size) = 111)
        if !(VarSetCapacity(buf, size, 0))
            throw Exception("Memory allocation failed for IP_ADAPTER_INFO struct", -1)
    if (DllCall("iphlpapi.dll\GetAdaptersInfo", "ptr", &buf, "UIntP", size) != 0)
        throw Exception("GetAdaptersInfo failed with error: " A_LastError, -1)
    addr := &buf, MAC_ADDRESS := []
    while (addr) {
        loop % NumGet(addr+0, 396 + A_PtrSize, "UInt")
            mac .= Format("{:02" (case ? "X" : "x") "}"
                 , NumGet(addr+0, 400 + A_PtrSize + A_Index - 1, "UChar")) "" delimiter ""
        MAC_ADDRESS[A_Index] := SubStr(mac, 1, -1), mac := ""
        addr := NumGet(addr+0, "UPtr")
    }
    return MAC_ADDRESS
}

; ===============================================================================================================================

for k, v in GetMacAddress()
    MsgBox % "MAC address #" k " is " v