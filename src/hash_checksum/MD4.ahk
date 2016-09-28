; ===============================================================================================================================
; The MD4 Message-Digest Algorithm is a cryptographic hash function
; ===============================================================================================================================

MD4(string, case := 0)
{
    static MD4_DIGEST_LENGTH := 16
    hModule := DllCall("LoadLibrary", "Str", "advapi32.dll", "Ptr")
    , VarSetCapacity(MD4_CTX, 104, 0), DllCall("advapi32\MD4Init", "Ptr", &MD4_CTX)
    , DllCall("advapi32\MD4Update", "Ptr", &MD4_CTX, "AStr", string, "UInt", StrLen(string))
    , DllCall("advapi32\MD4Final", "Ptr", &MD4_CTX)
    loop % MD4_DIGEST_LENGTH
        o .= Format("{:02" (case ? "X" : "x") "}", NumGet(MD4_CTX, 87 + A_Index, "UChar"))
    return o, DllCall("FreeLibrary", "Ptr", hModule)
}

; ===============================================================================================================================

MsgBox % MD4("Hello World") "`n"
       . MD4("Hello World", 1)