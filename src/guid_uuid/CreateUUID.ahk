; ===============================================================================================================================
; Creates a new UUID (Universally Unique IDentifier).
; ===============================================================================================================================

CreateUUID()
{
    VarSetCapacity(UUID, 16, 0)
    if (DllCall("rpcrt4.dll\UuidCreate", "ptr", &UUID) != 0)
        throw Exception("UuidCreate", -1)
    if (DllCall("rpcrt4.dll\UuidToString", "ptr", &UUID, "uint*", suuid) != 0)
        throw Exception("UuidToString", -1)
    return StrGet(suuid), DllCall("rpcrt4.dll\RpcStringFree", "uint*", suuid)
}

; ===============================================================================================================================

MsgBox % CreateUUID()    ; ==>  xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx