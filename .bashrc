. ~/.nvm/nvm.sh
export PATH=$PATH:/opt/local/bin/:/opt/local/sbin/
export MANPATH=$MANPATH:/opt/local/man

# 日付設定
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ';

# alias
alias ll='ls -l'

# git alias
alias lg='log --graph --decorate'

# cd系 alias
alias cdw='cd /Users/tachibana/_work/'
alias cdd='cd /Applications/MAMP/htdocs/'

# その他 alias
alias be='bundle exec'
alias gp='cd $(ghq list -p | peco)'
alias gho='gh-open $(ghq list -p | peco)'

# ターミナルからMacVimを開くようにする
#export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim'
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

# タイトルバーにディレクトリ名を表示
# function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# topを起動している間tabの色が黄緑っぽくなる。
alias top='tab-color 134 200 0; top; tab-reset'

# 連番ファイルを複製
function gej() {
	if [ $2 -eq '08' ] ; then
		currentNum='08'
		newNum='09'
	elif [ $2 -eq '09' ] ; then
		currentNum='09'
		newNum='10'
	elif [ $(($2 + 1)) -lt 10 ] ; then
		currentNum=$2
		newNum='0'$(($2 + 1))
	else
		currentNum=$2
		newNum=$(($2 + 1))
	fi
	currentFile=$1$currentNum'.html'
	newFile=$1$newNum'.html'

	cp $currentFile $newFile && mvim $newFile
}

# GO
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# direnv(classi)
eval "$(direnv hook bash)"

# apply japan
#export USE_NFS=1
