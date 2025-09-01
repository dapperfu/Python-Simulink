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
	@echo "  build-libraries - Build both shared and static libraries using MATLAB"
	@echo "  build-all-libs - Build all shared and static libraries from RTW source"
	@echo "  build-all-so - Build all shared libraries from RTW source"
	@echo "  build-all-static - Build all static libraries from RTW source"
	@echo "  build-example1-so - Build Example1 shared library from RTW source"
	@echo "  build-example2-so - Build Example2 shared library from RTW source"
	@echo "  build-example3-so - Build Example3 shared library from RTW source"
	@echo "  build-example1-static - Build Example1 static library from RTW source"
	@echo "  build-example2-static - Build Example2 static library from RTW source"
	@echo "  build-example3-static - Build Example3 static library from RTW source"
	@echo "  check-so-files - Check if shared libraries exist"
	@echo "  check-all-so - Check all shared libraries"
	@echo "  check-all-libs - Check all libraries (shared and static)"
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

# Build both shared (.so) and static (.a) libraries from RTW source code
build-libraries:
	@echo "Building both shared and static libraries from RTW source..."
	@if [ -f /opt/MATLAB/R2018a/bin/matlab ]; then \
		echo "Using MATLAB to build libraries..."; \
		/opt/MATLAB/R2018a/bin/matlab -nodesktop -sd ${CURDIR} -r "build_libraries; exit"; \
	elif command -v matlab &> /dev/null; then \
		echo "Using MATLAB to build libraries..."; \
		matlab -nodesktop -sd ${CURDIR} -r "build_libraries; exit"; \
	else \
		echo "MATLAB not available, using manual build process..."; \
		${MAKE} build-all-so; \
	fi
	@echo "✓ All libraries built successfully"

build-example1-so:
	@echo "Building Example1 shared library from RTW source..."
	@if [ -f Example1/dllModel_ert_shrlib_rtw/dllModel.mk ]; then \
		cd Example1/dllModel_ert_shrlib_rtw && \
		MATLAB_ROOT=/opt/MATLAB/R2018a make -f dllModel.mk || \
		echo "MATLAB build failed, using manual build..."; \
	fi
	@if [ ! -f Example1/dllModel.so ]; then \
		echo "Manual build for Example1..."; \
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
			-DUNIX \
			dllModel.c dllModel_data.c ert_main.c \
			-lm; \
	fi
	@echo "✓ Example1/dllModel.so built successfully"

build-example2-so:
	@echo "Building Example2 shared library from RTW source..."
	@if [ -f Example2/discrete_tf_ert_shrlib_rtw/discrete_tf.mk ]; then \
		cd Example2/discrete_tf_ert_shrlib_rtw && \
		MATLAB_ROOT=/opt/MATLAB/R2018a MATLAB_BIN=/opt/MATLAB/R2018a/bin MATLAB_ARCH_BIN=/opt/MATLAB/R2018a/bin/glnxa64 make -f discrete_tf.mk || \
		echo "MATLAB build failed, using manual build..."; \
	fi
	@if [ ! -f Example2/discrete_tf.so ]; then \
		echo "Manual build for Example2..."; \
		cd Example2/discrete_tf_ert_shrlib_rtw && \
		gcc -fPIC -shared -o ../discrete_tf.so \
			-I. \
			-I/opt/MATLAB/R2018a/extern/include \
			-I/opt/MATLAB/R2018a/simulink/include \
			-I/opt/MATLAB/R2018a/rtw/c/src \
			-I/opt/MATLAB/R2018a/rtw/c/src/ext_mode/common \
			-I/opt/MATLAB/R2018a/rtw/c/ert \
			-DMODEL=discrete_tf \
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
			-DUNIX \
			discrete_tf.c ert_main.c \
			-lm; \
	fi
	@echo "✓ Example2/discrete_tf.so built successfully"

