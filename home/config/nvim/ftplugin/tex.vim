setlocal ts=2
setlocal sts=2
setlocal sw=2
setlocal synmaxcol=150

set conceallevel=1
let g:tex_conceal='abdmg'

nnoremap <silent> <C-v> <Plug>(vimtex-view)<CR>
nnoremap <silent> <C-x> <Plug>(vimtex-compile)<CR>
nnoremap <silent> <C-;> <Plug>(vimtex-toc-toggle)<CR>

