#!/bin/bash

export LANG=en_US.UTF-8
export EDITOR=vim
export BROWSER=w3m
export TERM=screen-256color
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=ignoreboth
export NCURSES_NO_UTF8_ACS=1

# append to the history file, don't overwrite it
shopt -s -q histappend

# Make sure display get updated when terminal window get resized
shopt -s -q checkwinsize

# Correct dir spellings
shopt -s -q cdspell

# Turn on the extended pattern matching features
shopt -s -q extglob
