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
  set encoding=utf-8
  set termencoding=utf-8
" }

" Visual Stuffs {
  set bg=dark       " brogrammers like thier editors light-on-dark
  set ruler	        " show the cursor position all the time
  set cursorline    " highlight the current line
  set number        " line numbers are cool
  set numberwidth=4 " line number gutter width 
  set showtabline=2 " always show tablines in gvim, but not vim
  set laststatus=2

  " if you try to use a dumb terminal, you're gonna have a bad time
  if &t_Co > 2 || has("gui_running")
    " well fuck. at least we have this.
    syntax on
  endif

  " less eye melting, more awesome
  if &t_Co >= 256 || has("gui_running")
    highlight LineNr ctermfg=8 ctermbg=234
    highlight StatusLine ctermbg=231 ctermfg=236
    highlight CursorLine cterm=NONE ctermbg=235
    colorscheme jellybeans
    set colorcolumn=81
    highlight ColorColumn cterm=NONE ctermbg=236
  endif


  set statusline=[%02n]\ %t\ %y%m\ %=%l,%c/%L\ \ 
  "                  |    |   | |    |   |  `- total lines
  "                  |    |   | |    |   `---- current column number
  "                  |    |   | |    `------- current line number
  "                  |    |   | `--------------------- modified 
  "                  |    |   `----------------------- file type (e.g. ruby)
  "                  |    `--------------------------- file name
  "                  `--------------------------------- buffer number (leading 0)
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

" Key mappings {
  map <F5> :set hls!<bar>set hls?<CR>  " toggle search highlighting on F5
  map <F4> :set nu!<bar>set nu?<CR>    " toggle line numbers on F4, useful when you need to copy text w/ mouse
" } 

" experments & such
"set nowrap         " switch wrap off for everything
" set splitbelow    " new horizontal splits show up on the bottom
" set splitright    " new vert splits show up on the rhs

" NERDTree tweaks {
  "let NERDTreeQuitOnOpen = 1                        " Close the tree view when we open a file
  "autocmd vimenter * if !argc() | NERDTree | endif  " open NERDTree if no files were specified
  nmap <silent> ,nt :NERDTreeToggle \| :silent NERDTreeMirror<CR>
" }

" Keep text selected after indent
vnoremap < <gv 
vnoremap > >gv 

" tab switching
nmap <silent> ,f :tabn<CR>
nmap <silent> ,d :tabp<CR>

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

imap <Tab> <C-P> " remap tab completion

" rails test shortcuts
map <silent> ,tt :! rake test:units TEST=%<CR>
map <silent> ,ft :! rake test:functionals TEST=%<CR>
