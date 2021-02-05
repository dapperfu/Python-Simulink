/*
 * File: first_order_tf.h
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

#ifndef RTW_HEADER_first_order_tf_h_
#define RTW_HEADER_first_order_tf_h_
#include <string.h>
#ifndef first_order_tf_COMMON_INCLUDES_
# define first_order_tf_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#endif                                 /* first_order_tf_COMMON_INCLUDES_ */

#include "first_order_tf_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               ((rtm)->Timing.t)
#endif

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T Delay_DSTATE;                 /* '<Root>/Delay' */
} DW_first_order_tf_T;

/* Continuous states (default storage) */
typedef struct {
  real_T TransferFcn_CSTATE;           /* '<Root>/TransferFcn' */
} X_first_order_tf_T;

/* State derivatives (default storage) */
typedef struct {
  real_T TransferFcn_CSTATE;           /* '<Root>/TransferFcn' */
} XDot_first_order_tf_T;

/* State disabled  */
typedef struct {
  boolean_T TransferFcn_CSTATE;        /* '<Root>/TransferFcn' */
} XDis_first_order_tf_T;

#ifndef ODE1_INTG
#define ODE1_INTG

/* ODE1 Integration Data */
typedef struct {
  real_T *f[1];                        /* derivatives */
} ODE1_IntgData;

#endif

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  real_T Output;                       /* '<Root>/Output' */
} ExtY_first_order_tf_T;

/* Real-time Model Data Structure */
struct tag_RTM_first_order_tf_T {
  const char_T *errorStatus;
  RTWSolverInfo solverInfo;
  X_first_order_tf_T *contStates;
  int_T *periodicContStateIndices;
  real_T *periodicContStateRanges;
  real_T *derivs;
  boolean_T *contStateDisabled;
  boolean_T zCCacheNeedsReset;
  boolean_T derivCacheNeedsReset;
  boolean_T CTOutputIncnstWithState;
  real_T odeF[1][1];
  ODE1_IntgData intgData;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numSampTimes;
  } Sizes;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    time_T stepSize0;
    uint32_T clockTick1;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/* Continuous states (default storage) */
extern X_first_order_tf_T first_order_tf_X;

/* Block states (default storage) */
extern DW_first_order_tf_T first_order_tf_DW;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY_first_order_tf_T first_order_tf_Y;

/*
 * Exported Global Signals
 *
 * Note: Exported global signals are block signals with an exported global
 * storage class designation.  Code generation will declare the memory for
 * these signals and export their symbols.
 *
 */
extern real_T InputSignal;             /* '<Root>/Input' */
extern real_T OutputSignal;            /* '<Root>/TransferFcn' */
extern real_T SimTime;                 /* '<Root>/Digital Clock' */
extern real_T DelayedTime;             /* '<Root>/Delay' */
extern real_T SimTime2;                /* '<Root>/Weighted Sample Time Math' */

/*
 * Exported Global Parameters
 *
 * Note: Exported global parameters are tunable parameters with an exported
 * global storage class designation.  Code generation will declare the memory for
 * these parameters and exports their symbols.
 *
 */
extern real_T den[2];                  /* Variable: den
                                        * Referenced by: '<Root>/TransferFcn'
                                        */
extern real_T num;                     /* Variable: num
                                        * Referenced by: '<Root>/TransferFcn'
                                        */

/* Model entry point functions */
extern void first_order_tf_initialize(void);
extern void first_order_tf_step(void);
extern void first_order_tf_terminate(void);

/* Real-time Model object */
extern RT_MODEL_first_order_tf_T *const first_order_tf_M;

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
 * '<Root>' : 'first_order_tf'
 */
#endif                                 /* RTW_HEADER_first_order_tf_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
