" @todo change compiler method to tectonic
let g:vimtex_compiler_method='latexmk'

let g:tex_flavor='latex'
let g:vimtex_view_method='general'

let g:vimtex_mappings_enabled=0

set conceallevel=1
let g:tex_conceal='abdmg'

let g:vimtex_syntax_conceal_cites = {
    \ 'type': 'brakets',
    \ }

let g:vimtex_toc_todo_labels = {'@todo': 'TODO: '}

let g:vimtex_indent_lists = ['thebibliography']
