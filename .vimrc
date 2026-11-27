" Shared config for IdeaVim, Vim and Neovim.
"
" Setup:
"   Vim       reads ~/.vimrc directly
"   IdeaVim   ~/.ideavimrc contains:              source ~/.vimrc
"   Neovim    ~/.config/nvim/init.vim contains:   source ~/.vimrc

" ---- Shared: works the same everywhere ----------------------------------

" Yank uses the system clipboard (Ctrl+C / Ctrl+V)
" Vim needs +clipboard; Neovim needs xclip, xsel or wl-clipboard installed.
set clipboard+=unnamedplus

" Don't copy deletes/changes to the clipboard — only yank
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X

nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
vnoremap C "_C

nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap s "_s
nnoremap S "_S
vnoremap s "_s

" Zero goes to first non-blank char on line instead of line beginning
nnoremap 0 ^

" Alternative ways to get back to normal mode
inoremap jk <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>

" ---- Editor-specific ----------------------------------------------------

if has('ide')
  " IdeaVim

  " Click moves caret (no Ctrl required)
  set ideamouseclick

  " Use native find for Ctrl-F
  sethandler <C-F> a:ide

  " Close the current tab instantly with Ctrl-W
  nnoremap <C-w> <Action>(CloseContent)
else
  " Vim / Neovim

  " Click moves caret
  set mouse=a

  " Ctrl-F starts a search (replaces the default page-down)
  nnoremap <C-f> /

  " Close the current buffer with Ctrl-W
  " (replaces the <C-w> window prefix; use :split / :vsplit / :wincmd instead)
  nnoremap <C-w> :bdelete<CR>
endif