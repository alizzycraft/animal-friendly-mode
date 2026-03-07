#!/bin/bash

echo "Building Animal Friendly Mode..."
tsc --project ./tsconfig.json
if [ $? -ne 0 ]; then
    echo "TypeScript build failed!"
    exit 1
fi

./gradlew build
if [ $? -ne 0 ]; then
    echo "Animal Friendly Mode build failed!"
    exit 1
fi

echo "Animal Friendly Mode built successfully!"
