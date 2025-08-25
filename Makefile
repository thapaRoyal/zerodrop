.PHONY: help install-frontend install-backend dev-frontend dev-backend build clean test

# Default target
help:
	@echo "ZeroDrop - Privacy-First P2P File Transfer"
	@echo ""
	@echo "Available commands:"
	@echo "  install-frontend  - Install frontend dependencies"
	@echo "  install-backend   - Install backend dependencies"
	@echo "  dev-frontend      - Start frontend development server"
	@echo "  dev-backend       - Start backend development server"
	@echo "  build             - Build frontend and backend"
	@echo "  clean             - Clean build artifacts"

# Install dependencies
install-frontend:
	@echo "Installing frontend dependencies..."
	cd frontend && npm install

install-backend:
	@echo "Installing backend dependencies..."
	cd backend && go mod tidy

# Development server
dev-frontend:
	@echo "Starting frontend development server..."
	cd frontend && npm run dev

dev-backend:
	@echo "Starting backend development server..."
	cd backend && go run cmd/server/main.go

# Build
build: install-frontend install-backend
	@echo "Building frontend..."
	cd frontend && npm run build

	@echo "Building backend..."
	cd backend && go build -o bin/server ./cmd/server

# Clean
clean:
	@echo "Cleaning build artifacts..."
	rm -rf frontend/.next
	rm -rf frontend/node_modules
	rm -rf backend/bin
