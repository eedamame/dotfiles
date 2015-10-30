helptags ~/.vim/doc

"---------------------------------------------------------------------------
" NeoBundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'w0ng/vim-hybrid'
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

" カラーラベルを削除しないように、バックアップをしないようにする
set nowritebackup
set nobackup

" ctrl+j でノーマルモード
imap <C-j> <C-[>

" クリップボードを他のアプリと連携
set clipboard=unnamed

" backspaceで改行、タブ、スペースを削除
set backspace=indent,eol,start

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

autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" 自動でインデントしない
" set noautoindent
" filetype indent off

" zencoding
" let g:user_zen_expandabbr_key = '<C-e>'

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
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['js, css'], 'passive_filetypes': ['html'] }
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_checker = 'jshint'
"
"
