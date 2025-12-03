### pacman ###
alias S='sudo pacman -S --needed'
alias Syu='sudo pacman -Syu --needed'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias yeet='yay -Rns'
# alias search='sudo pacman -Qs'
##############

### configs ###
alias aliases='nvim ~/.bash_aliases'
alias kc='nvim ~/.config/kitty/kitty.conf'
alias ilua='nvim ~/.config/nvim/init.lua'
alias wilua='v /Windows/Users/muham/AppData/Local/nvim/init.lua'
alias dc='nvim /home/salman/.config/docker/docker-compose.yml'
alias mpvconf='v ~/.config/mpv/mpv.conf'

# dotfiles workflow #
alias dots='/usr/bin/git --git-dir=$HOME/dots/ --work-tree=$HOME'
###############

### others ###
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
alias ssh256='TERM=xterm-256color ssh'
alias inspiron='ssh salman@192.168.0.101'
alias zp="zen-browser --private-window"
alias snap='sudo timeshift --create --comments'
# alias shh='systemctl sleep'
alias rs='rsync -chavzP --stats'
alias reset-network='sudo systemctl restart NetworkManager && sudo systemctl restart systemd-resolved'
alias e='exit'
##############

### Docker ###
alias docker-update='sudo docker-compose -f ~/.config/docker/docker-compose.yml pull'
alias docker-up='sudo docker-compose -f ~/.config/docker/docker-compose.yml up -d'
alias docker-down='sudo docker-compose -f ~/.config/docker/docker-compose.yml down'
alias dl='sudo docker-compose -f ~/.config/docker/docker-compose.yml logs'
alias ctop='sudo ctop'
alias lazydocker='sudo lazydocker'
alias dexec='sudo docker-compose -f ~/.config/docker/docker-compose.yml exec'
alias sync-recyclarr='dexec recyclarr recyclarr sync radarr && dexec recyclarr recyclarr sync sonarr'
###################

### Directories ###
###################

###################
alias c='clear && fastfetch' # quick clear + fetch
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -' # return to last dir

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
