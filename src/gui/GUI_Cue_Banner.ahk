; GLOBAL SETTINGS ===============================================================================================================

#Warn
#NoEnv
#SingleInstance Force
SetBatchLines -1

; GUI ===========================================================================================================================

Gui, Margin, 10, 10
Gui, Add, Edit, xm ym w200 hWndhEdit01
EM_SETCUEBANNER(hEdit01, "stay on focus", 1)

Gui, Add, Edit, xm y+5 w200 hWndhEdit02
EM_SETCUEBANNER(hEdit02, "hide on focus", 2)

Gui, Add, Combobox, xm y+5 w200 hWndhCombo01, % "Test A|Test B|Test C"
CB_SETCUEBANNER(hCombo01, "this is a test")

Gui, Show, AutoSize
return

; FUNCTIONS =====================================================================================================================

EM_SETCUEBANNER(handle, string, hideonfocus := true)
{
    static EM_SETCUEBANNER := 0x1501
    return DllCall("user32\SendMessage", "ptr", handle, "uint", EM_SETCUEBANNER, "int", hideonfocus, "str", string, "int")
}

CB_SETCUEBANNER(handle, string)
{
    static CB_SETCUEBANNER := 0x1703
    return DllCall("user32\SendMessage", "ptr", handle, "uint", CB_SETCUEBANNER, "int", 0, "str", string, "int")
}

; EXIT ==========================================================================================================================

GuiClose:
GuiEscape:
ExitApp