import ctypes
import os

import pandas as pd

from rtwtypes import *


class DiscreteTF(object):
    def __init__(self, model="discrete_tf"):
        self.model = model
        self.dll_path = os.path.abspath(f"{model}_win64.dll")
        self.dll = ctypes.windll.LoadLibrary(self.dll_path)

        # Model entry point functions
        self.__initialize = getattr(self.dll, f"{model}_initialize")
        self.__step = getattr(self.dll, f"{model}_step")
        self.__model_terminate = getattr(self.dll, f"{model}_terminate")

        self._output = real_T.in_dll(self.dll, "OutputSignal")
        self._time = real_T.in_dll(self.dll, "SimTime")

        self._input_signal = real_T.in_dll(self.dll, "InputSignal")
        self._num = (real_T * 2).in_dll(self.dll, "num")
        self._den = (real_T * 2).in_dll(self.dll, "den")

    def initialize(self):
        """Initialize the Model."""
        self.__initialize()

    def step(self):
        """Step through the model Model."""
        self.step_num = self.__step()

    def terminate(self):
        """Terminate the model Model."""
        self.__model_terminate()

    def init_log(self):
        """Create an empty datalog and intialize the model."""
        self.data = dict()
        self.data["input"] = list()
        self.data["output"] = list()
        self.data["time"] = list()
        self.initialize()

    def step_log(self):
        """Step the data and log it."""
        self.step()
        self.data["input"].append(self.input_signal)
        self.data["output"].append(self.output)
        self.data["time"].append(self.time)

    @property
    def dataframe(self):
        return pd.DataFrame(self.data)

    def plot(self):
        self.dataframe.plot(x="time", y=["input", "output"])

    # Signals
    @property
    def output(self):
        # Return a Python data type
        return float(self._output.value)

    @property
    def time(self):
        return float(self._time.value)

    # Parameters
    # Use setters/getters to make it as pythonic as possible
    @property
    def num(self):
        # Convert the ctypes Array to a python list.
        return list(self._num)

    @num.setter
    def num(self, value):
        # This size was specified at compile time and does
        # need the library to be recompiled to change.
        assert len(value) in [1, 2]
        if len(value) == 2:
            self._num[0] = float(value[0])
            self._num[1] = float(value[1])
        else:
            self._num[0] = float(0)
            self._num[1] = float(value[0])

    @property
    def den(self):
        return list(self._den)

    @den.setter
    def den(self, value):
        # This size was specified at compile time and does
        # need the library to be recompiled to change.
        assert len(value) in [1, 2]
        if len(value) == 2:
            self._den[0] = float(value[0])
            self._den[1] = float(value[1])
        else:
            self._den[0] = float(0)
            self._den[1] = float(value[0])

    @property
    def input_signal(self):
        return float(self._input_signal.value)

    @input_signal.setter
    def input_signal(self, value):
        self._input_signal.value = float(value)

    # 'Pretty' Display for IPython/Notebooks.
    def __repr__(self):
        return f"{self.model}<{self.time}, {self.input_signal}, {self.output}>"
