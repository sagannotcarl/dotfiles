# Add git distinguishing marks.
export GIT_PS1_SHOWDIRTYSTATE=1

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
source /usr/local/etc/bash_completion.d/git-completion.bash

# Set Terminal colors.
# SI="\[\033[0;33m\]" #this is for the current directory 
# RI="\[\033[0;34m\]" #change this for letter colors
# HI="\[\033[0;36m\]" #change this for letter colors
# NM="\[\033[0;39m\]" #means no background and white lines
# export PS1="$NM[$SI\w$NM]! $HI"
# if [ "\$(type -t __git_ps1)" ]; then
# #  export PS1="$NM[$SI\w$RI $(__git_ps1 "(%s)")$NM]! $HI"
#   export PS1="$NM[$SI\w$RI"'$(__git_ps1 "(%s)")'"$NM]! $HI"
# fi

export CLICOLOR=cons25

# Set default editor to TextMate.
export EDITOR="/usr/bin/local/mate -w"

# Avoid successive duplicates in the bash command history.
export HISTCONTROL=ignoredups

# Append commands to the bash command history file (~/.bash_history)
# instead of overwriting it.
shopt -s histappend

# Set up grep options.
export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'
 
# Append commands to the history every time a prompt is shown,
# instead of after closing the session.
PROMPT_COMMAND='history -a'

# Setup env var for js test driver
export JSTESTDRIVER_HOME=/usr/local/bin

# Setup env var for MAMP & drush
export DRUSH_PHP='/Applications/MAMP/bin/php/php5.3.6/bin/php'
 
# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Add drush aliases.
if [ -f ~/.drush_bashrc ] ; then
   . ~/.drush_bashrc
fi

# Hitch rubygem.
# Allows two developers to be credited when pair programming using git.
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
# Uncomment to persist pair info between terminal instances
hitch

# Advanced prompt display.
COLOR_YELLOW="\[\e[33;40m\]"
COLOR_RED="\[\e[30;40m\]"
COLOR_GREEN="\[\e[32;40m\]"
COLOR_BLUE="\[\e[34;40m\]"
COLOR_NONE="\[\e[0m\]"
COLOR_NONEP="\[\e[38;40m\]"

git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "*"}'
}

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

prompt_func() {
    previous_return_value=$?;
    prompt="${COLOR_BLUE}\w${COLOR_GREEN}$(parse_git_branch)${COLOR_YELLOW}$(git_dirty_flag)${COLOR_NONEP}  "
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}${COLOR_NONEP}➔ ${COLOR_NONE} "
    else
        PS1="${prompt}${COLOR_RED}➔ ${COLOR_NONE} "
    fi
}
PROMPT_COMMAND=prompt_func

