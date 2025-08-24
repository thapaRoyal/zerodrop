.PHONY: help

help:
	@echo "ZeroDrop - Privacy first p2p file transfer"
	@echo " "
	@echo "Available commands:"
	@echo "  install-frontend     - Install Frontned Dependencies"
	@echo "  dev-frontend         - Run Frontend development server"

	
install-frontned:
	@echo "Installing Frontend Dependencies..."
	cd frontend && npm install

dev-frontend:
	@echo "Starting Frontend development server..."
	cd frontend && npm run dev