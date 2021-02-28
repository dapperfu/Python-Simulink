%% Benchmark Bouncing Ball Simulation

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

idx=1;
results=zeros(4,10);
for Ts = [1e-4, 1e-5, 1e-6, 1e-7]

    for i = 1:10
        tic
        sim('bouncing_ball', 25)
        results(idx, i) = toc;
    end
    idx=idx+1;
end
mean(results, 2)
