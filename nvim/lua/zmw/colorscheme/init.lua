local themes = {
  { theme = "nord",       style = "default" },
  { theme = "kanagawa",   style = "wave" },
  { theme = "kanagawa",   style = "dragon" },
  { theme = "kanagawa",   style = "lotus" },

  { theme = "rose-pine",  style = "moon" },
  { theme = "rose-pine",  style = "dawn" },

  { theme = "tokyonight", style = "storm" },
  { theme = "tokyonight", style = "moon" },
  { theme = "tokyonight", style = "night" },
  { theme = "tokyonight", style = "day" },

  { theme = "nightfox",   style = "duskfox" },
  { theme = "nightfox",   style = "nightfox" },
  { theme = "nightfox",   style = "nordfox" },
  { theme = "nightfox",   style = "dayfox" },
  { theme = "nightfox",   style = "dawnfox" },
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

local colorscheme_from_args = function(args)
  if args == "" or args == "random -> any" then
    return pick_random_theme()
  else
    local theme_style = vim.split(args, " -> ", { plain = true })
    return theme_style[1], theme_style[2]
  end
end

local M = {}

function M.setup()
  -- local theme, style = pick_random_theme()
  local theme, style = "kanagawa", "dragon"
  require("zmw.colorscheme." .. theme).setup(style)

  vim.api.nvim_create_user_command(
    'ColorMeGood',
    function(opts)
      local t, s = colorscheme_from_args(opts.args)
      require("zmw.colorscheme." .. t).setup(s)
      vim.notify(string.format("Set colorscheme %s -> %s", t, s))
    end,
    {
      nargs = "?",
      complete = function(ArgLead, CmdLine, CursorPos)
        local t = vim.tbl_map(function(v)
          return v["theme"] .. " -> " .. v["style"]
        end, themes)

        table.insert(t, 1, "random -> any")
        -- table.insert(t, 2, "random -> dark")
        -- table.insert(t, 3, "random -> light")

        return t
      end,
    }
  )
end

return M
