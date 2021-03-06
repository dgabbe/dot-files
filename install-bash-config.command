#!/usr/bin/env python3

# Set up your account to have the various bash config files point to your local git repo.
#
# Assume script is run from git local working directory.
#
# File naming convention is ~/.file-name maps to repo/file-name.sh
#
# Assume if a link is found, the environment is already setup, but not
# necessarily by this repo.
#

from __future__ import print_function
import getpass
from json import load
from os import environ, rename, symlink, path
from os.path import dirname, isfile, islink, abspath, join
from socket import gethostname
from sys import exit

home = environ["HOME"]
repo = dirname(abspath(__file__))

# os.path.dirname(os.path.abspath(__file__)) needed to unambigiously reference json file?
install_files = abspath("install-files.json")
if isfile(install_files):
    try:
        file = open(install_files, "r")
        scripts = load(file)
    except FileNotFoundError as e:
        print("  {} was not found. Cannot proceed :-(".format(e.name))
        exit(1)
    finally:
        file.close()


# Append host-user specific file if found
# Code moved to dot-files-private repo
src = 0
trg = 1
for s in scripts:
    f = join(home, s[trg])

    if isfile(f) and not islink(f):
        rename(f, f + ".org")
        print("\n    Moved", f, "to", f, ".org")

    if islink(f):
        print("\n    ", f, "is a sym link. No changes to make.")
    else:
        symlink(path.join(repo, s[src]), f)
        print("\n    ", f, "->", path.realpath(f))
