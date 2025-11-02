.PHONY: help ci-check lint format type-check test build clean version

help:
	@echo "Available targets:"
	@echo "  ci-check    - Run all CI checks (lint, type-check, test, build)"
	@echo "  lint        - Run ruff linting"
	@echo "  format      - Run ruff formatting check"
	@echo "  type-check  - Run mypy type checking"
	@echo "  test        - Run pytest with coverage"
	@echo "  build       - Build the package"
	@echo "  clean       - Remove build artifacts"
	@echo "  version     - Update version (usage: make version v=0.1.3)"

ci-check: lint format type-check test build
	@echo "✅ All CI checks passed!"

lint:
	@echo "Running ruff linting..."
	uv run ruff check .

format:
	@echo "Checking code formatting..."
	uv run ruff format --check .

type-check:
	@echo "Running type checking..."
	uv run mypy src/misalign tests

test:
	@echo "Running tests with coverage..."
	uv run pytest

build:
	@echo "Building package..."
	uv build
	@echo "Checking build artifacts..."
	ls -la dist/

clean:
	@echo "Cleaning build artifacts..."
	rm -rf dist/ build/ *.egg-info src/*.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .pytest_cache -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .mypy_cache -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name .ruff_cache -exec rm -rf {} + 2>/dev/null || true
	rm -rf htmlcov/ .coverage coverage.xml

version:
	@if [ -z "$(v)" ]; then \
		echo "Error: Please specify version with v=X.Y.Z (e.g., make version v=0.1.3)"; \
		exit 1; \
	fi
	@echo "Updating version to $(v)..."
	@# Update pyproject.toml
	@sed -i '' 's/^version = ".*"/version = "$(v)"/' pyproject.toml
	@# Update __init__.py
	@sed -i '' 's/__version__ = ".*"/__version__ = "$(v)"/' src/misalign/__init__.py
	@# Update test_version.py
	@sed -i '' 's/assert __version__ == ".*"/assert __version__ == "$(v)"/' tests/test_version.py
	@echo "Updated version to $(v) in all files"
	@echo "Updating lockfile..."
	@uv lock
	@echo "Running CI checks to verify everything works..."
	@$(MAKE) ci-check
	@echo "✅ Version updated to $(v) and all checks passed!"
	@echo ""
	@echo "Next steps:"
	@echo "  1. Commit changes: git add -A && git commit -m 'Bump version to $(v)'"
	@echo "  2. Create tag: git tag v$(v)"
	@echo "  3. Push: git push && git push --tags"
	@echo "  4. Create GitHub release with tag v$(v) to publish to PyPI"