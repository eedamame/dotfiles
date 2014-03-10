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
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'git://github.com/miripiruni/CSScomb-for-Vim.git'

filetype plugin on
filetype indent on


"---------------------------------------------------------------------------

" バックアップファイル 
set backupdir=/Users/tachibana/vimbackup

" スワップファイル
set directory=/Users/tachibana/vimbackup

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
