#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\e[00;37m\][\[\e[0m\]\[\e[01;32m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[01;31m\]\h\[\e[0m\]\[\e[00;37m\]:\w]\\$\[\e[0m\] "

export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"
export HISTTIMEFORMAT="%d/%m/%y %T "

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias grpe='grep --color=auto'
alias egrep='egrep --color=auto'
alias pyhton='python'

## START SSH-AGENT PROPER STARTER

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

## END SSH-AGENT PROPER STARTER
