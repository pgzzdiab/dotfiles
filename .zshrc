# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/pierre/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    aws
    zsh-syntax-highlighting
    zsh-completions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

source $HOME/.oh-my-zsh/custom/plugins/zsh-completions/zsh-completions.plugin.zsh


# only aws command completion
zstyle ':completion:*:*:aws' fzf-search-display true
# or for everything
zstyle ':completion:*' fzf-search-display true

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#3073f9,bg="#0b0016""
ZSH_AUTOSUGGEST_USE_ASYNC=True
# indkey '^l' autosuggest-accept

source /home/pierre/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias pic="picom -b --experimental-backends"
alias red="redshift -x"
alias red2="redshift -O 2000K"
alias red3="redshift -O 3000K"
alias red4="redshift -O 4000K"
alias red5="redshift -O 5000K"
alias poly="./.config/polybar/launch.sh"
alias ex="exec xset r rate 120 150"
alias vpn="sudo openfortivpn"
# alias back="hsetroot -solid '#000000'"
# alias back="feh --bg-scale ~/Pictures/xUjtUYC.png"
alias back="feh --bg-scale ~/Pictures/Wallpapers/abstraaaaact.jpg"
alias radio="pyradio --stations .config/pyradio/stations.csv"
alias re="pkill -USR1 -x sxhkd"
# alias ssh="kitty +kitten sshk"
alias senddata="scp -r -i .ssh/sims.pem dev/data/dalla_man_optimization/** ubuntu@ec2-35-180-6-113.eu-west-3.compute.amazonaws.com:git/data/dalla_man_optimization"
alias getresult="scp -r -i .ssh/sims.pem ubuntu@ec2-13-37-220-107.eu-west-3.compute.amazonaws.com:git/results/simulation_framework/ dev/results/simulation_framework/aws"


alias icat="kitty +kitten icat"
alias gittree="git log --graph --abbrev-commit --decorate --date=relative --all"
alias v="nvim"
alias radio="pyradio --stations .config/pyradio/stations.csv"

source /home/pierre/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# icat ~/Images/logo_diabeloop_bleu_rvb.png
icat ~/Pictures/diabeloop-logo.png
fm6000 -r


complete -C "/home/pierre/.local/bin/aws_completer" aws
