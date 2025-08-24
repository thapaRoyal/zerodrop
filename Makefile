.PHONY: help install-frontend dev-frontend build clean test

# Default target
help:
	@echo "ZeroDrop - Privacy-First P2P File Transfer"
	@echo ""
	@echo "Available commands:"
	@echo "  install-frontend  - Install frontend dependencies"
	@echo "  dev-frontend      - Start frontend development server"
	@echo "  build             - Build frontend"
	@echo "  clean             - Clean frontend build artifacts"
	@echo "  test              - Run frontend tests"

# Install dependencies
install-frontend:
	@echo "Installing frontend dependencies..."
	cd frontend && npm install

# Development server
dev-frontend:
	@echo "Starting frontend development server..."
	cd frontend && npm run dev

# Build
build: install-frontend
	@echo "Building frontend..."
	cd frontend && npm run build

# Clean
clean:
	@echo "Cleaning build artifacts..."
	rm -rf frontend/.next
	rm -rf frontend/node_modules

# Test
test:
	@echo "Running tests..."
	cd frontend && npm test
