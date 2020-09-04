call plug#begin()
" Plug 'scrooloose/nerdtree'	" file system explorer for the Vim editor
Plug 'tpope/vim-fugitive'	" the premier Vim plugin for Git
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'		" fuzzy finder
Plug 'sheerun/vim-polyglot'	" language pack (syntax, indent)
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 

Plug 'gruvbox-community/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
call plug#end()

if has("termguicolors")
  set termguicolors
endif
" if exists('$SHELL')
"   set shell=$SHELL
" else
"   set shell=/bin/sh
" endif

set shell=/bin/bash

let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_selection='0'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
colorscheme gruvbox
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
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
" let g:NERDTreeChDirMode=2
" let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
" let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
" let g:NERDTreeShowBookmarks=1
" let g:nerdtree_tabs_focus_on_files=1
" let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
" let g:NERDTreeWinSize = 50
" let g:NERDTreeQuitOnOpen=1
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" nnoremap <silent> <F2> :NERDTreeFind<CR>
" nnoremap <silent> <F3> :NERDTreeToggle<CR>

"" Startify
let g:startify_session_dir = '~/.config/nvim/sessions' "Sessions directory
let g:startify_session_delete_buffers = 1 "Delete all buffers when loading or closing a session
let g:startify_change_to_vcs_root = 1 "seek and change to the root directory of the VCS
let g:startify_session_persistence = 1 "Automatically update sessions before quiting vim
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'c': '~/.config/nvim/coc-settings.json' },
            \ { 'z': '~/.config/tmux/tmux.conf' },
            \ { 'x': '~/.gitconfig' },
            \ ]

"" Airline configuration
" let g:airline_theme = 'bubblegum'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#coc#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"" Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder/directory glyph flag
let g:DevIconsEnableFoldersOpenClose = 1        " enable open and close folder/directory glyph flags

"" FZF
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>E :FZF -m<CR>
nnoremap <silent> <leader>e :GFiles<CR>
nnoremap <silent> <leader>t :BTags<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" Split
noremap <Leader>s :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Buffer nav
nnoremap <leader>x :bp <BAR> bd #<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"" Clean search (highlight)
nnoremap <silent> <leader>cl :noh<cr>

" Jump to next error with F8 and previous error with Shift F8. Close the
" quickfix window with <leader>a
map <F8> :cnext<CR>
map <S-F8> :cprevious<CR>
nnoremap <leader>a :cclose<CR>		

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :Rg<SPACE>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

"" CoC
" CoC extensions
let g:coc_global_extensions = [
  \ 'coc-marketplace',
  \ 'coc-explorer',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json', 
  \ 'coc-elixir', 
  \ ]

nmap <silent>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
" Use ctrl+c to trigger completion.
inoremap <silent><expr> <C-c> coc#refresh()

" CoC -> tab and shift+tab to navigate completions
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"  CoC -> use <CR> to confirm completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" CoC -> Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" CoC -> Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" CoC -> coc-explorer
nmap <silent> <F2> :CocCommand explorer<CR>
" closes coc-explorer if it is the last buffer open
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
