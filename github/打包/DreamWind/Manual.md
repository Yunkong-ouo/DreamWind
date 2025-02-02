<div align="right">

**繁體中文** | [简体中文](#简体中文) | [English](#english)

</div>

<div align="center">

# 繁體中文

</div>

---

## 💼 DreamWind-CFG 介紹

**DreamWind-CFG** 是一款輕量級的 CS2 CFG 項目，整合了一些常見功能，同時提供強大的自訂選項。透過遊戲內的輪盤選單，🚀 讓玩家可以在遊戲中以視覺化方式存取 **DreamWind-CFG** 的各項功能。
**DreamWind-CFG** 主要以輕量設計為核心，其全部功能均可在 `sv_cheats 0` 下運行，同時也包含可在 `sv_cheats 1` 下運行的練習模式，幫助玩家快速熟悉地圖和道具，並提供視覺化操作方式。
在大多數情況下，使用 **DreamWind-CFG** 不會導致 **VAC** 封鎖。這僅僅是一個 CFG 項目，完全是官方提供的功能👍。

---

### ✨ 特色
- 🔥 快速配置
- 💤 簡潔介面
- 📦 預設插件
- 🧹 優雅設計
- 🚀 反應迅速

---

## 📝 功能介紹
| 名稱                    | 介紹
|------------------------ |----------------------------------------
| 自動急停 (已棄用)        | WASD 皆可快速降低移動速度
| 跳投綁定                | 根據 WASD 方向自動進行投擲或無方向投擲
| 空白鍵大跳              | 按下空白鍵自動執行大跳
| 開槍取消拆包            | 按下開火鍵時自動取消拆包，鬆開後繼續拆包
| 輪盤切換道具            | 節省按鍵，長按綁定鍵即可呼出輪盤，單擊亦可切換道具
| 狙擊槍快速切槍          | 只需按下 Q 鍵即可快速切換至狙擊槍
| 自動刷屏                | 內建刷屏文字，讓你輸入訊息快人一步
| 自訂文字輸出            | 可自訂關閉、控制台、隊伍、所有人或切換 CFG 時的文字輸出
| 準星實用功能            | 提供準星跟隨等相關功能
| 滾輪實用功能            | 方便設定並自訂滾輪相關設置
| 練習模式 (已棄用)       | 一鍵設定練習模式，並支援自訂相關功能
| 自動連跳                | 按下空白鍵自動實現連續跳躍
| 靜步縮放小地圖          | 靜步時可自動放大或縮小小地圖
| 重置 CFG 提示效果       | 重置 CFG 時切換介面顏色以提示已重置
| 手槍快速射擊            | 使用手槍時長按開火鍵可快速射擊，R8 會自動取消

---

## 🔥 特別說明
**⚠️ 此 CFG 會覆蓋原有設定，使用前請先備份原有 CFG 以防意外！**

## 🚀 安裝說明
從 Releases 下載並解壓縮檔案，將整個 `DreamWind` 資料夾拖入 `CFG` 資料夾內，預設的相對路徑為：
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

## 🛠️ 自動安裝
### 打開 `CFG main program.bat`
#### 🖥️ 安裝
選擇「安裝」即可完成 CFG 的安裝。
#### 🗑️ 解除安裝
選擇「解除安裝」即可移除 CFG。
##### 進入遊戲後重置
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
#### 方式 2
建立一個名為 `autoexec.cfg` 的檔案，並放置於預設的相對路徑下：
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```
檔案內容如下：
```
exec DreamWind/DreamWindMod
```
<h1><b>推薦使用 autoexec.cfg 方式</b></h1>

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

**DreamWind-CFG** 是一个轻量级的 CS2 CFG 项目，整合了一些常见功能，同时提供强大的自定义选项。使用游戏内的轮盘菜单，🚀 让玩家可以在游戏中以可视化方式访问 **DreamWind-CFG** 的各项功能。
**DreamWind-CFG** 主要为轻量设计，其全部功能均可在 `sv_cheats 0` 下运行，同时也包含在 `sv_cheats 1` 下运行的练习模式，帮助玩家快速熟悉地图和道具，同样提供了可视化的操作方式。
在大多数情况下，使用 **DreamWind-CFG** 不会导致 **VAC** 封禁。这仅仅是一个 CFG 项目，是官方提供的功能👍。

---

### ✨ 特性
- 🔥 配置迅速
- 💤 界面简洁
- 📦 预置插件
- 🧹 优雅设计
- 🚀 快如闪电

---

## 📝 功能介绍
| 名称                     | 介绍
|------------------------- |----------------------------------------
| 自动急停 (废弃)           | WASD 都能快速降低移动速度
| 跳投绑定                  | 根据 WASD 方向自动进行投掷或无方向投掷
| 空格大跳                  | 按下空格键自动进行大跳
| 开枪取消拆包              | 当按下开火键时自动取消拆包，松开后继续拆包
| 轮盘切道具                | 节省按键，只需长按绑定的键即可呼出轮盘，同时点击也可切换道具
| 狙击枪快速切枪            | 只需按下 Q 键即可快速切换至狙击枪
| 自动刷屏                  | 内置刷屏文本，让你打字快人一步
| 自定义文字输出            | 可自定义关闭、控制台、团队、全部或切换 CFG 时的文字输出
| 准星实用功能              | 提供准星跟随等相关功能
| 滚轮实用功能              | 方便设置并自定义滚轮相关设置
| 练习模式 (废弃)           | 一键设置练习模式，并支持自定义相关功能
| 自动连跳                  | 按下空格键自动实现连续跳跃
| 静步缩放小地图            | 静步时可自动放大或缩小小地图
| 重置 CFG 闪乐提醒         | 重置 CFG 时切换界面颜色以提醒已重置
| 手枪快速射击              | 拿起手枪后长按开火键可实现快速射击，R8 会自动取消

---

## 🔥 特别说明
**⚠️ 此 CFG 会覆盖原有设置，使用之前请先备份原有 CFG 以防意外！**

## 🚀 安装说明
从 Releases 下载并解压文件，将整个 `DreamWind` 文件夹拖入 `CFG` 文件夹中，默认的相对路径为：
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

## 🛠️ 自动安装
### 打开 `CFG main program.bat`
#### 🖥️ 安装
选择「安装」即可完成 CFG 的安装。
#### 🗑️ 卸载
选择「卸载」即可移除 CFG，。  
##### 进入游戏后重置
执行以下指令：
```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

## ⚒️ 手动安装
### 📃 手动放置文件
将 `resource` 文件夹内的所有文件（.txt）拖入 CS2 的 `resource` 文件夹中，默认的相对路径为：
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

### 💿 载入方式
#### 方式1
在 Steam 启动项中添加：
```
+exec DreamWind/DreamWindMod
```
---
#### 方式2
创建一个名为 `autoexec.cfg` 的文件，放在默认的相对路径下：
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```
文件内容为：
```
exec DreamWind/DreamWindMod
```
<h1><b>推荐使用 autoexec.cfg 方式</b></h1>

---

## ⚙️ 相关设置
在 config 文件夹中包含以下文件：
```
(KeyPreference.cfg)    —— 用于自定义修改整个 CFG 的初始按键绑定设置
(OptPreference.cfg)    —— 用于自定义修改整个 CFG 的初始设置
(PersonalSettings.cfg) —— 用于自定义修改个人设置
```
**请根据文件内的说明修改 CFG 设置**

---


<div align="right">

[繁體中文](#繁體中文) | [简体中文](#简体中文) | **English**

</div>

<div align="center">

# English

</div>

---

## 💼 DreamWind-CFG Introduction

**DreamWind-CFG** is a lightweight CS2 CFG project that integrates common features while providing powerful customization options. With an in-game radial menu, 🚀 players can visually access **DreamWind-CFG** functions directly in-game.
Designed with a lightweight approach, all features can run under `sv_cheats 0`, while an additional practice mode is available for `sv_cheats 1`, helping players quickly familiarize themselves with maps and utilities through a visual interface.
In most cases, using **DreamWind-CFG** will not result in a **VAC** ban. This is purely a CFG project that utilizes only official game features 👍.

---

### ✨ Features
- 🔥 Quick Setup
- 💤 Simple Interface
- 📦 Preconfigured Plugins
- 🧹 Elegant Design
- 🚀 Fast Response

---

## 📝 Features Overview
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

## 🔥 Important Notes
**⚠️ This CFG will overwrite existing settings. Please back up your original CFG before use!**

## 🚀 Installation Guide
Download and extract the files from Releases. Move the entire `DreamWind` folder into the `CFG` directory. The default relative path is:
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

## 🛠️ Automatic Installation
### Open `CFG main program.bat`
#### 🖥️ Installation
Select「Install」 to complete the CFG installation.
#### 🗑️ Uninstallation
Select「Uninstall」 to remove the CFG.
##### Reset After Launching the Game
Execute the following command:
```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

## ⚒️ Manual Installation
### 📃 Placing Files Manually
Move all `.txt` files from the `resource` folder into CS2's `resource` directory. The default relative path is:
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

### 💿 Loading the CFG
#### Method 1
Add the following to the Steam launch options:
```
+exec DreamWind/DreamWindMod
```
---
#### Method 2
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

## ⚙️ Configuration Files
The `config` folder contains the following files:
```
(KeyPreference.cfg)    —— Configures key bindings for the entire CFG
(OptPreference.cfg)    —— Configures general settings for the CFG
(PersonalSettings.cfg) —— Configures personal settings
```
**Follow the instructions within each file to adjust the CFG settings.**

---
