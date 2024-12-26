@echo off
setlocal

:: 设置背景颜色和前景颜色（湖蓝色背景，亮白色文字）
color 3F

:: 设置终端窗口大小（80列，25行）
mode con: cols=80 lines=25

:: 设置标题和主题
title 禁止 Cisco Packet Tracer 网络连接
echo =====================================================
echo            禁止 Cisco Packet Tracer 网络连接
echo =====================================================
echo 本脚本将创建防火墙规则，禁止 Cisco Packet Tracer 的网络连接。
echo 这样就可以避免频繁的账号验证，提高使用体验。
echo.

:: 检查是否以管理员身份运行
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo 需要管理员权限，请以管理员身份重新运行此脚本。
    pause
    exit /b 1
)

:: 提示用户选择操作
echo 请选择操作:
echo 1. 创建防火墙规则
echo 2. 删除防火墙规则
set /p choice=请输入选项 (1 或 2):

if "%choice%"=="1" (
    :: 提示用户输入程序所在路径，默认路径为"C:\Program Files\Cisco Packet Tracer 8.2.2\bin\PacketTracer.exe"
    echo 默认路径为 "C:\Program Files\Cisco Packet Tracer 8.2.2\bin\PacketTracer.exe"
    echo 直接回车将使用默认路径。
    set /p programPath=请输入程序所在路径:

    :: 如果用户未输入路径，则使用默认路径
    if "%programPath%"=="" (
        set programPath=C:\Program Files\Cisco Packet Tracer 8.2.2\bin\PacketTracer.exe
    )

    :: 检查路径是否存在
    if not exist "%programPath%" (
        echo 路径不存在，请检查后重试。
        exit /b 1
    )

    :: 创建防火墙出站规则
    netsh advfirewall firewall add rule name="Cisco Packet Tracer 出站" dir=out action=block program="%programPath%" enable=yes

    :: 创建防火墙入站规则
    netsh advfirewall firewall add rule name="Cisco Packet Tracer 入站" dir=in action=block program="%programPath%" enable=yes

    echo 防火墙规则已成功创建。
) else if "%choice%"=="2" (
    :: 删除防火墙出站规则
    netsh advfirewall firewall delete rule name="Cisco Packet Tracer 出站"

    :: 删除防火墙入站规则
    netsh advfirewall firewall delete rule name="Cisco Packet Tracer 入站"

    echo 防火墙规则已成功删除。
) else (
    echo 无效选项，请重新运行脚本。
    exit /b 1
)

endlocal
pause