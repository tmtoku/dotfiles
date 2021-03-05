#-- zinit set --#
ZINIT_DIR=${HOME}/.zsh/.zinit/bin
ZINIT_BIN=${ZINIT_DIR}/zinit.zsh
source $ZINIT_BIN
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#-- Powerline --#
zinit ice depth=1; zinit light romkatv/powerlevel10k

#-- Command suggestions based on history and completions --#
zinit light zsh-users/zsh-autosuggestions

#-- Syntax highlighting -- #
zinit light zdharma/fast-syntax-highlighting
