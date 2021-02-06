/*
 * File: bouncing_ball.h
 *
 * Code generated for Simulink model 'bouncing_ball'.
 *
 * Model version                  : 1.20
 * Simulink Coder version         : 9.0 (R2018b) 24-May-2018
 * C/C++ source code generated on : Sat Feb  6 16:13:51 2021
 *
 * Target selection: ert_shrlib.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_bouncing_ball_h_
#define RTW_HEADER_bouncing_ball_h_
#include <string.h>
#ifndef bouncing_ball_COMMON_INCLUDES_
# define bouncing_ball_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* bouncing_ball_COMMON_INCLUDES_ */

#include "bouncing_ball_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real32_T VelocityIntegrator_DSTATE;  /* '<Root>/Velocity Integrator' */
  real32_T AccelerationIntegrator_DSTATE;/* '<Root>/Acceleration Integrator' */
  int8_T VelocityIntegrator_PrevResetSta;/* '<Root>/Velocity Integrator' */
  int8_T AccelerationIntegrator_PrevRese;/* '<Root>/Acceleration Integrator' */
  boolean_T IC2_FirstOutputTime;       /* '<Root>/IC2' */
  boolean_T IC_FirstOutputTime;        /* '<Root>/IC' */
} DW_bouncing_ball_T;

/* Real-time Model Data Structure */
struct tag_RTM_bouncing_ball_T {
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
extern DW_bouncing_ball_T bouncing_ball_DW;

/*
 * Exported Global Signals
 *
 * Note: Exported global signals are block signals with an exported global
 * storage class designation.  Code generation will declare the memory for
 * these signals and export their symbols.
 *
 */
extern real_T SimTime;                 /* '<Root>/Digital Clock' */
extern real32_T ball_position;         /* '<Root>/Velocity Integrator' */
extern real32_T ball_velocity;         /* '<Root>/Acceleration Integrator' */

/*
 * Exported Global Parameters
 *
 * Note: Exported global parameters are tunable parameters with an exported
 * global storage class designation.  Code generation will declare the memory for
 * these parameters and exports their symbols.
 *
 */
extern real32_T coefficient_of_restitution;/* Variable: coefficient_of_restitution
                                            * Referenced by: '<Root>/Constant1'
                                            */
extern real32_T gravitational_constant;/* Variable: gravitational_constant
                                        * Referenced by: '<Root>/Constant'
                                        */

/* Model entry point functions */
extern void bouncing_ball_initialize(void);
extern void bouncing_ball_step(void);
extern void bouncing_ball_terminate(void);

/* Real-time Model object */
extern RT_MODEL_bouncing_ball_T *const bouncing_ball_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<Root>/Scope' : Unused code path elimination
 */

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
 * '<Root>' : 'bouncing_ball'
 * '<S1>'   : 'bouncing_ball/Compare To Zero'
 */
#endif                                 /* RTW_HEADER_bouncing_ball_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
