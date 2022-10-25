local M = {}

function M.setup()
  local status, nord = pcall(require, 'nord')
  if not status then
    return
  end

  vim.g.nord_contrast = true
  vim.g.nord_borders = true
  vim.g.nord_disable_background = false
  vim.g.nord_italic = true

  --vim.cmd [[colorscheme nord]]
  nord.set()
end

return M
