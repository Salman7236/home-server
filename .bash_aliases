### pacman ###
alias S='sudo pacman -S --needed'
alias Syu='sudo pacman -Syu --needed'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias yeet='yay -Rns'
# alias search='sudo pacman -Qs'
##############

### configs ###
alias aliases='nvim ~/.bash_aliases'
alias rc='nvim ~/.bashrc'
alias kc='nvim ~/.config/kitty/kitty.conf'
alias ilua='nvim ~/.config/nvim/init.lua'
alias wilua='v /Windows/Users/muham/AppData/Local/nvim/init.lua'
alias dc='nvim /home/salman/.config/docker/docker-compose.yml'
alias mpvconf='v ~/.config/mpv/mpv.conf'

# dotfiles git workflow #
alias dots='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'
# alias nun='dots commit -m "nun too much"'
nun() {
  dots commit -m "nun too much" && dots push
}
alias pkglist='dots add pkglist.txt && dots commit -m "pkglist" && dots push' # alias to add, commit and push pkglist.txt
###############

### others ###
# alias grep='grep --color=auto'
alias sv='sudoedit'
alias grep='rg'
alias fr='sudo $(history -p !!)'
alias :q="echo 'You ain'\''t editing a file, nigga.'"
#alias :wq=':q'
alias :wq="echo 'There ain'\''t nothin'' to save, cuh.'"
alias :x="echo 'This ain'\''t Vim, bro.'"
alias :qa="echo 'Quitting all what? You in Bash.'"
alias :w="echo 'Write where? There ain'\''t no buffer here.'"
alias ZZ="echo 'Trying to be slick with ZZ? Nah.'"
alias vote='aur-auto-vote -n Salman7236'
#alias v='nvim'
alias update-grub="sudo grub-mkconfig -o '/boot/grub/grub.cfg'"
alias ff="fastfetch"
alias inspiron='ssh salman@inspiron'
alias s='kitten ssh salman@inspiron'
# alias snap='sudo timeshift --create --comments'
# alias shh='systemctl sleep'
alias rs='rsync -chavzP --stats'
alias reset-network='sudo systemctl restart NetworkManager && sudo systemctl restart systemd-resolved'
alias e='exit'
alias tl='sudo timeshift --list'
alias cpu='auto-cpufreq --stats'
alias cp='cp -i'
alias mv='mv -i'
alias less='less -R'
alias h="history | grep "
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
##############

### Docker ###
alias docker-pull='sudo docker-compose -f ~/.config/docker/docker-compose.yml pull'
alias docker-up='sudo docker-compose -f ~/.config/docker/docker-compose.yml up -d'
alias docker-down='sudo docker-compose -f ~/.config/docker/docker-compose.yml down'
alias docker-restart='sudo docker-compose -f ~/.config/docker/docker-compose.yml restart'
alias docker-update='sudo docker-compose -f ~/.config/docker/docker-compose.yml pull && sudo docker-compose -f ~/.config/docker/docker-compose.yml up -d'
alias dl='sudo docker-compose -f ~/.config/docker/docker-compose.yml logs'
alias ctop='sudo ctop'
alias lazydocker='sudo lazydocker'
alias dexec='sudo docker-compose -f ~/.config/docker/docker-compose.yml exec'
alias sync-recyclarr='sudo docker-compose -f ~/.config/docker/docker-compose.yml exec recyclarr recyclarr sync'
###################

### Directories ###
###################

###################
alias c='clear && fastfetch' # quick clear + fetch
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
# alias -='cd -' # return to last dir

# eza ls aliases

alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias l='eza -blGF --header --git --color=always --group-directories-first --icons'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons'
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'

alias lS='eza -1 --color=always --group-directories-first --icons'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons'
alias l.="eza -a | grep -E '^\.'"

### Functions ###

# v = nvim
v() {
  nvim "$@"
}

sudo() {
  if [ "$1" = "v" ]; then
    shift
    command sudo nvim "$@"
  else
    command sudo "$@"
  fi
}

# timeshift
snap() {
  local comment="$*"
  local today
  today=$(date +%F)
  sudo timeshift --create --comments "${today}${comment:+_${comment}}"
}
