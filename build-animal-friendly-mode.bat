@echo off
echo Building Animal Friendly Mode...
npx tsc --project ./tsconfig.json
if errorlevel 1 (
    echo TypeScript build failed!
    pause
    exit /b 1
)

gradlew.bat build
if errorlevel 1 (
    echo Animal Friendly Mode build failed!
    pause
    exit /b 1
)

echo Animal Friendly Mode built successfully!
