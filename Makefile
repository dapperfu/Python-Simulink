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
	@echo "  build-all-so - Build all missing shared libraries for Linux"
	@echo "  build-example1-so - Build Example1 shared library for Linux"
	@echo "  docs       - Build documentation"
	@echo "  check      - Run all checks (lint + test)"

# Install dependencies
install:
	python -m pip install --upgrade pip
	pip install -r requirements.txt
	pip install -e .[dev]

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
dev-install:
	pip install -e .[dev]

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

# Build missing shared libraries for Linux
build-example1-so:
	@echo "Building Example1 shared library for Linux..."
	@mkdir -p Example1/build
	cd Example1/dllModel_ert_shrlib_rtw && \
	gcc -fPIC -shared -o ../dllModel.so \
		-I. \
		-DMODEL=dllModel \
		-DNUMST=1 \
		-DNCSTATES=0 \
		-DHAVESTDIO \
		-DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0 \
		-DCLASSIC_INTERFACE=0 \
		-DALLOCATIONFCN=0 \
		-DTID01EQ=0 \
		-DTERMFCN=1 \
		-DONESTEPFCN=1 \
		-DMAT_FILE=0 \
		-DMULTI_INSTANCE_CODE=0 \
		-DINTEGER_CODE=0 \
		-DMT=0 \
		dllModel.c dllModel_data.c ert_main.c \
		-lm
	@echo "✓ Example1/dllModel.so built successfully"

# Build all missing shared libraries
build-all-so: build-example1-so
	@echo "All shared libraries built successfully"

# CI/CD tasks
ci: install lint test-all
