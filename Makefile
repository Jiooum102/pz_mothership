.PHONY: help services-list deploy-all deploy stop-all stop

help:
	@echo "Available targets:"
	@echo "  make services-list               # List all available services"
	@echo "  make deploy-all                  # Deploy all services"
	@echo "  make deploy SERVICES=\"a b\"      # Deploy selected services"
	@echo "  make stop-all                    # Stop all services"
	@echo "  make stop SERVICES=\"a b\"        # Stop selected services"
	@echo ""
	@echo "Examples:"
	@echo "  make deploy SERVICES=\"minio mongo\""
	@echo "  make deploy-all"

services-list:
	@./services/deploy.sh --list

deploy-all:
	@./services/deploy.sh all

deploy:
	@if [ -z "$(SERVICES)" ]; then \
		echo "SERVICES is required. Example: make deploy SERVICES=\"minio mongo\""; \
		exit 1; \
	fi
	@./services/deploy.sh $(SERVICES)

stop-all:
	@for d in ./services/*/ ; do \
		if [ -f "$$d/docker-compose.yml" ]; then \
			echo "Stopping service in $$d"; \
			( cd "$$d" && docker compose -f docker-compose.yml down ); \
		fi; \
	done

stop:
	@if [ -z "$(SERVICES)" ]; then \
		echo "SERVICES is required. Example: make stop SERVICES=\"minio mongo\""; \
		exit 1; \
	fi
	@for svc in $(SERVICES); do \
		if [ -f "./services/$$svc/docker-compose.yml" ]; then \
			echo "Stopping service: $$svc"; \
			( cd "./services/$$svc" && docker compose -f docker-compose.yml down ); \
		else \
			echo "Unknown service: $$svc"; \
			exit 1; \
		fi; \
	done
