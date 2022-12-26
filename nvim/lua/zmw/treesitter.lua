local M = {}

function M.setup()
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  configs.setup({
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" }
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    autopairs = {
      enable = true,
    },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = {}, -- List of parsers to ignore installing
    ensure_installed = { -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      "bash",
      "css",
      "dockerfile",
      "eex",
      "elixir",
      "elm",
      "erlang",
      "fish",
      "go",
      "heex",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "python",
      "query",
      "scss",
      "surface",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml",
      "embedded_template"
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-a>',
        node_incremental = '<c-a>',
        scope_incremental = '<c-s>',
        node_decremental = '<c-backspace>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = { query = '@parameter.outer', desc = 'a parameter' },
          ['ia'] = { query = '@parameter.inner', desc = 'inner parameter' },
          ['af'] = { query = '@function.outer', desc = 'a function' },
          ['if'] = { query = '@function.inner', desc = 'inner function' },
          ['ac'] = { query = '@class.outer', desc = 'a class' },
          ['ic'] = { query = '@class.inner', desc = 'inner class' },
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = { query = '@function.outer', desc = 'next function' },
          [']]'] = { query = '@class.outer', desc = 'next class' },
        },
        goto_next_end = {
          [']M'] = { query = '@function.outer', desc = 'next function (end)' },
          [']['] = { query = '@class.outer', desc = 'next class (end)' },
        },
        goto_previous_start = {
          ['[m'] = { query = '@function.outer', desc = 'prev function' },
          ['[['] = { query = '@class.outer', desc = 'prev class' },
        },
        goto_previous_end = {
          ['[M'] = { query = '@function.outer', desc = 'prev function (end)' },
          ['[]'] = { query = '@class.outer', desc = 'prev class (end)' },
        },
      },
    },
  })

  require("zmw.options").enable_treesitter_fold()
end

return M
