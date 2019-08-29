% Model Builder.
% Automatically parses the model name from {model}_build.m and executes
% {model}_init.m before building the model.

% Close all models.
bdclose('all');
% Clear existing variables.
clear;
% Get the model name.
tokens = strsplit(mfilename, '_');
model = strjoin(tokens(1:end-1), '_');
% Execute the init.
feval([model '_init']);
% Open the sysetm.
open_system(model);
% Build the model.
rtwbuild(model);
% Close the model
close_system(model);
