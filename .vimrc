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

" Add the g flag to search/replace by default
set gdefault

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
