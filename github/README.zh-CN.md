<div align="right">

[繁體中文](../README.md) | **简体中文** | [English](./README.en.md)

</div>

<div align="center">
    <img src="https://github.com/Yunkong-ouo/CS2Konc_CFG/blob/main/github/image/CS2.jpg" alt="image" width="800">
</div>

<h1 align="center">CS2Konc-CFG</h1>

<p align="center">
    <a href="https://github.com/Yunkong-ouo/Cs2CfgHighlighterExtension">
        <img alt="CS2 Visual Studio Code 高亮扩展" src="https://img.shields.io/badge/CS2%20VSCode%20%E9%AB%98%E4%BA%AE%E6%89%A9%E5%B1%95-blue?style=for-the-badge&logo=github">
    </a>
    <a href="https://github.com/Yunkong-ouo/CS2Konc_CFG">
        <img alt="CS2Konc_CFG" src="https://img.shields.io/badge/CS2%20Konc%20CFG-green?style=for-the-badge&logo=github">
    </a>
</p>

## 💼 CS2Konc-CFG 介绍
**CS2Konc-CFG** 是一个轻量级的 CS2 CFG 项目，整合了一些常见的功能，同时提供强大的自定义选项。使用游戏内的轮盘选单，🚀 使玩家可以在游戏中以视觉化的方式访问 **CS2Konc-CFG** 的功能。

**CS2Konc-CFG** 主要是为轻量设计，同时全功能都能在 `sv_cheats 0` 下运行，也包含了练图模式在 `sv_cheats 1` 下运行，让玩家快速熟悉地图和道具，同样有视觉化的方式访问。

在大多数情况下，使用 **CS2Konc-CFG** 不会导致 **VAC** 封禁。这仅仅是一个 CFG 项目。官方提供的功能👍

## ✨ 特性
- 🔥 配置迅速
- 💤 界面简洁
- 📦 预置插件
- 🧹 优雅设计
- 🚀 快如闪电

## 📝 功能介绍
| 名字                      | 介绍                                   |
|------------------------- |----------------------------------------|
| 自动急停                  | WASD 都能快速将速度下降
| 跳投绑定                  | WASD 方向自动投掷与无方向投掷
| 空格大跳                  | 按下空白键自动大跳
| 开枪取消拆包              | 当你按下开火键自动取消拆包松开继续拆包
| 轮盘切道具                | 节省按键，只需按住绑定的键即可呼出轮盘，同时点按也能切换道具
| 狙击枪快速切枪            | 只需按下 Q 即可快速切枪
| 自动洗频                  | 内键洗频文本，打字快人一步
| 自定义文字输出            | 在关闭/控制台/团队/所有/切换 CFG 的输出
| 准星实用功能              | 准星跟随相关的功能
| 滚轮实用功能              | 方便设置滚轮相关设置，并可自定义滚轮相关设置
| 练习模式                  | 一键设置练习模式，并可自定义相关功能
| 自动连跳                  | 按下空格键自动跳跃  
| 静步缩放小地图            | 当你静步的时候可以自动放大缩小
| 重置 CFG 闪乐提醒         | 当你重置 CFG 会有切换界面颜色，提醒你 CFG 重置

## 🔥 特别说明
**！此 CFG 会覆盖原有设置，使用之前请先备份原先 CFG 以防意外！**

## 🚀 安装说明
到 Releases 里下载并解压缩文件，将 `CS2Konc_CFG` 文件夹整个拖到 `CFG` 文件夹，默认的相对路径为：
```
*Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

**文字安装**<br>
将 `resource` 文件夹内的文件（.txt）都拖到 CS2 的 `resource` 文件夹内，默认的相对路径为：
```
*Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

<h1>💿载入方式</h1>

**方式1**  
在 Steam 启动项中添加：
```
+exec CS2Konc_CFG/CSKoncMod
```

---

**方式2**  
创建一个名为 `autoexec.cfg` 的文件，创建在 `Counter-Strike Global Offensive\game\csgo\cfg` 里，内容为：
```
exec CS2Konc_CFG/CSKoncMod
```
### **推荐使用 autoexec.cfg 方式**

---

## 🖥️ 自动安装

双击 **InstallCS2Konc_CFG.bat** 进行自动安装（CS2Konc_CFG）

## 🗑️ 卸载

双击 **UninstallCS2Konc_CFG.bat** 卸载（CS2Konc_CFG）

## ⚙️ 相关设置
在 config 文件夹里有：
```
(KeyPreference.cfg)，自定义修改整个 CFG 初始绑定按键设置  
(OptPreference.cfg)，自定义修改整个 CFG 初始设置  
(PersonalSettings.cfg)，自定义修改个人设置  
请按照文本修改 CFG 设置
```
