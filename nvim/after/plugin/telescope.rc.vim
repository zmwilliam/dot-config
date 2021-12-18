if !exists('g:loaded_telescope') | finish | endif

nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fF <cmd>Telescope find_files<cr>
nnoremap <leader>fd <cmd>Telescope file_browser<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"Fix nord theme with telescope mathing color
" if g:colors_name == 'nord'
"   highlight TelescopeMatching guifg=#88C0D0
" endif

lua << EOF
local telescope = require('telescope')
local actions = require('telescope.actions')
local actions_layout = require("telescope.actions.layout")

telescope.setup{
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      vertical = { width = 0.95 },
    },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-]>"] = actions_layout.toggle_preview
      },
      i = {
        ["qq"] = actions.close,
        ["<C-]>"] = actions_layout.toggle_preview
      },
    },
  },
  pickers = {
    find_files = { previewer = false },
    git_files = { previewer = false },
  }
}

telescope.load_extension('project')
EOF

