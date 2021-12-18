require'nvim-tree'.setup {
  -- open the tree when running this setup function
  open_on_setup       = false,

  -- disables netrw completely
  disable_netrw       = false,

  -- hijack netrw window on startup
  hijack_netrw        = true,

  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {'startify'},

  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,

  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = true,

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 40,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }

}

--"0 by default, closes the tree when you open a file
vim.g.nvim_tree_quit_on_open = 1

vim.api.nvim_set_keymap('n', '<F3>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
