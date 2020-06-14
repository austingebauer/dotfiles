syntax on

" Start scrolling 10 lines before the horizontal window border
set scrolloff=10

" Allows the left, right, h, and l keys to wrap around lines
set whichwrap+=<,>,[,]

" Enable line numbers
set number

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Enable mouse in all modes
set mouse=r

" Disable error bells
set noerrorbells

" Use the OS clipboard by default
set clipboard=unnamed

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Highlight current line
set cursorline

" Always show status line
set laststatus=2

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Change the shape of the cursor in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " insert
let &t_SR = "\<Esc>]50;CursorShape=2\x7" " replace
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " normal

" Tabs appear as 4 space characters
set tabstop=4

" Cuts are deletes to the black hole registers
" This means copy/paste needs to happen deliberately
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap x "_x
vnoremap x "_x

" Backspace behaves as a
nnoremap <silent> <backspace> a

" Visual backspace behaves as c
vnoremap <silent> <backspace> c

" Enter behaves as i
nnoremap <silent> <return> i
