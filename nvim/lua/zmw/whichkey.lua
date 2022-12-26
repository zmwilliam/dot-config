local M = {}

local function setup_opts(which_key)
  local setup = {
    plugins = {
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }
  which_key.setup(setup)
end

local function register_mappings(which_key)
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
      f    = { "<cmd>lua require('zmw.telescope').project_files()<cr>", "Files" },
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
      w    = { "<cmd>Telescope grep_string<cr>", "Grep string" },
      p    = { "<cmd>Telescope projects<cr>", "Projects" },
      e    = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
    },

    m = {
      name = "Packer",
      p = { "<cmd>runtime lua/zmw/plugins.lua | PackerSync<cr>", "Source and Sync Plugins" },
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

    b = {
      name = "Buffers",
      b    = { "<cmd>Telescope buffers<cr>", "List" },
      p    = { "<cmd>BufferLinePick<CR>", "Pick" },
      c    = { "<cmd>bdelete!<CR>", "Close Current" },
      q    = { "<cmd>BufferLinePickClose<CR>", "Close Pick" },
      l    = { "<cmd>BufferLineCloseRight<CR>", "Close buffers to the RIGHT" },
      h    = { "<cmd>BufferLineCloseLeft<CR>", "Close buffers to the LEFT" },
      x    = { "<cmd>%bd|e#|bd#<CR>|'\"", "Close all buffers but current" },
      s    = {
        name = "Sort By",
        e = { "<cmd>BufferLineSortByExtension<CR>", "Extension" },
        d = { "<cmd>BufferLineSortByDirectory<CR>", "Directory" },
        r = { "<cmd>BufferLineSortByRelativeDirectory<CR>", "Relative Directory" },
        t = { "<cmd>BufferLineSortByTabs<CR>", "Tabs" },
      }
    }
  }
  which_key.register(mappings, opts)
end

local function register_clipboard_mappings(which_key)
  local normal_visual = {
    d = { [["+d]], "delete to clipboard" },
    p = { [["+p]], "paste from clipboard (after)" },
    P = { [["+P]], "paste from clipboard (before)" },
    y = { [["+y]], "yank to clipboard" }
  }

  local normal_only = {
    D = { [["+d$]], "delete to clipboard (d$)" },
    Y = { [["+y$]], "yank to clipboard (y$)" }
  }

  which_key.register(normal_only, { prefix = "<leader>", mode = "n" })
  which_key.register(normal_visual, { prefix = "<leader>", mode = "n" })
  which_key.register(normal_visual, { prefix = "<leader>", mode = "x" })
end

function M.setup()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  setup_opts(which_key)
  register_mappings(which_key)
  register_clipboard_mappings(which_key)
end

return M
