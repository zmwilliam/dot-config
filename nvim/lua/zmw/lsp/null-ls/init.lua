local M = {}

local null_ls = require("null-ls")
local null_ls_utils = require("null-ls.utils")
local b = null_ls.builtins

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  --json
  b.formatting.fixjson,

  --javascript
  b.formatting.prettierd,
  b.code_actions.eslint_d,
  b.diagnostics.eslint_d,
  b.diagnostics.tsc, --typescript

  --golang
  b.diagnostics.golangci_lint,

  --elixir
  -- with_root_file(b.diagnostics.credo, ".credo.exs"),
  -- b.formatting.mix,
  -- b.diagnostics.credo,
}

function M.setup(opts)
  -- null_ls.setup({
  --   log_level = "error", -- "off", "error", "warn", "info", "debug", "trace"
  --   debounce = 150,
  --   save_after_format = false,
  --   sources = sources,
  --   on_attach = opts.on_attach,
  --   root_dir = null_ls_utils.root_pattern ".git",
  --   default_timeout = 8000
  -- })

  null_ls.setup({
    sources = sources,
    on_attach = opts.on_attach,
    default_timeout = 8000,
    debug = false
  })
end

return M
