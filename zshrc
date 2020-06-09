export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/simonhng/.oh-my-zsh"
export JAVA_HOME="/usr/lib/jvm/jdk-14.0.1"
export PATH=$JAVA_HOME/bin:$PATH
ZSH_THEME="agnoster"
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(
	git
	ubuntu
	zsh-syntax-highlighting
	vscode
	)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=vim;
else
  export EDITOR=vim;
  export VISUAL=vim;
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias tmux="TERM=screen-256color-bce tmux"
alias o='xdg-open'
alias h='cd /mnt/c/Users/Simon\ Huang/'
alias v="vim"
alias ranger=". ranger"
alias r=". ranger"
alias gcc="gcc main.c -o main"
prompt_context(){}
keytimeout=1

setopt extendedglob
