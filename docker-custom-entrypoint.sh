#!/bin/sh
set -e

# Install n8n-nodes-puppeteer if not already installed
if [ ! -d "/home/node/.n8n/nodes/n8n-nodes-puppeteer" ]; then
    echo "Installing n8n-nodes-puppeteer..."
    cd /home/node/.n8n
    npm install n8n-nodes-puppeteer
fi

# Set Chromium path for Puppeteer
export PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Start n8n
exec n8n start