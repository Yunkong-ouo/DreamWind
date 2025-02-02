<div align="right">

[繁體中文](../README.md) | [简体中文](./README.zh-CN.md) | **English**

</div>

<div align="center">
    <img src="https://github.com/Yunkong-ouo/DreamWind/blob/main/github/image/CS2.jpg" alt="image" width="800">
</div>

<h1 align="center">DreamWind-CFG</h1>

<p align="center">
    <a href="https://github.com/Yunkong-ouo/Cs2CfgHighlighterExtension">
        <img alt="CS2 Visual Studio Code Highlight Extension" src="https://img.shields.io/badge/CS2%20VSCode%20Highlight%20Extension-blue?style=for-the-badge&logo=github">
    </a>
    <a href="https://github.com/Yunkong-ouo/DreamWind">
        <img alt="DreamWind" src="https://img.shields.io/badge/CS2%20DreamWind%20CFG-green?style=for-the-badge&logo=github">
    </a>
</p>

# 💼 DreamWind-CFG Introduction

**DreamWind-CFG** is a lightweight CS2 CFG project that integrates common features while providing powerful customization options. With an in-game radial menu, 🚀 players can visually access **DreamWind-CFG** functions directly in-game.
Designed with a lightweight approach, all features can run under `sv_cheats 0`, while an additional practice mode is available for `sv_cheats 1`, helping players quickly familiarize themselves with maps and utilities through a visual interface.
In most cases, using **DreamWind-CFG** will not result in a **VAC** ban. This is purely a CFG project that utilizes only official game features 👍.

---

## ✨ Features
- 🔥 Quick Setup
- 💤 Simple Interface
- 📦 Preconfigured Plugins
- 🧹 Elegant Design
- 🚀 Fast Response

---

# 📝 Features Overview
| Name                     | Description
|------------------------- |----------------------------------------
| Auto Stop (Deprecated)   | WASD can quickly reduce movement speed
| Jump Throw Bind          | Automatically performs directional or non-directional throws based on WASD input
| Spacebar Long Jump       | Holding spacebar triggers long jumps automatically
| Fire to Cancel Defuse    | Pressing fire cancels defusing; releasing continues defusing
| Radial Utility Selection | Saves key bindings; hold the bind key to open the radial menu, tap to switch utilities
| Sniper Quick Switch      | Pressing Q quickly swaps to a sniper rifle
| Auto Chat Spam           | Built-in spam messages for faster text input
| Custom Text Output       | Customize text output when switching CFGs, to console, team, or all chat
| Crosshair Utilities      | Includes crosshair following and related features
| Scroll Wheel Utilities   | Easy customization of scroll wheel actions
| Practice Mode (Deprecated) | One-click practice setup with customizable features
| Auto Bunny Hop           | Holding spacebar enables continuous jumping
| Minimap Zoom on Walk     | Automatically zooms in or out on the minimap when walking
| CFG Reset Indicator      | Changes UI colors to indicate CFG reset
| Pistol Rapid Fire        | Holding fire rapidly shoots pistols; automatically cancels for R8 revolver

---

# 🔥 Important Notes
**⚠️ This CFG will overwrite existing settings. Please back up your original CFG before use!**

# 🚀 Installation Guide
Download and extract the files from Releases. Move the entire `DreamWind` folder into the `CFG` directory. The default relative path is:
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

# 🛠️ Automatic Installation
## Open `CFG main program.bat`
### 🖥️ Installation
Select「Install」 to complete the CFG installation.
### 🗑️ Uninstallation
Select「Uninstall」 to remove the CFG.
#### Reset After Launching the Game
Execute the following command:
```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

# ⚒️ Manual Installation
## 📃 Placing Files Manually
Move all `.txt` files from the `resource` folder into CS2's `resource` directory. The default relative path is:
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

## 💿 Loading the CFG
### Method 1
Add the following to the Steam launch options:
```
+exec DreamWind/DreamWindMod
```
---
### Method 2
Create a file named `autoexec.cfg` and place it in the default relative path:
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```
Inside the file, add the following line:
```
exec DreamWind/DreamWindMod
```
<h1><b>Recommended: Use autoexec.cfg Method</b></h1>

---

# ⚙️ Configuration Files
The `config` folder contains the following files:
```
(KeyPreference.cfg)    —— Configures key bindings for the entire CFG
(OptPreference.cfg)    —— Configures general settings for the CFG
(PersonalSettings.cfg) —— Configures personal settings
```
**Follow the instructions within each file to adjust the CFG settings.**

---
