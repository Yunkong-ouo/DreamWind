<div align="right">

[繁體中文](../README.md) | **简体中文** | [English](./README.en.md)

</div>

<div align="center">
    <img src="https://github.com/Yunkong-ouo/DreamWind/blob/main/github/image/CS2.jpg" alt="image" width="800">
</div>

<h1 align="center">DreamWind-CFG</h1>

<p align="center">
    <a href="https://github.com/Yunkong-ouo/Cs2CfgHighlighterExtension">
        <img alt="CS2 Visual Studio Code 高亮扩展" src="https://img.shields.io/badge/CS2%20VSCode%20%E9%AB%98%E4%BA%AE%E6%89%A9%E5%B1%95-blue?style=for-the-badge&logo=github">
    </a>
    <a href="https://github.com/Yunkong-ouo/DreamWind">
        <img alt="DreamWind" src="https://img.shields.io/badge/CS2%20DreamWind%20CFG-green?style=for-the-badge&logo=github">
    </a>
</p>

# 💼 DreamWind-CFG 介绍

**DreamWind-CFG** 是一个轻量级的 CS2 CFG 项目，整合了一些常见功能，同时提供强大的自定义选项。使用游戏内的轮盘菜单，🚀 让玩家可以在游戏中以可视化方式访问 **DreamWind-CFG** 的各项功能。
**DreamWind-CFG** 主要为轻量设计，其全部功能均可在 `sv_cheats 0` 下运行，同时也包含在 `sv_cheats 1` 下运行的练习模式，帮助玩家快速熟悉地图和道具，同样提供了可视化的操作方式。
在大多数情况下，使用 **DreamWind-CFG** 不会导致 **VAC** 封禁。这仅仅是一个 CFG 项目，是官方提供的功能👍。

---

## ✨ 特性
- 🔥 配置迅速
- 💤 界面简洁
- 📦 预置插件
- 🧹 优雅设计
- 🚀 快如闪电

---

# 📝 功能介绍
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

# 🔥 特别说明
**⚠️ 此 CFG 会覆盖原有设置，使用之前请先备份原有 CFG 以防意外！**

# 🚀 安装说明
从 Releases 下载并解压文件，将整个 `DreamWind` 文件夹拖入 `CFG` 文件夹中，默认的相对路径为：
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

# 🛠️ 自动安装
## 打开 `CFG main program.bat`
### 🖥️ 安装
选择「安装」即可完成 CFG 的安装。
### 🗑️ 卸载
选择「卸载」即可移除 CFG，。  
#### 进入游戏后重置
执行以下指令：
```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

# ⚒️ 手动安装
## 📃 手动放置文件
将 `resource` 文件夹内的所有文件（.txt）拖入 CS2 的 `resource` 文件夹中，默认的相对路径为：
```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

## 💿 载入方式
### 方式1
在 Steam 启动项中添加：
```
+exec DreamWind/DreamWindMod
```
---
### 方式2
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

# ⚙️ 相关设置
在 config 文件夹中包含以下文件：
```
(KeyPreference.cfg)    —— 用于自定义修改整个 CFG 的初始按键绑定设置
(OptPreference.cfg)    —— 用于自定义修改整个 CFG 的初始设置
(PersonalSettings.cfg) —— 用于自定义修改个人设置
```
**请根据文件内的说明修改 CFG 设置**

---
