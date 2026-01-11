@echo off
call mvn clean package
if %ERRORLEVEL% EQU 0 (
    echo Cleaning up folders...
    pushd target
    for /d %%i in (*) do rd /s /q "%%i"
    del /q original-*.jar
    popd
    if exist "dependency-reduced-pom.xml" del /q "dependency-reduced-pom.xml"
    
    echo Building Launcher Executable...
    for /r "%WINDIR%\Microsoft.NET\Framework64" %%i in (csc.exe) do set "CSC=%%i"
    if defined CSC (
        "%CSC%" /target:winexe /out:target\VeneClicker.exe /win32icon:launcher\app.ico /r:System.Windows.Forms.dll launcher\Launcher.cs
        echo Launcher created: target\VeneClicker.exe
    ) else (
        echo Could not find C# compiler (csc.exe). Skipping launcher build.
    )

    echo Done. The final JAR and EXE are in the target folder.
)
