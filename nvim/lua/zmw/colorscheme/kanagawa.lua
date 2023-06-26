local M = {}

function M.setup(variant)
  local status, kanagawa = pcall(require, 'kanagawa')
  if not status then
    return
  end

  -- Default options:
  kanagawa.setup({
    --- @usage 'wave' | 'dragon' | 'lotus'
    theme = variant or "wave",
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,        -- special highlight for the return keyword
    specialException = true,     -- special highlight for exception handling keywords
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    globalStatus = true,         -- adjust window separators highlight for laststatus=3
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = function(colors) -- add/modify highlights
      return {}
    end,
  })

  if variant == "lotus" then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end

  -- setup must be called before loading
  vim.cmd("colorscheme kanagawa")
end

return M
