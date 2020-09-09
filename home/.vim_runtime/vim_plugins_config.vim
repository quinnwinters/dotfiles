""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VIM PLUGIN CONFIGIRUATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERD Tree Configuration
"   Show a file tree on command to make navigation easier. 
"   Key changes:
"       - Show NERD Tree by default 
"       - Use <leader>nn to toggle NERD Tree
"       - Use <leader>o to search for files with NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

" Git gutter settings
"   Show git diff information in the bar next to line numbers for active edits.
let g:gitgutter_enabled=1
nnoremap <silent> <leader>d :GitGutterToggle<cr>

" Airline settings
"   Show a status bar at the bottom which includes more detailed information 
"   about the file you're editing
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='molokai'
let g:molokai_original=1

" Configure YouCompleteMe completitions with Supertab
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabeDefaultCompletionType ='<C-n>'

" YouCompleteMe other setttings
let g:ycm_filepath_blacklist = {'html': 1, 'jsx': 1, 'xml': 1, 'tex': 1}
" Configure UltiSnips with Supertab
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" UltiSnips other settings
let g:UltiSnipsSnippetsDir = "~/.vim_snippets"

" Vimtex and Vim Snippets for LaTeX
let g:tex_flavor='latex'
let g:vimtex_view_mode='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


