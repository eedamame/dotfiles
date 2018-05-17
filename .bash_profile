source ~/.bashrc
source ~/.bash_login

[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
nvm use default
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir


#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

[[ -s "/Users/tachibana/.gvm/scripts/gvm" ]] && source "/Users/tachibana/.gvm/scripts/gvm"