build-example3-so:
	@echo "Building Example3 shared library from RTW source..."
	@if [ -f Example3/bouncing_ball_ert_shrlib_rtw/bouncing_ball.mk ]; then \
		cd Example3/bouncing_ball_ert_shrlib_rtw && \
		MATLAB_ROOT=/opt/MATLAB/R2018a make -f bouncing_ball.mk || \
		echo "MATLAB build failed, using manual build..."; \
	fi
	@if [ ! -f Example3/bouncing_ball.so ]; then \
		echo "Manual build for Example3..."; \
		cd Example3/bouncing_ball_ert_shrlib_rtw && \
		gcc -fPIC -shared -o ../bouncing_ball.so \
			-I. \
			-DMODEL=bouncing_ball \
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
			-DUNIX \
			bouncing_ball.c ert_main.c \
			-lm; \
	fi
	@echo "✓ Example3/bouncing_ball.so built successfully"

# Check if shared libraries exist
check-so-files:
	@echo "Checking for shared libraries..."
	@echo "Example1:"
	@ls -la Example1/*.so 2>/dev/null || echo "  No .so file found"
	@echo "Example2:"
	@ls -la Example2/*.so 2>/dev/null || echo "  No .so file found"
	@echo "Example3:"
	@ls -la Example3/*.so 2>/dev/null || echo "  No .so file found"

# Create virtual environment
venv:
	python3 -m venv venv
	@echo "✓ Virtual environment created"

# Install missing dependencies for examples
install-example-deps: venv
	@echo "Installing missing dependencies for examples..."
	venv/bin/pip install pandas numpy matplotlib scipy control pytest pytest-cov
	@echo "✓ Example dependencies installed"

# Build all shared libraries from RTW source
build-all-so: build-example1-so build-example2-so build-example3-so
	@echo "All shared libraries built from RTW source"

# Check all shared libraries
check-all-so: check-so-files
	@echo "All shared library checks completed"

# Build everything needed for examples
build-examples: install-example-deps check-all-so
	@echo "All examples ready"

# Build static libraries from RTW source code
build-example1-static:
	@echo "Building Example1 static library from RTW source..."
	@if [ -f Example1/dllModel_ert_shrlib_rtw/dllModel.o ]; then \
		cd Example1 && \
		ld -r -o combined.o dllModel_ert_shrlib_rtw/*.o && \
		ar rcs libdllModel.a combined.o && \
		rm combined.o; \
		echo "✓ Example1/libdllModel.a built successfully"; \
	else \
		echo "No object files found for Example1"; \
	fi

build-example2-static:
	@echo "Building Example2 static library from RTW source..."
	@if [ -f Example2/discrete_tf_ert_shrlib_rtw/discrete_tf.o ]; then \
		cd Example2 && \
		ld -r -o combined.o discrete_tf_ert_shrlib_rtw/*.o && \
		ar rcs libdiscrete_tf.a combined.o && \
		rm combined.o; \
		echo "✓ Example2/libdiscrete_tf.a built successfully"; \
	else \
		echo "No object files found for Example2"; \
	fi

build-example3-static:
	@echo "Building Example3 static library from RTW source..."
	@if [ -f Example3/bouncing_ball_ert_shrlib_rtw/bouncing_ball.o ]; then \
		cd Example3 && \
		ld -r -o combined.o bouncing_ball_ert_shrlib_rtw/*.o && \
		ar rcs libbouncing_ball.a combined.o && \
		rm combined.o; \
		echo "✓ Example3/libbouncing_ball.a built successfully"; \
	else \
		echo "No object files found for Example3"; \
	fi

# Build all static libraries
build-all-static: build-example1-static build-example2-static build-example3-static
	@echo "All static libraries built from RTW source"

# Build both shared and static libraries
build-all-libs: build-all-so build-all-static
	@echo "All libraries (shared and static) built from RTW source"

# Check all libraries
check-all-libs: check-so-files
	@echo "Checking for static libraries..."
	@echo "Example1:"
	@ls -la Example1/*.a 2>/dev/null || echo "  No .a file found"
	@echo "Example2:"
	@ls -la Example2/*.a 2>/dev/null || echo "  No .a file found"
	@echo "Example3:"
	@ls -la Example3/*.a 2>/dev/null || echo "  No .a file found"

# CI/CD tasks
ci: install lint test-all
