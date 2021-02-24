import control
import numpy as np


def test_steps(mdl, Ts):
    """Test the step counter"""
    mdl.initialize()
    for _ in range(int(15 / Ts)):
        mdl.step()
    assert mdl.step_num == 14999


def test_time(mdl, Ts):
    """Test simulation time after given number of steps."""
    mdl.initialize()
    for _ in range(int(15 / Ts)):
        mdl.step()
    assert mdl.time == 15 - Ts


def test_steady_state(mdl, Ts):
    """Test Step response steady state condition"""
    mdl.input_signal = 1.0
    for _ in range(int(100 / Ts)):
        mdl.step()
    assert np.isclose(mdl.output, mdl.input_signal * 3)


def test_control_tf(mdl, sysd):
    """Test that the discrete transfer function's numerator and denominator match
    those calculated from python-control.
    """
    assert np.isclose(mdl.num[1], sysd.num).all()
    assert np.isclose(mdl.den, sysd.den).all()


def test_sine_response(mdl, sysd, Ts):
    """
    Test that a sine wave input to the Simulink Transfer function matches the forced_response
    output given the same input.
    """
    sys = control.TransferFunction([3], [2, 1])
    sysd = control.c2d(sys, Ts)

    mdl.init_log()
    f = 0.5  # Hz
    for step in range(int(10 * 1e3)):
        mdl.input_signal = np.sin(2 * np.pi * step * f * Ts)
        mdl.step_log()
    df = mdl.dataframe
    _, yout = control.forced_response(sysd, df.time, df.input)
    np.allclose(yout, df.output)


def test_step_response(mdl, Ts):
    """ Test a step response for 1/(s+1)"""
    # Static Gain
    K = 1
    # Time Constant.
    tau = 1
    sys = control.TransferFunction([K], [tau, 1])
    sysd = control.c2d(sys, Ts)
    mdl.num = sysd.num[0][0]
    mdl.den = sysd.den[0][0]

    mdl.init_log()
    for step in range(int(10 * 1e3)):
        mdl.input_signal = 1 if step >= 1 / Ts else 0
        mdl.step_log()
    df = mdl.dataframe

    step_idx = np.where(df.input > 0)[0][0]
    tau1_idx = np.where(df.output < (1 - np.exp(-1 * tau)))[0][-1]
    tau2_idx = np.where(df.output < (1 - np.exp(-2 * tau)))[0][-1]
    assert np.isclose(df.time[tau1_idx] - df.time[step_idx], tau)
    assert np.isclose(df.time[tau2_idx] - df.time[step_idx], 2 * tau)
