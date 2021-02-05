/*
 * File: dllModel.h
 *
 * Code generated for Simulink model 'dllModel'.
 *
 * Model version                  : 1.66
 * Simulink Coder version         : 9.0 (R2018b) 24-May-2018
 * C/C++ source code generated on : Fri Feb  5 11:52:25 2021
 *
 * Target selection: ert_shrlib.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_dllModel_h_
#define RTW_HEADER_dllModel_h_
#include <string.h>
#ifndef dllModel_COMMON_INCLUDES_
# define dllModel_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* dllModel_COMMON_INCLUDES_ */

#include "dllModel_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Block signals (default storage) */
typedef struct {
  real_T SimulationSignal1;            /* '<Root>/Digital Clock' */
  real32_T SignalOut3;                 /* '<Root>/Sum' */
  uint16_T SignalOut2;                 /* '<Root>/Gain1' */
} B_dllModel_T;

/* External inputs (root inport signals with default storage) */
typedef struct {
  uint16_T SignalIn2;                  /* '<Root>/InputPort2' */
} ExtU_dllModel_T;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  real32_T OutputPort2;                /* '<Root>/OutputPort2' */
} ExtY_dllModel_T;

/* Parameters (default storage) */
struct P_dllModel_T_ {
  uint16_T K2;                         /* Variable: K2
                                        * Referenced by: '<Root>/Gain1'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_dllModel_T {
  const char_T * volatile errorStatus;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
  } Timing;
};

/* Block parameters (default storage) */
extern P_dllModel_T dllModel_P;

/* Block signals (default storage) */
extern B_dllModel_T dllModel_B;

/* External inputs (root inport signals with default storage) */
extern ExtU_dllModel_T dllModel_U;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY_dllModel_T dllModel_Y;

/*
 * Exported Global Signals
 *
 * Note: Exported global signals are block signals with an exported global
 * storage class designation.  Code generation will declare the memory for
 * these signals and export their symbols.
 *
 */
extern real32_T SignalIn;              /* '<Root>/InputPort1' */
extern real_T SimulationSignal2;       /* '<Root>/Gain2' */
extern real32_T SignalOut;             /* '<Root>/Gain' */

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

/* Model entry point functions */
extern void dllModel_initialize(void);
extern void dllModel_step(void);
extern void dllModel_terminate(void);

/* Real-time Model object */
extern RT_MODEL_dllModel_T *const dllModel_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'dllModel'
 */
#endif                                 /* RTW_HEADER_dllModel_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
