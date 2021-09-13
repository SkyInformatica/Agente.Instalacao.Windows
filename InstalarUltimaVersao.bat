@CHCP 65001
ECHO off

set versaoAInstalar=1.1.0.1

IF /I "%1" == "install" ( 

    copy "%~dp0\appsettings.json" "%~dp0%versaoAInstalar%\Binarios\appsettings.json"

    sc create SkyInfo.Servico.Agente.%versaoAInstalar% binPath="%~dp0%versaoAInstalar%\Binarios\SkyInfo.Agente.Servico.Agente.exe" start=delayed-auto
    sc description SkyInfo.Servico.Agente.%versaoAInstalar% "Agente de sincronização dos sistemas legado com novo projeto Sky Sistemas."
    sc failure SkyInfo.Servico.Agente.%versaoAInstalar% reset=86400 actions=restart/180000/restart/180000/restart/180000
    sc start SkyInfo.Servico.Agente.%versaoAInstalar%
)

IF /I "%1" == "uninstall" (
    sc stop SkyInfo.Servico.Agente.%versaoAInstalar%
    sc delete SkyInfo.Servico.Agente.%versaoAInstalar%
)