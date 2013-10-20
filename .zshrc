#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options key bindings, etc.


#####################
# export variables
#####################
# {{{ export
export LANG=ja_JP.UTF-8
export EDITOR='vim'
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8" # for java/scala charset
export SBT_OPTS="$SBT_OPTS -Dfile.encoding=UTF8"    # for java/scala charset
export SBT_OPTS="$SBT_OPTS -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:PermSize=256M -XX:MaxPermSize=512M" # for permgen space
export PATH=$HOME/.nodebrew/current/bin:$PATH       # for nodebrew
export PATH=/Library/Ruby/Gems/1.8/gems/CoffeeTags-0.0.3.0/bin:$PATH       # for coffeetags
export RUBYLIB=/Library/Ruby/Gems/1.8/gems/CoffeeTags-0.0.3.0/lib:$RUBYLIB
# }}}


#####################
# aliases
#####################
# {{{ aliases
alias ll='ls -la'
alias java="java $JAVA_OPTS"
alias subl="subl -w"
alias e="subl"
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'
alias sbt-init="g8 typesafehub/scala-sbt"
alias g8-init="g8 n8han/giter8"
# }}}


#####################
# complete
#####################
# {{{ complete
if [ -e ~/.zsh-completions ]; then
    fpath=(~/.zsh-completions $fpath)
fi
autoload -U compinit
compinit -u
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
setopt complete_in_word
setopt correct
setopt auto_pushd
setopt auto_list
setopt list_types
setopt auto_menu
zstyle ':completion:*:default' menu select=1
compdef mosh=ssh
# }}}


#####################
# colors
#####################
# {{{ colors
autoload -U colors
colors
LS_COLORS='di=00;34'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# }}}

#####################
# functions
#####################
# {{{ functions
function load-if-exists() { [ -f "$1" ] && source "$1" }
# }}}


#####################
# prompt
#####################
# {{{ prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%s:%b]'
zstyle ':vcs_info:*' actionformats '[%s:%b|%a]'
PROMPT="%{${fg[cyan]}%}[%n@%m %~]%(!.#.$)%{${reset_color}%} "
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[magenta]}%}correct: %R -> %r [n/y/a/e]? %{${reset_color}%}"
RPROMPT="%1(v|%{${fg[green]}%}%1v%f|)" # vcs branch name
setopt prompt_subst
# }}}


#####################
# history
#####################
# {{{ history
setopt hist_ignore_dups
# setopt append_history
# setopt inc_append_history
# setopt share_history
# }}}


#####################
# vim key bind
#####################
# {{{ vim key bind
bindkey -v
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char

# additional vim keybinds
# -v is insert mode.
# -a is command mode.
bindkey -v '^A' vi-beginning-of-line
bindkey -v '^E' vi-end-of-line
bindkey -v '^U' kill-whole-line

# show command line stack
show_buffer_stack() {
    POSTDISPLAY="
stack: $LBUFFER"
    zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey -v '^S' show_buffer_stack
# }}}

#####################
# vi mode line
#####################
# {{{ vim mode line
# Reads until the given character has been entered.
readuntil() {
    typeset a
    while [ "$a" != "$1" ]
    do
        read -E -k 1 a
    done
}

# displays the vi mode, specified by the $1 variable, under the current command line.
showmode() {
    typeset movedown
    typeset row

    # get number of lines down to print mode
    movedown=$(($(echo "$RBUFFER" | wc -l)))

    # get current row position
    echo -n "\e[6n"
    row="${${$(readuntil R)#*\[}%;*}"

    # Are we at the bottom of the terminal?
    if [ $((row+movedown)) -gt "$LINES" ]; then
        # Scroll terminal up one line
        echo -n "\e[1S"

        # Move cursor up one line
        echo -n "\e[1A"
    fi

    # save cursor position
    echo -n "\e[s"

    # move cursor to start of line $movedown lines down
    echo -n "\e[$movedown;E"
    echo -n "\e[${LINES};${movedown}H"

    # change font attributes(bold or hilight)
    echo -n "\e[1m"

    # print mode line or clear mode line
    if [ -n "$1" ]; then
        echo -n "-- $1 --"
    else
        echo -n "\e[0K"
    fi

    # restore font and cursor position
    echo -n "\e[0m"
    echo -n "\e[u"
}

function zle-line-init zle-keymap-select {
    vimode="${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}"

    # update status line
    if [ -n "$TMUX" ]; then
        # tmux
        if [ $vimode = "NORMAL" ]; then
            statbg="colour236"
            statfg="colour247"
            statl1bg="colour240"
            statl1fg="colour231"
            statl2bg="colour148"
            statl2fg="colour22"
            statr1bg="colour240"
            statr1fg="colour247"
            statr2bg="colour252"
            statr2fg="colour236"
        else
            statbg="colour24"
            statfg="colour117"
            statl1bg="colour31"
            statl1fg="colour231"
            statl2bg="colour231"
            statl2fg="colour23"
            statr1bg="colour31"
            statr1fg="colour117"
            statr2bg="colour117"
            statr2fg="colour23"
        fi
        tmux set -g status-bg ${statbg} > /dev/null
        tmux set -g status-fg ${statfg} > /dev/null
        statl1="#[bg=${statl1bg}, fg=${statl1fg}] #H "
        statl1a="#[bg=${statbg}, fg=${statl1bg}]⮀"
        statl2="#[bg=${statl2bg}, fg=${statl2fg}] $vimode "
        statl2a="#[bg=${statl1bg}, fg=${statl2bg}]⮀"
        tmux set -g status-left "${statl2}${statl2a}${statl1}${statl1a}" > /dev/null
        statr1="#[bg=${statr1bg}, fg=${statr1fg}] #($HOME/.battery) "
        statr1a="#[bg=${statbg}, fg=${statr1bg}]⮂"
        statr2="#[bg=${statr2bg}, fg=${statr2fg}] %Y-%m-%d(%a) %H:%M "
        statr2a="#[bg=${statr1bg}, fg=${statr2bg}]⮂"
        tmux set -g status-right "${statr1a}${statr1}${statr2a}${statr2}" > /dev/null
    else
        # zsh
        showmode $vimode
    fi
}
zle -N zle-line-init
zle -N zle-keymap-select
# }}}


#####################
# others
#####################
# {{{ others
# setopt no_beep
# setopt hub
# setopt nobgnice

# for ssh-agent
ssh_auth_sock="$HOME/.ssh/ssh_auth_sock"
if [ "$SSH_AUTH_SOCK" != "$ssh_auth_sock" ]; then
    echo "SSH_AUTH_SOCK is $SSH_AUTH_SOCK"
    ln -sf $SSH_AUTH_SOCK $ssh_auth_sock && SSH_AUTH_SOCK=$ssh_auth_sock
fi
# }}}


#####################
# precmd
#####################
# {{{ precmd
# for vcs_info
function precmd_vcs_info() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
precmd_functions+=precmd_vcs_info
# }}}


#####################
# other sources
#####################
# {{{ other sources
case ${OSTYPE} in
    darwin*)
        load-if-exists ~/.zshrc.osx
    ;;
    linux*)
        load-if-exists ~/.zshrc.linux
    ;;
esac
load-if-exists ~/.zshrc.local
# }}}

