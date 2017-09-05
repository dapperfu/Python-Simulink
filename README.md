# Python SimulinkDLL

Run your Simulink models in Python.

## Motivation

Running model in the loop tests with Simulink becomes time consuming with Matlab & Simulink overhead. There are ways to reduce it (Model reference, etc) however nothing has shown to be as fast as a precompiled binary.

Python has a very mature set of tools and packages to automate testing and put out JUnit test results.

It also means the testing can be distributed to machines without Simulink licenses.

## Use cases

1. Use Python and it's ecosystem to run complex Simulink models.
2. Use Python & pytest to run MIL tests on Simulink subsystems.
3. Give Simulink algorithms to developers without Matlab/Simulink licenses to use.
4. Start a programming language war at your company.

## Requirements

- [CastXML](https://github.com/CastXML/CastXML)
  - [Windows binaries](https://midas3.kitware.com/midas/item/318228)
- MinGW gcc.
- Simulink.
- A model.

## Caveats 