; ===============================================================================================================================
; Reverse the array order
; ===============================================================================================================================

RevArr(arr) {
    newarr := []
    for index, value in arr
        newarr.InsertAt(1, value)
    return newarr
}

RevArrByRef(ByRef arr) {
    loop % len := arr.MaxIndex()
        arr.Push(arr.RemoveAt(len - (A_Index - 1)))
    return
}

; ===============================================================================================================================

arr := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
NewArr := RevArr(arr)
for i, v in NewArr
    MsgBox % v                           ; -> 10 - 1


arr := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
RevArrByRef(arr)
for i, v in arr
    MsgBox % v                           ; -> 10 - 1