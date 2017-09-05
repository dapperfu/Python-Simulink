function lines = gcl
%GCL Get the handle(s) to the selected lines in the current Simulink system.
%   GCL returns the handle(s) to the currently selected lines in the
%   current system.
%
%   See also GCB, GCS, GCBH, GCSH


%   Copyright 2017 Jedediah Frey
lines = find_system(gcs,'SearchDepth',1, 'FindAll','on','Type','Line','Selected','on');