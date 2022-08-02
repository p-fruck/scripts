#!/bin/sh
# modify legacy application paths to comply with XDG Base Directory Specification
# Done with the help of https://github.com/b3nj5m1n/xdg-ninja and https://wiki.archlinux.org/title/XDG_Base_Directory

if [ -z "${XDG_CONFIG_HOME}" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -z "${XDG_CACHE_HOME}" ]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

if [ -z "${XDG_DATA_HOME}" ]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

if [ -z "${XDG_STATE_HOME}" ]; then
    export XDG_STATE_HOME="$HOME/.local/state"
fi

if [ -z "${XDG_RUNTIME_DIR}" ]; then
    export XDG_RUNTIME_DIR="/run/user/$UID"
fi

if [ -z "${XDG_DATA_DIRS}" ]; then
    export XDG_DATA_DIRS="/usr/local/share:/usr/share"
fi

if [ -z "${XDG_CONFIG_DIRS}" ]; then
    export XDG_CONFIG_DIRS="/etc/xdg"
fi

# [android-studio]: $HOME/.android
export ANDROID_HOME="$XDG_DATA_HOME"/android

# [bash]: $HOME/.bash_history
export HISTFILE="${XDG_STATE_HOME}"/bash/history

# [cargo]: $HOME/.cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# [gem]: ${HOME}/.gem
export GEM_HOME="${XDG_DATA_HOME}"/gem

# [gnupg]: $HOME/.gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# [gradle]: $HOME/.gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# [ipython]: $HOME/.ipython
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"

# [jupyter]: $HOME/.jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

# [less]: ${HOME}/.lesshst
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# [mypy]: $HOME/.mypy_cache
export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/mypy

# [mysql]: $HOME/.mysql_history
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history

# [nodejs]: $HOME/.node_repl_history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# [npm]: $HOME/.npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

if [ ! -f $NPM_CONFIG_USERCONFIG ]; then
    mkdir -p $(dirname $NPM_CONFIG_USERCONFIG)
    cat > $NPM_CONFIG_USERCONFIG <<EOF
# make npm XDG Base Directory compliant
prefix=${XDG_DATA_HOME}/npm
cache=${XDG_CACHE_HOME}/npm
tmp=${XDG_RUNTIME_DIR}/npm
init-module=${XDG_CONFIG_HOME}/npm/config/npm-init.js

# https://cheatsheetseries.owasp.org/cheatsheets/NPM_Security_Cheat_Sheet.html#3-minimize-attack-surfaces-by-ignoring-run-scripts
# this setting might cause issues with certain packages. In such cases simply override this setting in the projects npmrc
ignore-scripts
EOF
fi

# [openjdk]: $HOME/.java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# [pylint]: ${HOME}/.pylint.d
export PYLINTHOME="${XDG_CACHE_HOME}"/pylint

# [python]: $HOME/.python_history
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"

# python config path must be changed programatically and doesn't work with -i flag
if [ ! -f $PYTHONSTARTUP ]; then
	mkdir -p $(dirname $PYTHONSTARTUP)
	cat > $PYTHONSTARTUP <<EOF
import os
import atexit
import readline

history = os.path.join(os.environ['XDG_STATE_HOME'], 'python', 'python_history')
try:
    readline.read_history_file(history)
except OSError:
    pass

def write_history():
    try:
        readline.write_history_file(history)
    except OSError:
        pass

atexit.register(write_history)
EOF
fi

# [readline]: $HOME/.inputrc
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# [ruby bundler]: $HOME/.bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

# [rustup]: $HOME/.rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# [sagemath]: $HOME/.sage
export DOT_SAGE="$XDG_CONFIG_HOME"/sage

# [sqlite]: $HOME/.sqlite_history
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history

# [wget]: $HOME/.wget-hsts
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
