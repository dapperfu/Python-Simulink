%% Tunable parameters.
K=Simulink.Parameter;
K.Value=1;
K.CoderInfo.StorageClass='ExportedGlobal';

K2=Simulink.Parameter;
K2.Value=2;
K2.CoderInfo.StorageClass='SimulinkGlobal';

%% Signals.
SignalIn=Simulink.Signal;
SignalIn.CoderInfo.StorageClass='ExportedGlobal';

SignalIn2=Simulink.Signal;
SignalIn2.CoderInfo.StorageClass='SimulinkGlobal';

SignalOut=Simulink.Signal;
SignalOut.CoderInfo.StorageClass='ExportedGlobal';

SignalOut2=Simulink.Signal;
SignalOut2.CoderInfo.StorageClass='SimulinkGlobal';

SignalOut3=Simulink.Signal;
SignalOut3.CoderInfo.StorageClass='SimulinkGlobal';

SimulationSignal1=Simulink.Signal;
SimulationSignal1.CoderInfo.StorageClass='SimulinkGlobal';

SimulationSignal2=Simulink.Signal;
SimulationSignal2.CoderInfo.StorageClass='ExportedGlobal';
