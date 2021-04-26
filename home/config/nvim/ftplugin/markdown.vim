setlocal ts=2
setlocal sts=2
setlocal sw=2

nnoremap <C-x> :Pandoc pdf<BAR>:FloatermNew --silent open *.pdf<CR>
nnoremap <C-v> :MarkdownPreviewToggle<CR>

let g:mkdp_auto_start=1
let g:mkdp_auto_close=1

