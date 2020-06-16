#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Bash colors
NORMAL=$(echo -e "\001\033[00m\002")
GREEN=$(echo -e "\001\033[00;32m\002")
RED=$(echo -e "\001\033[00;31m\002")
BLUE=$(echo -e "\001\033[00;94m\002")
YELLOW=$(echo -e "\001\033[00;33m\002")
MAGENTA=$(echo -e "\001\033[00;35m\002")
CYAN=$(echo -e "\001\033[00;36m\002")

export TERM=xterm-256color
