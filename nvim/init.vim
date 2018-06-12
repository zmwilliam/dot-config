call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'majutsushi/tagbar'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Raimondi/delimitMate'
call plug#end()

colorscheme gruvbox
set background=dark
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

let mapleader="\<space>" 	" Map leader to space
set hidden 			" hidden buffers
set number			" Show line numbers
set relativenumber		" Relative line numbers
set mouse=a
set inccommand=split
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

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif


"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let g:NERDTreeQuitOnOpen=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"" Airline configuration
let g:airline_theme = 'bubblegum'
" let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#ale#enabled = 1 " show errors or warnings at airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"" Ale configuration
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"" Neosnippet
" C-k to select-and-expand a snippet from the deoplete popup (Use C-n and C-p to select it).
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" <tab> to select-and-expand a snippet from the deoplete popup (Use C-n and C-p to select it).
imap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<c-j>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" terminal emulation
" nnoremap <silent> <leader>sh :terminal<CR>

"" Split
noremap <Leader>s :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Movement
noremap <Leader>h ^
noremap <Leader>l $

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Buffer nav
"Move to the next buffer
nmap <leader>x :bnext<CR>
"Move to the previous buffer
nmap <leader>z :bprevious<CR>
"Close the current buffer and move to the previous one
nmap <leader>c :bp <BAR> bd #<CR>

"" Clean search (highlight)
" nnoremap <silent> <leader><space> :noh<cr>
nnoremap <silent> <leader>cl :noh<cr>

"" Git
noremap <Leader>gia :Gwrite<CR>
noremap <Leader>gic :Gcommit<CR>
noremap <Leader>gipu :Gpush<CR>
noremap <Leader>gip :Gpull<CR>
noremap <Leader>gis :Gstatus<CR>
noremap <Leader>gib :Gblame<CR>
noremap <Leader>gid :Gvdiff<CR>
noremap <Leader>gir :Gremove<CR>

"" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
" nnoremap <silent> <S-t> :tabnew<CR>

"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

""fzf
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

"" multiple-cursor
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment'])

"" vim-go

" Jump to next error with F8 and previous error with Shift F8. Close the
" quickfix window with <leader>a
map <F8> :cnext<CR>		
map <S-F8> :cprevious<CR>
nnoremap <leader>a :cclose<CR>		

let g:go_list_type = "quickfix" 		    " Specifies the type of list to use for command outputs 
let g:go_highlight_types = 1			      " Highlight struct and interface names.
let g:go_highlight_fields = 1			      " Highlight struct field names
let g:go_highlight_functions = 1		    " Highlight function and method declarations.
let g:go_highlight_function_calls = 1		" Highlight function and method calls
let g:go_highlight_operators = 1		    " Highlight operators such as `:=` , `==`, `-=`, etc.
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_decls_mode = 'fzf'
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1               " show the type info for the word under the cursor automatically
let g:go_auto_sameids = 1                 " highlight all uses of the identifier under the cursor
let g:go_addtags_transform = "snakecase"  " snake_case for json generated tags

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>gob :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>got  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>gor  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>god <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>goc <Plug>(go-coverage-toggle)
augroup END
