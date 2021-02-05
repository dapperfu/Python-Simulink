# Example 1

![](dllModel.png)

# Model Parameter/Signal Setup

### `SimulinkGlobal` vs `ExportedGlobal`

- `SimulinkGlobal`: parameters/signals inside of a global struct.

- `ExportedGlobal`: parameters/signals are global themselves.

# Block Parameters

### `SimulinkGlobal`

```matlab
K2=Simulink.Parameter;
K2.Value=2;
K2.CoderInfo.StorageClass='SimulinkGlobal';
```

```c
struct P_dllModel_T_ {
  uint16_T K2;                         /* Variable: K2
                                        * Referenced by: '<Root>/Gain1'
                                        */
};

/* Block parameters (default storage) */
extern P_dllModel_T dllModel_P;
```

### `ExportedGlobal`

```matlab
%% Tunable parameters.
K=Simulink.Parameter;
K.Value=1;
K.CoderInfo.StorageClass='ExportedGlobal';
```

```c
/*
 * Exported Global Parameters
 *
 * Note: Exported global parameters are tunable parameters with an exported
 * global storage class designation.  Code generation will declare the memory for
 * these parameters and exports their symbols.
 *
 */
extern real32_T K;                     /* Variable: K
                                        * Referenced by: '<Root>/Gain'
                                        */
```


## Block signals

### `SimulinkGlobal`

```matlab
SignalOut2=Simulink.Signal;
SignalOut2.CoderInfo.StorageClass='SimulinkGlobal';

SignalOut3=Simulink.Signal;
SignalOut3.CoderInfo.StorageClass='SimulinkGlobal';

SimulationSignal1=Simulink.Signal;
SimulationSignal1.CoderInfo.StorageClass='SimulinkGlobal';
```

```c
/* Block signals (default storage) */
typedef struct {
  real_T SimulationSignal1;            /* '<Root>/Digital Clock' */
  real32_T SignalOut3;                 /* '<Root>/Sum' */
  uint16_T SignalOut2;                 /* '<Root>/Gain1' */
} B_dllModel_T;

/* Block signals (default storage) */
extern B_dllModel_T dllModel_B;
```

### `ExportedGlobal`

## External inputs

### `ExportedGlobal`
```matlab
SignalIn2=Simulink.Signal;
SignalIn2.CoderInfo.StorageClass='SimulinkGlobal';
```

```
/* External inputs (root inport signals with default storage) */
typedef struct {
  uint16_T SignalIn2;                  /* '<Root>/InputPort2' */
} ExtU_dllModel_T;

/* External inputs (root inport signals with default storage) */
extern ExtU_dllModel_T dllModel_U;
```

## External Outputs

### `ExportedGlobal`

```matlab
SignalOut3=Simulink.Signal;
SignalOut3.CoderInfo.StorageClass='SimulinkGlobal';
```

```c
/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  real32_T OutputPort2;                /* '<Root>/OutputPort2' */
} ExtY_dllModel_T;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY_dllModel_T dllModel_Y;
```




# `rtwtypes.h`

`rtwtypes.h` contains multiple typedefs that need to be specified in python using ctypes.

These definitions are for `Embedded hardware selection: Intel->x86-64 (Windows64)`.


```c
/*=======================================================================*
 * Fixed width word size data types:                                     *
 *   int8_T, int16_T, int32_T     - signed 8, 16, or 32 bit integers     *
 *   uint8_T, uint16_T, uint32_T  - unsigned 8, 16, or 32 bit integers   *
 *   real32_T, real64_T           - 32 and 64 bit floating point numbers *
 *=======================================================================*/
 ```

```c
typedef signed char int8_T;
typedef unsigned char uint8_T;
typedef short int16_T;
typedef unsigned short uint16_T;
typedef int int32_T;
typedef unsigned int uint32_T;
typedef long long int64_T;
typedef unsigned long long uint64_T;
typedef float real32_T;
typedef double real64_T;
```

```python
int8_T = ctypes.c_byte
uint8_T = ctypes.c_ubyte
int16_T = ctypes.c_short
uint16_T = ctypes.c_ushort
int32_T = ctypes.c_int
uint32_T = ctypes.c_uint
int64_T = ctypes.c_longlong
uint64_T = ctypes.c_ulonglong
real32_T = ctypes.c_float
real64_T = ctypes.c_double
```


Generic type definitions: boolean_T, char_T, byte_T, int_T, uint_T, real_T, time_T, ulong_T, ulonglong_T. 

```c
typedef double real_T;
typedef double time_T;
typedef unsigned char boolean_T;
typedef int int_T;
typedef unsigned int uint_T;
typedef unsigned long ulong_T;
typedef unsigned long long ulonglong_T;
typedef char char_T;
typedef unsigned char uchar_T;
typedef char_T byte_T;
```

```python
real_T = ctypes.c_double
time_T = ctypes.c_double
boolean_T = ctypes.c_ubyte
int_T = ctypes.c_int
uint_T = ctypes.c_uint
ulong_T = ctypes.c_ulong
ulonglong_T = ctypes.c_ulonglong
char_T = ctypes.c_char
uchar_T = ctypes.c_ubyte
char_T = ctypes.c_byte
```

Complex number type definitions:

```c
typedef struct {
  real32_T re;
  real32_T im;
} creal32_T;

typedef struct {
  real64_T re;
  real64_T im;
} creal64_T;

typedef struct {
  real_T re;
  real_T im;
} creal_T;

typedef struct {
  int8_T re;
  int8_T im;
} cint8_T;

typedef struct {
  uint8_T re;
  uint8_T im;
} cuint8_T;

typedef struct {
  int16_T re;
  int16_T im;
} cint16_T;

typedef struct {
  uint16_T re;
  uint16_T im;
} cuint16_T;

typedef struct {
  int32_T re;
  int32_T im;
} cint32_T;

typedef struct {
  uint32_T re;
  uint32_T im;
} cuint32_T;

typedef struct {
  int64_T re;
  int64_T im;
} cint64_T;

typedef struct {
  uint64_T re;
  uint64_T im;
} cuint64_T;
```




```python
class creal32_T(ctypes.Structure):
    _fields_ = [
        ("re", real32_T),
        ("im", real32_T),
    ]

class creal64_T(ctypes.Structure):
    _fields_ = [
        ("re", real64_T),
        ("im", real64_T),
    ]

class creal_T(ctypes.Structure):
    _fields_ = [
        ("re", real_T),
        ("im", real_T),
    ]

class cint8_T(ctypes.Structure):
    _fields_ = [
        ("re", int8_T),
        ("im", int8_T),
    ]

class cuint8_T(ctypes.Structure):
    _fields_ = [
        ("re", uint8_T),
        ("im", uint8_T),
    ]

class cint16_T(ctypes.Structure):
    _fields_ = [
        ("re", int16_T),
        ("im", int16_T),
    ]

class cuint16_T(ctypes.Structure):
    _fields_ = [
        ("re", uint16_T),
        ("im", uint16_T),
    ]

class cint32_T(ctypes.Structure):
    _fields_ = [
        ("re", int32_T),
        ("im", int32_T),
    ]

class cuint32_T(ctypes.Structure):
    _fields_ = [
        ("re", uint32_T),
        ("im", uint32_T),
    ]

class cint64_T(ctypes.Structure):
    _fields_ = [
        ("re", int64_T),
        ("im", int64_T),
    ]

class cuint64_T(ctypes.Structure):
    _fields_ = [
        ("re", uint64_T),
        ("im", uint64_T),
    ]

```