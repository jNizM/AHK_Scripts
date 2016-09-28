; ===============================================================================================================================
; Checks if a value exists in an array (similar to HasKey)
; ===============================================================================================================================

; FoundPos := HasVal(Haystack, Needle)
HasVal(haystack, needle) {
    for index, value in haystack
        if (value = needle)
            return index
    if !(IsObject(haystack))
        throw Exception("Bad haystack!", -1, haystack)
    return 0
}

; ===============================================================================================================================

arr := ["a", "b", "", "d"]
MsgBox % HasVal(arr, "a") "`n"    ; ==> 1
       . HasVal(arr, "c") "`n"    ; ==> 0
	   . HasVal(arr, "d")         ; ==> 4


arr := {keyA: "A", keyB: "B"}
MsgBox % HasVal(arr, "B") "`n"    ; ==> keyB
       . HasVal(arr, "C")         ; ==> 0


arr := {keyA: "A", 1: 0, keyC: "C"}
MsgBox % HasVal(arr, 0)   "`n"    ; ==> 1
       . HasVal(arr, "C") "`n"    ; ==> keyC


str := "A"
MsgBox % HasVal(str, "A")         ; ==> fails -1