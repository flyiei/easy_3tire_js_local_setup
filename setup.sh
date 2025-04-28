#!/bin/bash

# Exit on any error
set -e

echo "========================================"
echo "Three-Tier Microservices Demo Setup"
echo "========================================"

# Define repository URLs
API_REPO="git@github.com:flyiei/easy_3tire_js_api.git"
FRONTEND_REPO="git@github.com:flyiei/easy_3tire_js_frontend.git"
SPRINGBOOT_REPO="git@github.com:flyiei/easy_3tire_springboot_api.git"

# Clone repositories if they don't exist
echo "Cloning repositories..."

if [ ! -d "easy_3tire_js_api" ]; then
  echo "Cloning API repository..."
  git clone $API_REPO
else
  echo "API repository already exists."
fi

if [ ! -d "easy_3tire_js_frontend" ]; then
  echo "Cloning Frontend repository..."
  git clone $FRONTEND_REPO
else
  echo "Frontend repository already exists."
fi

if [ ! -d "easy_3tire_springboot_api" ]; then
  echo "Cloning Spring Boot API repository..."
  git clone $SPRINGBOOT_REPO
else
  echo "Spring Boot API repository already exists."
fi

echo "All repositories cloned successfully."

# Check if Tilt is installed
if ! command -v tilt &> /dev/null; then
  echo "ERROR: Tilt is not installed."
  echo "Please install Tilt from https://docs.tilt.dev/install.html"
  exit 1
fi

# Start the services using Tilt
echo "========================================"
echo "Starting services with Tilt..."
echo "========================================"
echo "The Tilt UI will be available at http://localhost:10350/"
echo "The frontend will be available at http://localhost:8080/"
echo "The Node.js API will be available at http://localhost:3000/"
echo "The Spring Boot API will be available at http://localhost:8081/"
echo "========================================"

# Run Tilt
tilt up

echo "Setup complete!" 