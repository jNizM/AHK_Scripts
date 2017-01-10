; ===============================================================================================================================
; Check if a process is elevated
; ===============================================================================================================================

IsProcessElevated(ProcessID)
{
    if !(hProcess := DllCall("OpenProcess", "uint", 0x0400, "int", 0, "uint", ProcessID, "ptr"))
        throw Exception("OpenProcess failed", -1)
    if !(DllCall("advapi32\OpenProcessToken", "ptr", hProcess, "uint", 0x0008, "ptr*", hToken))
        throw Exception("OpenProcessToken failed", -1)
    DllCall("advapi32\GetTokenInformation", "ptr", hToken, "int", 20, "ptr", 0, "uint", 0, "uint*", size)
    VarSetCapacity(TOKEN_INFORMATION, size, 0)
    if !(DllCall("advapi32\GetTokenInformation", "ptr", hToken, "int", 20, "ptr", &TOKEN_INFORMATION, "uint", size, "uint*", size))
        throw Exception("GetTokenInformation failed", -1)
    return NumGet(TOKEN_INFORMATION, 0, "UInt"), DllCall("CloseHandle", "ptr", hProcess)
}

; ===============================================================================================================================

MsgBox % IsProcessElevated(DllCall("GetCurrentProcessId"))