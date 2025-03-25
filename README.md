<div align="right">

**繁體中文** | [简体中文](./github/README.zh-CN.md) | [English](./github/README.en.md)

</div>

<div align="center">
    <img src="https://github.com/Yunkong-ouo/DreamWind/blob/main/github/image/CS2.jpg" alt="image" width="800">
</div>

<h1 align="center">DreamWind-CFG</h1>

<p align="center">
    <a href="https://github.com/Yunkong-ouo/Cs2CfgHighlighterExtension">
        <img alt="CS2 Visual Studio Code 高亮擴展" src="https://img.shields.io/badge/CS2%20VSCode%20%E9%AB%98%E4%BA%AE%E6%93%B4%E5%B1%95-blue?style=for-the-badge&logo=github">
    </a>
    <a href="https://github.com/Yunkong-ouo/DreamWind">
        <img alt="DreamWind" src="https://img.shields.io/badge/CS2%20DreamWind%20CFG-green?style=for-the-badge&logo=github">
    </a>
</p>

**繁體中文** | [简体中文](./github/README.zh-CN.md) | [English](./github/README.en.md)

# 💼 DreamWind-CFG 介紹

**DreamWind-CFG** 是一款輕量級的 CS2 CFG 項目，整合多種實用功能，並提供個性化設置。
透過遊戲內的輪盤選單，🚀 可自由調整 **DreamWind-CFG** 的各項功能。

✅ **此 CFG 完全基於官方功能，不會導致 VAC 封鎖。**

---

## ✨ 特色

- 🔥 快速配置
- 💤 簡潔介面
- 📦 預設插件
- 🧹 優雅設計
- 🚀 反應迅速

---

# 📝 功能介紹

| 名稱              | 介紹                                                    |
| ----------------- | ------------------------------------------------------- |
| 移動方式          | 內有 3 種移動方式                                       |
| 跳投綁定          | 根據 WASD 方向自動進行投擲或無方向投擲                  |
| 空白鍵大跳        | 按下空白鍵自動執行大跳                                  |
| 開槍取消拆包      | 按下開火鍵時自動取消拆包，鬆開後繼續拆包                |
| 輪盤切換道具      | 節省按鍵，長按綁定鍵即可呼出輪盤，單擊亦可切換道具      |
| 狙擊槍快速切槍    | 只需按下 Q 鍵即可快速切換至狙擊槍                       |
| 自動刷屏          | 內建刷屏文字，讓你輸入訊息快人一步                      |
| 自訂文字輸出      | 可自訂關閉、控制台、隊伍、所有人或切換 CFG 時的文字輸出 |
| 準星實用功能      | 提供準星跟隨等相關功能                                  |
| 滾輪實用功能      | 方便設定並自訂滾輪相關設置                              |
| 自動連跳          | 按下空白鍵自動實現連續跳躍                              |
| 靜步縮放小地圖    | 靜步時可自動放大或縮小小地圖                            |
| 重置 CFG 提示效果 | 重置 CFG 時切換介面顏色以提示已重置                     |
| 手槍快速射擊      | 使用手槍時長按開火鍵可快速射擊                          |
| 自動道具          | 可一鍵定位道具瞄準點                                    |

---

# 🔥 特別說明

**⚠️ 此 CFG 會覆蓋原有設定，使用前請先備份原有 CFG 以防意外！**

# 🚀 安裝說明

從 Releases 下載並解壓縮檔案，將整個 `DreamWind` 資料夾拖入 `CFG` 資料夾內，預設的相對路徑為：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

# 🛠️ CFG 主程序

## 打開 `CFG main program.bat`

該程序用於安裝和設置 CFG，確保最佳運行效果。

### 🖥️ 安裝

選擇「安裝」即可完成 CFG 的安裝。

### 🗑️ 解除安裝

選擇「解除安裝」即可移除 CFG。

#### 進入遊戲後重置

執行以下指令：

```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

# ⚒️ 手動安裝

## 📃 手動放置檔案

將 `resource` 資料夾內的所有文件（.txt）拖入 CS2 的 `resource` 資料夾，預設的相對路徑為：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

## 💿 載入方式

### 方式 1

在 Steam 啟動選項中新增：

```
+exec DreamWind/DreamWindMod
```

---

### 方式 2(推薦)

建立一個名為 `autoexec.cfg` 的檔案，並放置於預設的相對路徑下：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

檔案內容如下：

```
exec DreamWind/DreamWindMod
```

---

# ⚙️ 相關設定

在 `config` 資料夾中包含以下文件：

```
(KeyPreference.cfg)    —— 用於自訂整個 CFG 的初始按鍵綁定設置
(OptPreference.cfg)    —— 用於自訂整個 CFG 的初始設置
(PersonalSettings.cfg) —— 用於自訂個人設定
```

**請依據文件內的說明調整 CFG 設定**

---
