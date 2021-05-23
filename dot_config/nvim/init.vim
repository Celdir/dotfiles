" THEME

" Custom Key Bindings --------------------------

"nmap <M-1> :b1 <CR>
"nmap <M-2> :b2 <CR>
let mapleader=";"
map <F12> :syntax off<CR>:set tw=80<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <leader>t :terminal<CR>
tnoremap <Esc> <C-\><C-n>

" ----------------------------------------------
" No backup files
set nobackup

" Copy from vim
set clipboard+=unnamedplus

" Remove unexpected events from system settings.
set nocompatible

if !isdirectory($HOME."/.config/nvim")
    call mkdir($HOME."/.config/nvim", "", 0770)
endif
if !isdirectory($HOME."/.config/nvim/undo")
    call mkdir($HOME."/.config/nvim/undo", "", 0700)
endif
set undofile
set undodir=~/.config/nvim/undo

" Try and Auto-Determine Filetype
filetype indent plugin on

" Pretty colors
syntax on

" Buffer something
set hidden

" Better Command-Line Completion
set wildmenu

" Show partial commands
set showcmd

" Highlight searches + incremental search
set hlsearch
set incsearch

" --------------------------------------------

" Case-Related Stuff
set ignorecase
set smartcase

" Backspacing
set backspace=indent,eol,start

" Auto-Indent
set autoindent

" Something about no-start-of-line
set nostartofline

" Something about a ruler
set ruler

" Always display status line
set laststatus=2

" Ask for confirmation on unsaved files
set confirm

" NO BEEPING
set visualbell
set t_vb=

" Mouse stuff for newbs like me
set mouse=a

" Set the command window height to 2 lines
set cmdheight=2

" LINE NUMBERS
set number

" <F11> Paste Toggle
set pastetoggle=<F11>

" Timeout quick on keycodes, not mappings
set notimeout ttimeout ttimeoutlen=200

" ------------------------------------------

" Tab = Spaces
set expandtab

" Tab Width is 4 Spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Smart Tabs?
set smarttab

" History Options
set history=100
set undolevels=100
set t_Co=256
"colorscheme bubblegum
"colorscheme xoria256
"colorscheme gotham256
colorscheme apprentice

call plug#begin()

Plug 'rust-lang/rust.vim'
nnoremap <leader>p :RustFmt<CR>

Plug 'ap/vim-buftabline'
let g:buftabline_show=1

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>f :Files<CR>
nnoremap <leader><S-f> :Rg<CR>

Plug 'machakann/vim-sandwich'

call plug#end()
