local M = {}

function M.setup()
  local icons = require("zmw.icons").diagnostic
  local signs = {
    { name = "DiagnosticSignError", text = icons.Error },
    { name = "DiagnosticSignWarn", text = icons.Warn },
    { name = "DiagnosticSignHint", text = icons.Hint },
    { name = "DiagnosticSignInfo", text = icons.Info },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    --virtual_text = false,
    virtual_text = {
      spacing = 4,
      prefix = "●",
      severity = vim.diagnostic.severity.ERROR
    },
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  -- Borders
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)

  require('lspconfig.ui.windows').default_options.border = "rounded"
end

return M
