let maplocalleader=";"
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \"|" autocmd BufLeave <buffer> set laststatus=2 showmode ruler

nnoremap <silent> <localleader>f :w<BAR>Git add %<BAR>FloatermNew git feat<CR>
nnoremap <silent> <localleader>F :wa<BAR>Git add --all<BAR>FloatermNew git feat<CR>
nnoremap <silent> <localleader>x :w<BAR>Git add %<BAR>FloatermNew git fix<CR>
nnoremap <silent> <localleader>X :wa<BAR>Git add --all<BAR>FloatermNew git fix<CR>
nnoremap <silent> <localleader>c :w<BAR>Git add %<BAR>FloatermNew git chore<CR>
nnoremap <silent> <localleader>C :wa<BAR>Git add --all<BAR>FloatermNew git chore<CR>
nnoremap <silent> <localleader>r :w<BAR>Git add %<BAR>FloatermNew git refactor<CR>
nnoremap <silent> <localleader>R :wa<BAR>Git add --all<BAR>FloatermNew git refactor<CR>
nnoremap <silent> <localleader>s :w<BAR>Git add %<BAR>FloatermNew git style<CR>
nnoremap <silent> <localleader>S :wa<BAR>Git add --all<BAR>FloatermNew git style<CR>
nnoremap <silent> <localleader>i :w<BAR>Git add %<BAR>FloatermNew git ci<CR>
nnoremap <silent> <localleader>I :wa<BAR>Git add --all<BAR>FloatermNew git ci<CR>
nnoremap <silent> <localleader>d :w<BAR>Git add %<BAR>FloatermNew git docs<CR>
nnoremap <silent> <localleader>D :wa<BAR>Git add --all<BAR>FloatermNew git docs<CR>
nnoremap <silent> <localleader>l FloatermNew git pull --rebase<CR>
nnoremap <silent> <localleader>L FloatermNew git add . && git stash && git pull --rebase && git stash pop<CR>
nnoremap <silent> <localleader>p FloatermNew git push -u origin $(git branch --show-current)<CR>
nnoremap <silent> <localleader>P FloatermNew git push --force -u origin $(git branch --show-current)<CR>
nnoremap <silent> <localleader>t GTags<CR>
nnoremap <silent> <localleader>T FloatermNew --autoclose=0 git tag --list --verbose --color=always<CR>
nnoremap <silent> <localleader>b Branches<CR>
nnoremap <silent> <localleader>B FloatermNew --autoclose=0 git branch --list --verbose --color=always<CR>
nnoremap <silent> <localleader>a w<BAR>:Git add%<CR>
nnoremap <silent> <localleader>A wa<BAR>:Git add --all<CR>
