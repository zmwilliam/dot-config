local themes = {
  "kanagawa",
  "nord",
  { theme = "rose-pine", style = "moon" },
  { theme = "tokyonight", style = "storm" },
  { theme = "tokyonight", style = "moon" },
  { theme = "nightfox", style = "duskfox" },
  { theme = "nightfox", style = "nightfox" },
  { theme = "nightfox", style = "nordfox" },
}

local random_number = function(limit)
  return ((os.time() % limit) + 1)
end

local pick_random_theme = function()
  local random_theme = themes[random_number(#themes)]

  if type(random_theme) == "table" then
    return random_theme["theme"], random_theme["style"]
  else
    return random_theme
  end
end

local M = {}

function M.setup()
  --local theme, style = pick_random_theme()
  local theme, style = "tokyonight", "storm"
  require("user.colorscheme." .. theme).setup(style)
end

return M
