#!/usr/bin/env python3

import sys
import itertools
from sympy import sin, cos, pi
from math import sqrt, tan, atan2, e, exp, factorial, log, log10, ceil, floor, comb as binom
from base64 import b64encode as b64e, b64decode as b64d


fact = factorial

def product(*args):
    return list(itertools.product(*args))

def grid_path_num(size: int) -> int:
    """calculates the amount of paths from top left to bottom right in a grid with size*size squares"""
    return binom(2 * (size - 1), size - 1)

print(eval(' '.join(sys.argv[1::])))
