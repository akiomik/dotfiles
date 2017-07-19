#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options key bindings, etc.


#####################
# export variables
#####################
# {{{ export
typeset -xU path fpath

path=( \
  $HOME/bin(N-/) \
  $HOME/.local/bin(N-/) \
  $HOME/.nodebrew/current/bin(N-/) \
  /usr/local/bin(N-/) \
  $path \
)

export LANG=ja_JP.UTF-8
export EDITOR='vim'
export LV="-c"

# pager
# LESS_TERMCAP_* can't seems to set in lesskey (and LESSHISTFILE too?)
# https://unix.stackexchange.com/a/377221
export PAGER='less'
export LESSKEY="$HOME/.less/key"
export LESSHISTFILE="$HOME/.less/hst"
export LESS_TERMCAP_mb=$'\e[36m'     # mode blink (cyan)
export LESS_TERMCAP_md=$'\e[34m'     # mode double-bright (blue)
export LESS_TERMCAP_me=$'\e[0m'      # mode end
export LESS_TERMCAP_so=$'\e[43;30m'  # stand-out mode (yellow/black)
export LESS_TERMCAP_se=$'\e[0m'      # stand-out mode end
export LESS_TERMCAP_us=$'\e[32m'     # underline start (green)
export LESS_TERMCAP_ue=$'\e[0m'      # underline end

# java & scala
export JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8"
export SBT_OPTS="$SBT_OPTS -Dfile.encoding=UTF-8"
export SBT_OPTS="$SBT_OPTS -Xms1024m -Xmx1024m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled"

# haskell
path=($(stack path --compiler-bin)(N-/) $path) # for hdevtools

# misc
export ZPLUG_HOME=/usr/local/opt/zplug
export GIBO_BOILERPLATES="$HOME/.config/git/ignore-boilerplates"
export NODE_REPL_HISTORY="$HOME/.history/node_repl_history"
# }}}


#####################
# aliases
#####################
# {{{ aliases
alias ls='ls -G'
alias ll='ls -la'
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'
alias vg="vagrant"
alias zshtime='for i in $(seq 1 10); do time zsh -i -c exit; done'
alias ack-pager="ack --pager=$PAGER"

# scala
SCALA_REPL_HISTORY="$HOME/.history/scala_history"
SCALA_REPL_OPTS="-Dscala.color -Dscala.shell.histfile=${SCALA_REPL_HISTORY}"
alias scala="scala $SCALA_REPL_OPTS"
alias sbt-init="sbt new scala/scala-seed.g8"
alias g8-init="g8 n8han/giter8"
alias android-init="g8 akiomik/android-pfn-app -b feature/upgrade-sbt-version"
# }}}


#####################
# complete
#####################
# {{{ complete
# NOTE: compinit is loaded by zplug
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
setopt complete_in_word
setopt correct
setopt auto_pushd
setopt auto_list
setopt list_types
setopt auto_menu
zstyle ':completion:*:default' menu select=1
# }}}


#####################
# colors
#####################
# {{{ colors
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
setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr     '%F{yellow}'           # %c
zstyle ':vcs_info:git:*' unstagedstr   '%F{red}'              # %u
zstyle ':vcs_info:*'     formats       '%F{green}%c%u%b%f'    # %b: branch
zstyle ':vcs_info:*'     actionformats '%F{green}%c%u%b:%a%f' # %a: action
PROMPT="
%~
%(?.%F{green}❯%f.%F{red}❯%f) "
PROMPT2="%F{blue}%_> %f"
SPROMPT="%F{magenta}correct: %R -> %r [n/y/a/e]? %f"
RPROMPT='${vcs_info_msg_0_}'
# }}}


#####################
# history
#####################
# {{{ history
HISTFILE=$HOME/.zsh/zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
setopt hist_ignore_dups
# setopt append_history
# setopt inc_append_history
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

# zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'

# zargs
autoload zargs

# for ssh-agent
ssh_auth_sock="$HOME/.ssh/ssh_auth_sock"
if [ -n "$SSH_AUTH_SOCK" ] && [ "$SSH_AUTH_SOCK" != "$ssh_auth_sock" ]; then
    echo "old SSH_AUTH_SOCK is $SSH_AUTH_SOCK"
    echo "new SSH_AUTH_SOCK is $ssh_auth_sock"
    ln -sf $SSH_AUTH_SOCK $ssh_auth_sock && SSH_AUTH_SOCK=$ssh_auth_sock
fi
# }}}


#####################
# other sources
#####################
# {{{ other sources
case ${OSTYPE} in
    darwin*)
        load-if-exists ~/.zsh/zshrc.osx
    ;;
    linux*)
        load-if-exists ~/.zsh/zshrc.linux
    ;;
esac
load-if-exists ~/.zsh/zshrc.local
# }}}


#####################
# plugins
#####################
# {{{ plugins
source $ZPLUG_HOME/init.zsh # zplug

zplug 'b4b4r07/peco-tmux.sh', \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

zplug 'b4b4r07/emoji-cli'
export EMOJI_CLI_FILTER="peco-tmux:peco"
bindkey '^xe' emoji::cli
bindkey '^x^e' emoji::cli

if ! zplug check; then
  zplug install
fi

zplug load
# }}}
