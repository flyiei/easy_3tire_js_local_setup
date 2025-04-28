#!/bin/bash

# Exit on any error
set -e

echo "========================================"
echo "Three-Tier Microservices Demo Setup"
echo "========================================"
echo "This script will set up a containerized development environment."
echo "No need to install Node.js or Java locally - everything runs in containers!"
echo "========================================"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
  echo "ERROR: Docker is not installed or not in PATH."
  echo "Please install Docker from https://docs.docker.com/get-docker/"
  exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker compose &> /dev/null; then
  echo "ERROR: Docker Compose is not installed or not in PATH."
  echo "Docker Compose is included with Docker Desktop for Mac and Windows"
  echo "For Linux, see: https://docs.docker.com/compose/install/"
  exit 1
fi

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