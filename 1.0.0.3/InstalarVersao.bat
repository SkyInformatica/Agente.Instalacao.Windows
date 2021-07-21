@ECHO off
@CHCP 65001

set caminhoDoAppsettings=%1

if (caminhoDoAppsettings neq '') (
	echo "Não foi informado o caminho do appsettings como parametro"
	exit /b 1;
)

set versao=1.0.0.3
set nomeServico=SkyAgenteNovoProjeto%versao%
set nomeDoExecutavel=SkyInfo.Agente.Servico.Agente.exe

set caminhoDeExecucaoAtual=%cd%
pushd ..
set caminhoAnterior=%cd%
popd

copy /Y %caminhoDoAppsettings% %caminhoAnterior%/%nomeServico%/appsettings.json

sc create %nomeServico% binPath=%caminhoDeExecucaoAtual%/%versao%/Binarios/%nomeDoExecutavel% start=auto
sc description %nomeServico% "Agente de sincronização dos sistemas legado com novo projeto Sky Sistemas."
sc failure %nomeServico% reset=86400 actions=restart/180000/restart/180000/restart/180000
sc start %nomeServico%