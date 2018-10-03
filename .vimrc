" Configuration file for vim
set modelines=0      " CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2      " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
syntax on
"set t_Co=256
set t_ut=
colorscheme inkpot
"colorscheme iceberg
"colorscheme molokai
"colorscheme solarized
"検索をハイライト
set hlsearch
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
" タブ幅の設定
"set noexpandtab
"set tabstop=3
"set softtabstop=0
"set shiftwidth=3
"set autoindent
"set smartindent
set expandtab
set tabstop=3
set softtabstop=0
set shiftwidth=3
set autoindent
set smartindent
" 行数表示
set number
" カラーライン
set cursorline
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない
" アンダーラインを引く(color terminal)
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" アンダーラインを引く(gui)
highlight CursorLine gui=underline guifg=NONE guibg=NONE
"comment color
highlight Comment ctermfg=242 ctermbg=NONE
"current line number color
highlight CursorLineNr ctermfg=17 ctermbg=67
"line number color 23:ao,osusume
highlight LineNr ctermfg=239 ctermbg=0
"search color
highlight Search ctermfg=18 ctermbg=67
"background
highlight Normal ctermbg=NONE ctermfg=146
"int double, ..
highlight Type ctermfg=130
"include, #define, ..
highlight PreProc ctermfg=30
" kakko
hi MatchParen ctermbg=19
"mouse
set mouse=a
if !has('nvim')
  " neovimではデフォルトでマウスサポートしているので不要
  set ttymouse=sgr
endif
"Neobundle入れるならこれはコメント
set clipboard+=unnamed
if !has('nvim')
   set clipboard+=autoselect
endif

"ステータス行を表示
set laststatus=2
"ステータス行の指定
set statusline=%<%F
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V

"Language is Japanese
set termencoding=utf-8
set encoding=utf-8

"
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

"tab
nnoremap st :tabnew
nnoremap sn gt
nnoremap sp gT
"java 使うときはコメントアウト
"set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp

"折りたたみ関係
"set foldmethod=marker
"set foldlevel=3
"set foldcolumn=0

" (,) {,}
set showmatch
set matchtime=1

" visualization
"set list
"set listchars=tab:aa,trail:b,eol:c,extends:d,precedes:e,nbsp:f
"set listchars=tab:^-
"hi SpecialKey guibg=NONE guifg=Gray40
"highlight SpecialKey ctermfg=235 ctermbg=NONE

" neovim with python3
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

" open quickfix-window automatically if grep is called
autocmd QuickFixCmdPost *grep* cwindow

" dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  let s:toml = '~/.config/nvim/dein-plugins.toml'
  let s:lazy_toml = '~/.config/nvim/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
" syntax enable

" If you want to install not installed plugins on startup.
" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" End dein Scripts-------------------------
"
"
" syntastic {{
let g:syntastic_mode_map = { 'mode': 'active',
   \ 'passive_filetypes': ['c']
   \ }
"" Disable automatic check at file open/close
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
" C
"let g:syntastic_c_check_header = 1
" C++
"let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options=" -std=c++14"
" Java
"let g:syntastic_java_javac_config_file_enabled = 1
"let g:syntastic_java_javac_config_file = "$HOME/.syntastic_javac_config"
" }}
" status line: 'itchyny/lightline.vim' {{
set laststatus=2  " show status line always
"set showmode      " show mode
"set showcmd       " show command
"set ruler         " show current cursor
let g:lightline = {
   \ 'colorscheme': 'wombat',
   \ 'mode_map': {'c': 'NORMAL'},
   \ 'active': {
   \  'left': [['mode', 'paste'],
   \             [ 'fugitive', 'absolutepath', 'modified' ] ],
   \  'right': [['lineinfo'],
   \             ['percent'], ['filetype'] ]
   \ },
   \ 'component': {
   \ 'lineinfo': '%3l/%L:%-2v'
   \ },
   \ 'component_function': {
   \   'modified': 'LightlineModified',
   \   'readonly': 'LightlineReadonly',
   \   'fugitive': 'LightlineFugitive',
   \   'filename': 'LightlineFilename',
   \   'fileformat': 'LightlineFileformat',
   \   'filetype': 'LightlineFiletype',
   \   'fileencoding': 'LightlineFileencoding',
   \   'mode': 'LightlineMode',
   \   'absolutepath': 'AbsolutePath',
   \ },
   \ 'separator': { 'left': "", 'right': "" },
   \ 'subseparator': { 'left': ":", 'right': "" }
   \ }
