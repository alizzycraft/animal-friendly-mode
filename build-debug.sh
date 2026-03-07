#!/bin/bash

echo "Building Animal Friendly Mode (DEBUG VERSION)..."

echo "Building TypeScript (debug version)..."
npx tsc --project ./tsconfig.json
if [ $? -ne 0 ]; then
    echo "TypeScript build failed!"
    exit 1
fi

echo "Copying debug entry point..."
cp -f "dist/debug-index.js" "dist/index.js"
if [ $? -ne 0 ]; then
    echo "Failed to copy debug entry point!"
    exit 1
fi

echo "Building JAR..."
./gradlew build
if [ $? -ne 0 ]; then
    echo "JAR build failed!"
    exit 1
fi

echo "Renaming JAR with debug suffix..."
mv -f "build/libs/animal-friendly-mode-1.0.0.jar" "build/libs/animal-friendly-mode-1.0.0-debug.jar"
if [ $? -ne 0 ]; then
    echo "Failed to rename JAR!"
    exit 1
fi

echo "Copying to mods directory..."
cp -f "build/libs/animal-friendly-mode-1.0.0-debug.jar" "$HOME/.minecraft/mods/"
if [ $? -ne 0 ]; then
    echo "Failed to copy JAR to mods directory!"
    exit 1
fi

echo ""
echo "✅ Animal Friendly Mode DEBUG build completed!"
echo "📝 Debug logs will appear in Minecraft console with [AnimalFriendlyMode] prefix"
echo "🎮 Launch Minecraft to see debug output"
echo "📦 Debug JAR: animal-friendly-mode-1.0.0-debug.jar"
echo ""
