# =====================================
# Options
# =====================================
# Disable dup history command
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt APPENDHISTORY

# =====================================
# Autoloads
# =====================================
# Completion
autoload -U compinit

# =====================================
# Prompt
# =====================================
export PROMPT=" %F{yellow}%B%1d %(?.%F{green}.%F{red}) %f%b"

# =====================================
# Shell Daemons
# =====================================
compinit

# =====================================
# Alias
# =====================================
alias ll="exa -alrh --icons --group-directories-first --git"
alias tran="trans -s English -t 'Chinese (Simplified)' -I"
alias cls="clear"
alias dict="sdcv --color"
alias music="ncmpcpp -q"
alias mail="neomutt"
alias wifi="nmcli"
alias blue="bluetoothctl"
alias lock="swaylock"

# =====================================
# Variable
# =====================================
export GPG_TTY=`tty`

# =====================================
# Plugins
# =====================================
source $ZDOTDIR/zsh-autopair/autopair.zsh
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
