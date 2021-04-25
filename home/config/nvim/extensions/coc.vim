" Install all the coc extension
let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-conventional',
  \ 'coc-explorer',
  \ 'coc-git',
  \ 'coc-java',
  \ 'coc-java-debug',
  \ 'coc-json',
  \ 'coc-metals',
  \ 'coc-pairs',
  \ 'coc-pyright',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-tabnine',
  \ 'coc-yaml'
  \ ]

" When coc is not activating for some reason, use Ctrl+Spc to get it to trigger
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Commands for formatting, folding, and organizing imports
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Short cuts for common workflows
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Explorer
let g:coc_explorer_global_presets={
  \   '.vim': {
  \      'root-uri': '~/.config/nvim',
  \   },
  \   'cocConfig' : {
  \       'root-uri': '~/.config/
  \   }
  \   'floating': {
  \      'position': 'floating',
  \   },
  \   'floatingLeftside': {
  \      'position': 'floating',
  \      'floating-position': 'left-center',
  \      'floating-width': 50,
  \   },
  \   'floatingRightside': {
  \      'position': 'floating',
  \      'floating-position': 'left-center',
  \      'floating-width': 50,
  \   },
  \   'simplify': {
  \     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
  \   }
  \ }

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next='<Tab>'

"Recommended setting to avoid |ins-coimpletion-menu|
set shortmess+=c
