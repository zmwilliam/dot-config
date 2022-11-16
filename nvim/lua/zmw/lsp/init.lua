local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_status_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities()
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

  require("zmw.lsp.keymaps").setup(bufnr)

  require("zmw.lsp.highlight").setup(client)

  require("zmw.lsp.formatter").setup(client)

  require("zmw.navic").attach(client, bufnr)
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

  require("zmw.lsp.handlers").setup()
  require("zmw.lsp.null-ls").setup(opts)
  require("zmw.lsp.mason-lspconfig").setup(opts)
end

-- Debug logs, :LspLog to view
--vim.lsp.set_log_level("debug")

return M
