local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local icons = require("zmw.icons")

local formatting = {
  --fields = { "kind", "abbr", "menu" },
  fields = { "abbr", "kind", "menu" },
  kind_icons = icons.kind,
  source_names = icons.sources,
  duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 0,
    luasnip = 1,
    vsnip = 1,
  },
  duplicates_default = 0,
}

cmp.setup(
  {
    completion = {
      keyword_length = 2,
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ['<C-n>']     = cmp.mapping(
        cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        { 'i', 'c' }
      ),
      ['<C-p>']     = cmp.mapping(
        cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        { 'i', 'c' }
      ),
      ["<C-b>"]     = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"]     = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      --Gotta double tap Space due to tmux prefix also being C-Space
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<c-y>"]     = cmp.mapping(
        cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        { "i", "c" }
      ),
      ["<C-e>"]     = cmp.mapping(
        {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close()
        }
      ),
      ["<CR>"]      = cmp.mapping.confirm({ select = true }),
      ["<Tab>"]     = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end,
        { "i", "s" }
      ),
      ["<S-Tab>"]   = cmp.mapping(
        function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end,
        { "i", "s" }
      )
    },
    sources = cmp.config.sources(
      {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        {
          name = "vsnip",
          -- TODO: Remove this once https://github.com/hrsh7th/cmp-vsnip/issues/5 is fixed.
          keyword_pattern = '\\%([^[:alnum:][:blank:]]\\|\\w\\+\\)',
        },
        { name = "path" },
        {
          name = "buffer",
          option = {
            -- pull keywords from all buffers
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end
          },
        }
      }
    ),
    formatting = {
      fields = formatting.fields,
      format = function(entry, vim_item)
        local kind = vim_item.kind
        local icon = formatting.kind_icons[kind]
        local source_icon = formatting.source_names[entry.source.name]

        vim_item.kind = string.format("%s%s", icon, kind)
        vim_item.menu = source_icon
        vim_item.dup = formatting.duplicates[entry.source.name] or formatting.duplicates_default
        return vim_item
      end
    },
    experimental = {
      native_menu = false,
      ghost_text = true,
    },
  })

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    { { name = "path" } },
    { { name = "cmdline" }
    })
})
