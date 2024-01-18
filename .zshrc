# Created by newuser for 5.8.1

# V analyzer
export PATH=$PATH:/home/taylor/.config/v-analyzer/bin
# Go programming language
export PATH=$PATH:/usr/local/go/bin
# Node JS
export PATH=$PATH:/opt/nodejs/bin
# Swagger
export PATH=$PATH:/opt/swagger
# Nvim
export PATH=$PATH:/opt/nvim
export VIMRUNTIME=/opt/nvim/runtime
# Atlas
export PATH=$PATH:/opt/atlas
# Flutter
export PATH=$PATH:/opt/flutter/bin
# Protoc
export PATH=$PATH:/opt/protoc/
# Dart
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH=$PATH:/opt/android-studio/jbr/bin
# Fly io
export FLYCTL_INSTALL="/home/taylor/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
# Zoxide
eval "$(zoxide init zsh)"
# Local bin
export PATH=$PATH:/home/taylor/.local/bin

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# ALIASES
#alias ls='ls --color=auto'
#alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
#alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias cat=batcat
alias ls="exa --icons"
alias ll="exa -ahl --icons"
alias lg=lazygit
setxkbmap -option caps:swapescape

# java home
# export JAVA_HOME=/usr/lib/jvm/default
export GOPATH=/home/taylor/go
export PATH=$PATH:/home/taylor/go/bin
# export PATH=$PATH:/home/vmkevv/.cargo/bin

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

if [ -f ${HOME}/.zplug/init.zsh ]; then
    source ${HOME}/.zplug/init.zsh
fi

# PLUGINS
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# spaceship config
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_GCLOUD_SHOW=false


# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/taylor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# . "$HOME/.cargo/env"


# pnpm
export PNPM_HOME="/home/taylor/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/taylor/.bun/_bun" ] && source "/home/taylor/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
