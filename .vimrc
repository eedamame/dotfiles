helptags ~/.vim/doc

"---------------------------------------------------------------------------
" NeoBundle
set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	" call neobundle#begin(expand('~/.vim/bundle/'))
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()
endif

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'miripiruni/CSScomb-for-Vim'
NeoBundle 'kannokanno/previm.git'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'gist:hokaccha/411828', {
\   'name': 'endtagcomment.vim',
\   'script_type': 'plugin'
\}
NeoBundle 'editorconfig/editorconfig-vim'

filetype plugin on
filetype indent on

NeoBundleCheck

"---------------------------------------------------------------------------

" バックアップファイル 
set backupdir=~/vimbackup

" スワップファイル
set directory=~/vimbackup

" undoファイル
set undodir=~/vimundo

set nocompatible

" 行終わりで右に移動したら次の行にいけるようにしたりなどする
set whichwrap=b,s,h,l,<,>,~,[,]

" カラーラベルを削除しないように、バックアップをしないようにする
set nowritebackup
set nobackup

" ectファイルのsyntaxhighlight
au BufRead,BufNewFile *.ect set filetype=php
" twig
au BufRead,BufNewFile *.twig set filetype=htmljinja
" jsonのsyntaxhighlight
autocmd BufNewFile,BufRead *.json set ft=javascript
" typescriptのsyntaxhighlight
autocmd BufRead,BufNewFile *.ts set ft=typescript
autocmd BufRead,BufNewFile *.tsx set ft=typescript
" jsxのsyntaxhighlight
let g:jsx_ext_required = 0

" syntaxをonに
syntax enable;

" ctrl+j でノーマルモード
imap <C-j> <C-[>

" クリップボードを他のアプリと連携
set clipboard=unnamed

" backspaceで改行、タブ、スペースを削除
set backspace=indent,eol,start

" 行番号
set number

" ウィンドウの右端で折り返さない
set nowrap

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

" Shift+Enter で <br>
inoremap <S-Enter> <br><CR>
nnoremap <S-Enter> a<br><CR><Esc>

" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" 自動でインデントしない
" set noautoindent
" filetype indent off

" emmet
let g:user_emmet_expandabbr_key = '<c-e>'

" neocomplcache
" let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
" let g:neocomplcache_enable_underbar_completion = 1 " _区切りの補完を有効化

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

" " open-browser.vim
" let g:netrw_nogx = 1 " disable netrw's gx mapping.
" nmap gx <Plug>(openbrowser-smart-search)
" vmap gx <Plug>(openbrowser-smart-search)

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['js, css'], 'passive_filetypes': ['html'] }
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_css_checkers=['stylelint']
let g:syntastic_scss_checkers=['stylelint']
let g:syntastic_sass_checkers=['stylelint']
let g:syntastic_check_on_open = 1

""" unite.vim
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


" 行終わりで右に移動したら次の行にいけるようにしたりなどする
autocmd FileType vim setlocal whichwrap=b,s,h,l,<,>,[,],~

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