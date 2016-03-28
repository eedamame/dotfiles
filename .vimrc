helptags ~/.vim/doc

"---------------------------------------------------------------------------
" NeoBundle
set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'miripiruni/CSScomb-for-Vim'
NeoBundle 'kannokanno/previm.git'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'thinca/vim-singleton'
NeoBundle 'gist:hokaccha/411828', {
\   'name': 'endtagcomment.vim',
\   'script_type': 'plugin'
\}
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/nerdtree'

filetype plugin on
filetype indent on

NeoBundleCheck

call neobundle#end()

"---------------------------------------------------------------------------

" call singleton#enable()

let mapleader = "\<Space>"

" バックアップファイル 
set backupdir=~/vimbackup

" スワップファイル
set directory=~/vimbackup

" undoファイル
set undodir=~/vimundo

" カラーラベルを削除しないように、バックアップをしないようにする
set nowritebackup
set nobackup

" ectファイルのsyntaxhighlight
au BufRead,BufNewFile *.ect set filetype=php

" jsonのsyntaxhighlight
autocmd BufNewFile,BufRead *.json set ft=javascript

" syntaxをonに
syntax enable;
" dataURLなどで重くなりすぎるので最大文字数200にしておく
set synmaxcol=200

" ctrl+j でノーマルモード
imap <C-j> <C-[>

" クリップボードを他のアプリと連携
set clipboard=unnamed

" backspaceで改行、タブ、スペースを削除
set backspace=indent,eol,start

"カラースキーマを設定
set background=dark
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme solarized

" フォント指定
" set guifont=SourceHanCodeJP-Light:h14
" set guifont=源ノ角ゴシック\ Code\ JP\ Light:h13
" set linespace=6

" 行番号
set nocompatible
set number

" ウィンドウの右端で折り返さない
set nowrap

" 行終わりで右に移動したら次の行にいけるようにしたりなどする
set whichwrap=b,s,h,l,<,>,[,],~

" コマンドライン上で、上を押すと上のディレクトリ、下を押すとしたのディレクトリに移動
set wildmenu

" カーソルのある行をハイライト
autocmd WinEnter * setlocal cursorline
autocmd WinLeave + setlocal nocursorline
set cursorline

" 初期ディレクトリをバッファの開いたディレクトリにする
set browsedir=buffer

" 上下最低２行を残してウィンドウをスクロールさせる
set scrolloff=2

" 左右最低３文字を残してウィンドウをスクロールさせる
set sidescrolloff=3

" ステータスラインにファイルのパスと現在の文字コード等を出す
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" バッファの移動
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>f :b#<CR>

"タブ切り替え
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT

" 対応する括弧へ移動
nnoremap <tab> %
vnoremap <tab> %

" シングルクオーテーション内選択
nnoremap <Space>7 vi'

" ダブルクオーテーション内選択
nnoremap <Space>2 vi"

" 行終わりで右に移動したら次の行にいけるようにしたりなどする
set whichwrap=b,s,h,l,<,>,[,]

" Shift+Enter で <br>
inoremap <S-Enter> <br><CR>
nnoremap <S-Enter> a<br><CR><Esc>

autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" 自動でインデントしない
" set noautoindent
" filetype indent off

" emmet
let g:user_emmet_expandabbr_key = '<c-e>'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:neocomplcache_enable_underbar_completion = 1 " _区切りの補完を有効化

" Load settings for each location.
" プロジェクトごとに設定ファイル（.vimrc.local）をつくれるようにする
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

" previmでmarkdownファイルのプレビュー
" let g:previm_open_cmd = 'open -a Chrome'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=4 "エラー表示ウィンドウの高さ
let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['js, css'], 'passive_filetypes': ['html'] }
" let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_css_checkers=['stylelint']
let g:syntastic_scss_checkers=['stylelint']
let g:syntastic_sass_checkers=['stylelint']
let g:syntastic_check_on_open = 1

" atom.appで開く
command! Atom !atom %

"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running') && !has('gui_macvim')
  let uname = system('uname')
  if uname =~? "linux"
    set term=builtin_linux
  elseif uname =~? "freebsd"
    set term=builtin_cons25
  elseif uname =~? "Darwin"
    set term=xterm-256color
"    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet uname
endif

"---------------------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"---------------------------------------------------------------------------
" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif
