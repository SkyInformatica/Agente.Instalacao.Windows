@ECHO off
@CHCP 65001

set versaoAnterior=1.0.0.2
set versao=1.0.0.6
set nomeServico=SkyInfo.Agente.Servico.Agente
set nomeDoExecutavel=SkyInfo.Agente.Servico.Agente.exe

cd ..

copy /Y %versaoAnterior%\binarios\appsettings.json %versao%\binarios\appsettings.json

sc create %nomeServico% binPath=%cd%\%versao%\Binarios\%nomeDoExecutavel% start=auto
sc description %nomeServico% "Agente de sincronização dos sistemas legado com novo projeto Sky Sistemas."
sc failure %nomeServico% reset=86400 actions=restart/180000/restart/180000/restart/180000
sc start %nomeServico%