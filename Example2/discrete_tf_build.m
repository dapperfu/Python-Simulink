%% Model Builder

% Close all models.
bdclose('all');
% Clear matlab environment.
clear;
model = 'discrete_tf';
% Run the model init script.
feval([model '_init']);
% Open the model.
open_system(model);
% 
rtwbuild(model);