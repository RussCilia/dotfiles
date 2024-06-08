#!/usr/bin/env bash


### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}



# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Terminal window/tile manager using ZELLIJ
alias zel="zellij"

# File navigation using zoxide
alias z="zoxide"
alias zz="zoxide -"
alias zi="zoxide query --interactive"

# Replace CAT with BAT
alias cat="bat"

# File listing shortcuts using eza
alias ls="eza -G"
alias l="eza --oneline"
alias ll="eza --long --all"
alias tree="eza --tree"
alias ltree="eza --long --tree"
alias lgi="eza --git-ignore"
alias lg="eza --long --header --icons --git"

alias upd="sudo apt-get update"
alias upg="sudo apt-get upgrade"
alias updg="sudo apt-get update && sudo apt-get upgrade"

alias install="sudo apt-get install"

alias binstall="brew install"

alias remove="sudo apt-get remove"
alias autoremove="sudo apt-get autoremove"
alias autoclean="sudo apt-get autoclean"

alias search="sudo apt search"

alias py="python3"
alias pip="pip3"

alias venv="python -m venv .venv"
alias activate="source .venv/bin/activate"

alias aliases="sudo nano ~/.bash_aliases && source ~/.bash_aliases" 
alias ubashrc="sudo nano ~/.bashrc && source ~/.bashrc && source ~/.profile"
alias sbashrc="source ~/.bashrc && source ~/.profile"

alias cls="clear"


# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
# alias l="ls -lF ${colorflag}"

# List all files colorized in long format, excluding . and ..
# alias la="ls -lAF ${colorflag}"

# List only directories
# alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
# alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Get week number
alias week='date +%V'

# IP addresses
#alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
#alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Merge PDF files, preserving hyperlinks
# Usage: `mergepdf input{1,2,3}.pdf`
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'


# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
