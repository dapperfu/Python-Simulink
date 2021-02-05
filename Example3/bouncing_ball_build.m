%% Model Builder

% Close all models.
bdclose('all');
% Clear matlab environment.
clear;
% Determine model name from the build script name
model = 'bouncing_ball';
% Run the model init script.
feval([model '_init']);
% Open the model.
open_system(model);
% 
rtwbuild(model);