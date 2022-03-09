::====================================================================================================
::Script ejecutable (.bat) para borrar archivos y carpetas en (en C:\Program Files\DIgSILENT\ScriptChec) 
::y  copiar carpetas y archivos actualizados desde el servidor de APOE hacia carpeta "ScriptsChec" en 
::disco C:/ de cada computador local (C:\Program Files\DIgSILENT\ScriptChec)
::Elaboró : Cristian Camilo Marín Cano - APOE 
::=====================================================================================================
::=========================================Rutina======================================================
@echo off
:: N:\13. MODELO_SEP_Y_CONFIG_IEDs\BD INGOP\0-Base\05. Versiones BD CHEC y programas cplm\MENU_PF\UltimaVersion_ScriptChec
:: C:\Program Files\DIgSILENT\ScriptChec
set Ruta_Apoe=C:\Users\cmarinca\Desktop\DE\DESDE\FROM TO LOCAL\
set Ruta_Local=C:\Users\cmarinca\Desktop\PARA\
set archivos=*.*
set ArchiLocal=%Ruta_Local%%archivos%

if exist "%Ruta_Apoe%" (
	if exist "%Ruta_Local%" (
		del /f /s /q  "%ArchiLocal%"
		for /d  %%i in ("%ArchiLocal%") do (
			rmdir /s /q "%%i"		
		) 
		xcopy /s /c /k /y "%Ruta_Apoe%" "%Ruta_Local%"
    ) else (echo La ruta %Ruta_Local%  en computador local no existe )
 ) else (echo La ruta APOE %Ruta_Apoe% desde Servidor  no existe)
@pause
::================================= Comandos y Atributos===============================================
:: /c -> atributo para forzar el copiado  los archivos y folders %Ruta_Apoe% and exist 
:: /f -> atributo para forzar borrado de los archivos
:: /k -> atributo para conservar los atributos y propiedades de los archivos copiados
:: /q -> atributo para forzar el borrado de las carpetas sin necesidad de solicitar confirmación
:: /s -> atributo para considera subcarpetas(con su contenido)
:: /y-> atributo para sobre escribir archivos que ya se encuentran copiados
:: del comando para borrar archivos
:: cd comando para acceder al directorio o carpeta
:: rmdir comando para borrar carpetas
:: xcopy comando para copiar archivos y carpetas 