function! AbsolutePath()
   let a = substitute(expand('%:p'), $HOME, '~', '')
   if a == ""
     return '??'
   elseif strlen(a) > 1000
     return a[strlen(a)-1000:]
   else
     return a
   endif
endfunction
function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" }}

" deoplete.nvim and neosnippet.vim.git {{
"補完候補選択時は<TAB>で候補移動snipppet時は<TAB>で次の入力先へ
imap <expr><TAB> pumvisible() ? "\<C-N>" : neosnippet#jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
"}}

" ctrlp {{
" マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100'
" .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_show_hidden = 1
"ファイル検索のみ使用
let g:ctrlp_types = ['fil']
" キャッシュディレクトリ
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" キャッシュを終了時に削除しない
let g:ctrlp_clear_cache_on_exit = 0
" 遅延再描画
let g:ctrlp_lazy_update = 1
" ルートパスと認識させるためのファイル
let g:ctrlp_root_markers = ['Gemfile', 'pom.xml', 'build.xml']
" CtrlPのウィンドウ最大高さ
let g:ctrlp_max_height = 20
" 無視するディレクトリ
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" CtrlPの拡張として「funky」と「commandline」を使用
let g:ctrlp_extensions = ['funky', 'commandline']
" CtrlPCommandLineの有効化
"command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())
" CtrlPFunkyの有効化
let g:ctrlp_funky_matchtype = 'path'
" }}

nnoremap qk :QuickRun
"---------------------------
" Start Neobundle Settings.
"---------------------------
"if &compatible
"  set nocompatible               " Be iMproved
"endif
"
"if has('vim_starting')
"    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
"    set runtimepath+=~/.vim/bundle/neobundle.vim/
"
"    " NeoBundleが未インストールであればgit cloneする・・・・・・①
"    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
"        echo "install NeoBundle..."
"        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
"    endif
"endif
"
" Required:
"call neobundle#begin(expand('~/.vim/bundle'))
"
"" neobundle自体をneobundleで管理
"NeoBundleFetch "Shougo/neobundle.vim"
"
"" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
""----------------------------------------------------------------
"" status line {
"NeoBundle 'itchyny/lightline.vim'
"set laststatus=2  " show status line always
"set showmode      " show mode
"set showcmd       " show command
"set ruler         " show current cursor
"let g:lightline = {
"   \ 'colorscheme': 'wombat'
"   \ }
"" }
"
"" NERDTree
"NeoBundle 'scrooloose/nerdtree'
"" vim-latex
""NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
""----------------------------------------------------------------
"call neobundle#end()
"" Re quired:
"filetype plugin indent on
"" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
"" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
"NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------
"< - 行が長すぎるときに切り詰める位置
"f - ファイル名（相対パス）
"%F - ファイル名（絶対パス）
"%t - ファイル名（パス無し)

"%m - 修正フラグ （[+]または[-]）
"%r - 読み込み専用フラグ（[RO]）
"%h - ヘルプバッファ
"%w - preview window flag

"%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'} - fileencodingとfileformatを表示

"%= - 左寄せと右寄せ項目の区切り（続くアイテムを右寄せにする）
"%l - 現在のカーソルの行番号
"%L - 総行数
"%c - column番号
"%V - カラム番号
"%P - カーソルの場所 %表示

"vim-latex(neobundle)--------------
"filetype plugin on
"filetype indent on
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"自動折りたたみ無効
"let g:TeX_AutoFolding = 0
"let g:Tex_Folding = 0
"let g:Imap_UsePlaceHolders = 1
"let g:Imap_DeleteEmptyPlaceHolders = 1
"let g:Imap_StickyPlaceHolders = 0
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_ps = 'dvi,ps'
"let g:Tex_MultipleCompileFormats = 'pdf'
"let g:Tex_CompileRule_dvi = 'platex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"let g:Tex_BibtexFlavor = 'upbibtex'
"let g:Tex_MakeIndexFlavor = 'mendex -U $*.idx'
"let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_pdf = 'open -a Skim.app'
"let g:Tex_ViewRule_ps = 'open'
"let g:Tex_ViewRule_dvi = 'open'
"
"let g:Tex_IgnoreLevel = 9
"let g:Tex_IgnoredWarnings =
"    \"Underfull\n".
"    \"Overfull\n".
"    \"specifier changed to\n".
"    \"You have requested\n".
"    \"Missing number, treated as zero.\n".
"    \"There were undefined references\n".
"    \"Citation %.%# undefined\n".
"    \"LaTeX Font Warning: Font shape `%s' undefined\n".
"    \"LaTeX Font Warning: Some font shapes were not available, defaults substituted."
"
