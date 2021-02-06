/*
 * File: discrete_tf.h
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

#ifndef RTW_HEADER_discrete_tf_h_
#define RTW_HEADER_discrete_tf_h_
#include <string.h>
#ifndef discrete_tf_COMMON_INCLUDES_
# define discrete_tf_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#endif                                 /* discrete_tf_COMMON_INCLUDES_ */

#include "discrete_tf_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T DiscreteTransferFcn_states;   /* '<Root>/Discrete Transfer Fcn' */
} DW_discrete_tf_T;

/* Real-time Model Data Structure */
struct tag_RTM_discrete_tf_T {
  const char_T * volatile errorStatus;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
  } Timing;
};

/* Block states (default storage) */
extern DW_discrete_tf_T discrete_tf_DW;

/*
 * Exported Global Signals
 *
 * Note: Exported global signals are block signals with an exported global
 * storage class designation.  Code generation will declare the memory for
 * these signals and export their symbols.
 *
 */
extern real_T OutputSignal;            /* '<Root>/Discrete Transfer Fcn' */
extern real_T SimTime;                 /* '<Root>/Digital Clock' */

/*
 * Exported Global Parameters
 *
 * Note: Exported global parameters are tunable parameters with an exported
 * global storage class designation.  Code generation will declare the memory for
 * these parameters and exports their symbols.
 *
 */
extern real_T InputSignal;             /* Variable: InputSignal
                                        * Referenced by: '<Root>/Constant'
                                        */
extern real_T den[2];                  /* Variable: den
                                        * Referenced by: '<Root>/Discrete Transfer Fcn'
                                        */
extern real_T num[2];                  /* Variable: num
                                        * Referenced by: '<Root>/Discrete Transfer Fcn'
                                        */

/* Model entry point functions */
extern void discrete_tf_initialize(void);
extern void discrete_tf_step(void);
extern void discrete_tf_terminate(void);

/* Real-time Model object */
extern RT_MODEL_discrete_tf_T *const discrete_tf_M;

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
 * '<Root>' : 'discrete_tf'
 */
#endif                                 /* RTW_HEADER_discrete_tf_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
