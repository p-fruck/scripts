#!/usr/bin/env python3

import sys
import itertools
from math import sqrt, sin, cos, tan, atan2, pi, e, exp, factorial, log, log10, ceil, floor, comb as binom

fact = factorial

def product(*args):
    return list(itertools.product(*args))

def grid_path_num(size: int) -> int:
    """calculates the amount of paths from top left to bottom right in a grid with size*size squares"""
    return binom(2 * (size - 1), size - 1)

print(eval(' '.join(sys.argv[1::])))
