" Shared Vim/Neovim editing preferences.
" Keep this file focused on editor behavior: no plugin loading, package
" management, project commands, or extra language syntax setup.

" Neovim already defaults to nocompatible, but this keeps the file useful if it
" is sourced by classic Vim.
set nocompatible
set mouse=

" Core behavior
filetype plugin indent on
syntax enable
set autoindent
set hidden
set encoding=utf-8

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Files
set nobackup
" LOOK TWICE: writebackup protects writes from interruptions. The old config
" disabled it; keep it enabled unless temporary write files cause real issues.
" set nowritebackup

" Tags
" Search for project tags from the current file upward, then from Vim's cwd.
set tags=./tags;,tags

" LOOK TWICE: Neovim has good XDG defaults for swap files. Use a custom swap
" directory only if it exists on every machine that uses these dotfiles.
" set directory=~/.vim/tmp//

" Display
set background=dark
if exists("+termguicolors")
  set termguicolors
endif
set ruler
set cursorline
set number
set numberwidth=4
set laststatus=2
set showtabline=2
set list
" LOOK TWICE: The old config used Unicode glyphs for invisible characters.
" ASCII markers are less pretty but more portable across fresh terminals.
"set listchars=tab:>-,eol:$,trail:.,extends:>,precedes:<,nbsp:+
set listchars=tab:▸\ ,eol:¬

" LOOK TWICE: 81 matches the old config. Consider whether you want 80, 100, or
" 120 depending on the codebases you mostly work in.
if exists("+colorcolumn")
  set colorcolumn=81
endif

set statusline=[%02n]\ %t\ %y%m\ %=%l,%c/%L

" Text formatting
set expandtab
" LOOK TWICE: A global two-space default is convenient for Ruby/YAML/etc, but
" filetype-specific settings may be better once the Neovim config grows.
set shiftwidth=2
set shiftround
set softtabstop=2
set tabstop=8

" Splits
set splitbelow
" LOOK TWICE: Enable this if you want vertical splits to open on the right.
" set splitright

" Leader and mappings
let mapleader = ","

nnoremap <leader>h :set hlsearch!<bar>set hlsearch?<CR>
nnoremap <leader>n :set number!<bar>set number?<CR>
nnoremap <leader>l :set list!<CR>

" Keep text selected after indenting.
vnoremap < <gv
vnoremap > >gv

" LOOK TWICE: These navigate Vim tab pages, not buffers.
nnoremap <silent> <leader>g :tabnext<CR>
nnoremap <silent> <leader>d :tabprevious<CR>

" LOOK TWICE: <C-h> can be intercepted by terminals or tmux as Backspace.
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" LOOK TWICE: The old config mapped Tab to previous insert completion. Modern
" Neovim completion and snippet setups usually want to own Tab.
" inoremap <Tab> <C-p>

" Machine-local settings
" LOOK TWICE: If this becomes Neovim-only, consider sourcing
" ~/.config/nvim/local.vim instead.
let s:local_vimrc = expand("~/.vimrc-local")
if filereadable(s:local_vimrc)
  execute "source " . fnameescape(s:local_vimrc)
endif
unlet s:local_vimrc
