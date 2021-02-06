/*
 * File: discrete_tf.c
 *
 * Code generated for Simulink model 'discrete_tf'.
 *
 * Model version                  : 1.19
 * Simulink Coder version         : 9.0 (R2018b) 24-May-2018
 * C/C++ source code generated on : Sat Feb  6 15:20:52 2021
 *
 * Target selection: ert_shrlib.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "discrete_tf.h"
#include "discrete_tf_private.h"

/* Exported block signals */
real_T OutputSignal;                   /* '<Root>/Discrete Transfer Fcn' */
real_T SimTime;                        /* '<Root>/Digital Clock' */

/* Exported block parameters */
real_T InputSignal = 0.0;              /* Variable: InputSignal
                                        * Referenced by: '<Root>/Constant'
                                        */
real_T den[2] = { 1.0, -0.99950012497916929 } ;/* Variable: den
                                                * Referenced by: '<Root>/Discrete Transfer Fcn'
                                                */

real_T num[2] = { 0.0, 0.0014996250624921886 } ;/* Variable: num
                                                 * Referenced by: '<Root>/Discrete Transfer Fcn'
                                                 */

/* Block states (default storage) */
DW_discrete_tf_T discrete_tf_DW;

/* Real-time model */
RT_MODEL_discrete_tf_T discrete_tf_M_;
RT_MODEL_discrete_tf_T *const discrete_tf_M = &discrete_tf_M_;

/* Model step function */
void discrete_tf_step(void)
{
  /* DiscreteTransferFcn: '<Root>/Discrete Transfer Fcn' */
  OutputSignal = num[1] * discrete_tf_DW.DiscreteTransferFcn_states;

  /* DigitalClock: '<Root>/Digital Clock' */
  SimTime = ((discrete_tf_M->Timing.clockTick0) * 0.001);

  /* Update for DiscreteTransferFcn: '<Root>/Discrete Transfer Fcn' incorporates:
   *  Constant: '<Root>/Constant'
   */
  discrete_tf_DW.DiscreteTransferFcn_states = (InputSignal - den[1] *
    discrete_tf_DW.DiscreteTransferFcn_states) / den[0];

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The resolution of this integer timer is 0.001, which is the step size
   * of the task. Size of "clockTick0" ensures timer will not overflow during the
   * application lifespan selected.
   */
  discrete_tf_M->Timing.clockTick0++;
}

/* Model initialize function */
void discrete_tf_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)discrete_tf_M, 0,
                sizeof(RT_MODEL_discrete_tf_T));

  /* block I/O */

  /* exported global signals */
  OutputSignal = 0.0;
  SimTime = 0.0;

  /* states (dwork) */
  (void) memset((void *)&discrete_tf_DW, 0,
                sizeof(DW_discrete_tf_T));
}

/* Model terminate function */
void discrete_tf_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
