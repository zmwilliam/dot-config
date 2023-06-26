local M = {}

local servers = {
  "elixirls@master",
  -- "elixirls",
  "emmet_ls",
  "elmls",
  "gopls",
  "html",
  "cssls",
  "lua_ls",
  -- "tailwindcss",
  "tsserver",
  "vimls",
  -- "ltex"
}

M.setup = function(opts)
  local lsp_config = require "lspconfig"
  local mason = require "mason"
  local mason_lspconfig = require "mason-lspconfig"

  mason.setup {
    ui = {
      border = "rounded",
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗",
      },
    },
    registries = {
      "lua:zmw.lsp.registry.index",
      "github:mason-org/mason-registry",
    },
  }

  mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = false,
    handlers = {
      function(server_name)
        local is_custom_opts, custom_opts = pcall(require, "zmw.lsp.settings." .. server_name)
        local server_opts = vim.tbl_deep_extend("force", opts, is_custom_opts and custom_opts or {})

        --print("[LSP] setting up " .. server_name, "debug")
        lsp_config[server_name].setup(server_opts)
      end
    }
  }
end

return M
