# dllModel - Python Runner Notebook

![](dllModel.png)

# Python Setup

This is the boilerplate setup needed before running the model. For readability the `rtwtypes.h` is in a separate file.


```python
from rtwtypes import *
```

### ```dllModel.h```


```python
class B_dllModel_T(ctypes.Structure):
    _fields_ = [
        ("SimulationSignal1", real_T),
        ("SignalOut3", real32_T),
        ("SignalOut2", uint16_T),
        
    ]
class ExtU_dllModel_T(ctypes.Structure):
    _fields_ = [
        ("SignalIin2", uint16_T)
    ]
class ExtY_dllModel_T(ctypes.Structure):
    _fields_ = [
        ("OutputPort2", real32_T)
    ]
class P_dllModel_T(ctypes.Structure):
    _fields_ = [
        ("K2", uint16_T)
    ]
    
class Timing(ctypes.Structure):
    _fields_ = [
        ("clockTick0", uint32_T),
        ("clockTickH0", uint32_T),
    ]
class tag_RTM_dllModel_T(ctypes.Structure):
    
    _fields_ = [
        ("errorStatus", ctypes.c_char_p),
        ("Timing", Timing),
    ]
```


```python
import os
dll_path = os.path.abspath('dllModel_win64.dll')
dll = ctypes.windll.LoadLibrary(dll_path)
```


```python
# Block parameters (default storage)
dllModel_P = P_dllModel_T.in_dll(dll, 'dllModel_P')
# Block signals (default storage)
dllModel_B = B_dllModel_T.in_dll(dll, 'dllModel_B')
# External inputs (root inport signals with default storage)
dllModel_U = ExtU_dllModel_T.in_dll(dll, 'dllModel_U')
# External outputs (root outports fed by signals with default storage)
dllModel_Y = ExtY_dllModel_T.in_dll(dll, 'dllModel_Y')
```


```python
"""
 * Exported Global Signals
 *
 * Note: Exported global signals are block signals with an exported global
 * storage class designation.  Code generation will declare the memory for
 * these signals and export their symbols.
 """
SignalIn = real32_T.in_dll(dll, 'SignalIn')
SimulationSignal2 = real_T.in_dll(dll, 'SimulationSignal2')
SignalOut = real32_T.in_dll(dll, 'SignalOut')
"""
 * Exported Global Parameters
 *
 * Note: Exported global parameters are tunable parameters with an exported
 * global storage class designation.  Code generation will declare the memory for
 * these parameters and exports their symbols.
"""
K = real32_T.in_dll(dll, 'K')

# Model entry point functions
dllModel_initialize = dll.dllModel_initialize
dllModel_step = dll.dllModel_step
dllModel_terminate = dll.dllModel_terminate

# Real-time Model object
dllModel_M = ctypes.POINTER(tag_RTM_dllModel_T).in_dll(dll, 'dllModel_M')
```

# Running The Model.

Before running the model you will need to run the model init function.


```python
dllModel_initialize();
```

Take an initial step into the model, function returns the current step number.


```python
dllModel_step()
```




    1



Inspect the simulation time, both in the Block signal structure and in the global variable.


```python
[dllModel_B.SimulationSignal1, SimulationSignal2]
```




    [0.0, c_double(0.0)]



Take another step and inspect the simulation time again.

0.1s matches the discrete step size specified in the model.

![](dllModel_solver.png)



```python
dllModel_step()
[dllModel_B.SimulationSignal1, SimulationSignal2]
```




    [0.30000000000000004, c_double(0.30000000000000004)]



### Manipulating Signals

& Reading Outputs

![](dllModel.png)


```python
SignalIn.value=float(2)
SignalOut
```




    c_float(2.0)




```python
dllModel_step()
SignalOut
```




    c_float(2.0)




```python
[dllModel_B.SignalOut2, dllModel_B.SignalOut3, SignalOut]
```




    [2, 4.0, c_float(2.0)]




```python
dllModel_U.SignalIin2=1
```


```python
dllModel_step()
[dllModel_B.SignalOut2, dllModel_B.SignalOut3, SignalOut]
```




    [2, 4.0, c_float(2.0)]




```python
dllModel_M.contents.Timing.clockTick0
```




    6




```python
step = dllModel_step()
assert dllModel_M.contents.Timing.clockTick0==step
```
