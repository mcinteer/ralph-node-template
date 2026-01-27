#!/bin/bash

# bootstrap.sh - Setup the project environment

set -e

echo "🚀 Bootstrapping project..."

# 1. Initialize Git
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
fi

# 2. Create directory structure
echo "Creating directory structure..."
mkdir -p specs tasks notes .pi scripts

# 3. Install dependencies
if [ -f package.json ]; then
    echo "Installing npm dependencies..."
    npm install
else
    echo "Creating package.json and installing markdownlint-cli..."
    npm init -y
    npm install --save-dev markdownlint-cli
fi

# 4. Ensure scripts are executable
chmod +x scripts/*.sh

echo "✅ Bootstrap complete!"
