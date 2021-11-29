vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local formatting = {
  fields = { "abbr", "kind", "menu" },
  kind_icons = {
    Class = " ",
    Color = " ",
    Constant = "ﲀ ",
    Constructor = " ",
    Enum = "練",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = "",
    Folder = " ",
    Function = " ",
    Interface = "ﰮ ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Operator = "",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = "塞",
    Value = " ",
    Variable = " ",
  },
  source_names = {
    nvim_lsp = "(LSP)",
    emoji = "(Emoji)",
    path = "(Path)",
    calc = "(Calc)",
    cmp_tabnine = "(Tabnine)",
    vsnip = "(Snippet)",
    luasnip = "(Snippet)",
    buffer = "(Buffer)",
  },
  duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 0,
    luasnip = 1,
    vsnip = 1,
  },
  duplicates_default = 0,
}

local cmp = require "cmp"
cmp.setup(
  {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    documentation = {
      border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
    },
    mapping = {
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
      ["<C-y>"] = cmp.config.disable,
      ["<C-e>"] = cmp.mapping(
        {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close()
        }
        ),
      ["<CR>"] = cmp.mapping.confirm({select = true}),
      ["<Tab>"] = cmp.mapping(
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
        {"i", "s"}
        ),
      ["<S-Tab>"] = cmp.mapping(
        function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end,
        {"i", "s"}
        )
    },
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp"},
        {name = "vsnip"}
      },
      {
        {name = "buffer"}
      }
      ),
    formatting = {
      fields = formatting.fields,
      format = function(entry, vim_item)
        vim_item.kind = formatting.kind_icons[vim_item.kind]
        vim_item.menu = formatting.source_names[entry.source.name]
        vim_item.dup = formatting.duplicates[entry.source.name] or formatting.duplicates_default
        return vim_item
      end
    },
  })

cmp.setup.cmdline( "/", { sources = { {name = "buffer"} } })

cmp.setup.cmdline( ":",
  { 
    sources = cmp.config.sources(
      { {name = "path"} },
      { {name = "cmdline"} })
  })
