let g:nvim_tree_auto_close = 1 "closes the tree when it's the last window
let g:nvim_tree_auto_open = 1  "opens the tree when typing `vim $DIR` or `vim
let g:nvim_tree_quit_on_open = 1 "closes the tree when you open a file
let g:nvim_tree_auto_ignore_ft = [ 'startify' ] "on't auto open tree on specific filetypes.

nnoremap <F3> :NvimTreeToggle<CR>
nnoremap <F2> :NvimTreeFindFile<CR>
