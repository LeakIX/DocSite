.PHONY: help prettify check-prettify fix-trailing-whitespace check-trailing-whitespace build serve test install-deps clean

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2}'

prettify: ## Format files with Prettier (includes markdown wrapping at 80 chars)
	@if [ -f package.json ]; then \
		npx prettier --write \
			'content/**/*.md' \
			'*.{json,md}' \
			'.github/**/*.yml' \
			--ignore-path .prettierignore || true; \
	else \
		echo "package.json not found. Run 'npm install' first."; \
	fi

check-prettify: ## Check if files are formatted with Prettier
	@echo "Checking code formatting..."
	@if [ -f package.json ]; then \
		npx prettier --check \
			'content/**/*.md' \
			'*.{json,md}' \
			'.github/**/*.yml' \
			--ignore-path .prettierignore; \
	else \
		echo "package.json not found. Run 'npm install' first."; \
		exit 1; \
	fi

fix-trailing-whitespace: ## Fix trailing whitespace in all files
	@echo "Fixing trailing whitespace..."
	@find . -type f \( -name "*.md" -o -name "*.html" -o -name "*.scss" \
		-o -name "*.css" -o -name "*.js" -o -name "*.json" \
		-o -name "*.toml" -o -name "*.yml" -o -name "*.yaml" \
		-o -name "*.go" -o -name "*.sh" \) \
		-not -path "./node_modules/*" \
		-not -path "./.git/*" \
		-not -path "./public/*" \
		-not -path "./resources/*" \
		-exec sed -i 's/[[:space:]]*$$//' {} +
	@echo "Trailing whitespace fixed!"

check-trailing-whitespace: ## Check for trailing whitespace in all files
	@echo "Checking for trailing whitespace..."
	@! find . -type f \( -name "*.md" -o -name "*.html" -o -name "*.scss" \
		-o -name "*.css" -o -name "*.js" -o -name "*.json" \
		-o -name "*.toml" -o -name "*.yml" -o -name "*.yaml" \
		-o -name "*.go" -o -name "*.sh" \) \
		-not -path "./node_modules/*" \
		-not -path "./.git/*" \
		-not -path "./public/*" \
		-not -path "./resources/*" \
		-exec grep -l '[[:space:]]$$' {} + || \
		(echo "✓ No trailing whitespace found" && exit 0)

build: ## Build the Hugo site
	@echo "Building Hugo site..."
	@hugo --gc --minify
	@echo "✓ Build complete!"

serve: ## Serve the site locally
	@echo "Starting Hugo server..."
	@hugo server --buildDrafts --disableFastRender

test: ## Run all checks
	@echo "Running all checks..."
	@$(MAKE) check-trailing-whitespace
	@$(MAKE) check-prettify
	@$(MAKE) build
	@echo "✓ All checks passed!"

install-deps: ## Install npm dependencies
	@echo "Installing dependencies..."
	@npm install
	@echo "✓ Dependencies installed!"

clean: ## Clean build artifacts
	@echo "Cleaning build artifacts..."
	@rm -rf public resources node_modules
	@echo "✓ Clean complete!"
