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
