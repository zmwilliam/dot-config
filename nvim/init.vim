call plug#begin()
Plug 'tpope/vim-fugitive'	" the premier Vim plugin for Git
Plug 'tpope/vim-rhubarb'	" fugitive support for github
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'hoob3rt/lualine.nvim'
Plug 'romgrk/barbar.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'zmwilliam/nord-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-startify'
call plug#end()

set shell=/bin/bash

let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_selection='0'

if exists('&termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"colorscheme gruvbox
colorscheme nord
set background=dark

let mapleader="\<space>" 	" Map leader to space
set hidden 			" hidden buffers
set number			" Show line numbers
set relativenumber		" Relative line numbers
set autowrite 			" Automatically save before :next, :make etc.
set clipboard=unnamed  		" System clipboard
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase			" Search case insensitive ...
set smartcase                   " ... but not it begins with upper case
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files<Paste>
set laststatus=2		" Display the status line always
set backspace=indent,eol,start  " Makes backspace key more powerful.
set pumheight=10                " Completion window max size
set nowrap 			" Disable word wrap
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set updatetime=50
set mouse=a
set inccommand=split
set smartindent
set noerrorbells

syntax on
filetype plugin indent on

"" Abbreviations to 'ignore' typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wqa wqa
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Qa qa

"" Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder/directory glyph flag
let g:DevIconsEnableFoldersOpenClose = 1        " enable open and close folder/directory glyph flags

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Clean search (highlight)
nnoremap <silent> <leader>cl :noh<cr>

" Jump to next error with F8 and previous error with Shift F8. Close the
" quickfix window with <leader>a
map <F8> :cnext<CR>
map <S-F8> :cprevious<CR>
nnoremap <leader>a :cclose<CR>		

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
" xnoremap K :move '<-2<CR>gv-gv
" xnoremap J :move '>+1<CR>gv-gv

" Disable arrow movement, resize splits instead.
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 800})
augroup END

