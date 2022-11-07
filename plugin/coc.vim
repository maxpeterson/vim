" === Coc.nvim === "

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
" *** inoremap of <CR> seems to be recursive ***
"   Use <c-cr>
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
  inoremap <silent><expr> <c-cr> coc#_select_confirm()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Run CocAction for word (under cursor)
" Choose code actions at current line.
nmap <leader>al   <Plug>(coc-codeaction-line)
" Choose code actions from selected range (word).
nmap <leader>aw   <Plug>(coc-codeaction-selected)w
" Choose code actions at cursor position.
nmap <leader>ac   <Plug>(coc-codeaction-cursor)
" Choose code actions of current file.
nmap <leader>af   <Plug>(coc-codeaction)
