function regenerate_linux_simple()
% REGENERATE_LINUX_SIMPLE Simple regeneration using rtwbuild
%
% This script regenerates all models using rtwbuild directly
% to create Linux-compatible .mk files

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
        
        % Build the model directly with rtwbuild
        fprintf('  Building with rtwbuild...\n');
        rtwbuild(model);
        
        fprintf('  ✓ %s regenerated successfully\n', model);
        
    catch ME
        fprintf('  ✗ Failed to regenerate %s: %s\n', model, ME.message);
    end
    
    % Return to parent directory
    cd('..');
end

fprintf('\n✅ All models regenerated!\n');

end
