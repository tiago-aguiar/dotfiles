" =================
"     plugins
" =================

if has('win32')
    :echom "running on win32"
    call plug#begin('~/AppData/Local/nvim/plugged')
else
    call plug#begin()
endif
"Plug 'srcery-colors/srcery-vim'       " colorscheme
"Plug 'loshjawrence/magicka.vim'       " coloscheme
"Plug 'vim-airline/vim-airline'        " status bar
"Plug 'vim-airline/vim-airline-themes' " status theme
"Plug 'ap/vim-css-color'               " preview css color
Plug 'xolox/vim-colorscheme-switcher' " switch coloscheme to test
Plug 'xolox/vim-misc'                 " dependency of vim-colorscheme-switcher to test
"Plug 'terryma/vim-multiple-cursors'   " <C-n> to replace all selected ocurr
"Plug 'Chiel92/vim-autoformat'         " autoformat file on save
"Plug 'udalov/kotlin-vim'              " kotlin filetype recognized
Plug 'junegunn/fzf.vim'               " fzf finder
"Plug 'sheerun/vim-polyglot'           " pack of languages syntaxes and more (this must be after vim-go to work)
"Plug 'benmills/vimux'                 " run command another pane tmux
Plug 'junegunn/fzf', {
            \ 'do': { -> fzf#install() }
            \}
"" Asynchronous Lint Engine - lint checker
"Plug 'dense-analysis/ale', {
"            \ 'do': 'pip install flake8 isort yapf'
"            \}
"
"" completion - make vim smart
"" (run :CocInstall coc-pyright, :CocInstall coc-kotlin, :CocUninstall  coc-pairs)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " golang features like :GoBuild and more
"
"Plug 'preservim/nerdtree' |
"            \ Plug 'Xuyuanp/nerdtree-git-plugin'
"
"" Flutter Plugins
"Plug 'dart-lang/dart-vim-plugin'
"Plug 'thosakwe/vim-flutter'
"Plug 'natebosch/dartlang-snippets'
"Plug 'natebosch/vim-lsc'
"Plug 'natebosch/vim-lsc-dart'
"Plug 'iamcco/coc-flutter'

call plug#end()


" ========================
"        default
" ========================
syntax on
filetype plugin indent on
set encoding=utf8
set hidden
set nobackup
set nowritebackup
set nonumber
set norelativenumber
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set laststatus=2
set colorcolumn=100
set mouse=a
set clipboard=unnamedplus
set cc=
set wildignore+=*.pyc,__pycache__,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let mapleader="\<Space>"

" Cursor style
set guicursor=n-v-c:block-Cursor
set guicursor+=i:block-Cursor
set guicursor+=i:blinkon1
set guicursor+=i:blinkwait1

" ==================
"       Theme
" ==================
syntax enable
colorscheme default

" hi! Normal   guibg=NONE ctermbg=233  ctermfg=223 "Dark background
hi! Normal   guibg=NONE ctermbg=NONE  ctermfg=NONE
hi! Todo     guibg=NONE ctermbg=NONE ctermfg=196
hi! Comment  guibg=NONE ctermbg=NONE ctermfg=28
hi! Constant guibg=NONE ctermbg=NONE ctermfg=15
hi! String   guibg=NONE ctermbg=NONE ctermfg=14
hi! Number   guibg=NONE ctermbg=NONE ctermfg=14

augroup myTodo
    autocmd!
    autocmd Syntax * syntax match myTodo /\v\_.<(TODO|FIXME).*/hs=s+1 containedin=.*Comment
augroup END

highlight link myTodo Todo

" ==========
"    GUI
" ==========
nnoremap <leader>/ I// <esc>j<esc>
nnoremap <leader>d oimport ipdb; ipdb.set_trace()<esc>
nnoremap <leader><F1> :mksession!<cr>
nnoremap <leader><F10> :e ~/.vimrc<cr>
nnoremap <leader><F12> :source %<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>s :Ag<space>
nnoremap <leader>k :bd<cr>
nnoremap <leader><TAB> :NERDTreeToggle<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-S-j> <C-e>
nnoremap <C-S-k> <C-y>
nnoremap <leader><esc> :noh<return><esc>
nnoremap <leader>e :call VimuxRunCommand("sh build.sh")<cr>
nnoremap <leader>r :call VimuxRunCommand("sh run.sh")<cr>
noremap <leader>l :Autoformat<cr>
if has('win32')
    inoremap <silent>  <S-Insert>  <C-R>+
endif

let $FZF_DEFAULT_COMMAND = 'ag --nocolor -g ""'
let NERDTreeRespectWildIgnore=1
"let g:airline_theme='srcery'


" ===========================
"   Plugins Configurations
" ===========================

" Ale linter
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_flake8_executable = 'python3'
let g:ale_pattern_options = {'\.java$': {'ale_enabled': 0}}
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': ['flake8']
            \}
"let g:ale_kotlin_ktlint_executable = '/usr/local/ktlint'
"let g:ale_kotlin_languageserver_executable


" Autoformat
au BufWrite *.mm :Autoformat

let g:go_fmt_autosave = 0
" let g:autoformat_verbosemode = 0 " debug autoformat
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
" let g:formatdef_my_html_django = "'html-beautify'" " custom for django html (need nodejs)
" let g:formatters_htmldjango = ['my_html_django']
" let g:formatdef_astyle_cpp = '"astyle --mode=c --style=google --indent-switches -pcH".(&expandtab ? "s".shiftwidth() : "t")'
" let g:lsc_server_commands = {'dart': 'dart_language_server'}
" autocmd FileType vim,tex,htmldjango,html let b:autoformat_autoindent=0


" Vimux
" let g:VimuxOrientation = "h"
" let g:VimuxHeight = "50"


" Vim
au BufRead,BufNewFile *.mm set filetype=objc
au BufRead,BufNewFile *.swift set filetype=swift
au BufRead,BufNewFile *.vs,*.fs,*.vert,*.frag set ft=glsl

" coc
"inoremap <silent><expr> <C-j>
"            \ pumvisible() ? "\<C-n>" :
"            \ <SID>check_back_space() ? "\<C-j>" :
"            \ coc#refresh()
"inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"     inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"     inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
" 
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 

autocmd bufNewFile *.cpp 0r  ~/dotfiles/boilers/cpp.txt
autocmd bufnewfile *.cpp exe "1," . 8 . "g/$File: $.*/s//$File: " . expand("%:t:r") . ".cpp $"
autocmd bufnewfile *.cpp exe "1," . 8 . "g/$Date: $.*/s//$Date: " . strftime("%d-%b-%Y") . " $"
autocmd bufnewfile *.cpp exe "1," . 8 . "g/$Version: $.*/s//$Version: 0.1 $"

" flutter
nnoremap <leader>ra :FlutterRun<cr>
nnoremap <leader>rq :FlutterQuit<cr>
nnoremap <leader>rr :FlutterHotReload<cr>
nnoremap <leader>rR :FlutterHotRestart<cr>
nnoremap <leader>rD :FlutterVisualDebug<cr>

let g:flutter_show_log_on_run = "hidden"
let g:flutter_use_last_run_option = 1

let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:lsc_auto_map = v:true
