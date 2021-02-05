/*
 * File: first_order_tf.c
 *
 * Code generated for Simulink model 'first_order_tf'.
 *
 * Model version                  : 1.10
 * Simulink Coder version         : 9.0 (R2018b) 24-May-2018
 * C/C++ source code generated on : Fri Feb  5 05:34:50 2021
 *
 * Target selection: ert_shrlib.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "first_order_tf.h"
#include "first_order_tf_private.h"

/* Exported block signals */
real_T InputSignal;                    /* '<Root>/Input' */
real_T OutputSignal;                   /* '<Root>/TransferFcn' */
real_T SimTime;                        /* '<Root>/Digital Clock' */
real_T DelayedTime;                    /* '<Root>/Delay' */
real_T SimTime2;                       /* '<Root>/Weighted Sample Time Math' */

/* Exported block parameters */
real_T den[2] = { 5.0, 1.0 } ;         /* Variable: den
                                        * Referenced by: '<Root>/TransferFcn'
                                        */

real_T num = 1.0;                      /* Variable: num
                                        * Referenced by: '<Root>/TransferFcn'
                                        */

/* Continuous states */
X_first_order_tf_T first_order_tf_X;

/* Block states (default storage) */
DW_first_order_tf_T first_order_tf_DW;

/* External outputs (root outports fed by signals with default storage) */
ExtY_first_order_tf_T first_order_tf_Y;

/* Real-time model */
RT_MODEL_first_order_tf_T first_order_tf_M_;
RT_MODEL_first_order_tf_T *const first_order_tf_M = &first_order_tf_M_;

/*
 * This function updates continuous states using the ODE1 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE1_IntgData *id = (ODE1_IntgData *)rtsiGetSolverData(si);
  real_T *f0 = id->f[0];
  int_T i;
  int_T nXc = 1;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);
  rtsiSetdX(si, f0);
  first_order_tf_derivatives();
  rtsiSetT(si, tnew);
  for (i = 0; i < nXc; ++i) {
    x[i] += h * f0[i];
  }

  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Model step function */
void first_order_tf_step(void)
{
  if (rtmIsMajorTimeStep(first_order_tf_M)) {
    /* set solver stop time */
    rtsiSetSolverStopTime(&first_order_tf_M->solverInfo,
                          ((first_order_tf_M->Timing.clockTick0+1)*
      first_order_tf_M->Timing.stepSize0));
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(first_order_tf_M)) {
    first_order_tf_M->Timing.t[0] = rtsiGetT(&first_order_tf_M->solverInfo);
  }

  /* TransferFcn: '<Root>/TransferFcn' */
  OutputSignal = 0.0;
  OutputSignal += num / den[0] * first_order_tf_X.TransferFcn_CSTATE;

  /* Outport: '<Root>/Output' */
  first_order_tf_Y.Output = OutputSignal;
  if (rtmIsMajorTimeStep(first_order_tf_M)) {
    /* DigitalClock: '<Root>/Digital Clock' */
    SimTime = ((first_order_tf_M->Timing.clockTick1) * 0.01);

    /* Delay: '<Root>/Delay' */
    DelayedTime = first_order_tf_DW.Delay_DSTATE;

    /* SampleTimeMath: '<Root>/Weighted Sample Time Math'
     *
     * About '<Root>/Weighted Sample Time Math':
     *  y = u + K where K = ( w * Ts )
     */
    SimTime2 = DelayedTime + 0.01;
  }

  if (rtmIsMajorTimeStep(first_order_tf_M)) {
    if (rtmIsMajorTimeStep(first_order_tf_M)) {
      /* Update for Delay: '<Root>/Delay' */
      first_order_tf_DW.Delay_DSTATE = SimTime2;
    }
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(first_order_tf_M)) {
    rt_ertODEUpdateContinuousStates(&first_order_tf_M->solverInfo);

    /* Update absolute time for base rate */
    /* The "clockTick0" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick0"
     * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
     * overflow during the application lifespan selected.
     */
    ++first_order_tf_M->Timing.clockTick0;
    first_order_tf_M->Timing.t[0] = rtsiGetSolverStopTime
      (&first_order_tf_M->solverInfo);

    {
      /* Update absolute timer for sample time: [0.01s, 0.0s] */
      /* The "clockTick1" counts the number of times the code of this task has
       * been executed. The resolution of this integer timer is 0.01, which is the step size
       * of the task. Size of "clockTick1" ensures timer will not overflow during the
       * application lifespan selected.
       */
      first_order_tf_M->Timing.clockTick1++;
    }
  }                                    /* end MajorTimeStep */
}

