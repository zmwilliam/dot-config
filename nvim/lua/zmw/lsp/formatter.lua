local M = {}

local function lsp_format_on_save(client)
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_command [[augroup Format]]
  --   vim.api.nvim_command [[autocmd! * <buffer>]]
  --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })]]
  --   vim.api.nvim_command [[augroup END]]
  -- end


  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd({ "BufWritePre" },
      {
        group = vim.api.nvim_create_augroup("lsp_format_on_save", {}),
        callback = function()
          if vim.g.lsp_format_on_save then
            vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
          end
        end,
      })
  end
end

M.setup = function(client)
  lsp_format_on_save(client)
end

return M
