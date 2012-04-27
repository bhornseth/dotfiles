" based on http://github.com/jferris/config_files/blob/master/vimrc
" some awesomeness found @ http://vi-improved.org/vimrc.html
" ----------------------------------------------------------------------
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif



" General {
  filetype plugin indent on  " load filetype plugins/indent settings
  set directory=~/.vim/tmp   " where to put .swp files
  set hidden                 " change buffers without saving 
  set incsearch              " turn on find-as-you-type completion
  set ignorecase             " ignore case when searching
  set smartcase              " but use case-sensitive searching if the search 
  set nobackup               " no backup files (~)
  set nowritebackup          " also no backup files
" }

" Visual Stuffs {
  set bg=dark       " brogrammers like thier editors light-on-dark
  set ruler	        " show the cursor position all the time
  set number        " line numbers are cool
  set numberwidth=3 " 
" }


" Text Formatting {
  set expandtab       " no real tabs
  set shiftwidth=2    " autoindent amount when using cindent / >> / <<
  set shiftround      " when at 3 spaces and I tab, go to 4, not 5
  set softtabstop=2   " when hitting tab or backspace, how many spaces a tab should be
  set tabstop=8       " actual tabs are 8
" }


" Ruby {
  au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
  au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
" }








" experments & such
set nowrap         " switch wrap off for everything
set showcmd        " display incomplete commands









