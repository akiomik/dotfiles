#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options key bindings, etc.


#####################
# export variables
#####################
export LANG=ja_JP.UTF-8
export EDITOR='subl -w'
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8" # for java/scala charset
export SBT_OPTS="$SBT_OPTS -Dfile.encoding=UTF8" # for java/scala charset


#####################
# aliases
#####################
alias ls='ls -G'
# alias ls='ls --color=auto'
alias ll='ls -la'
alias java="java $JAVA_OPTS"


#####################
# complete
#####################
autoload -U compinit
compinit
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
setopt complete_in_word
setopt correct
setopt auto_pushd
setopt auto_list
setopt list_types
setopt auto_menu
zstyle ':completion:*:default' menu select=1
compdef mosh=ssh


#####################
# colors
#####################
autoload -U colors
colors
LS_COLORS='di=00;34'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


#####################
# prompt
#####################
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%s:%b]'
zstyle ':vcs_info:*' actionformats '[%s:%b|%a]'
PROMPT="%{${fg[cyan]}%}[%n@%m %~]%(!.#.$)%{${reset_color}%} "
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[magenta]}%}correct: %R -> %r [n/y/a/e]? %{${reset_color}%}"
RPROMPT="%1(v|%{${fg[green]}%}%1v%f|)" # vcs branch name
setopt prompt_subst


#####################
# history
#####################
setopt hist_ignore_dups
# setopt append_history
# setopt inc_append_history
# setopt share_history


#####################
# vim
#####################
bindkey -v
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char

# additional vim keybinds
# -v is insert mode.
# -a is command mode.
bindkey -v '^A' vi-beginning-of-line
bindkey -v '^E' vi-end-of-line
bindkey -v '^U' vi-kill-line

#####################
# vi mode line
#####################
# Reads until the given character has been entered.
readuntil() {
    typeset a
    while [ "$a" != "$1" ]
    do
        read -E -k 1 a
    done
}

# displays the vi mode, specified by the $VIMODE variable, under the current command line.
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
	VIMODE="${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}"
	showmode $VIMODE
}
zle -N zle-line-init
zle -N zle-keymap-select




# others
# setopt no_beep
# setopt hub
# setopt nobgnice


# for z
. `brew --prefix`/etc/profile.d/z.sh

# precmd
function precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
	z --add "$(pwd -P)" # for z
}
