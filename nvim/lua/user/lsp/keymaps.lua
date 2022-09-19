local M = {}

local whichkey = require("which-key")

M.setup = function(bufnr)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })

  local keymap_diagnostic_prev = {
    d = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "[Diagnostic] Previous" },
    e = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.ERROR})<CR>", "[Diagnostic] Previous Error" }
  }

  local keymap_diagnostic_next = {
    d = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "[Diagnostic] Next" },
    e = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.ERROR})<CR>", "[Diagnostic] Next Error" }
  }

  local keymap_goto = {
    name = "Goto",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "[LSP] Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "[LSP] Declaration" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "[LSP] Implementation" },
    h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "[LSP] Signature Help" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "[LSP] Type Definition" },
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "[LSP] References" }
  }

  local keymap_lsp = {
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
      w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
      f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },

      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      j = {
        "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
        "Next Diagnostic",
      },
      k = {
        "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
        "Prev Diagnostic",
      },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
      },
    }
  }

  whichkey.register(keymap_diagnostic_prev, { buffer = bufnr, prefix = "[" })
  whichkey.register(keymap_diagnostic_next, { buffer = bufnr, prefix = "]" })
  whichkey.register(keymap_goto, { buffer = bufnr, prefix = "g" })
  whichkey.register(keymap_lsp, { buffer = bufnr, prefix = "<leader>" })
end

return M
