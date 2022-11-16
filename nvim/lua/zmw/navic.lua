local M = {}

M.icons = require("zmw.icons")

M.config = {
  options = {
    icons = M.icons.kind,
    highlight = true,
    separator = " " .. M.icons.ui.ChevronRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = M.icons.ui.HorizDots,
  },
  filetype_exclude = {
    "alpha",
    "fugitive",
    "help",
    "Markdown",
    "noice",
    "notify",
    "NvimTree",
    "packer",
    "gitcommit",
    ""
  }
}

function M.get_winbar()
  if vim.tbl_contains(M.config.filetype_exclude, vim.bo.filetype) then
    return
  end
  local location = "%{%v:lua.require'nvim-navic'.get_location()%}"
  local value = string.format(" %s %s", M.icons.ui.Location, location)
  pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
end

function M.create_winbar()
  vim.api.nvim_create_augroup("_winbar", {})
  vim.api.nvim_create_autocmd(
    { "CursorHoldI", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
    {
      group = "_winbar",
      callback = function()
        require("zmw.navic").get_winbar()
      end
    }
  )
end

function M.setup()
  local status, navic = pcall(require, "nvim-navic")
  if not status then
    return
  end

  navic.setup(M.config.options)

  M.create_winbar()
end

function M.attach(client, bufnr)
  local status, navic = pcall(require, "nvim-navic")
  if not status then
    return
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

return M
