@CHCP 65001

set versaoAInstalar=1.0.0.2
set appSettingsEmTexto=%1
set pastaTemporarioParaSalvarOAppsettings=%temp%/sky/agente/
set caminhoTemporarioParaSalvarOAppsettings=%pastaTemporarioParaSalvarOAppsettings%/appSettings.json

appSettingsEmTexto > %caminhoTemporarioParaSalvarOAppsettings%

%versaoAInstalar%/InstalarVersao %versaoAInstalar% %caminhoTemporarioParaSalvarOAppsettings%

del %caminhoTemporarioParaSalvarOAppsettings%