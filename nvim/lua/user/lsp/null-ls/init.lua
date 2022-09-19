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
  --lua
  -- b.formatting.stylua,
  -- with_root_file(b.diagnostics.selene, "selene.toml"),

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
  b.diagnostics.credo,
}

function M.setup(opts)
  null_ls.setup({
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = null_ls_utils.root_pattern ".git",
  })
end

return M
