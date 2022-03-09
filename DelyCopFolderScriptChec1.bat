::====================================================================================================
::Código simple (.bat) para borrar archivos y carpetas en (en C:\Program Files\DIgSILENT\ScriptChec) 
::y  copiar carpetas y archivos actualizados desde el servidor de APOE hacia carpeta "ScriptsChec" en 
::disco C:/ de cada computador local (C:\Program Files\DIgSILENT\ScriptChec)
::Elaboró : Cristian Camilo Marín Cano - APOE 
::=====================================================================================================
::=========================================Rutina======================================================
@echo off
del /f /s /q C:\Users\cmarinca\Desktop\Scripts\*.*
cd C:\Program Files\DIgSILENT\ScriptChec
for /d %%D in (*) do (rmdir /s /q "%%D") 
xcopy /s /c /k /y "\\chec-nsp27\EMPRESA\APOE\13. MODELO_SEP_Y_CONFIG_IEDs\BD INGOP\0-Base\05. Versiones BD CHEC y programas cplm\MENU_PF\20220217_ScriptChec (desarrollo)" "C:\Program Files\DIgSILENT\ScriptChec"
@pause
::================================= Comandos y Atributos===============================================

:: /c -> atributo para forzar el copiado  los archivos y folders
:: /f -> atributo para forzar borrado de los archivos
:: /k -> atributo para conservar los atributos y propiedades de los archivos copiados
:: /q -> atributo para forzar el borrado de las carpetas sin necesidad de solicitar confirmación
:: /s -> atributo para considera subcarpetas(con su contenido)
:: /y-> atributo para sobre escribir archivos que ya se encuentran copiados
:: del comando para borrar archivos
:: cd comando para acceder al directorio o carpeta
:: xcopy comando para copiar archivos y carpetas 