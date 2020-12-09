# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# If you come from bash you might have to change your $PATH.
export http_proxy="http://127.0.0.1:8889"
export https_proxy="http://127.0.0.1:8889"
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin

export PATH=$HOME/.cabal/bin:/usr/lib/go:$HOME/go:$HOME/go/bin:$HOME/.dotnet/tools:$HOME/.node_modules_global/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export ASPNETCORE_ENVIRONMENT=Development


# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
ZSH_THEME="archcraft"

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

plugins=(git zsh-syntax-highlighting zsh-autosuggestions extract sudo golang incr)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='mnvim'
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
#
alias vz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"

alias jpc="cd ~/PrivateConfig"
alias jb="cd ~/git/bspwm-dotfiles"
alias jd="cd ~/Downloads"
alias jdc="cd ~/Downloads/Compressed"
alias jc="cd ~/.config"
alias jcl="cd ~/clone"
alias jp="cd ~/.config/bspwm/polybar"
alias ji="cd ~/git/i3-dotfiles"
alias vp="nvim ~/.config/picom/picom.conf"
alias v3="nvim ~/.config/i3/config"

alias vb="nvim ~/.config/bspwm/bspwmrc"
alias vs="nvim ~/.config/sxhkd/sxhkdrc"
alias vv="nvim ~/.vimrc"
alias vvp="nvim ~/.vimrc.custom.plugins"
alias vvc="nvim ~/.vimrc.custom.config"

alias pyins="pip3 install --user"
alias pyuins="pip3 uninstall"

alias ins="land && yay -S"
alias uins="yay -R"
alias uinss="yay -Rsn"
alias up="land && yay -Syyu"

alias stlsa="sudo systemctl start"
alias stlst="sudo systemctl stop"
alias stlsu="sudo systemctl status"
alias stlre="sudo systemctl restart"
alias stlen="sudo systemctl enable --now"
alias stldis="sudo systemctl disable"

alias gc="git clone"
alias ga="git add"
alias gm="git commit -m"
alias gps="git push"

alias doom="~/.emacs.d/bin/doom"
alias ew="emacsclient -c -nw"

alias vim="nvim"
alias c="clear"
alias x="extract"
alias ne="neofetch"
alias ra="ranger"
alias re="sh ~/.config/sxhkd/reset.sh && reboot"
alias po="sh ~/.config/sxhkd/reset.sh && poweroff"
alias del="sh ~/.rm.sh"
alias tra="cd ~/.local/share/Trash/files && ls -a"
alias empty="sudo rm -fr ~/.trash && mkdir ~/.trash"
alias key="land && yay -S archlinuxcn-keyring"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
