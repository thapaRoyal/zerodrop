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

setup_environment(){
    print_status "Setting up environment configurations..."

    if [ ! -f .env]; then
    cp .env.example .env
    print_success ".env file created from .env.example"
    print_warning "Please edit .env with your configurations"
    else
    print_warning "Environment file already exists. Skipping .env creation"
    fi
}

install_frontend(){
    print_status "Installing frontned dependencies..."
    cd frontend
    npm install
    cd ..
    print_success "Frontend dependencies installed."
}

install_backend(){
    print_status "Installing backend dependencies..."
}

build_application(){
    print_status "Building the application..."

    # Build frontend
    print_status "Building frontend..."
    cd frontend
    npm run build
    cd ..

    print_success "Application built successfully"
}

setup_development(){
    print_status "Setting up development environment..."

    check_requirements
    setup_environment
    install_frontend
    install_backend

    print_status "Development environment setup complete."
     echo ""
    echo "To start development:"
    echo "1. Terminal 1: make dev-frontend"
    echo "2. Terminal 2: make dev-backend"
    echo ""
    echo "Frontend will be available at: http://localhost:3000"
    echo "Backend will be available at: http://localhost:8080"

}

setup_production(){
    print_status "Setting up production environment..."
}


main(){
    case "${1:-dev}" in
     "dev"|"development")
     setup_development
     ;;
    "prod"|"production")
     setup_production
     ;;
    "help"|"-h"|"--help")
    echo "Usage: ${0} [dev|prod]"
    echo " "
    echo "Options:"
    echo "  dev, development  - Setup development environment (default)"
    echo "  prod, production  - Setup production environment with Docker"
    echo "  help, -h, --help  - Show this help message"
    ;;
    *)
        print_error "Invalid option. Use 'dev' for development setup or 'prod' for production setup."
 esac   
}

main "$@"