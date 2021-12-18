set nocompatible " use vim settings, instead of vi
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'valloric/youcompleteme'
Plugin 'arcticicestudio/nord-vim'

call vundle#end()

" General Configuration Options
set backspace=indent,eol,start " Allow backspacing over indentation, line breaks, and insertion start
set history=1000
set showcmd
set showmode
set autoread
set hidden

" User Interface Options
set laststatus=2
set ruler
set wildmenu
set number
set cursorline
set mouse=a " Enable mouse for scrolling and resizing

" Indentation options
set autoindent " New lines inherit the indentation of previous line
filetype plugin indent on " smart auto indentation
set tabstop=2
set shiftwidth=2

" Text rendering options
set encoding=utf-8
set linebreak
set scrolloff=5
set sidescrolloff=5
syntax enable

" Miscellaneous options
set confirm
set spelllang=en

" netrw options

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" set swap directory
set directory=$HOME/.vim/swp//
" set backup directory
set backupdir=$HOME/.vim/bak//

" set project specific vimrc
set exrc

" mapping for moving between buffers
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>

" folding options
set foldenable "Enable folding
set foldlevelstart=10 "Open most of the folds by default. If set to 0, all folds will be closed
set foldnestmax=10 "Folds can be nested. Setting a max value protects you from too many folds.
set foldmethod=indent "Defines the type of folding.
set foldcolumn=2

" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

" NERDTree configurations
" start nerdtree, if a file is specified move cursor to its window
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit vim if nerdtree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" use F5 key to open nerdtree
map <F5> :NERDTreeToggle<CR>


" Airline configurations
" display buffers when only one tab open
let g:airline#extensions#tabline#enabled=1
" use powerline
let g:airline_powerline_fonts=1


" Set colorscheme
colorscheme nord
