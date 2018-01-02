" Configuration file for vim
set modelines=0		" CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

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
set ttymouse=xterm2
"Neobundle入れるならこれはコメント
set clipboard+=unnamed
set clipboard+=autoselect
"ステータス行を表示
set laststatus=2
"ステータス行の指定
set statusline=%<%F
"set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
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

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
"set runtimepath+=~/.vim/bundle/neobundle.vim
" Re quired: これは空白消すだけ
"call neobundle#begin(expand('~/.vim/bundle/'))
" neobundle自体をneobundleで管理
"NeoBundleFetch 'Shougo/neobundle.vim'
" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
" NERDTree               
"NeoBundle 'scrooloose/nerdtree'
" vim-latex
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
"call neobundle#end()
" Re quired:
"filetype plugin indent on
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
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
