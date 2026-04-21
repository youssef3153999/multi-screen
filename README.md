# Digital Signage System for Restaurants (Low-Cost Solution)
# Multi-Screen VLC Setup

## Overview

This project automatically plays videos on multiple screens using VLC and PowerShell.

## Features

* Play different videos on multiple monitors
* Control window position via WinAPI
* Fullscreen playback
* Delay between screens (e.g. 20 seconds)
* Auto-start via Windows Startup

## Requirements

* Windows OS
* VLC Media Player installed
* Multiple monitors (at least 3)

## Setup

1. Edit paths inside the script:

   * VLC path
   * Video file paths

2. Example:

```powershell
$vlcPath = "C:\Program Files\VideoLAN\VLC\vlc.exe"
$videoRecht = "C:\Videos\recht.mp4"
$videoLinks = "C:\Videos\links.mp4"
```

## Run

Run manually:

```bash
powershell -ExecutionPolicy Bypass -File video-1-2-3.ps1
```

Or use:

* start.bat for delayed startup
* or convert to .exe

## Startup

Place `start.bat` in:

```
shell:startup
```

## Notes

* Do not store videos inside this repo
* Adjust screen positions based on your setup

## Author

Youssef Al Ali
