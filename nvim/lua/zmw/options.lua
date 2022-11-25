local function setup_options()
  local options = {
    backup = false, -- don't creates a backup file
    --clipboard = "unnamedplus", -- allows neovim to access the syst em clipbard
    cmdheight = 1, -- more space to display messages at the command line
    completeopt = { 'menu', 'menuone', 'noselect' }, -- cmp requirement
    conceallevel = 0, -- so that `` is visible in markdown files
    cursorline = true, -- highlight the current line
    cursorlineopt = "number", -- highlight only the line number of the cursor
    expandtab = true, -- convert tabs to spaces
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    number = true, -- set numbered lines
    numberwidth = 2, -- set number column width to 2 {default 4}
    relativenumber = true, -- set relative numbered lines
    scrolloff = 8, -- always show N lines above and bellow the cursor
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    sidescrolloff = 8,
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- don't creates a swapfile
    tabstop = 2, -- insert 2 spaces for a tab
    timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 300, -- faster completion (4000ms default)
    wrap = false, -- display lines as one long line
    laststatus = 3, -- Enable global statusline
  }

  for k, v in pairs(options) do
    vim.opt[k] = v
  end

  vim.opt.shortmess:append "c"
  vim.opt.whichwrap:append "<,>,[,],h,l"
  vim.opt.iskeyword:append "-"

  local icons = require("zmw.icons")
  vim.opt.fillchars:append(icons.ui.FillChars)

  vim.opt.list = true
  vim.opt.listchars:append(icons.ui.ListChars)
end

local function set_abbreviations()
  -- Abbreviations to 'ignore' typos
  vim.cmd "cnoreabbrev W! w!"
  vim.cmd "cnoreabbrev Q! q!"
  vim.cmd "cnoreabbrev Qall! qall!"
  vim.cmd "cnoreabbrev Wq wq"
  vim.cmd "cnoreabbrev Wqa wqa"
  vim.cmd "cnoreabbrev Wa wa"
  vim.cmd "cnoreabbrev wQ wq"
  vim.cmd "cnoreabbrev WQ wq"
  vim.cmd "cnoreabbrev W w"
  vim.cmd "cnoreabbrev Q q"
  vim.cmd "cnoreabbrev Qall qall"
  vim.cmd "cnoreabbrev Qa qa"
end

local function enable_highlight_yank()
  -- highlight yank
  vim.cmd [[
  augroup highlight_yank
      autocmd!
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 800})
  augroup END
  ]]
end

local M = {}

function M.enable_treesitter_fold()
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.opt.foldlevelstart = 99
end

function M.setup()
  setup_options()
  set_abbreviations()
  enable_highlight_yank()
end

return M
