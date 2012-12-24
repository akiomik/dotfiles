#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options key bindings, etc.

# aliases
alias ls='ls -G'
# alias ls='ls --color=auto'
alias ll='ls -la'
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

# export variables
export LANG=ja_JP.UTF-8
export EDITOR='subl -w'
export PATH="$HOME/bin:$PATH"
#export JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8" # for java/scala charset
export SBT_OPTS="$SBT_OPTS -Dfile.encoding=UTF8" # for java/scala charset


#####################
# zsh options
#####################

# complete
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


# colors
autoload -U colors
colors
LS_COLORS='di=00;34'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="%{${fg[cyan]}%}[%n@%m %~]%(!.#.$)%{${reset_color}%} "
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[magenta]}%}correct: %R -> %r [n/y/a/e]? %{${reset_color}%}"
RPROMPT="%1(v|%{${fg[green]}%}%1v%f|)" # vcs branch name
setopt prompt_subst


# history
setopt hist_ignore_dups
# setopt append_history
# setopt inc_append_history
# setopt share_history


# vim
bindkey -v
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char
# Reads until the given character has been entered.
readuntil() {
    typeset a
    while [ "$a" != "$1" ]
    do
        read -E -k 1 a
    done
}
# If the $SHOWMODE variable is set, displays the vi mode, specified by
# the $VIMODE variable, under the current command line.
# Arguments:
#   1 (optional): Beyond normal calculations, the number of additional
#   lines to move down before printing the mode. Defaults to zero.
showmode() {
    typeset movedown
    typeset row

    # Get number of lines down to print mode
    movedown=$(($(echo "$RBUFFER" | wc -l) + ${1:-0}))

    # Get current row position
    echo -n "\e[6n"
    row="${${$(readuntil R)#*\[}%;*}"

    # Are we at the bottom of the terminal?
    if [ $((row+movedown)) -gt "$LINES" ]
    then
        # Scroll terminal up one line
        echo -n "\e[1S"

        # Move cursor up one line
        echo -n "\e[1A"
    fi

    # Save cursor position
    echo -n "\e[s"

    # Move cursor to start of line $movedown lines down
#    echo -n "\e[$movedown;E"
    echo -n "\e[${LINES};${movedown}H"

    # Change font attributes
    echo -n "\e[1m"

    # Has a mode been set?
    if [ -n "$VIMODE" ]
    then
        # Print mode line
        echo -n "-- $VIMODE --"
    else
        # Clear mode line
        echo -n "\e[0K"
    fi

    # Restore font
    echo -n "\e[0m"

    # Restore cursor position
    echo -n "\e[u"
}
clearmode() {
    VIMODE=showmode
}
# Temporary function to extend built-in widgets to display mode.
#   1: The name of the widget.
#   2: The mode string.
#   3(optional): Beyond normal calculations, the number of additional
#   lines to move down before printing the mode. Defaults to zero.
makemodal() {
    # Create new function
    eval "$1() { zle .'$1'; ${2:+VIMODE='$2'}; showmode $3 }"

    # Create new widget
    zle -N "$1"
}
# Extend widgets
makemodal vi-add-eol            INSERT
makemodal vi-add-next           INSERT
makemodal vi-change             INSERT
makemodal vi-change-eol         INSERT
makemodal vi-change-whole-line  INSERT
makemodal vi-insert             INSERT
makemodal vi-insert-bol         INSERT
makemodal vi-open-line-above    INSERT
makemodal vi-substitute         INSERT
makemodal vi-open-line-below    INSERT 1
makemodal vi-replace            REPLACE
makemodal vi-cmd-mode           NORMAL
unfunction makemodal


# keybinds
# -v is insert mode.
# -a is command mode.
bindkey -v '^A' vi-beginning-of-line
bindkey -v '^E' vi-end-of-line

# others
# setopt no_beep
# setopt hub
# setopt nobgnice
