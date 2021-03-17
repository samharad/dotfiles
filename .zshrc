# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="miloshadzic"

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
 #DISABLE_LS_COLORS="true"

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
plugins=(git brew osx npm)

source $ZSH/oh-my-zsh.sh

# User configuration

unsetopt RM_STAR_SILENT # prompt before rm-ing with *

# ALIASES
alias rm='safe-rm'

alias prp='pipenv run python'

alias t='python ~/t-task-manager/t.py --task-dir ~/tasks --list tasks'
alias cl='clear && l'
alias l='ls -aH' # size, show type, human readable
alias la='ls -lAFh' # long list, show almost all, type, human readable
alias ll='ls -l' # list format

alias zshrc='$EDITOR +58 ~/.zshrc' # quickly edit .zshrc
alias vimrc='$EDITOR ~/.vimrc' # quickly edit .vimrc

alias ..='cd ..' 
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd../../../..'
alias ~='cd ~'

alias c='clear'

# Set editor to vim
export EDITOR="/usr/local/bin/vim"

# Disable hostname completion 
zstyle ':completion:*' hosts off

# Path to your oh-my-zsh installation.
export ZSH=/Users/adamsam/.oh-my-zsh

# Don't create python .pyc files
export PYTHONDONTWRITEBYTECODE=1

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
# else
#  export EDITOR='mvim'
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

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. `brew --prefix`/etc/profile.d/z.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/Users/adamsam/Library/Python/2.7/bin" # for pipenv
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/opt/intel/compilers_and_libraries/mac/mkl/lib

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:/usr/local/Caskroom/miniconda/base/bin"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/datomic-cli:$PATH"

alias gcm='git commit -m'
alias gamm='git commit --amend --no-edit'

desc_() {
  desc
}

if [[ ! " ${chpwd_functions[@]} " =~ " desc_ " ]]; then
  chpwd_functions+=(desc_)
fi


