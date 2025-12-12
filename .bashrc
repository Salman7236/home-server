#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
# Colorized prompt with user@host and directory
# PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ "
# PS1='\[\e[96m\]\w\[\e[0m\] \[\e[38;5;208m\]λ \[\e[0m\]'
# PS1='\[\e[38;5;141m\]\u@\h\[\e[0m\] \[\e[96m\]\w\[\e[0m\]\n\[\e[38;5;208m\]➜ \[\e[0m\]'

# git_branch() { git branch 2>/dev/null | sed -n '/^\*/s/^\* //p'; }
# PS1='\[\e[38;5;81m\]\w\[\e[0m\]$(gb="\[\e[38;5;208m\]$(git_branch)\[\e[0m\]"; [[ $gb ]] && echo " $gb") \[\e[38;5;208m\]❯\[\e[0m\] '

# Parse git branch
parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\e[36m\]\u\[\e[0m\]@\[\e[35m\]\h\[\e[0m\] \[\e[33m\]\w\[\e[0m\] \[\e[32m\]$(parse_git_branch)\[\e[0m\]\$ '

if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi

############################

if [ -f /usr/bin/fastfetch ]; then
  fastfetch
fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T" # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
# Ignore case on auto-completion
bind "set completion-ignore-case on"
# Show auto-completion list automatically, without double tab
# bind "set show-all-if-ambiguous On"

### Onefetch ###
# git repository greeter
last_repository=
check_directory_for_new_repository() {
  current_repository=$(git rev-parse --show-toplevel 2>/dev/null)

  if [ "$current_repository" ] &&
    [ "$current_repository" != "$last_repository" ]; then
    onefetch
  fi
  last_repository=$current_repository
}
cd() {
  builtin cd "$@" || return
  check_directory_for_new_repository
}

# optional, greet also when opening shell directly in repository directory
# adds time to startup
#check_directory_for_new_repository
###############

# Zoxide
eval "$(zoxide init bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# yazi change cwd when exiting
function y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")" || return
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd" || return
  rm -f -- "$tmp"
}

#path for bin
export PATH="$HOME/.local/bin:$PATH"

# fnm
eval "$(fnm env --use-on-cd --shell bash)"

# Auto "cd" when entering just a path
shopt -s autocd
