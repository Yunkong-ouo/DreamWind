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

## 💼 CS2Konc-CFG Introduction
**CS2Konc-CFG** is a lightweight CS2 CFG project that integrates common features while providing powerful customization options. Using the in-game wheel menu, 🚀 players can visually access the functions of **CS2Konc-CFG** within the game.  
**CS2Konc-CFG** is designed with a focus on being lightweight while maintaining full functionality, which can operate under `sv_cheats 0`. It also includes a training mode that works with `sv_cheats 1`, allowing players to quickly familiarize themselves with maps and items, again with a visual interface for access.  
In most cases, using **CS2Konc-CFG** will not result in a **VAC** ban. This is simply a CFG project with official functionalities provided. 👍

## ✨ Features
- 🔥 Fast configuration
- 💤 Simple interface
- 📦 Preconfigured plugins
- 🧹 Elegant design
- 🚀 Lightning fast

## 📝 Feature Introduction
| Name                       | Description                                   |
|----------------------------|-----------------------------------------------|
| Auto Stop (Deprecated)     | WASD can quickly decrease speed.
| Throw Bindings             | Automatic throwing with WASD directions and no-direction throws.
| Space Jump                 | Automatically jump when pressing the space key.
| Cancel Plant on Fire       | Cancels planting when you press the fire key, resuming planting after release.
| Wheel Item Switch          | Save key presses by holding the assigned key to open the wheel; pressing switches items.
| Sniper Quick Switch        | Quickly switch to the sniper by pressing Q.
| Auto Clean Frequency       | Built-in frequency cleaning text, type faster.
| Custom Text Output         | Output to Close/Console/Team/All/Switch CFG.
| Crosshair Utility          | Features related to crosshair follow.
| Wheel Utility              | Convenient settings for the scroll wheel, and customization options.
| Training Mode (Deprecated) | One-click to set up training mode with customizable features.
| Auto Jump                  | Automatically jump when pressing the space key.
| Crouch Zoom Mini-map       | Automatically zoom in and out when crouching.
| Reset CFG Flash Reminder   | Interface color change reminder when resetting CFG.
| Quick Fire with Handgun    | Hold fire after picking up a pistol to shoot quickly, R8 automatically cancels.

## 🔥 Special Notes
**! This CFG will overwrite existing settings, please backup your original CFG before use to avoid issues!**

## 🚀 Installation Guide
Download and extract the files from the Releases section, then drag the entire `CS2Konc_CFG` folder into the `CFG` folder. The default relative path is:
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```
---
**📃 Text Installation**
Drag the files in the `resource` folder (with .txt extension) into CS2's `resource` folder. The default relative path is:
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```
---

## 💿 Loading Method
**Method 1**  
Add the following in the Steam launch options:
```
+exec CS2Konc_CFG/CSKoncMod
```
---
**Method 2**  
Create a file named `autoexec.cfg` in the `Counter-Strike Global Offensive\game\csgo\cfg` folder with the content:
```
exec CS2Konc_CFG/CSKoncMod
```
<h1><b>Recommended to use autoexec.cfg method</b></h1>

---

## 🖥️ Auto Install
Double-click **InstallCS2Konc_CFG.bat** to automatically install **CS2Konc_CFG**.
## 🗑️ Uninstall
Double-click **UninstallCS2Konc_CFG.bat** to uninstall **CS2Konc_CFG**.  
Then, reset the keys in the game twice, or type the following:
```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```
---

## ⚙️ Related Settings
In the config folder, there are the following:
```
(KeyPreference.cfg) - Customize the initial key binding setup for the entire CFG.
(OptPreference.cfg) - Customize the initial settings for the entire CFG.
(PersonalSettings.cfg) - Customize personal settings.
Please modify the CFG settings as per the text files.
```
---
