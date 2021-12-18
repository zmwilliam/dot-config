" Move to previous/next
nnoremap <silent>    <S-h> :BufferPrevious<CR>
nnoremap <silent>    <S-l> :BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-q> :BufferClose<CR>
nnoremap <silent>    <leader>Q :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
" nnoremap <silent> <M-s>    :BufferPick<CR>
nnoremap <silent> <leader>bs    :BufferPick<CR>
"nnoremap <silent> <leader>bs    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <leader>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <leader>bl :BufferOrderByLanguage<CR>

"" Fix colors with nord colorscheme
" if g:colors_name == 'nord'
"   highlight BufferVisibleMod guifg=#5E81AC
"   highlight BufferInactiveMod guifg=#5E81AC
"   highlight BufferCurrentMod guifg=#88C0D0
" endif

lua << EOF
local tree ={}
tree.open = function ()
  require'bufferline.state'.set_offset(31, 'FileTree')
  require'nvim-tree'.find_file(true)
end

tree.close = function ()
  require'bufferline.state'.set_offset(0)
  require'nvim-tree'.close()
end

return tree 
EOF
