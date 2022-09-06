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
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# wp-cli
source ~/wp-completion.bash

# android emulator
export PATH="$PATH:$HOME/Library/Android/sdk/tools/emulator"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# swiftenv
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
