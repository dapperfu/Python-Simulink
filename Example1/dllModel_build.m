%% Model Builder

% Close all models.
bdclose('all');
% Clear matlab environment.
clear;
% Determine model name from the build script name
model = strtok(mfilename, '_');
% Run the model init script.
feval([model '_init']);
% Open the model.
open_system(model);
% 
rtwbuild(model);