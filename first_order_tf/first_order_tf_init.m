%% Tunable parameters.
K=Simulink.Parameter;
K.Value=1;
K.CoderInfo.StorageClass='SimulinkGlobal';

tau=Simulink.Parameter;
tau.Value=2;
tau.CoderInfo.StorageClass='SimulinkGlobal';

%% Signals.
InputSignal=Simulink.Signal;
InputSignal.CoderInfo.StorageClass='SimulinkGlobal';


OutputSignal=Simulink.Signal;
OutputSignal.CoderInfo.StorageClass='SimulinkGlobal';

SimTime=Simulink.Signal;
SimTime.CoderInfo.StorageClass='SimulinkGlobal';

SimTime2=Simulink.Signal;
SimTime2.CoderInfo.StorageClass='SimulinkGlobal';

DelayedTime=Simulink.Signal;
DelayedTime.CoderInfo.StorageClass='SimulinkGlobal';
