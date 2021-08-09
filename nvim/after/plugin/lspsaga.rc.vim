if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = ' ',
  warn_sign = ' ',
  hint_sign = '',
  infor_sign = ' ',
  border_style = "round",
}
EOF

"Jump Diagnostic and Show Diagnostics
nnoremap <silent> [d :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]d :Lspsaga diagnostic_jump_prev<CR>

"Code Action
noremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

"Hover Doc
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>

" SignatureHelp
nnoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>

"lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

"Rename
nnoremap <silent>rn :Lspsaga rename<CR>
