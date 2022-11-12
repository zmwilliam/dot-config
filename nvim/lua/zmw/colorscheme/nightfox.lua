local M = {}

function M.setup(style)
  local status, nightfox = pcall(require, 'nightfox')
  if not status then
    return
  end

  nightfox.setup({
    options = {
      styles = {
        comments = "italic", -- change style of comments to be italic
        keywords = "bold", -- change style of keywords to be bold
        functions = "italic,bold" -- styles can be a comma separated list
      },
      inverse = {
        match_paren = false, -- inverse the highlighting of match_parens
        visual = false,
        search = false,
      },
      transparent = false, -- Disable setting background
      dim_inactive = false, -- Non focused panes set to alternative background
    }
  })

  -- dark styles: nightfox, duskfox, nordfox, terafox, carbonfox
  vim.cmd("colorscheme " .. (style or "nightfox"))
end

return M
