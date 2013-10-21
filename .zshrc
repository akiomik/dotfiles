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
autoload -Uz add-zsh-hook
function precmd_vcs_info() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd precmd_vcs_info
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

