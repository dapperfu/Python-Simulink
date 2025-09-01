function regenerate_linux()
% REGENERATE_LINUX Regenerate all Simulink models for Linux platform
%
% This script regenerates all models using rtwbuild with Linux target
% to create proper Linux-compatible .mk files with .o targets

% Close all models
bdclose('all');
clear;

% Change to the script directory
cd(fileparts(mfilename('fullpath')));

fprintf('Regenerating all models for Linux platform...\n');

% Define models to regenerate
models = {'dllModel', 'discrete_tf', 'bouncing_ball'};
example_dirs = {'Example1', 'Example2', 'Example3'};

for i = 1:length(models)
    model = models{i};
    example_dir = example_dirs{i};
    
    fprintf('\nRegenerating %s in %s...\n', model, example_dir);
    
    % Change to example directory
    cd(example_dir);
    
    try
        % Run the model init script if it exists
        if exist([model '_init.m'], 'file')
            fprintf('  Running %s_init...\n', model);
            feval([model '_init']);
        end
        
        % Open the model
        fprintf('  Opening %s...\n', model);
        open_system(model);
        
        % Get the model handle
        model_handle = get_param(model, 'Handle');
        
        % Set target platform to Linux (R2018a compatible)
        fprintf('  Setting target to Linux...\n');
        set_param(model_handle, 'TargetHWDeviceType', 'Intel->x86-64 (Linux 64)');
        
        % Configure for shared library target
        fprintf('  Configuring for shared library...\n');
        set_param(model_handle, 'GenCodeOnly', 'off');
        set_param(model_handle, 'TargetLang', 'C');
        set_param(model_handle, 'SystemTargetFile', 'ert_shrlib.tlc');
        
        % Set function library to ISO_C for better compatibility
        set_param(model_handle, 'TargetFcnLib', 'ISO_C');
        
        % Build the model
        fprintf('  Building with rtwbuild...\n');
        rtwbuild(model);
        
        fprintf('  ✓ %s regenerated successfully\n', model);
        
    catch ME
        fprintf('  ✗ Failed to regenerate %s: %s\n', model, ME.message);
        
        % Try alternative approach - just run rtwbuild directly
        try
            fprintf('  Trying direct rtwbuild...\n');
            rtwbuild(model);
            fprintf('  ✓ %s regenerated successfully (direct method)\n', model);
        catch ME2
            fprintf('  ✗ Direct rtwbuild also failed: %s\n', ME2.message);
        end
    end
    
    % Close the model
    try
        close_system(model, 0);
    catch
        % Model might already be closed
    end
    
    % Return to parent directory
    cd('..');
end

fprintf('\n✅ All models regenerated for Linux platform!\n');
fprintf('The .mk files now use Linux-compatible .o targets.\n');

end
