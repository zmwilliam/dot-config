local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_status_ok then
  M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
else
  M.capabilities = capabilities
end

M.on_attach = function(client, bufnr)
  --TODO: move these configs to server settings
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  require("user.lsp.keymaps").setup(bufnr)

  require("user.lsp.highlight").setup(client)

  require("user.lsp.formatter").setup(client)
end

local opts = {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

M.setup = function()
  local status_ok, _ = pcall(require, "lspconfig")
  if not status_ok then
    return
  end

  require("user.lsp.handlers").setup()
  require("user.lsp.null-ls").setup(opts)
  require("user.lsp.lsp-installer").setup(opts)
end

return M
