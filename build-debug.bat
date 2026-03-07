@echo off
echo Building Animal Friendly Mode (DEBUG VERSION)...

echo Building TypeScript (debug version)...
npx tsc --project ./tsconfig.json
if errorlevel 1 (
    echo TypeScript build failed!
    pause
    exit /b 1
)

echo Copying debug entry point...
copy /Y "dist\debug-index.js" "dist\index.js"
if errorlevel 1 (
    echo Failed to copy debug entry point!
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

echo Renaming JAR with debug suffix...
rename "build\libs\animal-friendly-mode-1.0.0.jar" "animal-friendly-mode-1.0.0-debug.jar"
if errorlevel 1 (
    echo Failed to rename JAR!
    pause
    exit /b 1
)

echo Copying to mods directory...
copy /Y "build\libs\animal-friendly-mode-1.0.0-debug.jar" "%APPDATA%\.minecraft\mods\"
if errorlevel 1 (
    echo Failed to copy JAR to mods directory!
    pause
    exit /b 1
)

echo.
echo ✅ Animal Friendly Mode DEBUG build completed!
echo 📝 Debug logs will appear in Minecraft console with [AnimalFriendlyMode] prefix
echo 🎮 Launch Minecraft to see debug output
echo 📦 Debug JAR: animal-friendly-mode-1.0.0-debug.jar
echo.
pause
