" NeoBundle installation
set nocompatible
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'bling/vim-airline'
NeoBundle 'othree/html5'
NeoBundle 'jeetsukumaran/vim-buffergator'
call neobundle#end()

let mapleader = "\<Space>"

filetype  plugin on
filetype  indent on
set autoindent                         " Copy indent from current line
set autoread                           " Read open files again when changed outside Vim
set autowrite                          " Write a modified buffer on each :next , ...
set backspace=indent,eol,start         " Backspacing over everything in insert mode
set history=200                        " Keep 200 lines of command line history
set hlsearch                           " Highlight the last used search pattern
set incsearch                          " Do incremental searching
set nobackup                           " Don't constantly write backup files
set noswapfile                         " Ain't nobody got time for swap files
set noerrorbells                       " Don't beep
set nowrap                             " Do not wrap lines
set popt=left:8pc,right:3pc            " Print options
set shiftwidth=4                       " Number of spaces to use for each step of indent
set showcmd                            " Display incomplete commands in the bottom line of the screen
set ignorecase                         " Ignore case when searching....
set smartcase                          " ...unless uppercase letter are used
set tabstop=4                          " Number of spaces that a <Tab> counts for
set expandtab                          " Make vim use spaces and not tabs
set undolevels=1000                    " Never can be too careful when it comes to undoing
set hidden                             " Don't unload the buffer when we switch between them. Saves undo history
set visualbell                         " Visual bell instead of beeping
set wildignore=*.swp,*.bak,*.pyc,*.class,tmp/**,dist/**,node_modules/**  " wildmenu: ignore these extensions
set wildmenu                           " Command-line completion in an enhanced mode
set shell=bash                         " Required to let zsh know how to run things on command line
set ttimeoutlen=50                     " Fix delay when escaping from insert with Esc
set noshowmode                         " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set showbreak=↪\
set synmaxcol=256
set scrolloff=3
set clipboard=unnamed
set colorcolumn=80                     " Show column 80
set number                             " Show line numbers
set pastetoggle=<F3>
set nofoldenable

if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

set t_Co=16
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:mustache_abbreviations = 1

if has("autocmd")
  au BufNewFile,BufRead *.{mustache,handlebars,hbs}{,.erb} set filetype=html syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
endif

set laststatus=2                                    " Make the second to last line of vim our status line
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 0        " JMJ - hide tabs
let g:airline_powerline_fonts = 1

" Syntastic
let g:syntastic_check_on_open=1                   " check for errors when file is loaded
let g:syntastic_loc_list_height=5                 " the height of the error list defaults to 10
let g:syntastic_python_checkers = ['flake8']      " sets flake8 as the default for checking python files
let g:syntastic_javascript_checkers = ['jshint']  " sets jshint as our javascript linter
" let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }
"let g:syntastic_mode_map={ 'mode': 'active',
"                     \ 'active_filetypes': [],
"                     \ 'passive_filetypes': ['html', 'handlebars'] }

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

set tags=./tags,ctags;

let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeMapJumpNextSibling = ''
let g:NERDTreeMapJumpPrevSibling = ''
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1
" let g:jedi#rename_command = "<leader>rn"

" Cycle through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-o> :bprevious<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Block indent without losing selection
vnoremap < <gv
vnoremap > >gv

" easier formatting of paragraphs (wrap to page width)
vmap Q gq
nmap Q gqap

nnoremap <Esc><Esc> :nohlsearch<CR>


map <Leader>d :NERDTreeToggle<CR>
map <C-e> :NERDTreeToggle<CR>
nmap <Leader>nt :NERDTreeFind<CR>
