# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="%BABUN_THEME%"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras docker vagrant ng python pip pylint)

# User configuration

# export PATH="/home/sborden/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/home/sborden/.local/bin:/cygdrive/c/WINDOWS:/cygdrive/c/WINDOWS/System32:/cygdrive/c/WINDOWS/System32/Wbem:/cygdrive/c/mu/bin64:/cygdrive/c/mu/bin:/cygdrive/y/Ruby23-x64/bin:/cygdrive/c/WINDOWS/CCM:/cygdrive/c/Micron Common:/cygdrive/c/ProgramData/Oracle/Java/javapath:/cygdrive/c/Oracle/Ora11_x86/bin:/cygdrive/c/Oracle/Ora11_x64/bin:/cygdrive/c/wamp/bin/php/php7.0.4:/cygdrive/c/Program Files/Git:/cygdrive/c/Program Files/Git/bin:/cygdrive/c/Program Files/Git/mingw64/bin:/cygdrive/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/cygdrive/c/Program Files/nodejs:/cygdrive/c/ProgramData/chocolatey/bin:/cygdrive/y/Vagrant/bin:/cygdrive/c/Users/sborden/AppData/Roaming/npm:/cygdrive/c/Users/sborden/AppData/Roaming/nvm:/cygdrive/y/Docker Toolbox:/cygdrive/c/Users/sborden/.babun:/cygdrive/y/VirtualBox:/cygdrive/y/minishift:/cygdrive/c/Windows/System32/WindowsPowerShell/v1.0:/cygdrive/c/Windows/SysWOW64/WindowsPowerShell/v1.0"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# setup docker-machine
eval $(docker-machine env)

# add proxy settings
unset http_proxy
unset https_proxy
unset no_proxy
export HTTP_PROXY=%HTTP_PROXY%
export HTTPS_PROXY=%HTTP_PROXY%
export NO_PROXY=%NO_PROXY%