# Multi-Screen VLC Digital Signage

## 🚀 Overview

A lightweight digital signage solution for multi-screen environments using PowerShell and VLC.

Designed for real-world usage in restaurants, kiosks, and retail displays.

---

## 💡 Use Case

A restaurant setup with:

* 3 HDMI screens
* Promotional videos
* Delayed playback between screens

This solution replaces expensive digital signage systems with a simple, automated script.

---

## 🖥️ Demo

![Demo](assets/demo.png)

---

## ⚙️ Features

* Multi-screen video playback
* Fullscreen VLC automation
* Screen positioning using WinAPI
* Playback delay between screens
* Auto-start on system boot
* No external software required (except VLC)

---

## 🧠 Architecture

![Architecture](assets/setup.png)

* PowerShell controls window placement
* WinAPI handles screen positioning
* VLC handles media playback

---

## 🛠️ Setup

1. Install VLC:
   https://www.videolan.org/vlc/

2. Update paths in script:

```powershell
$vlcPath = "C:\Program Files\VideoLAN\VLC\vlc.exe"
$videoRecht = "C:\Videos\recht.mp4"
$videoLinks = "C:\Videos\links.mp4"
```

3. Run script:

```bash
powershell -ExecutionPolicy Bypass -File video-1-2-3.ps1
```

---

## 🔁 Auto Start

Place `start.bat` in:

```
shell:startup
```

---

## 📈 Why This Project Matters

* Demonstrates Windows automation skills
* Uses WinAPI for real system control
* Practical real-world deployment
* Low-cost alternative to enterprise solutions

---

## 👨‍💻 Author

Youssef Al Ali
