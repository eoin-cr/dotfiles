# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# echo "Hello World!"
xrdb ~/.config/x11/xresources
echo "Welcome Eoin.  It is currently `date +"%A, %e %B %Y, %r"`.  Have a nice day."

# Path to your oh-my-zsh installation.
export ZSH="/home/eoin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
 ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "dpoggi" "rkj" "half-life" "steeef" "wedisagree" "mira" "linuxonly" )

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[blue]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.

# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'

## Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null


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
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Fixing pip keychain hang issue (pip issue #7883)
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# aliases
alias vim="nvim"

alias l="ls -a"
alias c="setxkbmap us -variant colemak"
alias qwerty="setxkbmap us"
alias fb='sudo zsh -c "echo "255" > /sys/class/backlight/amdgpu_bl0/brightness"'
alias hb='sudo zsh -c "echo "128" > /sys/class/backlight/amdgpu_bl0/brightness"'
alias qb='sudo zsh -c "echo "50" > /sys/class/backlight/amdgpu_bl0/brightness"'
alias lb='sudo zsh -c "echo "20" > /sys/class/backlight/amdgpu_bl0/brightness"'
alias fb1='sudo zsh -c "echo "255" > /sys/class/backlight/amdgpu_bl1/brightness"'
alias hb1='sudo zsh -c "echo "128" > /sys/class/backlight/amdgpu_bl1/brightness"'
alias qb1='sudo zsh -c "echo "50" > /sys/class/backlight/amdgpu_bl1/brightness"'
alias lb1='sudo zsh -c "echo "20" > /sys/class/backlight/amdgpu_bl1/brightness"'

alias s="ssh eoin@[REDACTED]"
alias s-j="ssh -L 8096:127.0.0.1:8096 eoin@[REDACTED]"
alias s-q="ssh -L 8079:127.0.0.1:8079 eoin@[REDACTED]"
alias s-sy="ssh -L 8384:127.0.0.1:8384 eoin@[REDACTED]"
alias s-s="ssh -L 8989:127.0.0.1:8989 eoin@[REDACTED]"
alias s-jack="ssh -L 9117:127.0.0.1:9117 eoin@[REDACTED]"
alias s-r="ssh -L 7878:127.0.0.1:7878 eoin@[REDACTED]"
alias e="echo"
alias x="xdg-open"
alias t="xrdb ~/.config/x11/xresources"
alias v-x="vim ~/.config/x11/xresources"
alias v-z="vim ~/.config/zsh/.zshrc"
alias v-d="vim ~/.local/src/dwm/config.h"
alias py="python3"
alias pip-i="python3 -m pip install"
alias pdf="pdflatex"
alias cdu="cd ~/Uni"
alias vi="vim"
alias cdm="cd ~/eoin/Desktop/Stede_Bonnet/Music/All"
alias cds="cd ~/eoin/Desktop/Stede_Bonnet/Music/All/Soulseek"
alias p="sudo pacman -S"
alias cdp="cd ~/Programming"
alias cdj="cd ~/Programming/JomBot"
alias "ip?"="curl ifconfig.co"
alias exe="chmod +x"
alias "git-ssh"="git remote set-url origin git@github.com:eoin-cr/"
alias sys="sudo systemctl"
alias netsoc="ssh eoin@netsoc.com"
alias z="zathura"
alias cdc="cd ~/Uni/C/Prog_II/"
