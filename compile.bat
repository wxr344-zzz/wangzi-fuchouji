@echo off
rem ============================================================
rem 天神传 MUD - Windows 编译脚本（使用 Visual Studio 的 MSVC）
rem
rem 前置要求：已安装 Visual Studio 2022（含 C++ 桌面开发工具链）
rem 说明：源码为 UTF-8 编码，须加 /utf-8；windows.h 与 std::max
rem       冲突，须加 /DNOMINMAX
rem ============================================================
cd /d "%~dp0"

set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if exist "%VSWHERE%" (
    for /f "usebackq delims=" %%i in (`"%VSWHERE%" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do set "VSROOT=%%i"
)

if not defined VSROOT (
    echo [错误] 未找到 Visual Studio C++ 工具链，请安装 VS2022 并勾选"C++ 桌面开发"。
    pause
    exit /b 1
)

call "%VSROOT%\VC\Auxiliary\Build\vcvars64.bat" >nul

echo 正在编译天神传 MUD ...
cl /nologo /EHsc /std:c++17 /utf-8 /DNOMINMAX /D_CRT_SECURE_NO_WARNINGS ^
   /Isrc /Isrc\core /Isrc\ui /Isrc\character /Isrc\combat /Isrc\items /Isrc\world /Isrc\quest /Isrc\system ^
   src\core\*.cpp src\ui\*.cpp src\character\*.cpp src\combat\*.cpp src\items\*.cpp src\world\*.cpp src\quest\*.cpp src\system\*.cpp ^
   /Fe:game.exe

if %errorlevel% equ 0 (
    echo 编译成功！运行 game.exe 开始游戏。
) else (
    echo 编译失败，请检查上方错误信息。
    pause
)
