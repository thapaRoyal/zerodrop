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
print_color(){
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

