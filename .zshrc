# ===============
#      _         
#  ___| |__  ___ 
# |_  / '_ \/ __|
#  / /| | | \__ \
# /___|_| |_|___/
#
# ===============                

export DISPLAY=:0.0
export TERM="xterm-256color"
export LANG=en_US.UTF-8

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
    export KOTLIN_HOME=/Applications/Android\ Studio.app/Contents/plugins/Kotlin
    export ANDROID_SDK_ROOT=$HOME/Library/Android/Sdk
    export SSL_CERT_FILE=/opt/homebrew/etc/openssl@3/cert.pem

    export PATH=/usr/local/bin:$PATH
    export PATH=$HOME/bin:$PATH
    export PATH=$HOME/go/bin:$PATH
    export PATH=$HOME/.local/bin:$PATH
    export PATH=$JAVA_HOME/bin:$PATH
    export PATH=$KOTLIN_HOME/kotlinc/bin:$PATH
    export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
    export PATH=/opt/homebrew/opt/ruby/bin:$PATH

    alias myip="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com"
    alias air='~/go/bin/air'
    alias gop="~/bin/git-open"
    alias studio="open -a /Applications/Android\ Studio.app"
    alias pip='noglob pip'
    alias tmk="tmux kill-session -t DEVENV"
    alias tms="tmux attach -t DEVENV || tmux new -s DEVENV"
    alias vim="nvim"
    alias ems="/Applications/Emacs.app/Contents/MacOS/Emacs -daemon && /Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait --create-frame"
    alias emk='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -e "(kill-emacs)"'

    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi
    source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
    source /opt/homebrew/opt/chruby/share/chruby/auto.sh
    chruby ruby-3.4.1

    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --ignore *.pyc --ignore .git -l -g "" | fzf'
    export FZF_DEFAULT_COMMAND='ag --ignore *.ttf --ignore *.woff -l -g "" | fzf'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo 'not implemented yet'
elif [[ "$OSTYPE" == "win32" ]]; then
    echo 'not implemented yet'
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"

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
