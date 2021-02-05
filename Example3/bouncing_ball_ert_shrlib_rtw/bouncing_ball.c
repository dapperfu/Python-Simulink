/*
 * File: bouncing_ball.c
 *
 * Code generated for Simulink model 'bouncing_ball'.
 *
 * Model version                  : 1.17
 * Simulink Coder version         : 9.0 (R2018b) 24-May-2018
 * C/C++ source code generated on : Fri Feb  5 05:40:56 2021
 *
 * Target selection: ert_shrlib.tlc
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "bouncing_ball.h"
#include "bouncing_ball_private.h"

/* Exported block signals */
real32_T ball_position;                /* '<Root>/Velocity Integrator' */
real32_T ball_velocity;                /* '<Root>/Acceleration Integrator' */

/* Exported block parameters */
real32_T coefficient_of_restitution = -0.8F;/* Variable: coefficient_of_restitution
                                             * Referenced by: '<Root>/Constant1'
                                             */
real32_T gravitational_constant = -9.81F;/* Variable: gravitational_constant
                                          * Referenced by: '<Root>/Constant'
                                          */

/* Block states (default storage) */
DW_bouncing_ball_T bouncing_ball_DW;

/* Real-time model */
RT_MODEL_bouncing_ball_T bouncing_ball_M_;
RT_MODEL_bouncing_ball_T *const bouncing_ball_M = &bouncing_ball_M_;

/* Model step function */
void bouncing_ball_step(void)
{
  boolean_T rtb_Compare;
  int32_T IC2;
  real32_T IC;

  /* RelationalOperator: '<S1>/Compare' incorporates:
   *  Constant: '<S1>/Constant'
   */
  rtb_Compare = (bouncing_ball_DW.VelocityIntegrator_DSTATE <= 0.0F);

  /* InitialCondition: '<Root>/IC2' */
  if (bouncing_ball_DW.IC2_FirstOutputTime) {
    bouncing_ball_DW.IC2_FirstOutputTime = false;
    IC2 = 10;
  } else {
    IC2 = 0;
  }

  /* End of InitialCondition: '<Root>/IC2' */

  /* DiscreteIntegrator: '<Root>/Velocity Integrator' */
  if (rtb_Compare && (bouncing_ball_DW.VelocityIntegrator_PrevResetSta <= 0)) {
    bouncing_ball_DW.VelocityIntegrator_DSTATE = (real32_T)IC2;
  }

  ball_position = bouncing_ball_DW.VelocityIntegrator_DSTATE;

  /* End of DiscreteIntegrator: '<Root>/Velocity Integrator' */

  /* InitialCondition: '<Root>/IC' incorporates:
   *  Constant: '<Root>/Constant1'
   *  Product: '<Root>/Multiply'
   */
  if (bouncing_ball_DW.IC_FirstOutputTime) {
    bouncing_ball_DW.IC_FirstOutputTime = false;
    IC = 15.0F;
  } else {
    IC = coefficient_of_restitution *
      bouncing_ball_DW.AccelerationIntegrator_DSTATE;
  }

  /* End of InitialCondition: '<Root>/IC' */

  /* DiscreteIntegrator: '<Root>/Acceleration Integrator' */
  if (rtb_Compare && (bouncing_ball_DW.AccelerationIntegrator_PrevRese <= 0)) {
    bouncing_ball_DW.AccelerationIntegrator_DSTATE = IC;
  }

  ball_velocity = bouncing_ball_DW.AccelerationIntegrator_DSTATE;

  /* End of DiscreteIntegrator: '<Root>/Acceleration Integrator' */

  /* Update for DiscreteIntegrator: '<Root>/Velocity Integrator' */
  bouncing_ball_DW.VelocityIntegrator_DSTATE += 0.001F * ball_velocity;
  bouncing_ball_DW.VelocityIntegrator_PrevResetSta = (int8_T)rtb_Compare;

  /* Update for DiscreteIntegrator: '<Root>/Acceleration Integrator' incorporates:
   *  Constant: '<Root>/Constant'
   */
  bouncing_ball_DW.AccelerationIntegrator_DSTATE += 0.001F *
    gravitational_constant;
  bouncing_ball_DW.AccelerationIntegrator_PrevRese = (int8_T)rtb_Compare;
}

/* Model initialize function */
void bouncing_ball_initialize(void)
{
  /* Registration code */

  /* initialize error status */
  rtmSetErrorStatus(bouncing_ball_M, (NULL));

  /* block I/O */

  /* exported global signals */
  ball_position = 0.0F;
  ball_velocity = 0.0F;

  /* states (dwork) */
  (void) memset((void *)&bouncing_ball_DW, 0,
                sizeof(DW_bouncing_ball_T));

  /* Start for InitialCondition: '<Root>/IC2' */
  bouncing_ball_DW.IC2_FirstOutputTime = true;

  /* Start for InitialCondition: '<Root>/IC' */
  bouncing_ball_DW.IC_FirstOutputTime = true;

  /* InitializeConditions for DiscreteIntegrator: '<Root>/Velocity Integrator' */
  bouncing_ball_DW.VelocityIntegrator_DSTATE = 10.0F;
  bouncing_ball_DW.VelocityIntegrator_PrevResetSta = 2;

  /* InitializeConditions for DiscreteIntegrator: '<Root>/Acceleration Integrator' */
  bouncing_ball_DW.AccelerationIntegrator_DSTATE = 15.0F;
  bouncing_ball_DW.AccelerationIntegrator_PrevRese = 2;
}

/* Model terminate function */
void bouncing_ball_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
