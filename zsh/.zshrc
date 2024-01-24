autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

alias lsa='ls -la'

autoload -Uz vcs_info
precmd() {
  # Fetching the latest Git branch information
  vcs_info

  # Defining the prompt with your preferred format and dynamic Git info
PROMPT='%F{cyan}┌─[%F{green}%n@%m%F{cyan}] - [%F{blue}%~%F{cyan}] - [%F{magenta}%D{%Y-%m-%d %H:%M:%S}%f]
%F{cyan}└─[%F{yellow}%?%F{cyan}] <%(!.%B.%b) %F{red}${vcs_info_msg_0_}%F{cyan}> %f'

  RPROMPT=' %F{005}%T%f'
}

# Enable prompt substitution to ensure dynamic updates
setopt prompt_subst

# Configuring the vcs_info function to output the branch name
zstyle ':vcs_info:git:*' formats '(%b) '



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
alias tfi="test_file
