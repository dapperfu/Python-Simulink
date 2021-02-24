import os
import sys

import control
import pytest
from discretetf import DiscreteTF


@pytest.fixture
def Ts():
    """ Simulink time step. """
    return 1e-3


@pytest.fixture(scope="function")
def mdl():
    """Pytest fixture for the model.
    Run the initialize function before handing off the model
    Run the terminate function after recieving the model.

    This ensures that each test has the same starting model state.
    """
    mdl = DiscreteTF()
    mdl.initialize()
    yield mdl
    mdl.terminate()


@pytest.fixture(scope="function")
def sysd(Ts):
    """ python-control discrete transfer function """
    sys = control.TransferFunction([3], [2, 1])
    return control.c2d(sys, Ts)
