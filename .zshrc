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

# Editor settings (use nvim if available)
export EDITOR=nvim

# AWS
export AWS_PROFILE=MMAWS_Profile

# CLI enhancements
alias ls="ls --color=always"
alias ll="ls -larht --color=always"
alias zshrc="$EDITOR ~/.zshrc"


source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
