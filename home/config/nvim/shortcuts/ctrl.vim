" Mappings that match VS Code
nnoremap <silent> <C-p> :CocFzfList commands<CR>
nnoremap <silent> <C-o> :Files<CR>
nnoremap <silent> <C-`> :FloatermNew --wintype=split --height=0.2<CR>
nnoremap <silent> <C-\> :vsplit<CR>
nnoremap <silent> <C--> :split<CR>
nnoremap <silent> <C-f> :Lines<CR>
nnoremap <silent> <C-/> <plug>NERDCommenterToggle<CR>
vnoremap <silent> <C-/> <plug>NERDCommenterToggle<CR>
nnoremap <silent> <C-n> :enew<CR>
nnoremap <silent> <C-w> :w!<BAR>:bd<CR>
nnoremap <silent> <C-q> :wa!<BAR>:qa!<CR>
nnoremap <silent> <C-,> :enew<BAR>:e ~/.config/nvim<CR>
nnoremap <silent> <C-e> :FloatermNew ranger<CR>
nnoremap <silent> <C-g> :FloatermNew lazygit<CR>
nnoremap <silent> <C-s> :w!<CR>

" Commands that require additional support / are custom

" R => replace selection
vnoremap <silent> <C-r> "hy:%s/<C-r>h//gc<left><left><left> "find and replace
" B => search buffers
nnoremap <silent> <C-b> :Buffers<CR>
" I => information (diff with cached)
nnoremap <silent> <C-i> :FloatermNew ydiff -s -w0 --wrap --cached<CR>
" U => upstream (diff with origin's version of current branch)
nnoremap <silent> <C-u> :FloatermNew ydiff -s -w0 --wrap origin $(git branch --show-current)<CR>
" T => tree (log with graph)
nnoremap <silent> <C-t> :FloatermNew git log --oneline --decorate --graph --all --abbrev-commit<CR>
" = => equal sizes (equalize all split sizes)
nnoremap <silent> <C-=> <C-w>=


" Behavior that matches most other editors
nnoremap <silent> <C-[> >
nnoremap <silent> <C-]> >
inoremap <silent> <C-[> <ESC>>
inoremap <silent> <C-]> <ESC>>
vnoremap <silent> <C-[> >
vnoremap <silent> <C-]> >

nnoremap <silent> <C-a> ggVG
inoremap <silent> <C-a> <ESC>ggVG
vnoremap <silent> <C-z> <ESC>ggVG

nnoremap <silent> <C-z> :undo<CR>
inoremap <silent> <C-z> <ESC>:undo<CR>
vnoremap <silent> <C-z> <ESC>:undo<CR>

nnoremap <silent> <C-y> :redo<CR>
inoremap <silent> <C-y> <ESC>:redo<CR>
vnoremap <silent> <C-y> <ESC>:redo<CR>

nnoremap <silent> <C-1> :buffer 1<CR>
nnoremap <silent> <C-2> :buffer 2<CR>
nnoremap <silent> <C-3> :buffer 3<CR>
nnoremap <silent> <C-4> :buffer 4<CR>
nnoremap <silent> <C-5> :buffer 5<CR>
nnoremap <silent> <C-6> :buffer 6<CR>
nnoremap <silent> <C-7> :buffer 7<CR>
nnoremap <silent> <C-8> :buffer 8<CR>
nnoremap <silent> <C-9> :buffer 9<CR>

vnoremap <silent> <C-1> y<ESC>:buffer 1<CR>
vnoremap <silent> <C-2> y<ESC>:buffer 2<CR>
vnoremap <silent> <C-3> y<ESC>:buffer 3<CR>
vnoremap <silent> <C-4> y<ESC>:buffer 4<CR>
vnoremap <silent> <C-5> y<ESC>:buffer 5<CR>
vnoremap <silent> <C-6> y<ESC>:buffer 6<CR>
vnoremap <silent> <C-7> y<ESC>:buffer 7<CR>
vnoremap <silent> <C-8> y<ESC>:buffer 8<CR>
vnoremap <silent> <C-9> y<ESC>:buffer 9<CR>

nnoremap <silent> <C-0> :enew<BAR>:e $DOT_DIR<CR>

" Terminal helper commands
tnoremap <ESC><ESC> <C-\><C-n>
tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-l> <C-\><C-n><C-w>l
