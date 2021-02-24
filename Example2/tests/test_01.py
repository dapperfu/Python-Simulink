Ts = 0.001


def test_steps(mdl):
    mdl.initialize()
    for step in range(int(15 / Ts)):
        mdl.step()
    assert mdl.step_num == 14999


def test_time(mdl):
    mdl.initialize()
    for step in range(int(15 / Ts)):
        mdl.step()
    assert mdl.time == 14.999


import control
import numpy as np


def test_control_num(mdl):
    sys = control.TransferFunction([3], [2, 1])
    sysd = control.c2d(sys, Ts)
    sysd
    assert np.isclose(mdl.num[1], sysd.num).all()
    assert np.isclose(mdl.den, sysd.den).all()


def test_steady_state(mdl):
    mdl.initialize()
    mdl.input_signal = 1.0
    for step in range(int(1e5)):
        mdl.step()
    assert np.isclose(mdl.output, mdl.input_signal * 3)
