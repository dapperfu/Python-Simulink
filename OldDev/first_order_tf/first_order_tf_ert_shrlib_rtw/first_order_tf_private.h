/*
 * File: first_order_tf_private.h
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

#ifndef RTW_HEADER_first_order_tf_private_h_
#define RTW_HEADER_first_order_tf_private_h_
#include "rtwtypes.h"

/* Private macros used by the generated code to access rtModel */
#ifndef rtmIsMajorTimeStep
# define rtmIsMajorTimeStep(rtm)       (((rtm)->Timing.simTimeStep) == MAJOR_TIME_STEP)
#endif

#ifndef rtmIsMinorTimeStep
# define rtmIsMinorTimeStep(rtm)       (((rtm)->Timing.simTimeStep) == MINOR_TIME_STEP)
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               ((rtm)->Timing.t)
#endif

#ifndef rtmSetTPtr
# define rtmSetTPtr(rtm, val)          ((rtm)->Timing.t = (val))
#endif

/* private model entry point functions */
extern void first_order_tf_derivatives(void);

#endif                                 /* RTW_HEADER_first_order_tf_private_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
