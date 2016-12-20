; ===============================================================================================================================
; Upload Files to FTP Server (Server, Username, Password, LocalFile, RemoteFile)
; ===============================================================================================================================

FTPUpload(srv, usr, pwd, lfile, rfile)
{
    static a := "AHK-FTP-UL"
    if !(m := DllCall("LoadLibrary", "str", "wininet.dll", "ptr")) || !(h := DllCall("wininet\InternetOpen", "ptr", &a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr"))
        return 0
    if (f := DllCall("wininet\InternetConnect", "ptr", h, "ptr", &srv, "ushort", 21, "ptr", &usr, "ptr", &pwd, "uint", 1, "uint", 0x08000000, "uptr", 0, "ptr")) {
        if !(DllCall("wininet\FtpPutFile", "ptr", f, "ptr", &lfile, "ptr", &rfile, "uint", 0, "uptr", 0))
            return 0, DllCall("wininet\InternetCloseHandle", "ptr", h) && DllCall("FreeLibrary", "ptr", m)
        DllCall("wininet\InternetCloseHandle", "ptr", f)
    }
    DllCall("wininet\InternetCloseHandle", "ptr", h) && DllCall("FreeLibrary", "ptr", m)
    return 1
}

; ===============================================================================================================================

FTPUpload("example.net", "username", "password", "C:\Temp\testfile.txt", "testfile.txt")