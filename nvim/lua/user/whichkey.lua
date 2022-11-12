local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>qa!<CR>", "Quit" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

  f = {
    name = "Find",
    f    = { "<cmd>lua require('user.telescope').project_files()<cr>", "Files" },
    F    = { "<cmd>Telescope find_files<cr>", "Files (all)" },
    g    = {
      function()
        vim.ui.input(
          { prompt = "  " },
          function(input)
              return input and require("telescope.builtin").grep_string({ search = input })
          end
        )
      end,
      "Grep For"
    },
    G    = { "<cmd>Telescope live_grep theme=ivy<cr>", "Live grep" },
    w    = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Grep string" },
    b    = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
    p    = { "<cmd>Telescope projects<cr>", "Projects" },
    e    = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
  },

  P = {
    name = "Packer",
    p = { "<cmd>runtime lua/user/plugins.lua | PackerSync<cr>", "Source and Sync Plugins" },
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    g = { "<cmd>Git<CR>", "Fugitive" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    P = { "<cmd>Git push<CR>", "Push" },
  },

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  b = {
    name = "Buffers",
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "List" },
    p = { "<cmd>BufferLinePick<CR>", "Pick" },
    c = { "<cmd>bdelete!<CR>", "Close Current" },
    q = { "<cmd>BufferLinePickClose<CR>", "Close Pick" },
    l = { "<cmd>BufferLineCloseRight<CR>", "Close buffers to the RIGHT" },
    h = { "<cmd>BufferLineCloseLeft<CR>", "Close buffers to the LEFT" },
    x = { "<cmd>%bd|e#|bd#<CR>|'\"", "Close all buffers but current" },
    s = {
      name = "Sort By",
      e = { "<cmd>BufferLineSortByExtension<CR>", "Extension" },
      d = { "<cmd>BufferLineSortByDirectory<CR>", "Directory" },
      r = { "<cmd>BufferLineSortByRelativeDirectory<CR>", "Relative Directory" },
      t = { "<cmd>BufferLineSortByTabs<CR>", "Tabs" },
    },
    g = {
      name = "Go to #",
      ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer #1" },
      ["2"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer #2" },
      ["3"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer #3" },
      ["4"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer #4" },
      ["5"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer #5" },
      ["6"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer #6" },
      ["7"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer #7" },
      ["8"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer #8" },
      ["9"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer #9" },
    }
  }
}

which_key.setup(setup)
which_key.register(mappings, opts)

local clipboard_mappings = {
  normal_visual = {
    d = { [["+d]], "delete to clipboard" },
    p = { [["+p]], "paste from clipboard (after)" },
    P = { [["+P]], "paste from clipboard (before)" },
    y = { [["+y]], "yank to clipboard" }
  },
  normal_only = {
    D = { [["+d$]], "delete to clipboard (d$)" },
    Y = { [["+y$]], "yank to clipboard (y$)" }
  }
}

which_key.register(clipboard_mappings.normal_only, { prefix = "<leader>", mode = "n" })
which_key.register(clipboard_mappings.normal_visual, { prefix = "<leader>", mode = "n" })
which_key.register(clipboard_mappings.normal_visual, { prefix = "<leader>", mode = "x" })
