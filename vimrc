set nocompatible
syntax on
set expandtab " indent with spaces, not tab

" see: https://bugs.launchpad.net/ubuntu/+source/vim-latexsuite/+bug/137205
set runtimepath+=/usr/share/vim/addons

"set relativenumber
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set noerrorbells " don't make noise

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"
"set lines=80 " 80 lines tall
"set columns=160 " 160 cols wide
set statusline=%F%m%r%h%w\ format:%{&ff}\ type:%Y\ pos:%04l,%04v\ %p%%\ len=%L
set laststatus=2 " always show the status line
set showmatch     " shows matching parenthesis
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set listchars=tab:▸\ ,eol:¬
set ruler " show current positions along the bottom

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"
set si
set cindent
set shiftwidth=2 " number of spaces to use for autoindenting
set tabstop=2
set softtabstop=2
"set number        " show line numbers

set fo=tcrqn " See Help (complex)
"set ai " autoindent
set si " smartindent 
set cindent " do c-style indenting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"
set foldenable
set foldmethod=indent
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff

filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex and latex-suite
"
set grepprg=grep\ -nH\ $*
filetype indent on " enables automatic indentation as you type.
let g:tex_flavor='latex'
" win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

augroup filetypedetect
  au! BufRead,BufNewFile *.tex		setfiletype tex "tex_latexSuite
  au! BufRead,BufNewFile *.bib		setfiletype tex "bib_latexSuite
augroup END

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++
"
autocmd FileType *.c set foldmethod=indent
autocmd FileType *.cpp set foldmethod=indent
autocmd FileType cpp map <F5> <ESC>:wa<CR>:make<CR>
if getline(1) =~ '-*-c++-*-'
  set filetype=cpp
endif
set tags=~/tags

set winminheight=0 " minimal height of windows

let NERDTreeIgnore=['\.vim$', '\~$', '\.o$']

"autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>
"autocmd FileType haskell nmap <C-c><C-r> :GhciReload<CR>

autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl,*.glslf,*.glslv setf glsl
autocmd bufwritepost .vimrc source $MYVIMRC
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us
runtime! ftplugin/man.vim

if &t_Co >= 256 || has("gui_running")
  colorscheme mustang
  "colorscheme summerfruit
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.otl		setfiletype vo_base
  au! BufRead,BufNewFile *.oln		setfiletype xoutliner
augroup END

