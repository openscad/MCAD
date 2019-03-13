#!/usr/bin/python3

import os
import shutil

if shutil.which("openscad-format") is None:
    os.system("npm install -g openscad-format")
os.system("openscad-format -i './**/*.scad'")
