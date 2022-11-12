local M = {}

local servers = {
  "elixirls",
  "emmet_ls",
  "gopls",
  "html",
  "cssls",
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "vimls",
}

M.setup = function(opts)
  local lsp_config = require "lspconfig"
  local mason = require "mason"
  local mason_lspconfig = require "mason-lspconfig"

  local mason_registry = require "mason-registry.index"
  mason_registry["elixir-ls"] = "zmw.lsp.registry.elixir-ls"

  mason.setup {
    ui = {
      border = "rounded",
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗",
      },
    },
  }

  mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = false,
  }

  for _, server_name in pairs(servers) do
    local is_custom_opts, custom_opts = pcall(require, "zmw.lsp.settings." .. server_name)
    local server_opts = vim.tbl_deep_extend("force", opts, is_custom_opts and custom_opts or {})

    --print("[LSP] setting up " .. server_name, "debug")
    lsp_config[server_name].setup(server_opts)
  end
end

return M
