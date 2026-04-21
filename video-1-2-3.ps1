Add-Type -AssemblyName System.Windows.Forms

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class WinAPI {
    [DllImport("user32.dll")]
    public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);

    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);

    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
}
"@

$vlcPath    = "C:\Program Files\VideoLAN\VLC\vlc.exe"
$videoRecht = "C:\Users\hot20\Downloads\recht.mp4"
$videoLinks = "C:\Users\hot20\Downloads\links.mp4"
$logFile    = "C:\Scripts\video-start.log"

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logFile -Value "$timestamp - $Message"
}

if (!(Test-Path $vlcPath)) {
    Write-Log "VLC nicht gefunden: $vlcPath"
    exit
}

if (!(Test-Path $videoRecht)) {
    Write-Log "Video nicht gefunden: $videoRecht"
    exit
}

if (!(Test-Path $videoLinks)) {
    Write-Log "Video nicht gefunden: $videoLinks"
    exit
}

$screens = [System.Windows.Forms.Screen]::AllScreens

if ($screens.Count -lt 3) {
    Write-Log "Weniger als 3 Bildschirme erkannt. Count=$($screens.Count)"
    exit
}

$screen1 = $screens[0].Bounds
$screen2 = $screens[1].Bounds
$screen3 = $screens[2].Bounds

function Start-VLCOnScreen {
    param (
        [string]$VideoPath,
        $ScreenBounds
    )

    $p = Start-Process -FilePath $vlcPath -ArgumentList "--loop `"$VideoPath`"" -PassThru
    Start-Sleep -Seconds 3
    $p.Refresh()

    if ($p.MainWindowHandle -eq 0) {
        Write-Log "Kein Fensterhandle für: $VideoPath"
        return
    }

    [WinAPI]::ShowWindow($p.MainWindowHandle, 1) | Out-Null
    [WinAPI]::MoveWindow($p.MainWindowHandle, $ScreenBounds.X, $ScreenBounds.Y, $ScreenBounds.Width, $ScreenBounds.Height, $true) | Out-Null
    [WinAPI]::SetForegroundWindow($p.MainWindowHandle) | Out-Null
    Start-Sleep -Milliseconds 500
    [System.Windows.Forms.SendKeys]::SendWait("f")

    Write-Log "Gestartet: $VideoPath auf X=$($ScreenBounds.X), Y=$($ScreenBounds.Y), W=$($ScreenBounds.Width), H=$($ScreenBounds.Height)"
}

# Bildschirm 1 -> recht.mp4
Start-VLCOnScreen -VideoPath $videoRecht -ScreenBounds $screen1

Start-Sleep -Seconds 2

# Bildschirm 2 -> links.mp4
Start-VLCOnScreen -VideoPath $videoLinks -ScreenBounds $screen2

Start-Sleep -Seconds 20

# Bildschirm 3 -> links.mp4
Start-VLCOnScreen -VideoPath $videoLinks -ScreenBounds $screen3