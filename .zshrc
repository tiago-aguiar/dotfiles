# ===============
#      _         
#  ___| |__  ___ 
# |_  / '_ \/ __|
#  / /| | | \__ \
# /___|_| |_|___/
#
# ===============                

export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
export PATH=$HOME/go/bin:$HOME/bin:/usr/local/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$PATH:/opt/flutter/bin"
export PATH="$PATH:/usr/lib/dart/bin"
export LC_ALL=en_US.UTF-8


ANDROID_HOME=""
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    ANDROID_HOME=$HOME/Android/Sdk
    export ANDROID_SDK_ROOT=$HOME/Android/Sdk
    export PATH=$PATH:$HOME/swift-4.0.3-RELEASE-ubuntu16.10/usr/bin
    export PATH=$PATH:/opt/firefox
    ZSH_DISABLE_COMPFIX=true

elif [[ "$OSTYPE" == "darwin"* ]]; then
    export ANDROID_SDK_ROOT=~/Library/Android/Sdk
    ANDROID_HOME=~/Library/Android/Sdk
    export PATH=$PATH:/$HOME/bin/kotlin-native-macos-x86_64-1.8.21/bin
    export PATH=$PATH:/$HOME/bin/kotlinc/bin
    export PATH=$PATH:/Library/TeX/texbin

elif [[ "$OSTYPE" == "win32" ]]; then
fi

export ANDROID_HOME
export PATH=$PATH:$HOME/bin:$ANDROID_SDK_ROOT/tools
export PATH=${PATH}:${ANDROID_SDK_ROOT}/tools
export PATH=${PATH}:${ANDROID_SDK_ROOT}/platform-tools

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gallois"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

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
#
plugins=(git)


source $ZSH/oh-my-zsh.sh

export DISPLAY=:0.0
export TERM="xterm-256color"
export LANG=en_US.UTF-8

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias studio="open -a /Applications/Android\ Studio.app"
alias pip='noglob pip'
alias homewin='cd $HOME/..'    
alias tmk="tmux kill-session -t DEVENV"
alias tms="tmux attach -t DEVENV || tmux new -s DEVENV"
alias vim="nvim"
alias ems="/Applications/Emacs.app/Contents/MacOS/Emacs -daemon && /Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait --create-frame"
alias emt="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"
alias emk='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -e "(kill-emacs)"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --ignore *.pyc --ignore .git -l -g "" | fzf'
export FZF_DEFAULT_COMMAND='ag --ignore *.ttf --ignore *.woff -l -g "" | fzf'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/tiago/.sdkman"
[[ -s "/home/tiago/.sdkman/bin/sdkman-init.sh" ]] && source "/home/tiago/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/bin/flutter/bin"


if [ -d '/usr/local/go/bin' ]; then 
    export PATH=$PATH:/usr/local/go/bin;
fi

export PATH="/Users/tiagoaguiar/.deta/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
#source /usr/local/opt/chruby/share/chruby/chruby.sh
#source /usr/local/opt/chruby/share/chruby/auto.sh
#chruby ruby-3.1.2
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tiagoaguiar/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tiagoaguiar/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tiagoaguiar/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tiagoaguiar/bin/google-cloud-sdk/completion.zsh.inc'; fi
