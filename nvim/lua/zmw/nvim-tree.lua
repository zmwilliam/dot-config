local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  -- open the tree when running this setup function
  open_on_setup = false,

  -- disables netrw completely
  disable_netrw = false,

  -- hijack netrw window on startup
  hijack_netrw = true,

  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = { 'alpha', 'startify', 'dashboard' },

  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = true,

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  },

  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },

  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
    }
  },

  -- project support
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
}

vim.g.nvim_tree_respect_buf_cwd = 1 --"0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}
