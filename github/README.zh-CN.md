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

**DreamWind-CFG** 是一款轻量级的 CS2 CFG 项目，整合多种实用功能，并提供个性化设置。
通过游戏内的轮盘菜单，🚀 可自由调整 **DreamWind-CFG** 的各项功能。

✅ **此 CFG 完全基于官方功能，不会导致 VAC 封锁。**

---

## ✨ 特色

- 🔥 快速配置
- 💤 简洁界面
- 📦 预设插件
- 🧹 优雅设计
- 🚀 反应迅速

---

# 📝 功能介绍

| 名称              | 介绍                                                      |
| ----------------- | --------------------------------------------------------- |
| 移动方式          | 内含 3 种移动方式                                         |
| 跳投绑定          | 根据 WASD 方向自动进行投掷或无方向投掷                    |
| 空格键大跳        | 按下空格键自动执行大跳                                    |
| 开枪取消拆包      | 按下开火键时自动取消拆包，松开后继续拆包                  |
| 轮盘切换道具      | 节省按键，长按绑定键即可呼出轮盘，单击亦可切换道具        |
| 狙击枪快速切枪    | 只需按下 Q 键即可快速切换至狙击枪                         |
| 自动刷屏          | 内建刷屏文字，让你输入信息快人一步                        |
| 自定义文字输出    | 可自定义关闭、控制台、队伍、所有人或切换 CFG 时的文字输出 |
| 准星实用功能      | 提供准星跟随等相关功能                                    |
| 滚轮实用功能      | 方便设置并自定义滚轮相关功能                              |
| 自动连跳          | 按下空格键自动实现连续跳跃                                |
| 静步缩放小地图    | 静步时可自动放大或缩小小地图                              |
| 重置 CFG 提示效果 | 重置 CFG 时切换界面颜色以提示已重置                       |
| 手枪快速射击      | 使用手枪时长按开火键可快速射击                            |
| 自动道具          | 可一键定位道具瞄准点                                      |

---

# 🔥 特别说明

**⚠️ 此 CFG 会覆盖原有设置，使用前请先备份原有 CFG 以防意外！**

---

# 🚀 安装说明

从 Releases 下载并解压缩文件，将整个 `DreamWind` 文件夹拖入 `CFG` 文件夹内，默认的相对路径为：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

---

# 🛠️ CFG 主程序

## 打开 `CFG main program.bat`

该程序用于安装和设置 CFG，确保最佳运行效果。

### 🖥️ 安装

选择「安装」即可完成 CFG 的安装。

### 🗑️ 卸载

选择「卸载」即可移除 CFG。

#### 进入游戏后重置

执行以下指令：

```
bind mouse_x yaw;bind mouse_y pitch;unbindall;binddefaults;binddefaults;joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt;host_writeconfig
```

---

# ⚒️ 手动安装

## 📃 手动放置文件

将 `resource` 文件夹内的所有文件（.txt）拖入 CS2 的 `resource` 文件夹，默认的相对路径为：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\resource
```

---

## 💿 载入方式

### 方式 1

在 Steam 启动选项中新增：

```
+exec DreamWind/DreamWindMod
```

---

### 方式 2（推荐）

创建一个名为 `autoexec.cfg` 的文件，并放置于默认的相对路径下：

```
*\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg
```

文件内容如下：

```
exec DreamWind/DreamWindMod
```

---

# ⚙️ 相关设置

在 `config` 文件夹中包含以下文件：

```
(KeyPreference.cfg)    —— 用于自定义整个 CFG 的初始按键绑定设置
(OptPreference.cfg)    —— 用于自定义整个 CFG 的初始设置
(PersonalSettings.cfg) —— 用于自定义个人设置
```

**请根据文件内的说明调整 CFG 设置**

---
