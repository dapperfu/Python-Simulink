/*
 * File: first_order_tf.h
 *
 * Code generated for Simulink model 'first_order_tf'.
 *
 * Model version                  : 1.7
 * Simulink Coder version         : 8.9 (R2015b) 13-Aug-2015
 * C/C++ source code generated on : Fri May 19 11:26:27 2017
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

/* Block signals (auto storage) */
typedef struct {
  real_T OutputSignal;                 /* '<Root>/TransferFcn' */
  real_T SimTime;                      /* '<Root>/Digital Clock' */
  real_T DelayedTime;                  /* '<Root>/Delay' */
  real_T SimTime2;                     /* '<Root>/Weighted Sample Time Math' */
} B_first_order_tf_T;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  real_T Delay_DSTATE;                 /* '<Root>/Delay' */
} DW_first_order_tf_T;

/* Continuous states (auto storage) */
typedef struct {
  real_T TransferFcn_CSTATE;           /* '<Root>/TransferFcn' */
} X_first_order_tf_T;

/* State derivatives (auto storage) */
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

/* External inputs (root inport signals with auto storage) */
typedef struct {
  real_T InputSignal;                  /* '<Root>/Input' */
} ExtU_first_order_tf_T;

/* External outputs (root outports fed by signals with auto storage) */
typedef struct {
  real_T Output;                       /* '<Root>/Output' */
  real_T SimulationTime;               /* '<Root>/SimulationTime' */
  real_T SimulationTime2;              /* '<Root>/SimulationTime2' */
} ExtY_first_order_tf_T;

/* Real-time Model Data Structure */
struct tag_RTM_first_order_tf_T {
  const char_T *errorStatus;
  RTWSolverInfo solverInfo;

  /*
   * ModelData:
   * The following substructure contains information regarding
   * the data used in the model.
   */
  struct {
    X_first_order_tf_T *contStates;
    int_T *periodicContStateIndices;
    real_T *periodicContStateRanges;
    real_T *derivs;
    boolean_T *contStateDisabled;
    boolean_T zCCacheNeedsReset;
    boolean_T derivCacheNeedsReset;
    boolean_T blkStateChange;
    real_T odeF[1][1];
    ODE1_IntgData intgData;
  } ModelData;

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

/* Block signals (auto storage) */
extern B_first_order_tf_T first_order_tf_B;

/* Continuous states (auto storage) */
extern X_first_order_tf_T first_order_tf_X;

/* Block states (auto storage) */
extern DW_first_order_tf_T first_order_tf_DW;

/* External inputs (root inport signals with auto storage) */
extern ExtU_first_order_tf_T first_order_tf_U;

/* External outputs (root outports fed by signals with auto storage) */
extern ExtY_first_order_tf_T first_order_tf_Y;

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
