local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local ui_icons = require("zmw.icons").ui

bufferline.setup {
  options = {
    numbers = "none",                    -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    indicator = { style = "icon", icon = ui_icons.LineLeft },
    buffer_close_icon = ui_icons.Close,
    modified_icon = ui_icons.BoldCircle,
    close_icon = ui_icons.BoldClose,
    left_trunc_marker = ui_icons.ArrowCircleLeft,
    right_trunc_marker = ui_icons.ArrowCircleRight,
    max_name_length = 30,
    max_prefix_length = 30,   -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "thin",   -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false,
    always_show_bufferline = true,
  }
}
