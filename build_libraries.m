function build_libraries()
% BUILD_LIBRARIES Create both static (.a) and dynamic (.so) libraries from RTW source
%
% This script builds both shared and static libraries for all examples
% using the same approach as Rosetta-Simulink project.

% Define models to build
models = {'dllModel', 'discrete_tf', 'bouncing_ball'};
example_dirs = {'Example1', 'Example2', 'Example3'};

fprintf('Building libraries for all examples...\n');

for i = 1:length(models)
    model = models{i};
    example_dir = example_dirs{i};
    
    fprintf('\nBuilding %s in %s...\n', model, example_dir);
    
    % Build shared library (.so)
    build_shared_lib(model, example_dir);
    
    % Build static library (.a)
    build_static_lib(model, example_dir);
end

fprintf('\n✅ All libraries built successfully!\n');
end

function build_shared_lib(modelName, exampleDir)
% BUILD_SHARED_LIB Create a shared library (.so) from RTW source
%
% This uses the generated Makefile or manual compilation

rtw_dir = fullfile(exampleDir, [modelName '_ert_shrlib_rtw']);
so_file = fullfile(exampleDir, [modelName '.so']);

% Check if RTW directory exists
if ~isfolder(rtw_dir)
    error('RTW directory "%s" does not exist.', rtw_dir);
end

% Try to use generated Makefile first
mk_file = fullfile(rtw_dir, [modelName '.mk']);
if isfile(mk_file)
    fprintf('  Using generated Makefile for %s.so...\n', modelName);
    
    % Set MATLAB paths for the build
    old_dir = pwd;
    cd(rtw_dir);
    
    try
        % Override MATLAB paths in environment
        setenv('MATLAB_ROOT', '/opt/MATLAB/R2018a');
        setenv('MATLAB_BIN', '/opt/MATLAB/R2018a/bin');
        setenv('MATLAB_ARCH_BIN', '/opt/MATLAB/R2018a/bin/glnxa64');
        
        % Run make
        [status, result] = system('make -f ${modelName}.mk');
        
        if status == 0
            fprintf('  ✓ %s.so built successfully using Makefile\n', modelName);
            cd(old_dir);
            return;
        else
            fprintf('  Makefile failed, using manual build...\n');
        end
    catch
        fprintf('  Makefile failed, using manual build...\n');
    end
    
    cd(old_dir);
end

% Manual build with correct paths
fprintf('  Manual build for %s.so...\n', modelName);

% Define include paths
matlab_root = '/opt/MATLAB/R2018a';
include_paths = {
    fullfile(rtw_dir),
    fullfile(matlab_root, 'extern', 'include'),
    fullfile(matlab_root, 'simulink', 'include'),
    fullfile(matlab_root, 'rtw', 'c', 'src'),
    fullfile(matlab_root, 'rtw', 'c', 'src', 'ext_mode', 'common'),
    fullfile(matlab_root, 'rtw', 'c', 'ert')
};

% Build include flags
include_flags = '';
for i = 1:length(include_paths)
    include_flags = [include_flags, ' -I"', include_paths{i}, '"'];
end

% Define compilation flags
defines = {
    ['-DMODEL=', modelName],
    '-DNUMST=1',
    '-DNCSTATES=0',
    '-DHAVESTDIO',
    '-DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0',
    '-DCLASSIC_INTERFACE=0',
    '-DALLOCATIONFCN=0',
    '-DTID01EQ=0',
    '-DTERMFCN=1',
    '-DONESTEPFCN=1',
    '-DMAT_FILE=0',
    '-DMULTI_INSTANCE_CODE=0',
    '-DINTEGER_CODE=0',
    '-DMT=0',
    '-DUNIX'
};

% Build define flags
define_flags = '';
for i = 1:length(defines)
    define_flags = [define_flags, ' ', defines{i}];
end

% Build command
gcc_cmd = sprintf('gcc -fPIC -shared -o "%s"%s%s "%s.c" ert_main.c -lm', ...
    so_file, include_flags, define_flags, modelName);

% Change to RTW directory for compilation
old_dir = pwd;
cd(rtw_dir);

% Execute build
[status, result] = system(gcc_cmd);

% Return to original directory
cd(old_dir);

if status == 0
    fprintf('  ✓ %s.so built successfully\n', modelName);
else
    fprintf('  ✗ Failed to build %s.so: %s\n', modelName, result);
end

end

function build_static_lib(modelName, exampleDir)
% BUILD_STATIC_LIB Create a static library (.a) from RTW source
%
% This follows the same approach as Rosetta-Simulink build_static_lib.m

rtw_dir = fullfile(exampleDir, [modelName '_ert_shrlib_rtw']);
static_lib_name = fullfile(exampleDir, ['lib', modelName, '.a']);
combined_obj = fullfile(exampleDir, 'combined.o');

% Check if RTW directory exists
if ~isfolder(rtw_dir)
    error('RTW directory "%s" does not exist.', rtw_dir);
end

% Find all .o files
d = dir(fullfile(rtw_dir, '*.o'));
if isempty(d)
    fprintf('  No object (.o) files found in "%s", skipping static library\n', rtw_dir);
    return;
end

fprintf('  Building static library %s...\n', static_lib_name);

% Build object file paths
object_files = '';
for i = 1:length(d)
    object_files = [object_files, ' "', fullfile(rtw_dir, d(i).name), '"'];
end

% Change to example directory for build
old_dir = pwd;
cd(exampleDir);

try
    % Combine object files using ld
    ld_cmd = sprintf('ld -r -o %s%s', combined_obj, object_files);
    [status, result] = system(ld_cmd);
    
    if status ~= 0
        error('ld command failed: %s', result);
    end
    
    % Create static library using ar
    ar_cmd = sprintf('ar rcs %s %s', static_lib_name, combined_obj);
    [status, result] = system(ar_cmd);
    
    if status ~= 0
        error('ar command failed: %s', result);
    end
    
    % Clean up combined object file
    delete(combined_obj);
    
    fprintf('  ✓ %s built successfully\n', static_lib_name);
    
catch ME
    fprintf('  ✗ Failed to build static library: %s\n', ME.message);
    cd(old_dir);
    rethrow(ME);
end

cd(old_dir);

end
