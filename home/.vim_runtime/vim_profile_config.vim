""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VIM PROFILE & STANDARD CONFIGIRUATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader and keymaps
"   Use ; as the leader key because it's easy and you don't have to move hands
"   off the standard key map. Also include quick leader accessible ways to do 
"   common workflows such as
"       - save the current file (w) 
"       - save and close the current file
"       - quit without saving
"       - split horizontal/vertical panes
let mapleader = ";"
nmap <leader>w :w!<cr>
nmap <leader>wq :wqa!<cr>
nmap <leader>s :vsplit<cr>
nmap <leader>v :split<cr>
nmap <leader>q :close<cr>


" Navigation shortcuts
"   Use C+key to navigate vim more efficiently 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Some nice editing shortcuts
noremap Y y$
nnoremap U <C-r>

" File read behaviors
"   Make vim behave more like other text editors by auto-reloading edits, 
"   not backing up or creating swap files when editing. Note this comest with 
"   minor risks. 
set autoread
set nobackup
set noswapfile

" Text apperence settings
"   Include line numbers, 100-char column, and setup nice viewing options
set number
set colorcolumn=100
set showmatch 
set scrolloff=5
set showmatch
set ruler

" Text editing settings
"   Always prefer spaces and do it smartly. Also don't force new line wraps
set expandtab 
set smartindent
set nowrap   

" Search settings
"   Always highlight searches and by default igore case
set hlsearch
set ignorecase
set incsearch

" In visual mode * or # searches your current selection
vnoremap <silent> <leader>* :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> <leader># :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do nice things with triming extra spaces
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
