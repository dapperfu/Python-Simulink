# Python-Simulink

Run your Simulink models & libraries in Python.

[![CI/CD Pipeline](https://github.com/dapperfu/Python-Simulink/actions/workflows/ci.yml/badge.svg)](https://github.com/dapperfu/Python-Simulink/actions/workflows/ci.yml)
[![Build Status](https://github.com/dapperfu/Python-Simulink/actions/workflows/build.yml/badge.svg)](https://github.com/dapperfu/Python-Simulink/actions/workflows/build.yml)
[![Release Status](https://github.com/dapperfu/Python-Simulink/actions/workflows/release.yml/badge.svg)](https://github.com/dapperfu/Python-Simulink/actions/workflows/release.yml)
[![Python 3.9](https://img.shields.io/badge/python-3.9-blue.svg)](https://www.python.org/downloads/)
[![Python 3.10](https://img.shields.io/badge/python-3.10-blue.svg)](https://www.python.org/downloads/)
[![Python 3.11](https://img.shields.io/badge/python-3.11-blue.svg)](https://www.python.org/downloads/)
[![Python 3.12](https://img.shields.io/badge/python-3.12-blue.svg)](https://www.python.org/downloads/)

## Motivation

1. Running software-in-the-loop tests with Simulink becomes time consuming with Matlab & Simulink overhead. There are ways to reduce it (Model reference, etc) however nothing has shown to be as fast as a precompiled shared library.

2. Python has a very mature set of tools and packages to automate testing.

3. Testing can be distributed to machines without Matlab/Simulink licenses.

4. There are more and more Python developers. Being able to hand off a Simulink Library for further use there is a good feature.

## Use cases

1. Use Python and it's ecosystem to run complex Simulink models.
2. Use Python & `pytest` to run Software-in-the-Loop (SIL) tests on Simulink subsystems.
3. Give Simulink algorithms to developers without Matlab/Simulink licenses to use.
4. Use GitHub/GitLab actions and Python to automate testing in the cloud.
5. Start a programming language war at your company.

##  Disclaimer

This repository is a set of instructions, with examples, on how to create a Pythonic wrapper for Simulink models. It **is not** a turnkey Python module to do this:

```python
import simulinkdll
simulinkdll.run("my_model.slx")
do_stuff()
```

For a given library or model configuring the Python should only need done when the Simulink Parameters/Signals change. The end developer will then be able do a `import simulink_model`, but it takes development time.

### High level instructions.

1. [Create a shared library in Simulink.](https://www.mathworks.com/help/ecoder/ug/creating-and-using-host-based-shared-libraries.html)
2. Create Python representations of all items in the header file.
3. Open the shared library (`.dll`, `.so`) in Python and run the model.

# Examples

### [Simple DLL Export](https://nbviewer.jupyter.org/github/dapperfu/python_SimulinkDLL/blob/master/Example1/dllModel.ipynb)

[![Example1 Status](https://img.shields.io/badge/Example1-PASS-green.svg)](https://github.com/dapperfu/Python-Simulink/actions/workflows/ci.yml)
[![Example1 Library](https://img.shields.io/badge/Library-Pre--built-blue.svg)](Example1/dllModel_win64.dll)

- For demonstrating minimal dll functionality and the steps required to run a model in Python.
- Demonstrate implementions of `SimulinkGlobal` vs  `ExportedGlobal` in `Simulink.Parameter` and `Simulink.Signal` variables.

![](Example1/dllModel.png)

### [Discrete Transfer Function](https://nbviewer.jupyter.org/github/dapperfu/python_SimulinkDLL/blob/master/Example2/discrete_tf-python_class.ipynb)

[![Example2 Status](https://img.shields.io/badge/Example2-PASS-green.svg)](https://github.com/dapperfu/Python-Simulink/actions/workflows/ci.yml)
[![Example2 Tests](https://img.shields.io/badge/Tests-Passing-green.svg)](https://github.com/dapperfu/Python-Simulink/actions/workflows/ci.yml)
[![Example2 Library](https://img.shields.io/badge/Library-Pre--built-blue.svg)](Example2/discrete_tf.so)

![](Example2/discrete_tf.png)

A simple discrete transfer function. Compiled with a 1st order low pass filter.

There are two example notebooks for Example 2.

1. [Simple Example](https://nbviewer.jupyter.org/github/dapperfu/python_SimulinkDLL/blob/master/Example2/discrete_tf.ipynb) - A simple low-level ctypes wrapper.
2. [Pythonic Example](https://nbviewer.jupyter.org/github/dapperfu/python_SimulinkDLL/blob/master/Example2/discrete_tf-python_class.ipynb) - Use Python syntactic sugar to create a high level [TransferTF python](https://github.com/dapperfu/python_SimulinkDLL/blob/master/Example2/discretetf.py) class to interact with the model. Adds datalogging and pandas integration.

- Example 2 also contains sample `pytest` tests in the [`tests`](https://github.com/dapperfu/python_SimulinkDLL/tree/master/Example2/tests) directory. This demonstrates how you can use `pytest` to test Simulink models. Sample test results are shown shown in [Example2/test_results.md.](https://github.com/dapperfu/python_SimulinkDLL/blob/master/Example2/test_results.md)

- Tests can be run on [GitHub actions](https://github.com/features/actions) as well. The project now includes comprehensive CI/CD workflows:
  - **CI Pipeline**: [`.github/workflows/ci.yml`](https://github.com/dapperfu/Python-Simulink/blob/master/.github/workflows/ci.yml) - Multi-platform testing across Python 3.9-3.12
  - **Build Pipeline**: [`.github/workflows/build.yml`](https://github.com/dapperfu/Python-Simulink/blob/master/.github/workflows/build.yml) - Simulink model compilation
  - **Release Pipeline**: [`.github/workflows/release.yml`](https://github.com/dapperfu/Python-Simulink/blob/master/.github/workflows/release.yml) - Automated releases

### [Bouncing Ball](https://nbviewer.jupyter.org/github/dapperfu/python_SimulinkDLL/blob/master/Example3/bouncing_ball.ipynb)

[![Example3 Status](https://img.shields.io/badge/Example3-PASS-green.svg)](https://github.com/dapperfu/Python-Simulink/actions/workflows/ci.yml)
[![Example3 Library](https://img.shields.io/badge/Library-Pre--built-blue.svg)](Example3/bouncing_ball_R2018a.so)

Adapted from [Mathworks's Simulation of a Bouncing Ball](https://www.mathworks.com/help/simulink/slref/simulation-of-a-bouncing-ball.html)

![](Example3/bouncing_ball.png)

Running a Simulation in Simulink also has some overhead. By compiling the model to a shared library and executing it, this overhead is eliminated.

`bouncing_ball_benchmark.m` benchmarks the model by testing increasingly smaller time steps. The model was then compiled and tested in Python and the corresponding times are recorded below.

| Time Step | Simulink Duration (s) | Python Duration (s) |
| --------- | --------------------- | ------------------- |
| 1e-4      | 0.5905                | 0.06                |
| 1e-5      | 1.0461                | 0.61                |
| 1e-6      | 8.1991                | 6.08                |
| 1e-7      | 78.9901               | 60.18               |

## 🚀 Quick Start

### Prerequisites
- Python 3.9+ 
- Required packages: `pip install -r requirements.txt`

### Running Examples
```bash
# Install dependencies
make install

# Run comprehensive tests
make test-all

# Test individual examples
python test_all_examples.py

# Run Example2 tests with pytest
cd Example2 && python -m pytest tests/ -v
```

### Building Missing Libraries
```bash
# Build all missing shared libraries for Linux
make build-all-so

# Build specific example
make build-example1-so
```

# Build Automation

This project includes comprehensive CI/CD automation for building and testing Simulink models.

## GitHub Actions

The project uses GitHub Actions for automated building and testing:

### CI Workflow (`.github/workflows/ci.yml`)
- **Triggers**: Push to main/develop, pull requests
- **Features**:
  - Multi-platform testing (Ubuntu, Windows)
  - Multi-Python version testing (3.9-3.12)
  - Automatic .so file generation for Linux
  - Comprehensive example testing
  - Linting and validation
  - Artifact upload for generated .so files

### Build Workflow (`.github/workflows/build.yml`)
- **Triggers**: Changes to Simulink models (.slx, .mdl, .m files)
- **Features**:
  - Automatic .so file generation
  - Build validation
  - Artifact creation and upload

### .so Files Build Workflow (`.github/workflows/build-so-files.yml`)
- **Triggers**: Changes to source files, manual dispatch, releases
- **Features**:
  - Dedicated .so file generation
  - Library verification and testing
  - Automatic GitHub releases with .so files
  - Long-term artifact storage (90 days)

### Usage

The .so files are automatically generated in GitHub Actions whenever:
- Source files are modified
- A pull request is created
- A release is published

You can also manually trigger the workflow using the "workflow_dispatch" trigger.

## Jenkins Build Automation

This project also serves as a proof of concept for using [CI/CD devops techniques](https://www.atlassian.com/continuous-delivery/principles/continuous-integration-vs-delivery-vs-deployment) with Simulink Models. There is a [`Jenkinsfile` ](Jenkinsfile) that will build each of the examples and archive the artifacts:

- shared library (`.dll`)
- header files (`.h`)

Jenkins Pipeline screenshot:

![Jenkins pipeline screenshot](jenkins_pipeline.png)

Jenkins Artifacts screenshot:

![Jenkins artifacts](jenkins_artifacts.png)

# Discussion, Questions & Feedback

- https://github.com/dapperfu/Python-Simulink/discussions
