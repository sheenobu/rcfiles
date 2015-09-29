#!/bin/bash

# aliases
alias ls='gls -X -G -F -t --color=auto --group-directories-first'
alias vundle='vim +BundleInstall +qall'
alias t='vim ~/.tasks'
alias f='gfind -iname '
alias restart_vbox="sudo /Library/StartupItems/VirtualBox/VirtualBox restart"
alias be='bundle exec'
alias veewee='bundle exec veewee'
alias reverse_each_line="perl -nle 'print scalar reverse'"
alias groovysh="groovysh -C -Djava.awt.headless=true "
alias all_strip_trailing_whitespace="ack -f | xargs perl -pi -e 's/ +$//'"
alias git_strip_training_whitespace="git ls-files | xargs perl -pi -e 's/ +$//'"
alias svnll="svn log | perl -l40pe 's/^-+/\n/'"
