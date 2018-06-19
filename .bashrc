source ~/git-completion.bash
source ~/git-prompt.sh

# nodebrew
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# nvm
. ~/.nvm/nvm.sh
export PATH=$PATH:/opt/local/bin/:/opt/local/sbin/
export MANPATH=$MANPATH:/opt/local/man
export NODEJS_ORG_MIRROR=${NODEJS_ORG_MIRROR-$NVM_NODEJS_ORG_MIRROR}
export IOJS_ORG_MIRROR=${IOJS_ORG_MIRROR-$NVM_IOJS_ORG_MIRROR}

# 日付設定
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ';

# プロンプト表示
PS1="\h@\u:\W\$(__git_ps1) \$ "

# alias
alias ll='ls -l'
alias be='bundle exec'
alias gp='cd $(ghq list -p | peco)'
alias gho='gh-open $(ghq list -p | peco)'

# git alias
alias lg='log --graph --decorate'
alias gg='git grep'

# cd系 alias
alias cdw='cd ~/_work/'
alias cdd='cd /Applications/MAMP/htdocs/'

# headless chrome
# canaryのalias
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

# history検索
peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
alias psh='peco-select-history'
bind -x '"\C-r": peco-select-history'


# ターミナルからMacVimを開くようにする
#export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim -g --remote-tab-silent'
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# gitから差分ファイルだけzipにまとめる
function git_diff_archive() 
{
  local diff=""
  local h="HEAD"
  if [ $# -eq 1 ]; then
    if expr "$1" : '[0-9]*' > /dev/null ; then
      diff="HEAD HEAD~${1}"
    else
      diff="HEAD ${1}"
    fi
  elif [ $# -eq 2 ]; then
    diff="${1} ${2}"
    h=$1
  fi
  if [ "$diff" != "" ]; then
    diff="git diff --name-only ${diff}"
  fi
  git archive --format=zip --prefix=root/ $h `eval $diff` -o archive.zip
}

# ターミナルのタイトルバーに任意の名前をつける
function tt() {
  echo -e '\033]2;🐶'$1'🐶\007'
}

# topを起動している間tabの色が黄緑っぽくなる。
alias top='tab-color 134 200 0; top; tab-reset'

# GO
export GOPATH=$HOME
GO_BIN=$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/src/github.com/
# PATH=$GOPATH/bin:$PATH

# export PATH=$PATH:$GOPATH/bin
# export GOPATH=$HOME
# export GOPATH=$HOME/src/github.com/

# export GOROOT=/usr/local/opt/go/libexec
# export GOPATH=$HOME
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# phpenv
PATH=$HOME/.phpenv/bin:$PATH # Add phpenv to PATH for scripting
eval "$(phpenv init -)"

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rbenv
eval "$(rbenv init -)"

# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    # tmux対応
    for D in `\ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi
