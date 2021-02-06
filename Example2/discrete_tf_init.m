%% Tunable parameters.
sys = tf(3, [2, 1])
sysd = c2d(sys,1e-3)

step(sys, sysd)

Ts = Simulink.Parameter;
Ts.Value=1e-3;
Ts.CoderInfo.StorageClass='ExportedGlobal';

num=Simulink.Parameter;
num.Value=sysd.Numerator{1};
num.CoderInfo.StorageClass='ExportedGlobal';

den=Simulink.Parameter;
den.Value=sysd.Denominator{1};
den.CoderInfo.StorageClass='ExportedGlobal';

InputSignal=Simulink.Parameter;
InputSignal.Value=0;
InputSignal.CoderInfo.StorageClass='ExportedGlobal';
%% Signals.

OutputSignal=Simulink.Signal;
OutputSignal.CoderInfo.StorageClass='ExportedGlobal';

SimTime=Simulink.Signal;
SimTime.CoderInfo.StorageClass='ExportedGlobal';