; ===============================================================================================================================
; Download Files from FTP Server (Server, Username, Password, RemoteFile, LocalFile)
; ===============================================================================================================================

FTPDownload(srv, usr, pwd, rfile, lfile)
{
    static a := "AHK-FTP-DL"
    if !(m := DllCall("LoadLibrary", "str", "wininet.dll", "ptr")) || !(h := DllCall("wininet\InternetOpen", "ptr", &a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr"))
        return 0
    if (f := DllCall("wininet\InternetConnect", "ptr", h, "ptr", &srv, "ushort", 21, "ptr", &usr, "ptr", &pwd, "uint", 1, "uint", 0x08000000, "uptr", 0, "ptr")) {
        if !(DllCall("wininet\FtpGetFile", "ptr", f, "ptr", &rfile, "ptr", &lfile, "int", 0, "uint", 0, "uint", 0, "uptr", 0))
            return 0, DllCall("wininet\InternetCloseHandle", "ptr", h) && DllCall("FreeLibrary", "ptr", m)
        DllCall("wininet\InternetCloseHandle", "ptr", f)
    }
    DllCall("wininet\InternetCloseHandle", "ptr", h) && DllCall("FreeLibrary", "ptr", m)
    return 1
}

; ===============================================================================================================================

FTPDownload("example.net", "username", "password", "testfile.txt", "C:\Temp\testfile.txt")