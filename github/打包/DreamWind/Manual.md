<div align="right">

**繁體中文** | [简体中文](#简体中文) | [English](#english)

</div>

<div align="center">

# 繁體中文

</div>

---

## 💼 DreamWind-CFG 介紹

**DreamWind-CFG** 是一款輕量級的 CS2 CFG 項目，整合多種實用功能，並提供個性化設置。
透過遊戲內的輪盤選單，🚀 可自由調整 **DreamWind-CFG** 的各項功能。

✅ **此 CFG 完全基於官方功能，不會導致 VAC 封鎖。**

---

### ✨ 特色

- 🔥 快速配置
- 💤 簡潔介面
- 📦 預設插件
- 🧹 優雅設計
- 🚀 反應迅速

---

## 🔥 特別說明

**⚠️ 此 CFG 會覆蓋原有設定，使用前請先備份原有 CFG 以防意外！**

## 🚀 安裝說明

從 Releases 下載並解壓縮檔案，將整個 `DreamWind` 資料夾拖入 `CFG` 資料夾內，預設的相對路徑為：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

## 🛠️ CFG 主程序

### 打開 `CFG main program.bat`

該程序用於安裝和設置 CFG，確保最佳運行效果。

#### 🖥️ 安裝

選擇「安裝」即可完成 CFG 的安裝。

### 🗑️ 解除安裝

選擇「解除安裝」即可移除 CFG。

#### 進入遊戲後重置

執行以下指令：

```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

## ⚒️ 手動安裝

### 📃 手動放置檔案

將 `resource` 資料夾內的所有文件（.txt）拖入 CS2 的 `resource` 資料夾，預設的相對路徑為：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

### 💿 載入方式

#### 方式 1

在 Steam 啟動選項中新增：

```
+exec DreamWind/DreamWindMod
```

---

#### 方式 2(推薦)

建立一個名為 `autoexec.cfg` 的檔案，並放置於預設的相對路徑下：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

檔案內容如下：

```
exec DreamWind/DreamWindMod
```

---

## ⚙️ 相關設定

在 `config` 資料夾中包含以下文件：

```
(KeyPreference.cfg)    —— 用於自訂整個 CFG 的初始按鍵綁定設置
(OptPreference.cfg)    —— 用於自訂整個 CFG 的初始設置
(PersonalSettings.cfg) —— 用於自訂個人設定
```

**請依據文件內的說明調整 CFG 設定**

---

<div align="right">

[繁體中文](#繁體中文) | **简体中文** | [English](#english)

</div>

<div align="center">

# 简体中文

</div>

---

## 💼 DreamWind-CFG 介绍

**DreamWind-CFG** 是一款轻量级的 CS2 CFG 项目，整合多种实用功能，并提供个性化设置。
通过游戏内的轮盘菜单，🚀 可自由调整 **DreamWind-CFG** 的各项功能。

✅ **此 CFG 完全基于官方功能，不会导致 VAC 封锁。**

---

### ✨ 特色

- 🔥 快速配置
- 💤 简洁界面
- 📦 预设插件
- 🧹 优雅设计
- 🚀 反应迅速

---

## 🔥 特别说明

**⚠️ 此 CFG 会覆盖原有设置，使用前请先备份原有 CFG 以防意外！**

---

## 🚀 安装说明

从 Releases 下载并解压缩文件，将整个 `DreamWind` 文件夹拖入 `CFG` 文件夹内，默认的相对路径为：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

## 🛠️ CFG 主程序

### 打开 `CFG main program.bat`

该程序用于安装和设置 CFG，确保最佳运行效果。

#### 🖥️ 安装

选择「安装」即可完成 CFG 的安装。

#### 🗑️ 卸载

选择「卸载」即可移除 CFG。

##### 进入游戏后重置

执行以下指令：

```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

## ⚒️ 手动安装

### 📃 手动放置文件

将 `resource` 文件夹内的所有文件（.txt）拖入 CS2 的 `resource` 文件夹，默认的相对路径为：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

### 💿 载入方式

#### 方式 1

在 Steam 启动选项中新增：

```
+exec DreamWind/DreamWindMod
```

---

#### 方式 2（推荐）

创建一个名为 `autoexec.cfg` 的文件，并放置于默认的相对路径下：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

文件内容如下：

```
exec DreamWind/DreamWindMod
```

---

## ⚙️ 相关设置

在 `config` 文件夹中包含以下文件：

```
(KeyPreference.cfg)    —— 用于自定义整个 CFG 的初始按键绑定设置
(OptPreference.cfg)    —— 用于自定义整个 CFG 的初始设置
(PersonalSettings.cfg) —— 用于自定义个人设置
```

**请根据文件内的说明调整 CFG 设置**

---

<div align="right">

[繁體中文](#繁體中文) | [简体中文](#简体中文) | **English**

</div>

<div align="center">

# English

</div>

---

## 💼 DreamWind-CFG Introduction

**DreamWind-CFG** is a lightweight CS2 CFG project that integrates multiple practical functions and provides personalized settings.
With the in-game radial menu, 🚀 you can freely adjust various **DreamWind-CFG** features.

✅ **This CFG is entirely based on official features and will not result in a VAC ban.**

---

### ✨ Features

- 🔥 Quick setup
- 💤 Simple interface
- 📦 Pre-installed plugins
- 🧹 Elegant design
- 🚀 Fast response

---

## 🔥 Important Notes

**⚠️ This CFG will overwrite your existing settings. Please back up your original CFG before using it!**

---

## 🚀 Installation Guide

Download the files from Releases and extract them. Drag the entire `DreamWind` folder into the `CFG` folder. The default path is:

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

## 🛠️ CFG Main Program

### Open `CFG main program.bat`

This program is used for installing and configuring the CFG to ensure optimal performance.

#### 🖥️ Installation

Select **"Install"** to complete the CFG installation.

#### 🗑️ Uninstallation

Select **"Uninstall"** to remove the CFG.

##### Reset After Entering the Game

Execute the following command:

```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

## ⚒️ Manual Installation

### 📃 Manually Placing Files

Move all `.txt` files from the `resource` folder into the CS2 `resource` folder. The default path is:

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

### 💿 Loading Methods

#### Method 1

Add the following command to the Steam launch options:

```
+exec DreamWind/DreamWindMod
```

---

#### Method 2 (Recommended)

Create a file named `autoexec.cfg` and place it in the default path:

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

Add the following content to the file:

```
exec DreamWind/DreamWindMod
```

---

## ⚙️ Configuration Files

The `config` folder contains the following files:

```
(KeyPreference.cfg)    —— Used to customize key bindings for the CFG
(OptPreference.cfg)    —— Used to customize the initial settings of the CFG
(PersonalSettings.cfg) —— Used to personalize individual settings
```

**Please adjust the CFG settings according to the instructions in the files.**

---
