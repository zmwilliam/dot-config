let g:nvim_tree_auto_open = 0  "opens the tree when typing `vim $DIR` or `vim
let g:nvim_tree_auto_close = 1 "closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 1 "closes the tree when you open a file
let g:nvim_tree_auto_ignore_ft = [ 'startify' ] "on't auto open tree on specific filetypes.
let g:nvim_tree_width = 40 "can be width_in_columns or 'width_in_percent%'
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw (netrw is required by fugitive)
let g:nvim_tree_hijack_netrw = 1 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)

nnoremap <silent> <F3> :NvimTreeToggle<CR>
nnoremap <silent> <F2> :NvimTreeFindFile<CR>
