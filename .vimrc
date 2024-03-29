" helptags ~/.vim/doc
"
"---------------------------------------------------------------------------
"dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

"set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " add myself ------------------------------------
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('Shougo/neocomplcache')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('mattn/emmet-vim')
  call dein#add('miripiruni/CSScomb-for-Vim')
  call dein#add('kannokanno/previm.git')
  call dein#add('tyru/open-browser.vim')
  " call dein#add('scrooloose/syntastic')
  call dein#add('thinca/vim-quickrun')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('justinmk/vim-dirvish')

  " typescript
  call dein#add('Quramy/tsuquyomi')

  " syntaxhighlight
  call dein#add('digitaltoad/vim-pug')
  call dein#add('posva/vim-vue')
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('slim-template/vim-slim')
  call dein#add('leafgarland/typescript-vim')

  " linter
  call dein#add('w0rp/ale')

  " formatter
  call dein#add('prettier/vim-prettier')


  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" バックアップファイル
set backupdir=~/.vim/vimbackup

" スワップファイル
set directory=~/.vim/vimbackup

" undoファイル
set undodir=~/.vim/vimundo
set undofile

" vim-airline
let g:airline#extensions#tabline#enabled = 1

set nocompatible

" 行終わりで右に移動したら次の行にいけるようにしたりなどする
set whichwrap=b,s,h,l,<,>,~,[,]

" カラーラベルを削除しないように、バックアップをしないようにする
set nowritebackup
set nobackup

" vueファイルのsyntaxhighlight
autocmd FileType vue syntax sync fromstart
au BufNewFile,BufRead *.vue setf vue
autocmd BufRead,BufNewFile *.vue set filetype=vue.html.pug.javascript.css
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
" slimのsyntaxhighlight
autocmd BufRead,BufNewFile *.slim setfiletype slim

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

" tab key -> 2space
set expandtab
set tabstop=2
set shiftwidth=2

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
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=2
" let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['js, css'], 'passive_filetypes': ['html'] }
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_css_checkers=['stylelint']
" let g:syntastic_scss_checkers=['stylelint']
" let g:syntastic_sass_checkers=['stylelint']
" let g:syntastic_check_on_open = 1

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

" tab一覧
nnoremap <silent> ,ut :<C-u>Unite tab<CR>


" 行終わりで右に移動したら次の行にいけるようにしたりなどする
autocmd FileType vim setlocal whichwrap=b,s,h,l,<,>,[,],~

" 対応htmlタグにジャンプ
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

" terryma/vim-multiple-cursors の有効化
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Map start key separately from next key
let g:multi_cursor_start_key='<C-m>'

" linter
let g:airline#extensions#ale#enabled = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier-eslint']
let g:ale_fix_on_save = 1

let g:sass_lint_config = './src/github.com/eedamame/farmfes-front/.sasslint.yml'

" typescript
let g:tsuquyomi_completion_detail = 1

packloadall

silent! helptags ALL

"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running') && !has('gui_macvim')
  let uname = system('uname')
  if uname =~? "linux"
    set term=builtin_linux
  elseif uname =~? "freebsd"
    set term=builtin_cons25
  elseif uname =~? "Darwin"
    "set term=xterm-256color
     if has('nvim')
       set termguicolors
     endif
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

" カラースキーマ
set background=dark
" solarized options 
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" エンコード
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

" 不可視文字の表示
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" ref: https://gist.github.com/hokaccha/411828
" こういうHTMLがあったときに
" <div id="hoge" class="fuga">
" ...
" </div>
"
" 実行するとこうなる
" <div id="hoge" class="fuga">
" ...
" <!-- /div#hoge.fuga --></div>

function! Endtagcomment()
    let reg_save = @@

    try
        silent normal vaty
    catch
        execute "normal \<Esc>"
        echohl ErrorMsg
        echo 'no match html tags'
        echohl None
        return
    endtry

    let html = @@

    let start_tag = matchstr(html, '\v(\<.{-}\>)')
    let tag_name  = matchstr(start_tag, '\v([a-zA-Z]+)')

    let id = ''
    let id_match = matchlist(start_tag, '\vid\=["'']([^"'']+)["'']')
    if exists('id_match[1]')
        let id = '#' . id_match[1]
    endif

    let class = ''
    let class_match = matchlist(start_tag, '\vclass\=["'']([^"'']+)["'']')
    if exists('class_match[1]')
        let class = '.' . join(split(class_match[1], '\v\s+'), '.')
    endif

    execute "normal `>va<\<Esc>`<"

    let comment = g:endtagcommentFormat
    let comment = substitute(comment, '%tag_name', tag_name, 'g')
    let comment = substitute(comment, '%id', id, 'g')
    let comment = substitute(comment, '%class', class, 'g')
    let @@ = comment

    normal ""P

    let @@ = reg_save
endfunction

let g:endtagcommentFormat = '<!-- /%tag_name%id%class -->'
nnoremap ,t :<C-u>call Endtagcomment()<CR>
