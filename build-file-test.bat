@echo off
echo Building Animal Friendly Mode File Test...

echo Building TypeScript (file test)...
npx tsc --project ./tsconfig.json
if errorlevel 1 (
    echo TypeScript build failed!
    pause
    exit /b 1
)

echo Copying file test entry point...
copy /Y "dist\file-test.js" "dist\index.js"
if errorlevel 1 (
    echo Failed to copy file test entry point!
    pause
    exit /b 1
)

echo Building JAR...
gradlew.bat build
if errorlevel 1 (
    echo JAR build failed!
    pause
    exit /b 1
)

echo Renaming JAR with file test suffix...
rename "build\libs\animal-friendly-mode-1.0.0.jar" "animal-friendly-mode-1.0.0-file-test.jar"
if errorlevel 1 (
    echo Failed to rename JAR!
    pause
    exit /b 1
)

echo Copying to mods directory...
copy /Y "build\libs\animal-friendly-mode-1.0.0-file-test.jar" "%APPDATA%\.minecraft\mods\"
if errorlevel 1 (
    echo Failed to copy JAR to mods directory!
    pause
    exit /b 1
)

echo.
echo ✅ Animal Friendly Mode FILE TEST build completed!
echo 📝 Check for animal-friendly-mode-test.log in mods folder
echo 📦 File test JAR: animal-friendly-mode-1.0.0-file-test.jar
echo.
pause
