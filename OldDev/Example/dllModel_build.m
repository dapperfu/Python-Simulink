bdclose('all');
clear;

model = strtok(mfilename, '_');

feval([model '_init']);
open_system(model);
rtwbuild(model);