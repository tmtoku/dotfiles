# History Settings -------------------------

export HISTFILE=${HOME}/Dropbox/zsh/.zsh_history
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export SAVEHIST=1000000

zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    # Only those that satisfy all of the following conditions are added to the history
    [[ ${#line} -ge 5
       && ${cmd} != ls
       && ${cmd} != ll
       && ${cmd} != la
       && ${cmd} != pwd
       && ${cmd} != cd
       && ${cmd} != exit
    ]]
}

select-history() {
  BUFFER=$(history -n -r 1 | fzf-tmux -d --reverse --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# New history lines are added incrementally
setopt INC_APPEND_HISTORY
# Share history
setopt SHARE_HISTORY
# When searching for history entries, do not display duplicates
setopt HIST_FIND_NO_DUPS
# If a new command duplicates an older one, remove the older command
setopt HIST_IGNORE_ALL_DUPS
# If a command contains a leading space, remove the command
setopt HIST_IGNORE_SPACE
# Remove superfluous blanks
setopt HIST_REDUCE_BLANKS

