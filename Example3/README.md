### Example 3: [bouncing_ball.ipynb](https://nbviewer.jupyter.org/github/dapperfu/python_SimulinkDLL/blob/master/Example3/bouncing_ball.ipynb)

Adapted from [Mathworks's Simulation of a Bouncing Ball](https://www.mathworks.com/help/simulink/slref/simulation-of-a-bouncing-ball.html)

![](bouncing_ball.png)

Running a Simulation in Simulink also has some overhead. By compiling the model to a shared library and executing it, this overhead is eliminated.

`bouncing_ball_benchmark.m` benchmarks the model by testing increasingly smaller time steps. The model was then compiled and tested in Python and the corresponding times are recorded below.

| Time Step | Simulink Duration (s) | Python Duration (s) |
| --------- | --------------------- | ------------------- |
| 1e-4      | 0.5905                | 0.06                |
| 1e-5      | 1.0461                | 0.61                |
| 1e-6      | 8.1991                | 6.08                |
| 1e-7      | 78.9901               | 60.18               |
