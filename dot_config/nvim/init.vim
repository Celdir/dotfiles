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
set noswapfile
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

set updatetime=50

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

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

call plug#begin()

Plug 'rktjmp/lush.nvim'
Plug 'adisen99/apprentice.nvim'

Plug 'rust-lang/rust.vim'
nnoremap <leader>p :RustFmt<CR>

Plug 'elixir-editors/vim-elixir'

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

Plug 'ap/vim-buftabline'
let g:buftabline_show=1

command! -bang -nargs=* Rg
    \ call fzf#vim#grep("rg --hidden --glob '!.git' --column --line-number --no-heading --color=always --smart-case -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview(), <bang>0)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>f :Files<CR>
nnoremap <leader><S-f> :Rg<CR>

Plug 'machakann/vim-sandwich'

Plug 'm4xshen/autoclose.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" 
" nnoremap <silent> <buffer> <F9> :call <SID>compile_run_cpp()<CR>
" 
" function! s:compile_run_cpp() abort
"   let src_path = fnameescape(expand('%:p:~'))
"   let src_noext = fnameescape(expand('%:p:~:r'))
"   " The building flags
"   let _flag = '-Wall -Wextra -std=c++11 -O2'
" 
"   if executable('clang++')
"     let prog = 'clang++'
"   elseif executable('g++')
"     let prog = 'g++'
"   else
"     echoerr 'No compiler found!'
"   endif
"   call s:create_term_buf('v', 80)
"   execute printf('term %s %s %s -o %s && %s', prog, _flag, src_path, src_noext, src_noext)
"   startinsert
" endfunction
" 
" function s:create_term_buf(_type, size) abort
"   set splitbelow
"   set splitright
"   if a:_type ==# 'v'
"     vnew
"   else
"     new
"   endif
"   execute 'resize ' . a:size
" endfunction

" C++ language server config
" setting with vim-lsp
" lua require'lspconfig'.clangd.setup{}
" if executable('clangd')
"     augroup lsp_clangd
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"                     \ 'name': 'clangd',
"                     \ 'cmd': {server_info->['clangd']},
"                     \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"                     \ })
"         autocmd FileType c setlocal omnifunc=lsp#complete
"         autocmd FileType cpp setlocal omnifunc=lsp#complete
"         autocmd FileType objc setlocal omnifunc=lsp#complete
"         autocmd FileType objcpp setlocal omnifunc=lsp#complete
" 
"     augroup end
" endif
" 
" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
"     setlocal signcolumn=yes
"     if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"     nmap <buffer> gd <plug>(lsp-definition)
"     nmap <buffer> gs <plug>(lsp-document-symbol-search)
"     nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"     nmap <buffer> gr <plug>(lsp-references)
"     nmap <buffer> gi <plug>(lsp-implementation)
"     nmap <buffer> gt <plug>(lsp-type-definition)
"     nmap <buffer> <leader>rn <plug>(lsp-rename)
"     nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"     nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"     nmap <buffer> K <plug>(lsp-hover)
"     inoremap <buffer> <expr><c-f> lsp#scroll(+4)
"     inoremap <buffer> <expr><c-d> lsp#scroll(-4)
" 
"     let g:lsp_format_sync_timeout = 1000
"     autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"     
"     " refer to doc to add more commands
" endfunction
" 
" augroup lsp_install
"     au!
"     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END
" 
" autocmd FileType cpp let b:vcm_tab_complete = 'omni'

" LSP Support
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'neovim/nvim-lspconfig'
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

call plug#end()

lua require('init')
