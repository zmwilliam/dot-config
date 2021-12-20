local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Include the servers you want to have installed by default below
local servers = {
  "elixirls",
  "sumneko_lua",
  "vimls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("[lsp-installer] Installing " .. name)
      server:install()
    end
  end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
    flags = { debounce_text_changes = 150 }
  }

  local is_custom_settings, custom_opts = pcall(require, "user.lsp.settings." .. server.name)
  if is_custom_settings then
    --print("[lsp-installer] Loading custom opts for " .. server.name)
    opts = vim.tbl_deep_extend("force", custom_opts, opts)
  end
  --if server.name == "sumneko_lua" then
  --  local sumneko_opts = require("user.lsp.settings.sumneko_lua")
  --  opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  --end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
