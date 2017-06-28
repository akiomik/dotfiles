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
export PATH="$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
export JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8" # for java/scala charset
export SBT_OPTS="$SBT_OPTS -Dfile.encoding=UTF8"    # for java/scala charset
export SBT_OPTS="$SBT_OPTS -Xms1024m -Xmx1024m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled"
export PATH=$HOME/.nodebrew/current/bin:$PATH       # for nodebrew
export ZPLUG_HOME=/usr/local/opt/zplug
# }}}


#####################
# aliases
#####################
# {{{ aliases
alias ls='ls -G'
alias ll='ls -la'
alias java="java $JAVA_OPTS"
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'
alias sbt-init="sbt new scala/scala-seed.g8"
alias g8-init="g8 n8han/giter8"
alias android-init="g8 akiomik/android-pfn-app -b feature/upgrade-sbt-version"
alias vg="vagrant"
# }}}


#####################
# complete
#####################
# {{{ complete
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

# stack
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script "$(which stack)")"
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
setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}' # %c
zstyle ':vcs_info:git:*' unstagedstr '%F{red}'  # %u
zstyle ':vcs_info:*' formats '%F{green}%c%u[%s:%b]%f'
zstyle ':vcs_info:*' actionformats '%F{green}%c%u[%s:%b|%a]%f'
PROMPT="
%~
%(?.%F{green}❯%f.%F{red}❯%f) "
PROMPT2="%F{blue}%_> %f}"
SPROMPT="%F{magenta}correct: %R -> %r [n/y/a/e]? %f}"
RPROMPT='${vcs_info_msg_0_}'
# }}}


#####################
# history
#####################
# {{{ history
HISTFILE=$HOME/.zsh_history
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
# plugins
#####################
# {{{ plugins
source $ZPLUG_HOME/init.zsh # zplug

zplug 'zsh-users/zsh-completions'

zplug 'b4b4r07/peco-tmux.sh', \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

zplug 'b4b4r07/emoji-cli'
export EMOJI_CLI_FILTER="peco-tmux:peco"
bindkey '^xe' emoji::cli
bindkey '^x^e' emoji::cli

zplug load
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
load-if-exists ~/.zshrc.npm
load-if-exists ~/.zshrc.local
# }}}

