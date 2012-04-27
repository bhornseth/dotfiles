" based on http://github.com/jferris/config_files/blob/master/vimrc
" some awesomeness found @ http://vi-improved.org/vimrc.html
" ----------------------------------------------------------------------
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" we're using pathogen as a git submodule, so it's not
" necessarily where it should be. load it, then call it
source ~/.vim/autoload/pathogen.vim/autoload/pathogen.vim
call pathogen#infect()


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif



" General {
  filetype plugin indent on  " load filetype plugins/indent settings
  set autoindent             " copy the indentation from the previous 
                             " line. doesn't interfere with the above
  set directory=~/.vim/tmp   " where to put .swp files
  set hidden                 " change buffers without saving 
  set incsearch              " turn on find-as-you-type completion
  set ignorecase             " ignore case when searching
  set smartcase              " but use case-sensitive searching if the search 
  set nobackup               " no backup files (~)
  set nowritebackup          " also no backup files
" }

" Visual Stuffs {
  set t_Co=256      " terminal supports 256 colors. Can't imgagine how it wouldn't
  set bg=dark       " brogrammers like thier editors light-on-dark
  set ruler	        " show the cursor position all the time
  set cursorline    " highlight the current line
  set number        " line numbers are cool
  set numberwidth=4 " line number gutter width 
  set showtabline=2 " always show tablines in gvim, but not vim
  set laststatus=2
  highlight LineNr ctermfg=8 ctermbg=234
  highlight StatusLine ctermbg=231 ctermfg=236
  highlight CursorLine cterm=NONE ctermbg=235
  set statusline=[%02n]\ %t\ %y%m\ %=%l,%c/%L\ \ 
  "                  |    |   | |    |   |  `- total lines
  "                  |    |   | |    |   `---- current column number
  "                  |    |   | |    `------- current line number
  "                  |    |   | `--------------------- modified 
  "                  |    |   `----------------------- file type (e.g. ruby)
  "                  |    `--------------------------- file name
  "                  `--------------------------------- buffer number (leading 0)
  colorscheme jellybeans
" }


" Text Formatting {
  set expandtab       " no real tabs
  set shiftwidth=2    " autoindent amount when using cindent / >> / <<
  set shiftround      " when at 3 spaces and I tab, go to 4, not 5
  set softtabstop=2   " when hitting tab or backspace, how many spaces a tab should be
  set tabstop=8       " actual tabs are 8
" }


" Ruby {
  au BufNewFile,BufRead *.erb              setf eruby
  au BufRead,BufNewFile *.rb,*.rhtml,*.erb set shiftwidth=2
  au BufRead,BufNewFile *.rb,*.rhtml,*.erb set softtabstop=2
  au BufRead,BUfNewFile Gemfile            set filetype=Gemfile
" }


" experments & such
set nowrap         " switch wrap off for everything
