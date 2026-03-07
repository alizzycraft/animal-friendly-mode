@echo off
echo Building Animal Friendly Mode Basic Test...

echo Building with Gradle (includes TypeScript compilation)...
gradlew.bat clean build
if errorlevel 1 (
    echo Gradle build failed!
    pause
    exit /b 1
)

echo Renaming JAR with basic test suffix...
move "build\libs\animal-friendly-mode-1.0.0.jar" "build\libs\animal-friendly-mode-1.0.0-basic.jar"
if errorlevel 1 (
    echo Failed to rename JAR!
    pause
    exit /b 1
)

echo Copying Animal Friendly Mode JAR to mods directory...
powershell -Command "Copy-Item 'build\libs\animal-friendly-mode-1.0.0-basic.jar' '$env:APPDATA\.minecraft\mods\' -Force"
if errorlevel 1 (
    echo Failed to copy Animal Friendly Mode JAR to mods directory!
    pause
    exit /b 1
)

echo Copying Tapestry JAR to mods directory...
powershell -Command "Copy-Item 'libs\tapestry-0.3.0-alpha.jar' '$env:APPDATA\.minecraft\mods\' -Force"
if errorlevel 1 (
    echo Failed to copy Tapestry JAR to mods directory!
    pause
    exit /b 1
)

echo.
echo ✅ Animal Friendly Mode BASIC TEST build completed!
echo 🔥 Look for "Animal Friendly Mode loaded successfully!" in console
echo 📦 Animal Friendly Mode JAR: animal-friendly-mode-1.0.0-basic.jar
echo 📦 Tapestry JAR: tapestry-0.3.0-alpha.jar
echo.
pause
