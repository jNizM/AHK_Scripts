; ===============================================================================================================================
; In cryptography, SHA-1 (Secure Hash Algorithm 1) is a cryptographic hash function
; ===============================================================================================================================

SHA(string, case := 0)
{
    static SHA_DIGEST_LENGTH := 20
    hModule := DllCall("LoadLibrary", "Str", "advapi32.dll", "Ptr")
    , VarSetCapacity(SHA_CTX, 136, 0), DllCall("advapi32\A_SHAInit", "Ptr", &SHA_CTX)
    , DllCall("advapi32\A_SHAUpdate", "Ptr", &SHA_CTX, "AStr", string, "UInt", StrLen(string))
    , DllCall("advapi32\A_SHAFinal", "Ptr", &SHA_CTX, "UInt", &SHA_CTX + 116)
    loop % SHA_DIGEST_LENGTH
        o .= Format("{:02" (case ? "X" : "x") "}", NumGet(SHA_CTX, 115 + A_Index, "UChar"))
    return o, DllCall("FreeLibrary", "Ptr", hModule)
}

; ===============================================================================================================================

MsgBox % SHA("Hello World") "`n"
       . SHA("Hello World", 1)