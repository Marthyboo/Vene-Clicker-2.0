@echo off
setlocal EnableDelayedExpansion

call mvn clean package
if %ERRORLEVEL% NEQ 0 goto BuildFailed

echo Cleaning up folders...
pushd target
for /d %%i in (*) do rd /s /q "%%i"
del /q original-*.jar
popd
if exist "dependency-reduced-pom.xml" del /q "dependency-reduced-pom.xml"

echo Building Launcher Executable...
set "CSC="

if exist "%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe" (
    set "CSC=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
    goto FoundCSC
)

:FoundCSC
if not defined CSC (
    echo Could not find C# compiler. Skipping launcher build.
    goto Finalize
)

echo Found C# compiler at: !CSC!
"!CSC!" /target:winexe /out:target\VeneClicker.exe /win32icon:launcher\app.ico /r:System.Windows.Forms.dll launcher\Launcher.cs
echo Launcher created: target\VeneClicker.exe

:Finalize
echo Done. The final JAR and EXE are in the target folder.
goto :EOF

:BuildFailed
echo Maven build failed. Exiting.
exit /b 1
