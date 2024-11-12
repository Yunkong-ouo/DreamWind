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

## 💼 Introduction to CS2Konc-CFG
**CS2Konc-CFG** is a lightweight CS2 CFG project that integrates some common features while providing powerful customization options. Using an in-game wheel menu, 🚀 players can visually access the features of **CS2Konc-CFG** during gameplay.

**CS2Konc-CFG** is primarily designed for lightweight performance, with all features operable under `sv_cheats 0`, and includes a practice mode that runs under `sv_cheats 1`, allowing players to quickly familiarize themselves with maps and items, also accessible in a visual manner. 

In most cases, using **CS2Konc-CFG** will not result in a **VAC** ban. This is merely a CFG project. Officially provided features 👍

## ✨ Features
- 🔥 Quick configuration
- 💤 Simple interface
- 📦 Preloaded plugins
- 🧹 Elegant design
- 🚀 Lightning fast

## 📝 Feature Description
| Name                      | Description                             |
|-------------------------  |------------------------------------------|
| Auto Stop                 | Quickly decrease speed using WASD
| Jump Throw Binding        | Automatically throw with WASD direction or without direction
| Space Big Jump            | Automatically perform a big jump when pressing the space key
| Shoot to Cancel Unpacking | When you press the fire button, it automatically cancels unpacking; release to continue unpacking.
| Wheel Item Switching      | Saves key presses; just hold the bound key to bring up the wheel, and tapping can also switch items
| Quick Sniper Switching    | Quickly switch weapons by pressing Q
| Auto Frequency Wash       | Internal key wash frequency text, type faster than others
| Custom Text Output        | Output in close/control/team/all/switch CFG
| Crosshair Utility Functions    | Functions related to crosshair tracking
| Scroll Wheel Utility Functions | Convenient settings for scroll wheel settings, can also customize scroll wheel settings
| Practice Mode             | One-click setting for practice mode, can also customize related functions
| Auto Bhop                 | Press the spacebar to jump automatically  
| Mini-map Zoom with Walk   | Automatically zooms the mini-map when walking quietly
| Reset CFG Flash Reminder  | Changing interface color when you reset CFG, reminding you of the CFG reset

## 🔥 Special Note
**! This CFG will overwrite existing settings, please back up the original CFG before use to avoid accidents!**

## 🚀 Installation Instructions
Go to the Releases Download and unzip the file, drag the entire `CS2Konc_CFG` folder into the `CFG` folder. The default relative path is:
```
*Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

**Text Installation**<br>
Drag all the files (.txt) from the `resource` folder into the CS2 `resource` folder. The default relative path is:
```
*Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

<h1>💿Loading Methods</h1>

**Method 1**  
Add to the Steam launch options:
```
+exec CS2Konc_CFG/CSKoncMod
```

---

**Method 2**  
Create a file named `autoexec.cfg` in the `Counter-Strike Global Offensive\game\csgo\cfg` folder, and the content should be:
```
exec CS2Konc_CFG/CSKoncMod
```
### **Recommended to use the autoexec.cfg method**

---

## 🖥️ Automatic Installation

Double-click **InstallCS2Konc_CFG.bat** for automatic installation (CS2Konc_CFG)

## 🗑️ Uninstallation

Double-click **UninstallCS2Konc_CFG.bat** to uninstall (CS2Konc_CFG)

## ⚙️ Related Settings
In the config folder, there are the following files:
```
(KeyPreference.cfg) - Customize and modify the initial keybinding settings for the entire CFG
(OptPreference.cfg) - Customize and modify the initial settings for the entire CFG
(PersonalSettings.cfg) - Customize and modify personal settings
Please modify the CFG settings according to the text instructions
```
