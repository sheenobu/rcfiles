#!/bin/bash

export PROMPT_COMMAND=__prompt_command

PS1_USER="$PINK\u$RESET"

BLUE='\[\e[1;34m\]'

PS1_LONGPATH="$BLUE\w$RESET"
PS1_TIME="[$GREEN\@$RESET]"

function __prompt_command() {
    local EXIT="$?"
    RES=""

    if [ $EXIT != 0 ]; then
	  RES=" [$RED$EXIT$RESET]"
	else
	  RES=" [$GREEN$EXIT$RESET]"
	fi

	local PS1_ENV=""
	if [ -n "$name" ]; then
		PS1_ENV=" [env=$GREEN$name$RESET]"
	fi

	local PS1_GONAME=""
	if [ -n "$GONAME" ]; then
		PS1_GONAME=" [go=$GREEN$GONAME$RESET]"
	fi


	PS1="$PS1_TIME $PS1_LONGPATH\n$PS1_USER@$PS1_HOSTNAME$RES$PS1_GONAME$PS1_ENV$PS1_PROMPT "
}