/* Derivatives for root system: '<Root>' */
void first_order_tf_derivatives(void)
{
  XDot_first_order_tf_T *_rtXdot;
  _rtXdot = ((XDot_first_order_tf_T *) first_order_tf_M->derivs);

  /* Derivatives for TransferFcn: '<Root>/TransferFcn' incorporates:
   *  Inport: '<Root>/Input'
   */
  _rtXdot->TransferFcn_CSTATE = 0.0;
  _rtXdot->TransferFcn_CSTATE += -den[1] / den[0] *
    first_order_tf_X.TransferFcn_CSTATE;
  _rtXdot->TransferFcn_CSTATE += InputSignal;
}

/* Model initialize function */
void first_order_tf_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)first_order_tf_M, 0,
                sizeof(RT_MODEL_first_order_tf_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&first_order_tf_M->solverInfo,
                          &first_order_tf_M->Timing.simTimeStep);
    rtsiSetTPtr(&first_order_tf_M->solverInfo, &rtmGetTPtr(first_order_tf_M));
    rtsiSetStepSizePtr(&first_order_tf_M->solverInfo,
                       &first_order_tf_M->Timing.stepSize0);
    rtsiSetdXPtr(&first_order_tf_M->solverInfo, &first_order_tf_M->derivs);
    rtsiSetContStatesPtr(&first_order_tf_M->solverInfo, (real_T **)
                         &first_order_tf_M->contStates);
    rtsiSetNumContStatesPtr(&first_order_tf_M->solverInfo,
      &first_order_tf_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&first_order_tf_M->solverInfo,
      &first_order_tf_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&first_order_tf_M->solverInfo,
      &first_order_tf_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&first_order_tf_M->solverInfo,
      &first_order_tf_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&first_order_tf_M->solverInfo, (&rtmGetErrorStatus
      (first_order_tf_M)));
    rtsiSetRTModelPtr(&first_order_tf_M->solverInfo, first_order_tf_M);
  }

  rtsiSetSimTimeStep(&first_order_tf_M->solverInfo, MAJOR_TIME_STEP);
  first_order_tf_M->intgData.f[0] = first_order_tf_M->odeF[0];
  first_order_tf_M->contStates = ((X_first_order_tf_T *) &first_order_tf_X);
  rtsiSetSolverData(&first_order_tf_M->solverInfo, (void *)
                    &first_order_tf_M->intgData);
  rtsiSetSolverName(&first_order_tf_M->solverInfo,"ode1");
  rtmSetTPtr(first_order_tf_M, &first_order_tf_M->Timing.tArray[0]);
  first_order_tf_M->Timing.stepSize0 = 0.01;

  /* block I/O */

  /* exported global signals */
  OutputSignal = 0.0;
  SimTime = 0.0;
  DelayedTime = 0.0;
  SimTime2 = 0.0;

  /* states (continuous) */
  {
    (void) memset((void *)&first_order_tf_X, 0,
                  sizeof(X_first_order_tf_T));
  }

  /* states (dwork) */
  (void) memset((void *)&first_order_tf_DW, 0,
                sizeof(DW_first_order_tf_T));

  /* external inputs */
  InputSignal = 0.0;

  /* external outputs */
  (void) memset((void *)&first_order_tf_Y, 0,
                sizeof(ExtY_first_order_tf_T));

  /* InitializeConditions for TransferFcn: '<Root>/TransferFcn' */
  first_order_tf_X.TransferFcn_CSTATE = 0.0;
}

/* Model terminate function */
void first_order_tf_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
