#!/usr/bin/env python3

import sys
import itertools
#from sympy import sin, cos, pi
from math import sqrt, sin, tan, atan2, e, exp, factorial, log, log10, ceil, floor, comb as binom
from base64 import b64encode as b64e, b64decode as b64d


fact = factorial

def product(*args):
    return list(itertools.product(*args))

def grid_path_num(size: int) -> int:
    """calculates the amount of paths from top left to bottom right in a grid with size*size squares"""
    return binom(2 * (size - 1), size - 1)

def split_blocks(text: bytes, block_size=16) -> list[bytes]:
    """Splits bytes into blocks with a given block size."""
    return [ text[i:i+block_size] for i in range(0, len(text), block_size) ]

def split_str(text: str, block_size=16) -> str:
    return ' '.join(split_blocks(text, block_size))

print(eval(' '.join(sys.argv[1::])))
