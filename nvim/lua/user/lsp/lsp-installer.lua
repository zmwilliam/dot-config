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
  local lsp_installer = require "nvim-lsp-installer"

  -- nvim-lsp-installer must be set up before nvim-lspconfig
  lsp_installer.setup {
    ensure_installed = servers,
    automatic_installation = false,
    ui = {
      border = "rounded",
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗",
      },
    },
  }

  for _, server_name in pairs(servers) do
    local is_custom_opts, custom_opts = pcall(require, "user.lsp.settings." .. server_name)
    local server_opts = vim.tbl_deep_extend("force", opts, is_custom_opts and custom_opts or {})

    --print("[lsp-installer] setting up " .. server_name, "debug")
    lsp_config[server_name].setup(server_opts)
  end
end

return M
