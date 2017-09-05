dur = 1;

tic
T= toc;
while T<10
    dur = dur*10;
    sim(bdroot, dur)
    T=toc;
    fprintf('%d %.2f\n',dur, toc)
end