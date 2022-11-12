local M = {}

local function lsp_format_on_save(client)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })]]
    vim.api.nvim_command [[augroup END]]
  end
end

M.setup = function(client)
  lsp_format_on_save(client)
end

return M
