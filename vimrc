" General
  set nocompatible
  set t_Co=256 " use 256 colours in terminal vim 
  set enc=utf-8

  " Match and search
  set hlsearch      " highlight search terms
  set incsearch     " show search matches as you type
  " Visual Cues
  "set lines=80 " 80 lines tall
  "set columns=160 " 160 cols wide
  set statusline=%F%m%r%h%w\ format:%{&ff}\ type:%Y\ pos:%04l,%04v\ %p%%\ len=%L
  set laststatus=2 " always show the status line
  set showmatch     " shows matching parenthesis
  "set listchars=nbsp:¬,tab:>-,trail:·
  set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«
  set ruler " show current positions along the bottom

  " Sudo write
  comm! W exec 'w !sudo tee % > /dev/null' | e!
  let mapleader = ","

  syntax on
  set expandtab " indent with spaces, not tab
  set hidden

filetype plugin indent on

" Plugins:
  " needs curl
  set runtimepath+=~/.vim/bundle/vundle/ 
  call vundle#rc()

  Bundle 'gmarik/vundle'

  " original repos on github
  Bundle 'tpope/vim-fugitive'
  Bundle 'majutsushi/tagbar'
  Bundle 'reinh/vim-makegreen'
  Bundle 'Twinside/vim-haskellConceal'
  Bundle 'Conque-Shell'
  "Bundle 'LustyJuggler'

  " vim-scripts repos
  Bundle 'L9'
  Bundle 'FuzzyFinder'

  Bundle 'gundo'
  nnoremap <F5> :GundoToggle<CR>

  Bundle 'scrooloose/syntastic'

  " Bundle 'ack.vim'
  " Bundle 'git.vim'
  Bundle 'openssl.vim'
  Bundle 'Rainbow-Parenthsis-Bundle'
  Bundle 'Source-Explorer-srcexpl.vim'
  Bundle 'project.tar.gz'
  Bundle 'taglist.vim'

  " vimwiki " {{{
  Bundle 'vimwiki'
  " vimwiki
  "let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_export': 1}]
  "let g:vimwiki_list = [{'path_html': '~/vimwiki_html/', 'auto_export': 1}]
  let wiki = {}
  let wiki.path = '~/Dropbox/vimwiki/'
  let wiki.path_html = '~/vimwiki_html/'
  let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'haskell': 'haskell'}
  let wiki.auto_export = 1
  let wiki.html_footer = '~/vimwiki_html/footer.tpl'
  let g:vimwiki_list = [wiki]
  let g:vimwiki_browsers=['/usr/bin/google-chrome']
  " " }}}

  " colorschemes
  Bundle 'Mustang2'
  Bundle 'vibrantink'
  "Bundle 'summerfruit'
  Bundle 'summerfruit256.vim'

  "Make gvim-only colorschemes work transparently in terminal vim 
  Bundle 'CSApprox'
  Bundle 'bclear'
  Bundle 'glsl.vim'
  Bundle 'tslime.vim'
  Bundle 'Zenburn'
  Bundle 'Solarized'


  " Ack
  Bundle 'kronn/ack.vim'
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"

  " non github repos
  Bundle 'git://git.wincent.com/command-t.git'

  let NERDTreeIgnore=['\.vim$', '\~$', '\.o$']

" see: https://bugs.launchpad.net/ubuntu/+source/vim-latexsuite/+bug/137205
set runtimepath+=/usr/share/vim/addons

"set relativenumber
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set noerrorbells " don't make noise

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"
  set si
  set cindent
  set shiftwidth=2 " number of spaces to use for autoindenting
  set tabstop=2
  set softtabstop=2

  set fo=tcrqn " See Help (complex)
  "set ai " autoindent
  set si " smartindent 
  set cindent " do c-style indenting

  set colorcolumn=81
"
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
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C/C++
"
autocmd FileType *.c set foldmethod=indent
autocmd FileType *.cpp set foldmethod=indent
autocmd FileType cpp map <F5> <ESC>:wa<CR>:make<CR>
autocmd FileType cpp map <F7> :cex system("cppcheck --template gcc --enable=all " . shellescape(expand('%')))<CR>
autocmd FileType cpp map <F5> <ESC>:wa<CR>:make<CR>

if getline(1) =~ '-*-c++-*-'
  set filetype=cpp
endif
set tags=~/tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Haskell
"
"autocmd BufWritePost *.hs !ghc -c %

"autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>
"autocmd FileType haskell nmap <C-c><C-r> :GhciReload<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" glsl
"
autocmd FileType *.glsl setfiletype glsl
autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl,*.glslf,*.glslv setf glsl

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.tmux setf tmux
autocmd bufwritepost .vimrc source $MYVIMRC
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us
runtime! ftplugin/man.vim

set winminheight=0 " minimal height of windows

if &t_Co >= 256 || has("gui_running")
  "colorscheme summerfruit256
  colorscheme Mustang
  "colorscheme vibrantink
  "colorscheme bclear
  "set background=dark
  "let g:solarized_termtrans=1
  "let g:solarized_termcolors=256
  "let g:solarized_contrast="high"
  "let g:solarized_visibility="high"
  "colorscheme solarized

  "remove scroolbars and toolbar
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R

  set gcr=n-v-c:block-blinkwait0-blinkon0-blinkoff0
  "let w:solarized_style="dark"
  "colorscheme solarized
  "colorscheme slate
else
  "
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.otl		setfiletype vo_base
  au! BufRead,BufNewFile *.oln		setfiletype xoutliner
augroup END

" in case you forgot sudo
cmap w!! w !sudo tee % >/dev/null

" from reddit , originally from syntastic guys
" {{{ Nice statusbar
"statusline setup
set statusline=%f       "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

" display current git branch
set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2        " Always show status line

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

" execute tests
map <leader>dt :set makeprg=make\ test\|:call MakeGreen()<CR>
"map <leader>dt :set makeprg=!runhaskell\ test.hs\|:call MakeGreen()<CR>

