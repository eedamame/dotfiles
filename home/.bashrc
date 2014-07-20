. ~/.node/nvm.sh
nvm use v0.10.26
export PATH=$PATH:/opt/local/bin/:/opt/local/sbin/
export MANPATH=$MANPATH:/opt/local/man

export PATH="$HOME/.rbenv/bin:$PATH" 
eval "$(rbenv init -)"

alias cdw='cd /Users/tachibana/work/'
alias cdd='cd /Applications/MAMP/htdocs/'

// ターミナルからMacVimを開くようにする
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'