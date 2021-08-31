ECHO off
@CHCP 65001

set NomeServico=SkyInfo.Servico.Agente.

for /d %%a in (*) do (
  if %%a NEQ git (
    set ErrorLevel="5"
    sc query SkyInfo.Servico.Agente.%%a | findstr /i running
    if %ErrorLevel% EQU 0 (
      echo SkyInfo.Servico.Agente.%%a Running  ERRO:  %ErrorLevel%
    ) else (
    echo SkyInfo.Servico.Agente.%%a Not running ERRO:  %ErrorLevel%
    )

)
)
