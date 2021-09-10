ECHO off
@CHCP 65001 >null

setlocal enabledelayedexpansion

FOR /f "tokens=1" %%g IN ('wmic service get name ^| find "SkyInfo.Servico.Agente"') do (
	wmic /locale:ms_409 service WHERE 'name = "%%g"' GET state /value | findstr State=Running
	if !ErrorLevel! NEQ 0 (
		sc delete %%g
	) else (
        sc stop %%g
        sc delete %%g
    )
)

rmdir /s /q "%~dp0%"