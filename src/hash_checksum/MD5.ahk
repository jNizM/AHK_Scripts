; ===============================================================================================================================
; The MD5 algorithm is a widely used hash function producing a 128-bit hash value
; ===============================================================================================================================

MD5(string, case := 0)
{
    static MD5_DIGEST_LENGTH := 16
    hModule := DllCall("LoadLibrary", "Str", "advapi32.dll", "Ptr")
    , VarSetCapacity(MD5_CTX, 104, 0), DllCall("advapi32\MD5Init", "Ptr", &MD5_CTX)
    , DllCall("advapi32\MD5Update", "Ptr", &MD5_CTX, "AStr", string, "UInt", StrLen(string))
    , DllCall("advapi32\MD5Final", "Ptr", &MD5_CTX)
    loop % MD5_DIGEST_LENGTH
        o .= Format("{:02" (case ? "X" : "x") "}", NumGet(MD5_CTX, 87 + A_Index, "UChar"))
    return o, DllCall("FreeLibrary", "Ptr", hModule)
}

; ===============================================================================================================================

MsgBox % MD5("Hello World") "`n"
       . MD5("Hello World", 1)