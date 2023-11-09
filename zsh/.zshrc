# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#function to find a directory and cd there using fzf
cd_and_copy() {
  # Search for a file using fzf
  local result=$(find . -type f | fzf)
  
  # If a file was selected
  if [[ -n $result ]]; then
    # Copy the full path to the clipboard using pbcopy
    echo $result | pbcopy
    
    # Extract the directory from the full path and change to that directory
    cd "$(dirname $result)"
  fi
}
alias cdac='cd_and_copy'

# count() {
#   if [ -z "$1" ]; then
#     echo "Please provide a file extension."
#     return 1
#   fi
#
#   find . -name "*.$1" -type f -print0 | xargs -0 wc -l | awk 'END { print $1 " LoC" }'
# }
# alias count='count'

function current-path() {
  echo -n $PWD | pbcopy
}
alias cdr='current-path'

function find-logs() {
  git diff | grep -B 8 -A 5 'console.log' | fzf
}
alias search-logs='find-logs'

function desktop() {
  cd ~/Desktop
}
alias desktop='desktop'

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

plugins=(git npm docker colorize golang)

source $ZSH/oh-my-zsh.sh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# opam configuration
[[ ! -r /Users/deantaylor/.opam/opam-init/init.zsh ]] || source /Users/deantaylor/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH="/usr/local/opt/python@3.11/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
function test_file() {
  export NODE_ENV=test
  yarn db:refresh
  npx jest "$1"
}
alias tfi="test_file"
