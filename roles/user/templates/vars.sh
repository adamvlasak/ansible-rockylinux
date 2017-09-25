#!/bin/bash

export LANG=en_US.UTF-8
export EDITOR=vim
export TERM=screen-256color
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=ignoreboth
export NCURSES_NO_UTF8_ACS=1

# append to the history file, don't overwrite it
shopt -s histappend

shopt -s checkwinsize
