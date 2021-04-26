nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \"|" autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let mapleader=" "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" b => buffer                                                                               """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bN :bprev<CR>
nnoremap <leader>bo :Buffers<CR>
nnoremap <leader>bO :enew<BAR>:Buffers<CR>
nnoremap <leader>bp :enew<BAR>:Files<CR>
nnoremap <leader>bP :enew<BAR>:Files $HOME<CR>
nnoremap <leader>bv :vsplit<BAR>:Buffers<CR>
nnoremap <leader>bh :split<BAR>:Buffers<CR>
nnoremap <leader>bd :w<BAR>:bd<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" g => git                                                                                  """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ga :w<BAR>:Git add %<CR>
nnoremap <leader>gA :wa<BAR>:Git add --all<CR>
nnoremap <leader>gc :w<BAR>:Git add %<BAR>:FloatermNew git commit<CR>
nnoremap <leader>gC :wa<BAR>:Git add --all<BAR>:FloatermNew git commit<CR>
nnoremap <leader>gl :FloatermNew git log -n 100 --color=always --graph<CR>
nnoremap <leader>gL :FloatermNew "git" "log" "-n" "100" "-p" "|" "ydiff" "-s" "-w0"<CR>
nnoremap <leader>gd :FloatermNew ydiff -s -w0 origin $(git branch --show-current)<CR>
nnoremap <leader>gD :FloatermNew ydiff -s -w0 origin/main<CR>
nnoremap <leader>gp :FloatermNew git push -u origin $(git branch --show-current)<CR>
nnoremap <leader>gl :FloatermNew git pull --rebase<CR>
nnoremap <leader>go :Git checkout<space>
nnoremap <leader>gO :FloatermNew --silent git checkout main<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" s => search                                                                               """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>sb :Branches<CR>
nnoremap <leader>sc :Commits<CR>
nnoremap <leader>st :GTags<CR>
nnoremap <leader>sf :Lines<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" x => latex                                                                                """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>xv :VimtexCompile<BAR>:VimtexView<CR>
nnoremap <leader>xx :VimtexCompile<CR>
