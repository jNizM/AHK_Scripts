; ===============================================================================================================================
; Creates a GUID (Globally Unique IDentifier), a unique 128-bit integer used for CLSIDs and interface identifiers.
; ===============================================================================================================================

CreateGUID()
{
    VarSetCapacity(pguid, 16, 0)
    if (DllCall("ole32.dll\CoCreateGuid", "ptr", &pguid) != 0)
        throw Exception("CoCreateGuid", -1)
    size := VarSetCapacity(sguid, 38 * (A_IsUnicode ? 2 : 1) + 1, 0)
    if !(DllCall("ole32.dll\StringFromGUID2", "ptr", &pguid, "ptr", &sguid, "int", size))
        throw Exception("StringFromGUID2", -1)
    return StrGet(&sguid)
}

; ===============================================================================================================================

MsgBox % CreateGUID()    ; ==> {XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}