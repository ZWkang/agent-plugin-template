#!/bin/bash
# Build script for the plugin
set -e

echo "Building Claude Plugin Template..."

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
fi

# Compile TypeScript
echo "Compiling TypeScript..."
npm run build

# Make shell scripts executable
echo "Setting permissions..."
chmod +x hooks/*.sh
chmod +x scripts/*.sh

echo "Build complete!"
