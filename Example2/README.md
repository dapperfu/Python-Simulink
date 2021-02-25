### Example 2: [discrete_tf-python_class.ipynb](https://nbviewer.jupyter.org/github/dapperfu/python_SimulinkDLL/blob/master/Example2/discrete_tf-python_class.ipynb)

![](discrete_tf.png)

A simple discrete transfer function. Compiled with a 1st order low pass filter.

There are two example notebooks for Example 2. 

1. [Simple Example](https://nbviewer.jupyter.org/github/dapperfu/python_SimulinkDLL/blob/master/Example2/discrete_tf.ipynb) - A simple low-level ctypes wrapper.
2. [Pythonic Example](https://nbviewer.jupyter.org/github/dapperfu/python_SimulinkDLL/blob/master/Example2/discrete_tf-python_class.ipynb) - Use Python syntactic sugar to create a high level [TransferTF python](https://github.com/dapperfu/python_SimulinkDLL/blob/master/Example2/discretetf.py) class to interact with the model. Adds datalogging and pandas integration.

Example 2 also contains sample `pytest` tests in the [`tests`](https://github.com/dapperfu/python_SimulinkDLL/tree/master/Example2/tests) directory. This demonstrates how you can use `pytest` to test Simulink models. Sample test results are shown shown in [test_results.md.](test_results.md)

- For the tests example the model shared library is presented to tests as a `pytest` fixture defined in [`conftest.py`](tests/conftest.py)