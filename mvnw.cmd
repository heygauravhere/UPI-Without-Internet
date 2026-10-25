
@REM ----------------------------------------------------------------------------
@REM Apache Maven Wrapper startup script (Windows)
@REM
@REM First-run behavior: downloads the Maven Wrapper JAR and uses it
@REM to download the full Maven distribution.
@REM
@REM Required: Java 17 or newer on PATH (or JAVA_HOME set).
@REM ----------------------------------------------------------------------------

@echo off
title %0
setlocal

set ERROR_CODE=0

@REM Decide JVM
if not "%JAVA_HOME%"=="" goto OkJHome
set "MAVEN_JAVA_EXE=java.exe"
goto chkMHome

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" (
    set "MAVEN_JAVA_EXE=%JAVA_HOME%\bin\java.exe"
    goto chkMHome
)

echo ERROR: JAVA_HOME is set to "%JAVA_HOME%" but %%JAVA_HOME%%\bin\java.exe does not exist.
goto error

:chkMHome
set "MAVEN_PROJECTBASEDIR=%~dp0"

@REM Strip trailing backslash
if "%MAVEN_PROJECTBASEDIR:~-1%"=="\" set "MAVEN_PROJECTBASEDIR=%MAVEN_PROJECTBASEDIR:~0,-1%"

set "WRAPPER_JAR=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
set "WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain"
set "DOWNLOAD_URL=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.3.2/maven-wrapper-3.3.2.jar"

@REM Download wrapper JAR if missing
if not exist "%WRAPPER_JAR%" (
    echo Downloading Maven Wrapper from %DOWNLOAD_URL% ...
    powershell -NoProfile -Command "& { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%DOWNLOAD_URL%' -OutFile '%WRAPPER_JAR%' }"

    if not exist "%WRAPPER_JAR%" (
        echo ERROR: Failed to download Maven Wrapper.
        goto error
    )
)

@REM Run Maven Wrapper using the configured Java executable
"%MAVEN_JAVA_EXE%" ^
  %JVM_CONFIG_MAVEN_PROPS% ^
  %MAVEN_OPTS% ^
  -classpath "%WRAPPER_JAR%" ^
  "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" ^
  %WRAPPER_LAUNCHER% %*

if ERRORLEVEL 1 goto error
goto end

:error
set ERROR_CODE=1

:end
endlocal & set ERROR_CODE=%ERROR_CODE%
exit /B %ERROR_CODE%
