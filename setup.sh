# HomeBrewのインストール
if [ ! -x "`which brew`" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
fi

# mas-cliのインストール
if [ ! -x "`which mas`" ]; then
  brew install mas
fi

# mac app store
# mas cliが使えなくなったので、1個ずつコマンド実行
# mas install 80453959  # Slack
# mas install 768053424 # Gapplin
# mas install 1142151959 # Just Focus


# dotfiles
DOT_FILES=(.bashrc .bash_profile .eslintrc .gvimrc .slate .slate.js .sshrc .vimrc .zshrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/src/github.com/eedamame/dotfiles/$file $HOME/$file
done

# homebrew
brew install --cask firefox
brew install --cask google-japanese-ime
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask sequel-ace
brew install --cask toggl-track
brew install --cask sourcetree
brew install --cask brave-browser
brew install --cask deepl
brew install --cask rectangle
brew install --cask coteditor

brew install git
brew install tig
brew install wget
brew install nvm
brew install zsh-completions
brew install starship
brew install ghq
brew install peco
brew install openssh
brew tap shopify/shopify
brew install shopify-cli
brew install lima

# corepack
corepack prepare yarn@stable --activate

