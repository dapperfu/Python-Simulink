function fix_makefiles_linux()
% FIX_MAKEFILES_LINUX Fix existing Makefiles to use Linux-compatible patterns
%
% This script modifies existing .mk files to use .o targets instead of .obj
% and Linux-compatible patterns

fprintf('Fixing Makefiles for Linux compatibility...\n');

% Define models to fix
models = {'dllModel', 'discrete_tf', 'bouncing_ball'};
example_dirs = {'Example1', 'Example2', 'Example3'};

for i = 1:length(models)
    model = models{i};
    example_dir = example_dirs{i};
    
    fprintf('\nFixing %s in %s...\n', model, example_dir);
    
    % Find the Makefile
    mk_file = fullfile(example_dir, [model '_ert_shrlib_rtw'], [model '.mk']);
    
    if ~isfile(mk_file)
        fprintf('  Makefile not found: %s\n', mk_file);
        continue;
    end
    
    % Read the Makefile
    fprintf('  Reading Makefile...\n');
    fid = fopen(mk_file, 'r');
    content = fread(fid, '*char')';
    fclose(fid);
    
    % Fix object file definitions
    fprintf('  Fixing object definitions...\n');
    content = strrep(content, '.obj', '.o');
    
    % Fix target patterns
    fprintf('  Fixing target patterns...\n');
    content = strrep(content, '%.obj :', '%.o :');
    
    % Fix system libraries (add -lm for Linux)
    fprintf('  Fixing system libraries...\n');
    content = strrep(content, 'SYSTEM_LIBS =', 'SYSTEM_LIBS =  -lm');
    
    % Write the fixed Makefile
    fprintf('  Writing fixed Makefile...\n');
    fid = fopen(mk_file, 'w');
    fprintf(fid, '%s', content);
    fclose(fid);
    
    fprintf('  ✓ %s Makefile fixed\n', model);
end

fprintf('\n✅ All Makefiles fixed for Linux compatibility!\n');

end
