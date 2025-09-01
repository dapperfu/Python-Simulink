# Python-Simulink Makefile
# This Makefile provides common development tasks

.PHONY: help install test lint clean build docs

# Default target
help:
	@echo "Python-Simulink Development Commands:"
	@echo "  install    - Install dependencies"
	@echo "  test       - Run all tests"
	@echo "  lint       - Run linting checks"
	@echo "  clean      - Clean build artifacts"
	@echo "  build      - Build the package"
	@echo "  check-so-files - Check if shared libraries exist"
	@echo "  check-all-so - Check all shared libraries"
	@echo "  build-examples - Build everything needed for examples"
	@echo "  install-example-deps - Install missing dependencies for examples"
	@echo "  docs       - Build documentation"
	@echo "  check      - Run all checks (lint + test)"

# Install dependencies
install: venv
	venv/bin/python -m pip install --upgrade pip
	venv/bin/pip install -r requirements.txt
	venv/bin/pip install -e .[dev]

# Run tests
test:
	@echo "Running tests..."
	cd Example2 && python -m pytest tests/ -v
	python test_all_examples.py

# Run linting
lint:
	@echo "Running linting checks..."
	flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
	flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
	black --check .
	mypy .

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf __pycache__/
	rm -rf .pytest_cache/
	rm -rf Example1/build/
	rm -f Example1/dllModel.so
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

# Build the package
build: clean
	@echo "Building package..."
	python -m build

# Build documentation
docs:
	@echo "Building documentation..."
	# Add documentation build commands here when docs are added

# Run all checks
check: lint test

# Install development dependencies
dev-install: venv
	venv/bin/pip install -e .[dev]

# Run security checks
security:
	@echo "Running security checks..."
	# Add security scanning commands here

# Format code
format:
	@echo "Formatting code..."
	black .
	isort .

# Type checking
type-check:
	@echo "Running type checks..."
	mypy .

# Run the comprehensive test suite
test-all:
	@echo "Running comprehensive test suite..."
	python test_all_examples.py
	cd Example2 && python -m pytest tests/ -v --cov=discretetf --cov-report=html

# Check for pre-built libraries
check-libs:
	@echo "Checking for pre-built libraries..."
	@echo "Example1:"
	@ls -la Example1/*.dll Example1/*.so 2>/dev/null || echo "No pre-built libraries found"
	@echo "Example2:"
	@ls -la Example2/*.dll Example2/*.so 2>/dev/null || echo "No pre-built libraries found"
	@echo "Example3:"
	@ls -la Example3/*.dll Example3/*.so 2>/dev/null || echo "No pre-built libraries found"

# Validate Python files
validate:
	@echo "Validating Python files..."
	python -m py_compile Example1/rtwtypes.py
	python -m py_compile Example2/rtwtypes.py
	python -m py_compile Example2/discretetf.py
	python -m py_compile Example3/rtwtypes.py
	python -m py_compile test_all_examples.py
	@echo "All Python files compile successfully!"

# Check if shared libraries exist (they should be pre-built from _ert_shrlib_rtw source)
check-so-files:
	@echo "Checking for pre-built shared libraries..."
	@echo "Example1:"
	@ls -la Example1/*.so 2>/dev/null || echo "  No .so file found"
	@echo "Example2:"
	@ls -la Example2/*.so 2>/dev/null || echo "  No .so file found"
	@echo "Example3:"
	@ls -la Example3/*.so 2>/dev/null || echo "  No .so file found"
	@echo ""
	@echo "Note: .so files should be built from _ert_shrlib_rtw source code using MATLAB/Simulink"
	@echo "The source code is available in each example's _ert_shrlib_rtw directory"

# Create virtual environment
venv:
	python3 -m venv venv
	@echo "✓ Virtual environment created"

# Install missing dependencies for examples
install-example-deps: venv
	@echo "Installing missing dependencies for examples..."
	venv/bin/pip install pandas numpy matplotlib scipy control pytest pytest-cov
	@echo "✓ Example dependencies installed"

# Check all shared libraries
check-all-so: check-so-files
	@echo "All shared library checks completed"

# Build everything needed for examples
build-examples: install-example-deps check-all-so
	@echo "All examples ready"

# CI/CD tasks
ci: install lint test-all
