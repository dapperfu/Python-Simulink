Ts = 0.001


def test_time(mdl):
    mdl.initialize()
    for step in range(int(15 / Ts) + 1):
        mdl.step()
    assert mdl.time == 15.0


import control
import numpy as np


def test(mdl):
    mdl.initialize()
    for step in range(int(15 / Ts) + 1):
        mdl.step()
    assert mdl.step_num == 15000
