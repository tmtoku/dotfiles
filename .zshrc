# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_HOME=${HOME}/.zsh/zsh
PLUGIN_HOME=${HOME}/.zsh/plugins

[[ -f ${HOME}/.aliases ]] && source ${HOME}/.aliases

[[ -f ${HOME}/.envs ]] && source ${HOME}/.envs

[[ -f ${ZSH_HOME}/plugins.zsh ]] && source ${ZSH_HOME}/plugins.zsh

[[ -f ${PLUGIN_HOME}/p10k.zsh ]] && source ${PLUGIN_HOME}/p10k.zsh

[[ -f ${ZSH_HOME}/history.zsh ]] && source ${ZSH_HOME}/history.zsh

[[ -f ${ZSH_HOME}/completion.zsh ]] && source ${ZSH_HOME}/completion.zsh
