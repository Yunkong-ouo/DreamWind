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

**DreamWind-CFG** is a lightweight CS2 CFG project that integrates multiple practical functions and provides personalized settings.
With the in-game radial menu, 🚀 you can freely adjust various **DreamWind-CFG** features.

✅ **This CFG is entirely based on official features and will not result in a VAC ban.**

---

## ✨ Features

- 🔥 Quick setup
- 💤 Simple interface
- 📦 Pre-installed plugins
- 🧹 Elegant design
- 🚀 Fast response

---

# 📝 Features Overview

| Name                     | Description                                                                        |
| ------------------------ | ---------------------------------------------------------------------------------- |
| Movement Modes           | Includes three different movement styles                                           |
| Jump-Throw Bind          | Automatically throws based on WASD direction or without direction                  |
| Spacebar Long Jump       | Press the spacebar to automatically perform a long jump                            |
| Fire to Cancel Defuse    | Cancels defusing when firing; resumes when releasing the fire button               |
| Radial Item Switch       | Saves key bindings; long press to open the radial menu, single tap to switch items |
| Quick Sniper Switch      | Press **Q** to instantly switch to a sniper rifle                                  |
| Auto Chat Spam           | Built-in chat spam messages for faster communication                               |
| Custom Text Output       | Customize messages for console, team, global chat, or CFG switches                 |
| Crosshair Features       | Provides crosshair-related utilities, including tracking                           |
| Scroll Wheel Features    | Allows for customized scroll wheel settings                                        |
| Auto Bunny Hop           | Hold the spacebar to continuously jump                                             |
| Silent Walk Minimap Zoom | Automatically zooms in or out on the minimap when walking silently                 |
| CFG Reset Indicator      | Changes UI colors when resetting CFG to indicate completion                        |
| Pistol Rapid Fire        | Hold the fire button to shoot rapidly with pistols                                 |
| Auto Utility Usage       | One-key positioning for throwing grenades                                          |

---

# 🔥 Important Notes

**⚠️ This CFG will overwrite your existing settings. Please back up your original CFG before using it!**

---

# 🚀 Installation Guide

Download the files from Releases and extract them. Drag the entire `DreamWind` folder into the `CFG` folder. The default path is:

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

# 🛠️ CFG Main Program

## Open `CFG main program.bat`

This program is used for installing and configuring the CFG to ensure optimal performance.

### 🖥️ Installation

Select **"Install"** to complete the CFG installation.

### 🗑️ Uninstallation

Select **"Uninstall"** to remove the CFG.

#### Reset After Entering the Game

Execute the following command:

```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

# ⚒️ Manual Installation

## 📃 Manually Placing Files

Move all `.txt` files from the `resource` folder into the CS2 `resource` folder. The default path is:

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

## 💿 Loading Methods

### Method 1

Add the following command to the Steam launch options:

```
+exec DreamWind/DWLoad
```

---

### Method 2 (Recommended)

Create a file named `autoexec.cfg` and place it in the default path:

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

Add the following content to the file:

```
exec DreamWind/DWLoad
```

---

# ⚙️ Configuration Files

The `config` folder contains the following files:

```
(KeyPreference.cfg)    —— Used to customize key bindings for the CFG
(OptPreference.cfg)    —— Used to customize the initial settings of the CFG
(PersonalSettings.cfg) —— Used to personalize individual settings
```

**Please adjust the CFG settings according to the instructions in the files.**

---
