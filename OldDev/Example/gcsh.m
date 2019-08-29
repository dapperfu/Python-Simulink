function cursys=gcsh
%GCSH Get the handle to the current Simulink system.
%   GCSH returns the handle to the of the current system. During editing,
%   the current system is the system or subsystem most recently clicked in.
%   During simulation of a system containing S-function blocks, the current
%   system is the system or subsystem containing the S-function block that
%   is currently being evaluated.
%
%   See also GCBH, GCB, GCS.

%   Copyright 2017 Jedediah Frey

cursys = get_param(gcs, 'Handle');
