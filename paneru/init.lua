-- Paneru Lua config migrated from aerospace/aerospace.toml.
-- Lua is used so bindings can run callbacks such as opening or focusing apps.

paneru.setup {
  options = {
    -- Keep the pointer where it is when focus changes via keyboard or cmd-tab.
    focus_follows_mouse = false,
    mouse_follows_focus = false,
    animation_speed = 20.0,
    preset_column_widths = { 0.25, 0.50, 0.60, 0.70, 0.80, 0.90, 1.00 },
    window_resize_cycle = false,

    -- Optional mouse resizing: hold alt+shift near a window edge and drag.
    -- mouse_resize_modifier = "alt + shift",
  },

  swipe = {
    deceleration = 1.0,
    sensitivity = 0.4,
    continuous = false,

    -- gesture = {
    --   fingers_count = 4,
    --   direction = "Natural",
    -- },
  },

  decorations = {
    workspace_menu_status = false,
    workspace_popup_status = false,
    active = {
      border = {
        enabled = false,
        color = "#89b4fa",
        opacity = 1.0,
        width = 1.5,
        -- radius = 10.0,
      },
    },

    -- inactive = {
    --   dim = { opacity_night = -0.08 },
    -- },
  },

  -- Matches the AeroSpace zero-gap setup.
  padding = {
    top = 5,
    bottom = 5,
    left = 5,
    right = 5,
  },

  restore = {
    -- Static window index rules are easier to reason about without restore.
    enabled = false,
  },

  bindings = {
    -- Focus: mirrors alt-h/j/k/l from AeroSpace.
    ["window focus west"] = "alt - h",
    ["window focus south"] = "alt - j",
    ["window focus north"] = "alt - k",
    ["window focus east"] = "alt - l",

    -- Move/swap with neighboring windows: mirrors alt-shift-h/j/k/l.
    ["window swap west"] = "alt + shift - h",
    -- ["window swap south"] = "alt + shift - j",
    -- ["window swap north"] = "alt + shift - k",
    ["window swap east"] = "alt + shift - l",

    -- Resize and fullscreen equivalents.
    ["window shrink"] = "alt + shift - j",
    ["window grow"] = "alt + shift - k",
    ["window fullwidth"] = "alt + shift - return",

    -- Paneru equivalents for common service-mode layout actions.
    -- ["window manage"] = "alt + shift - f",
    -- ["window stack"] = "alt + shift - comma",
    -- ["window unstack"] = "alt + shift - slash",
    ["window center"] = "alt + shift - c",
    -- ["window snap"] = "alt + shift - space",

    -- Multi-monitor helpers.
    -- ["window focus managed"] = "alt - tab",
    -- ["window nextdisplay"] = "alt + shift - tab",
  },

  windows = {
    loom = {
      title = ".*",
      bundle_id = "com.loom.desktop",
      floating = true,
    },
    wezterm = {
      -- Keep WezTerm at the start of the managed strip when it spawns.
      title = ".*",
      bundle_id = "com.github.wez.wezterm",
      index = 0,
    },
    arc = {
      -- Keep Arc immediately after WezTerm when it spawns.
      title = ".*",
      bundle_id = "company.thebrowser.Browser",
      index = 1,
    },
    ["1password"] = {
      title = ".*",
      bundle_id = "com.1password.1password",
      floating = true,
    },
    cleanshotx = {
      title = ".*",
      bundle_id = "com.getcleanshot.app-setapp",
      floating = true,
    },

    -- mosyle = {
    --   -- Paneru can float Mosyle, but cannot auto-send it to a workspace.
    --   title = ".*",
    --   bundle_id = "com.mosyle.macos.business",
    --   floating = true,
    --   dont_focus = true,
    -- },

    all = {
      title = ".*",
      horizontal_padding = 5,
      vertical_padding = 0,
      index = 100,
      -- width = 0.5,
    },
  },
}

-- macOS `open -a` launches a closed app and activates an already-running app.
local function open_or_focus(path)
  return function()
    os.execute("/usr/bin/open -a " .. string.format("%q", path) .. " >/dev/null 2>&1 &")
  end
end

paneru.bind("alt - w", open_or_focus("/Applications/Obsidian.app"))
paneru.bind("alt - t", open_or_focus("/Applications/WezTerm.app"))
paneru.bind("alt - b", open_or_focus("/Applications/Arc.app"))
paneru.bind("alt - z", open_or_focus("/Applications/zoom.us.app"))
paneru.bind("alt - s", open_or_focus("/Applications/Slack.app"))
paneru.bind("alt - d", open_or_focus("/Users/wzmiyewski/Applications/Setapp/Dash.app"))
