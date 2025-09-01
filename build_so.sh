#!/bin/bash
# Build script for .so files from _ert_shrlib_rtw source code

MATLAB_ROOT="/opt/MATLAB/R2018a"

build_example() {
    local example_name=$1
    local example_dir="Example${2}"
    local rtw_dir="${example_dir}/${example_name}_ert_shrlib_rtw"
    local so_file="${example_name}.so"
    
    echo "Building ${example_name} shared library from RTW source..."
    
    if [ ! -d "$rtw_dir" ]; then
        echo "Error: $rtw_dir directory not found"
        return 1
    fi
    
    cd "$rtw_dir"
    
    # Try to use the generated Makefile first
    if [ -f "${example_name}.mk" ]; then
        echo "Using generated Makefile..."
        if MATLAB_ROOT="$MATLAB_ROOT" make -f "${example_name}.mk"; then
            echo "✓ ${example_name}.so built successfully using generated Makefile"
            cd ..
            return 0
        else
            echo "Generated Makefile failed, using manual build..."
        fi
    fi
    
    # Manual build with correct paths
    echo "Manual build for ${example_name}..."
    
    # Compile the source files
    gcc -fPIC -shared -o "../${so_file}" \
        -I. \
        -I"$MATLAB_ROOT/extern/include" \
        -I"$MATLAB_ROOT/simulink/include" \
        -I"$MATLAB_ROOT/rtw/c/src" \
        -I"$MATLAB_ROOT/rtw/c/src/ext_mode/common" \
        -I"$MATLAB_ROOT/rtw/c/ert" \
        -DMODEL="${example_name}" \
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
        "${example_name}.c" ert_main.c \
        -lm
    
    if [ $? -eq 0 ]; then
        echo "✓ ${example_name}.so built successfully"
    else
        echo "✗ Failed to build ${example_name}.so"
        cd ..
        return 1
    fi
    
    cd ..
}

# Build all examples
build_example "dllModel" "1"
build_example "discrete_tf" "2"
build_example "bouncing_ball" "3"

echo "All shared libraries built from RTW source code!"
