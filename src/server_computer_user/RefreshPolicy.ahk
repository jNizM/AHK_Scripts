; ===============================================================================================================================
; RefreshPolicy - Causes policy to be applied immediately on the computer. (like gpupdate)
; ===============================================================================================================================

RefreshPolicy(machine := true, option := false)
{
    static RP_FORCE := 1
    if (option & ~RP_FORCE)
        return false
    if (option & RP_FORCE)
        if !(DllCall("userenv.dll\RefreshPolicyEx", "int", machine, "uint", RP_FORCE))
            throw Exception("RefreshPolicyEx failed: " A_LastError, -1)
    else
        if !(DllCall("userenv.dll\RefreshPolicy", "int", machine))
            throw Exception("RefreshPolicy failed: " A_LastError, -1)
    return true
}

; ===============================================================================================================================

RefreshPolicy(1, 1)    ; -> refresh the computer policy with force flag
RefreshPolicy(0, 1)    ; -> refresh the user     policy with force flag

ExitApp