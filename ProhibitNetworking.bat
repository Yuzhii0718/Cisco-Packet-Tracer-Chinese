@echo off
setlocal

:: ���ñ�����ɫ��ǰ����ɫ������ɫ����������ɫ���֣�
color 3F

:: �����ն˴��ڴ�С��80�У�25�У�
mode con: cols=80 lines=25

:: ���ñ��������
title ��ֹ Cisco Packet Tracer ��������
echo =====================================================
echo            ��ֹ Cisco Packet Tracer ��������
echo =====================================================
echo ���ű�����������ǽ���򣬽�ֹ Cisco Packet Tracer ���������ӡ�
echo �����Ϳ��Ա���Ƶ�����˺���֤�����ʹ�����顣
echo.

:: ����Ƿ��Թ���Ա�������
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo ��Ҫ����ԱȨ�ޣ����Թ���Ա����������д˽ű���
    pause
    exit /b 1
)

:: ��ʾ�û�ѡ�����
echo ��ѡ�����:
echo 1. ��������ǽ����
echo 2. ɾ������ǽ����
set /p choice=������ѡ�� (1 �� 2):

if "%choice%"=="1" (
    :: ��ʾ�û������������·����Ĭ��·��Ϊ"C:\Program Files\Cisco Packet Tracer 8.2.2\bin\PacketTracer.exe"
    echo Ĭ��·��Ϊ "C:\Program Files\Cisco Packet Tracer 8.2.2\bin\PacketTracer.exe"
    echo ֱ�ӻس���ʹ��Ĭ��·����
    set /p programPath=�������������·��:

    :: ����û�δ����·������ʹ��Ĭ��·��
    if "%programPath%"=="" (
        set programPath=C:\Program Files\Cisco Packet Tracer 8.2.2\bin\PacketTracer.exe
    )

    :: ���·���Ƿ����
    if not exist "%programPath%" (
        echo ·�������ڣ���������ԡ�
        exit /b 1
    )

    :: ��������ǽ��վ����
    netsh advfirewall firewall add rule name="Cisco Packet Tracer ��վ" dir=out action=block program="%programPath%" enable=yes

    :: ��������ǽ��վ����
    netsh advfirewall firewall add rule name="Cisco Packet Tracer ��վ" dir=in action=block program="%programPath%" enable=yes

    echo ����ǽ�����ѳɹ�������
) else if "%choice%"=="2" (
    :: ɾ������ǽ��վ����
    netsh advfirewall firewall delete rule name="Cisco Packet Tracer ��վ"

    :: ɾ������ǽ��վ����
    netsh advfirewall firewall delete rule name="Cisco Packet Tracer ��վ"

    echo ����ǽ�����ѳɹ�ɾ����
) else (
    echo ��Чѡ����������нű���
    exit /b 1
)

endlocal
pause