#!/bin/bash

export PROMPT_COMMAND=__prompt_command

PS1_USER="$GREEN\u$RESET"

BLUE='\[\e[1;34m\]'

PS1_LONGPATH="$BLUE\w$RESET"
PS1_TIME="[$BLUE\@$RESET]"

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

	PS1="$PS1_TIME $PS1_LONGPATH\n$PS1_USER@$PS1_HOSTNAME$RES$PS1_ENV$PS1_PROMPT "
}
