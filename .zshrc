# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=50000
setopt notify
# bindkey -v
# Bind the delete key to actually delete chars
# bindkey -a '^[[3~' delete-char
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/Marius.Mirea/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# PATH setup
export PATH="/opt/homebrew/bin:$PATH"

# CLI enhancements
alias ls="ls --color=always"
alias ll="ls -la --color=always"



eval "$(starship init zsh)"
