local status, kanagawa = pcall(require, 'kanagawa')
if not status then
  return
end

-- Default options:
kanagawa.setup({
  undercurl = true,           -- enable undercurls
  commentStyle = "italic",
  functionStyle = "NONE",
  keywordStyle = "italic",
  statementStyle = "bold",
  typeStyle = "NONE",
  variablebuiltinStyle = "italic",
  specialReturn = true,       -- special highlight for the return keyword
  specialException = true,    -- special highlight for exception handling keywords
  transparent = false,        -- do not set background color
  colors = {},
  overrides = {},
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
