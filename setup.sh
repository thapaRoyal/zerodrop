#!/bin/bash

# ZeroDrop Setup Script
# This script sets up the ZeroDrop project environment.

set -e

echo "🚀 ZeroDrop - Privacy-First P2P File Transfer"
echo "=============================================="

# colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status(){
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success(){
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning(){
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error(){
    echo -e "${RED}[ERROR]${NC} $1"
}

check_requirements(){
    print_status "Checking system requirements..."

    # Check for Node js
    if ! command -v node &> /dev/null
    then
        print_error "Node.js is not installed. Please install Node.js (version 18+ or higher)."
        exit 1
    else 
        print_status "Node.js is installed."
    fi

    # check for npm
    if ! command -v npm &> /dev/null
    then
        print_error "npm is not installed. Please install npm."
        exit 1
    else
         print_status "NPM is installed."
    fi 

    # check for go
    if ! command -v go &> /dev/null
    then
        print_error "Go is not installed. Please install Go (version 1.22+ or higher)."
        exit 1
    else
        print_status "Go is installed."
    fi

    # check docker (optional)
    if ! command -v docker &> /dev/null
    then
        print_warning "Docker is not installed. You can still run the project without Docker, but it's recommended to have it for easier setup."
    else
        print_status "Docker is installed."
    fi

   # check Docker Compose (optional)
    if ! command -v docker-compose &> /dev/null
    then
        print_warning "Docker Compose is not installed. You can still run the project without Docker Compose, but it's recommended to have it for easier setup."
    else
        print_status "Docker Compose is installed."
    fi

    print_success "System requirements check completed."
}
