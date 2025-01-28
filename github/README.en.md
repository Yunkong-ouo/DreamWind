<div align="right">

[繁體中文](../README.md) | [简体中文](./README.zh-CN.md) | **English**

</div>

<div align="center">
    <img src="https://github.com/Yunkong-ouo/CS2Konc_CFG/blob/main/github/image/CS2.jpg" alt="image" width="800">
</div>

<h1 align="center">CS2Konc-CFG</h1>

<p align="center">
    <a href="https://github.com/Yunkong-ouo/Cs2CfgHighlighterExtension">
        <img alt="CS2 Visual Studio Code Highlight Extension" src="https://img.shields.io/badge/CS2%20VSCode%20Highlight%20Extension-blue?style=for-the-badge&logo=github">
    </a>
    <a href="https://github.com/Yunkong-ouo/CS2Konc_CFG">
        <img alt="CS2Konc_CFG" src="https://img.shields.io/badge/CS2%20Konc%20CFG-green?style=for-the-badge&logo=github">
    </a>
</p>

# 💼 CS2Konc-CFG Introduction
**CS2Konc-CFG** is a lightweight CS2 CFG project that integrates common features and provides powerful customization options. Using the in-game wheel menu, 🚀 it allows players to access the features of **CS2Konc-CFG** visually within the game.
**CS2Konc-CFG** is designed to be lightweight while still providing full functionality under sv_cheats 0. It also includes a practice mode for sv_cheats 1, allowing players to quickly familiarize themselves with maps and items, and offers visual access to these features.
In most cases, using **CS2Konc-CFG** will not lead to a **VAC** ban. This is merely a CFG project with features provided by the official game 👍

---

## ✨ Features
- 🔥 Fast Configuration
- 💤 Simple Interface
- 📦 Pre-installed Plugins
- 🧹 Elegant Design
- 🚀 Lightning Fast
---

# 📝 Features Description
| Name                      | Description                                 
|------------------------- |---------------------------------------------
| Auto Stop (Deprecated)     | Quickly slows down speed using WASD
| Jump Throw Bind            | Auto-throw in WASD directions or no-direction throw
| Space Jump                 | Auto jump when the space bar is pressed
| Cancel Defuse on Fire      | Automatically cancels defusing when the fire key is pressed and continues defusing when released
| Wheel Item Switch          | Save keys, just long press a bound key to bring up the wheel, and tapping will switch items
| Sniper Quick Switch        | Quickly switch weapons by pressing Q
| Auto Clear Frequency       | Built-in key for clearing text, typing faster than others
| Custom Text Output         | Outputs text in close/console/team/all/switch CFG
| Crosshair Utility          | Features related to crosshair following
| Scroll Wheel Utility       | Convenient for setting scroll wheel related options, customizable
| Practice Mode (Deprecated) | One-click practice mode setup, customizable options
| Auto Bunnyhop              | Auto jump when pressing the space bar
| Stealth Zoom Small Map     | Automatically zoom in/out when crouch walking
| CFG Reset Flash Alert      | Changes interface color to alert when CFG is reset
| Pistol Fast Fire           | Press and hold fire to rapidly shoot when using a pistol, R8 auto cancels

---

# 🔥 Special Notes
**! This CFG will overwrite your existing settings, make sure to back up your original CFG before using to prevent accidents!**

# 🚀 Installation Guide
Download and unzip the files from the Releases, then drag the entire CS2Konc_CFG folder into the CFG folder. The default relative path is:
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg

---

# 🛠️ Automatic Installation
## Open CFG main program.bat
### 🖥️ Installation
Select Install to install the CFG.
### 🗑️ Uninstallation
Select Uninstall to remove the CFG.
#### Reset in-game
1. Enter the game and press reset twice.
2. Alternatively, run the following commands:
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig

---

# ⚒️ Manual Installation
## 📃 Text Installation
Drag the files (.txt) from the resource folder into the CS2 resource folder. The default relative path is:
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource

---

## 💿 Loading Methods
### Method 1
Add to Steam launch options:
+exec CS2Konc_CFG/CSKoncMod

### Method 2
Create a file named autoexec.cfg in the following default relative path:
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg

Inside the file, add:
exec CS2Konc_CFG/CSKoncMod

<h1><b>Recommended to use the autoexec.cfg method</b></h1>

---

# ⚙️ Related Settings
Inside the config folder, you will find:
```
(KeyPreference.cfg) - Customize initial key bindings for the entire CFG
(OptPreference.cfg) - Customize general settings for the entire CFG
(PersonalSettings.cfg) - Customize personal settings
```
**Please modify the CFG settings according to the text.**

---
