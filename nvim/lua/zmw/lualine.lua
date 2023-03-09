local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require("zmw.icons")

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = {
    error = icons.diagnostic.Error .. " ",
    warn = icons.diagnostic.Warn .. " ",
    info = icons.diagnostic.Info .. " ",
    hint = icons.diagnostic.Hint .. " ",
  },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = {
    added = icons.git.Added .. " ",
    modified = icons.git.Modified .. " ",
    removed = icons.git.Removed .. " ",
  },
  cond = hide_in_width
}

local mode = { "mode" }

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = icons.git.Branch
}

local location = {
  "location",
  padding = 0,
}

local filename = {
  "filename",
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 1, -- 0: Just the filename 1: Relative path 2: Absolute path
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", "__" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return icons.ui.Tab .. " " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local session = require("zmw.session").session_name

lualine.setup({
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = icons.ui.LineCenter,
    section_separators = {
      left = icons.ui.SeparatorRoundedLeft,
      right = icons.ui.SeparatorRoundedRight
    },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { branch, diagnostics },
    lualine_b = { mode },
    lualine_c = { filename },
    lualine_x = { diff, spaces, "encoding", filetype, session },
    lualine_y = { location },
    lualine_z = { progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { 'fugitive' },
})
