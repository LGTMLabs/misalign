.PHONY: help ci-check lint format type-check test build clean

help:
	@echo "Available targets:"
	@echo "  ci-check    - Run all CI checks (lint, type-check, test, build)"
	@echo "  lint        - Run ruff linting"
	@echo "  format      - Run ruff formatting check"
	@echo "  type-check  - Run mypy type checking"
	@echo "  test        - Run pytest with coverage"
	@echo "  build       - Build the package"
	@echo "  clean       - Remove build artifacts"

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