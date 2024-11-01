<div align="right">

**繁體中文** | [简体中文](./README.zh-CN.md) | [English](./README.en.md)

</div>

<div align="center">
    <img src="https://github.com/Yunkong-ouo/CS2Konc_CFG/blob/main/github/image/ditou.jpg" alt="image" width="600">
</div>

<h1 align="center">CS2Konc-CFG</h1>

## 💼 CS2Konc-CFG 介紹
**CS2Konc-CFG** 是一個輕量級的 CS2 CFG 項目，整合了一些常見的功能，同時提供強大的自定義選項。使用遊戲內的輪盤選單，🚀 使玩家可以在遊戲中以視覺化的方式訪問 **CS2Konc-CFG** 的功能。

**CS2Konc-CFG** 主要是為輕量設計，同時全功能都能在 `sv_cheats 0` 下運行，也包含了練圖模式在 `sv_cheats 1` 下運行，讓玩家快速熟悉地圖和道具，同樣有視覺化的方式訪問。在大多數情況下，使用 **CS2Konc-CFG** 不會導致 **VAC** 封禁。這僅僅是一個 CFG 專案。官方提供的功能👍

## ✨ 特性
- 🔥 配置迅速
- 💤 介面簡潔
- 📦 預置插件
- 🧹 優雅設計
- 🚀 快如閃電

## 📝 功能介紹
| 名字                      | 介紹                                   |
|------------------------- |----------------------------------------|
| 自動急停                  | WASD 都能快速將速度下降              |
| 跳投綁定                  | WASD 方向自動投擲與無方向投擲      |
| 空格大跳                  | 按下空白鍵自動大跳                    |
| 輪盤切道具                | 節省按鍵，只需按住綁定的鍵即可呼出輪盤，同時點按也能切換道具 |
| 狙擊槍快速切槍            | 只需按下 Q 即可快速切槍              |
| 自動洗頻                  | 內鍵洗頻文本，打字快人一步            |
| 自定義文字輸出            | 在關閉/控制台/團隊/所有/切換 CFG 的輸出 |
| 準星實用功能              | 準星跟隨相關的功能                    |
| 滾輪實用功能              | 方便設定滾輪相關設定，並可自訂滾輪相關設定 |
| 練習模式                  | 一鍵設定練習模式，並可自訂相關功能    |
| 重置 CFG 閃樂提醒         | 當你重置 CFG 會有切換介面顏色，提醒你 CFG 重置 |

## 🔥 特別說明
**！此 CFG 會覆蓋原有設置，使用之前請先備份原先 CFG 以防意外！**

## 🚀 安裝說明
下載並解壓縮文件，將 `CS2Konc_CFG` 資料夾整個拖到 CFG 資料夾，預設的相對路徑為：
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

**文字安裝**<br>
將 `resource` 文件夾內的檔案（.txt）都拖到 CS2 的 `resource` 文件夾內，預設的相對路徑為：
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

<h1>載入方式</h1>

**方式1**  
在 Steam 啟動項中添加：
```
+exec CS2Konc_CFG/CSKoncMod
```

---

**方式2**  
創建一個名為 `autoexec.cfg` 的檔案，創建在 `Counter-Strike Global Offensive\game\csgo\cfg` 裡，內容為：
```
exec CS2Konc_CFG/CSKoncMod
```
### **推薦用 autoexec.cfg 方式**

---

<h1>🖥️ 自動安裝</h1>

雙擊 **InstallCS2Konc_CFG.bat** 進行自動安裝。

## ⚙️ 相關設定
請根據文檔修改以下檔案以更新 CFG 預設設置：
```
在 config\OptPreference.cfg 和 KeyPreference.cfg
```
