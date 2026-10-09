# ⚔️ 天神传 MUD —— 从一把剑开始

一款用 C++17 编写的**中文文字冒险（MUD）游戏**，在控制台/终端中运行。你将从一把剑开始，在神魔世界中探索地图、战斗升级、收集装备、完成主线任务，一路成长到挑战终极 Boss。

> 版本：v1.0 ｜ 体裁：文字冒险 / 角色扮演 ｜ 平台：Windows / Linux / macOS

## 🎮 开始游戏

启动后进入主菜单，选择 **`[1] ⚔️ 开始新的冒险`** 创建角色并进入游戏。

### 常用指令

| 指令 | 作用 |
| --- | --- |
| `go <方向>` 或直接输入方向（如 `go 东北`、`东北`） | 移动（支持：北/南/东/西/东北/西北/东南/西南/上/下） |
| `look` / `观察` | 查看当前区域信息 |
| `pick <物品名>` / `pick all` | 拾取物品 / 一键拾取当前区域全部物品 |
| `use <物品名>` | 使用道具 |
| `task list` | 查看可接任务 |
| `skill` | 查看技能信息 |
| `map` | 查看地图 |
| `status` | 查看角色状态 |
| `save` / `load` | 手动存档 / 读取存档（重要位置会自动存档） |
| `help` | 查看全部命令 |
| `quit` | 退出游戏 |

战斗中可在「攻击 / 技能 / 道具 / 逃跑」之间选择。

## 🏗️ 项目结构

源码按**功能模块**分目录组织：

```
TianShen-MUD/
├── src/
│   ├── core/       入口与核心框架（main / Game / GameData / CommandParser）
│   ├── ui/         界面（MainMenu / UIManager）
│   ├── character/  角色（Player / Attribute / Skills）
│   ├── combat/     战斗（CombatSystem / CommonEnemy / EvilGeneral / BossWanEshuji）
│   ├── items/      物品装备（Item / Equipment / DivineWeapon / DivineSet / ShopSystem）
│   ├── world/      地图关卡（Map / Room / NPC）
│   ├── quest/      任务系统（TaskSystem）
│   └── system/     存档系统（SaveLoadSystem）
├── Makefile                g++ 构建
├── compile.bat             Windows / MSVC 一键编译
├── VS2022_COMPILE_GUIDE.txt  Visual Studio 配置说明
└── "# Code Citations.md"   代码引用来源说明
```

## 🔨 如何编译

### 方式一：Windows + Visual Studio（推荐，本机已验证）

```bat
compile.bat
```

脚本会自动定位 MSVC 并处理 UTF-8 编码与 `NOMINMAX` 宏，成功后运行 `game.exe`。

### 方式二：g++（MinGW / Linux / macOS）

```bash
make
./game
```

> 注意：源码为 UTF-8 编码，编译时需确保编译器按 UTF-8 读取；Windows 上如用 MSVC 请务必加 `/utf-8` 与 `/DNOMINMAX`（详见 `VS2022_COMPILE_GUIDE.txt`）。

## 📜 代码引用

部分代码片段（如 `std::cin.clear()` / `std::cin.ignore(...)` 等惯用法）参考了开源仓库，详见仓库内的 `# Code Citations.md`。

---

*「this is yang's first code」* 🚀
