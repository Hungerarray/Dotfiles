set nocompatible " use vim settings, instead of vi

"###############################################################################
" vim plug - start plugins
"###############################################################################
call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kevinoid/vim-jsonc'
"Plug 'nvim-telescope/telescope.nvim'

" themes
Plug 'arcticicestudio/nord-vim'
Plug 'mcchrish/zenbones.nvim'

call plug#end()
"###############################################################################


"###############################################################################
" General Configuration Options
"###############################################################################
" Allow backspacing over indentation, line breaks, and insertion start
set backspace=indent,eol,start
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
"Enable folding
set foldenable
"Open most of the folds by default. If set to 0, all folds will be closed
set foldlevelstart=10
"Folds can be nested. Setting a max value protects you from too many folds.
set foldnestmax=10
"Defines the type of folding.
set foldmethod=indent
set foldcolumn=2

" remove trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e
"###############################################################################


"###############################################################################
" NERDTree configurations
"###############################################################################
" start nerdtree, if a file is specified move cursor to its window
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") |
	\ wincmd p | endif
" Exit vim if nerdtree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
	\ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" use F5 key to open nerdtree
map <F5> :NERDTreeToggle<CR>
"###############################################################################


"###############################################################################
" Airline configurations
"###############################################################################
" display buffers when only one tab open
let g:airline#extensions#tabline#enabled=1
" use powerline
let g:airline_powerline_fonts=1
"###############################################################################


"###############################################################################
" coc.nvim configurations
"###############################################################################
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif
" use tab for trigger completion
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : <\C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"###############################################################################

"###############################################################################
" Torchlight config
"###############################################################################
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"###############################################################################


"###############################################################################
" Set colorscheme
"###############################################################################
set termguicolors
colorscheme forestbones
