%% Tunable parameters.
num=Simulink.Parameter;
num.Value=1;
num.CoderInfo.StorageClass='ExportedGlobal';

den=Simulink.Parameter;
den.Value=[5 1];
den.CoderInfo.StorageClass='ExportedGlobal';
%% Signals.
InputSignal=Simulink.Signal;
InputSignal.CoderInfo.StorageClass='ExportedGlobal';


OutputSignal=Simulink.Signal;
OutputSignal.CoderInfo.StorageClass='ExportedGlobal';

SimTime=Simulink.Signal;
SimTime.CoderInfo.StorageClass='ExportedGlobal';

SimTime2=Simulink.Signal;
SimTime2.CoderInfo.StorageClass='ExportedGlobal';

DelayedTime=Simulink.Signal;
DelayedTime.CoderInfo.StorageClass='ExportedGlobal';
