import os
import sys

import pytest


@pytest.fixture(scope="function")
def mdl():
    from discretetf import DiscreteTF

    mdl = DiscreteTF()
    yield mdl
    mdl.terminate()
