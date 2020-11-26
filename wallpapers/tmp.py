"""
This is a quick python script to rename all files in the current directory
in a numbered format. To use save this file as 'tmp.py' and execute it with
python3.
"""
import os

filenames = os.listdir()
COUNT = 1

for src in filenames:

    if src == "tmp.py":
        continue

    os.rename(src, "{:04d}".format(COUNT) + ".jpg")
    COUNT += 1
