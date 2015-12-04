# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Some more alias from Calle
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ga="git add -A "
alias gb="git branch "
alias gba="git branch --all"
alias gc="git commit -sv"
alias gca="git commit -asv"
alias gcaa="git commit -asv --amend"
alias gd="git diff -M -w"
alias gco="git checkout "
alias gdc="git diff --cached"
alias gs="git status"
alias gl="git log -p -M -w --stat --pretty=fuller"
alias glp='git log --pretty="format:%Cred%h %Cblue%d %Cgreen%s %Creset%an %ar" --graph --all'

alias l="ls --group-directories-first -alhX"

alias ag='ag -U'
alias scrot='scrot "%Y-%m-%d_$wx$h.png" -e "mv $f ~/Pictures/screenshot/"'
alias v="gvim"
alias cds="cd ~/code"
alias cdd="cd ~/.config/dotfiles"
alias cdv="cd ~/vagrants/vbox"
alias cdp="cd ~/code/system-addons/plugins"
alias cdm="cd ~/code/monitor"

alias ack="ack-grep"
alias lock="i3lock -n -c 000000"
