#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import shlex
import subprocess
from comm.compat import PY3


def run_command(command):
    try:
        process = subprocess.Popen(
            shlex.split(command), stdout=subprocess.PIPE, stderr=subprocess.PIPE
        )
        out, err = process.communicate()
        ret = process.poll()
    except OSError:
        return -1, "\n"

    if ret != 0:
        return ret, err.decode("utf-8") if PY3 else err

    return ret, out.decode("utf-8") if PY3 else out


def parse_version(s):
    try:
        return re.findall("[0-9]+\\.[0-9]+\\.?[0-9]*", s)[0]
    except IndexError:
        return "unknown"
