Ts = 1e-3;

gravitational_constant = Simulink.Parameter;
gravitational_constant.Value = -9.81;
gravitational_constant.CoderInfo.StorageClass='ExportedGlobal';

coefficient_of_restitution = Simulink.Parameter;
coefficient_of_restitution.Value = -0.8;
coefficient_of_restitution.CoderInfo.StorageClass='ExportedGlobal';

ball_position = Simulink.Signal;
ball_position.CoderInfo.StorageClass='ExportedGlobal';

ball_velocity = Simulink.Signal;
ball_velocity.CoderInfo.StorageClass='ExportedGlobal';


SimTime = Simulink.Signal;
SimTime.CoderInfo.StorageClass='ExportedGlobal';
