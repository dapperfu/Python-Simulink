%% Model Builder
% Close all models.
bdclose('all');
% Clear matlab environment.
clear;
% Change to the build script folder
cd(fileparts(mfilename('fullpath')));

% Model To Build
model = 'discrete_tf';
% Run the model init script.
feval([model '_init']);
% Open the model.
open_system(model);
% RealTimeWorkshop Build
rtwbuild(model);
