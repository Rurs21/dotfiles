# PROMPT
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr 'M'
zstyle ':vcs_info:*' unstagedstr 'M'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{4}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats '%F{5}[%F{4}%b%F{5}] %F{4}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked 
zstyle ':vcs+info:*' enable git
+vi-git-untracked() {
 if [[ $(git rev-parse --is-inside-wrok-tree 2> /dev/null) == 'true' ]] && [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ;  then hook_com[unstaged]+='%F{1}??%f'
 fi
}

precmd () { vcs_info }
PROMPT='%F{031}%n%f@%F{070}%m%f %F{080}%(5~|%-1~/.../%3~|%4~)%f ${vcs_info_msg_0_}%f%# '

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rurs/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Alias
alias ls='ls --color'
# dotfiles git
alias dotfiles='/usr/bin/git --git-dir=/home/rurs/.dotfiles/ --work-tree=/home/rurs'
