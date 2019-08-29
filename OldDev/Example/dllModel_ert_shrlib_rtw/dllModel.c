/*
 * File: dllModel.c
 *
 * Code generated for Simulink model 'dllModel'.
 *
 * Model version                  : 1.56
 * Simulink Coder version         : 8.9 (R2015b) 13-Aug-2015
 * C/C++ source code generated on : Fri May 19 01:22:38 2017
 *
 * Target selection: ert_shrlib.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "dllModel.h"
#include "dllModel_private.h"

/* Exported block signals */
real32_T SignalIn;                     /* '<Root>/InputPort1' */
real_T SimulationSignal2;              /* '<Root>/Gain2' */
real32_T SignalOut;                    /* '<Root>/Gain' */

/* Exported block parameters */
real32_T K = 1.0F;                     /* Variable: K
                                        * Referenced by: '<Root>/Gain'
                                        */

/* Block signals (auto storage) */
B_dllModel_T dllModel_B;

/* External inputs (root inport signals with auto storage) */
ExtU_dllModel_T dllModel_U;

/* External outputs (root outports fed by signals with auto storage) */
ExtY_dllModel_T dllModel_Y;

/* Real-time model */
RT_MODEL_dllModel_T dllModel_M_;
RT_MODEL_dllModel_T *const dllModel_M = &dllModel_M_;

/* Model step function */
void dllModel_step(void)
{
  /* Gain: '<Root>/Gain' incorporates:
   *  Inport: '<Root>/InputPort1'
   */
  SignalOut = K * SignalIn;

  /* Gain: '<Root>/Gain1' incorporates:
   *  Inport: '<Root>/InputPort2'
   */
  dllModel_B.SignalOut2 = (uint16_T)((uint32_T)dllModel_P.K2 *
    dllModel_U.SignalIn2 >> 14);

  /* Sum: '<Root>/Sum' */
  dllModel_B.SignalOut3 = SignalOut + (real32_T)dllModel_B.SignalOut2;

  /* Outport: '<Root>/OutputPort2' */
  dllModel_Y.OutputPort2 = dllModel_B.SignalOut3;

  /* DigitalClock: '<Root>/Digital Clock' */
  dllModel_B.SimulationSignal1 = (((dllModel_M->Timing.clockTick0+
    dllModel_M->Timing.clockTickH0* 4294967296.0)) * 0.1);

  /* Gain: '<Root>/Gain2' */
  SimulationSignal2 = 1.0 * dllModel_B.SimulationSignal1;

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The resolution of this integer timer is 0.1, which is the step size
   * of the task. Size of "clockTick0" ensures timer will not overflow during the
   * application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  dllModel_M->Timing.clockTick0++;
  if (!dllModel_M->Timing.clockTick0) {
    dllModel_M->Timing.clockTickH0++;
  }
}

/* Model initialize function */
void dllModel_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)dllModel_M, 0,
                sizeof(RT_MODEL_dllModel_T));

  /* block I/O */
  (void) memset(((void *) &dllModel_B), 0,
                sizeof(B_dllModel_T));

  /* exported global signals */
  SimulationSignal2 = 0.0;
  SignalOut = 0.0F;

  /* external inputs */
  (void) memset((void *)&dllModel_U, 0,
                sizeof(ExtU_dllModel_T));
  SignalIn = 0.0F;

  /* external outputs */
  (void) memset((void *)&dllModel_Y, 0,
                sizeof(ExtY_dllModel_T));
}

/* Model terminate function */
void dllModel_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
