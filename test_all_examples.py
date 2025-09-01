#!/usr/bin/env python3
"""
Comprehensive test script for Python-Simulink examples.

This script tests all examples that have Python code and pre-built libraries.
"""

import os
import sys
import platform
import ctypes
from pathlib import Path


def test_rtwtypes_import(example_path: str) -> bool:
    """Test if rtwtypes.py can be imported successfully."""
    try:
        sys.path.insert(0, example_path)
        import rtwtypes
        print(f"✓ {example_path}/rtwtypes.py imports successfully")
        return True
    except Exception as e:
        print(f"✗ {example_path}/rtwtypes.py import failed: {e}")
        return False


def test_library_loading(example_path: str, library_name: str) -> bool:
    """Test if a library can be loaded successfully."""
    try:
        library_path = os.path.join(example_path, library_name)
        if not os.path.exists(library_path):
            print(f"✗ Library not found: {library_path}")
            return False
        
        if platform.system() == "Linux":
            ctypes.cdll.LoadLibrary(library_path)
        elif platform.system() == "Windows":
            ctypes.windll.LoadLibrary(library_path)
        else:
            print(f"✗ Unsupported platform: {platform.system()}")
            return False
        
        print(f"✓ Library loaded successfully: {library_path}")
        return True
    except Exception as e:
        print(f"✗ Library loading failed: {library_path} - {e}")
        return False


def test_example2_discretetf(example_path: str) -> bool:
    """Test Example2's DiscreteTF class."""
    try:
        sys.path.insert(0, example_path)
        from discretetf import DiscreteTF
        
        # Test basic functionality
        mdl = DiscreteTF()
        mdl.initialize()
        mdl.input_signal = 1.0
        mdl.step()
        
        print(f"✓ {example_path}/discretetf.py works correctly")
        print(f"  - Output: {mdl.output}")
        print(f"  - Time: {mdl.time}")
        
        mdl.terminate()
        return True
    except Exception as e:
        print(f"✗ {example_path}/discretetf.py test failed: {e}")
        return False


def main():
    """Main test function."""
    print("Python-Simulink Examples Test Suite")
    print("=" * 50)
    print(f"Platform: {platform.system()}")
    print(f"Python version: {sys.version}")
    print()
    
    # Test Example1
    print("Testing Example1 (DLL Model):")
    print("-" * 30)
    example1_path = "Example1"
    rtwtypes_ok = test_rtwtypes_import(example1_path)
    
    # Check for libraries
    if platform.system() == "Linux":
        library_ok = test_library_loading(example1_path, "dllModel.so")
    else:
        library_ok = test_library_loading(example1_path, "dllModel_win64.dll")
    
    print(f"Example1 status: {'✓ PASS' if rtwtypes_ok and library_ok else '✗ FAIL'}")
    print()
    
    # Test Example2
    print("Testing Example2 (Discrete Transfer Function):")
    print("-" * 40)
    example2_path = "Example2"
    rtwtypes_ok = test_rtwtypes_import(example2_path)
    
    # Check for libraries
    if platform.system() == "Linux":
        library_ok = test_library_loading(example2_path, "discrete_tf.so")
    else:
        library_ok = test_library_loading(example2_path, "discrete_tf_win64.dll")
    
    discretetf_ok = test_example2_discretetf(example2_path)
    
    print(f"Example2 status: {'✓ PASS' if rtwtypes_ok and library_ok and discretetf_ok else '✗ FAIL'}")
    print()
    
    # Test Example3
    print("Testing Example3 (Bouncing Ball):")
    print("-" * 30)
    example3_path = "Example3"
    rtwtypes_ok = test_rtwtypes_import(example3_path)
    
    # Check for libraries
    if platform.system() == "Linux":
        library_ok = test_library_loading(example3_path, "bouncing_ball_R2018a.so")
    else:
        library_ok = test_library_loading(example3_path, "bouncing_ball_win64.dll")
    
    print(f"Example3 status: {'✓ PASS' if rtwtypes_ok and library_ok else '✗ FAIL'}")
    print()
    
    # Summary
    print("=" * 50)
    print("Test Summary:")
    print("All examples with Python code have been tested.")
    print("Note: Some examples may have pre-built libraries (.so/.dll files)")
    print("that are already included in the repository.")
    print()
    print("For comprehensive testing with pytest, run:")
    print("cd Example2 && python -m pytest tests/ -v")


if __name__ == "__main__":
    main()
