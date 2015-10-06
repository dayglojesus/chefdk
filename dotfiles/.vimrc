set nocompatible " be iMproved

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent          " always set autoindenting on
set nobackup            " do not keep a backup file
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set shiftwidth=2        " 1st tab is at column 2, so start at 3 for auto-indent
set tabstop=8           " correct for normal tab
set smarttab            " it's so smart

" BEGIN PLUGIN CONFIG FOR vim-plug
call plug#begin('~/.vim/plugged')

" Chef support
Plug 'tomtom/tlib_vim'
Plug 'vadv/vim-chef'

" File browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" TextMate’s ⌘-T smart-filtering file launcher
Plug 'wincent/command-t'

" Ruby lang plugin
Plug 'vim-ruby/vim-ruby'

" Snippets for snipmate
Plug 'honza/vim-snippets'

" TextMate style snippets
Plug 'msanders/snipmate.vim'

" Theme
" Plug 'altercation/vim-color-solarized'
Plug 'tomasr/molokai'

" Surround selected text with input (ie. quotes)
Plug 'tpope/vim-surround'

" Rails support
Plug 'tpope/vim-rails'

" Git support: Gx commands
Plug 'tpope/vim-fugitive'

" Autoclose brackets, etc.
Plug 'jiangmiao/auto-pairs'

" Fancy vim status bar
Plug 'bling/vim-airline'

" Tab completions
Plug 'ervandew/supertab'

" CoffeeScript syntax
Plug 'kchmck/vim-coffee-script'

" Fuzzy finder for vim (CTRL+P)
Plug 'kien/ctrlp.vim'

" Ruby Tests
Plug 'skalnik/vim-vroom'

" Easy motion for easy motion
Plug 'Lokaltog/vim-easymotion'

" Running tests in tmux session
Plug 'tpope/vim-dispatch'

" Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'danro/rename.vim'

Plug 'nono/vim-handlebars'

" END PLUGIN CONFIG FOR vim-plug
call plug#end()

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown set filetype=ruby.eruby.chef  ai sw=2 sts=2 et
augroup END

" Syntax highlighting and theme
syntax enable

" Configs to make Molokai look great
set background=dark
let g:molokai_original=1
let g:rehash256=1
set t_Co=256
colorscheme molokai

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" linenumbers
set nu


" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

" Install plugins on first launch and reload vimrc
if isdirectory($HOME . '/.vim/plugged') == 0
	execute "PlugInstall"
	execute "source .vimrc"
endif

