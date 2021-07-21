@ECHO off
@CHCP 65001

set versao=1.0.0.2
set nomeServico=SkyAgenteNovoProjeto%versao%

sc stop %nomeServico%
sc delete %nomeServico%