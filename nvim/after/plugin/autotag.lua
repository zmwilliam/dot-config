local filetypes = {
  'html', 
  'javascript', 
  'javascriptreact',
  'typescriptreact',
  'svelte',
  'vue',
  'heex',
  'leex',
  'eex',
  'eelixir'
}
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
    filetypes = filetypes,
  }
}
-- require('nvim-ts-autotag').setup({
--   filetypes = filetypes,
-- })
