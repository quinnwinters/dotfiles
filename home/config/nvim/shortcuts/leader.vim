nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let mapleader=";"
let g:leader_map={}
let g:which_key_sep='-'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" TOP LEVEL SHORTCUTS                                                                       """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" leader => meta/common shortcuts                                                           """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" c => code                                                                                 """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:leader_map.c = { 
  \ 'name' : '+code',
  \ 'c' : { 'name' : '+code-comment' },
  \ 'd' : { 'name' : '+code-docker' },
  \ 'f' : { 'name' : '+code-format' },
  \ 'i' : { 'name' : '+code-ipython/jupyter' },
  \ 'j' : { 'name' : '+code-java' },
  \ 'l' : { 'name' : '+code-lua' },
  \ 'm' : { 'name' : '+code-markdown' },
  \ 'n' : { 'name' : '+code-nodejs/javascript' },
  \ 'o' : { 'name' : '+code-ocaml' },
  \ 'p' : { 'name' : '+code-c/cpp' },
  \ 's' : { 'name' : '+code-scala' },
  \ 't' : { 'name' : '+code-typescript' },
  \ 'x' : { 'name' : '+code-tex/latex' },
  \ 'y' : { 'name' : '+code-python' },
  \ 'z' : { 'name' : '+code-zsh/shell/bash' }
  \ }

" Comment commands

" Format commands

" IPython / Jupyter commands

" Java commands

" Lua commands
" @todo add lua helper commands

" Markdown commands

" Node.js / Javascript commands
" @todo add node/javascript helper commands

" OCaml  commands
" @todo add ocaml helper commands

" C/C++ commands
" @todo add C/C++ commands

" Scala commands
" @todo add scala helper commands

" Typescript commands
" @todo add zsh helper commands

" TeX/LaTeX commands 
let g:leader_map.c.x.i = 'vimtex-document-info'
let g:leader_map.c.x.o = 'vimtex-compile'
let g:leader_map.c.x.t = 'vimtex-toc-sidebar'
let g:leader_map.c.x.v = 'vimtex-open-no-compile'
nnoremap <leader>cxi :VimtexInfo<CR>
nnoremap <leader>cxo :VimtexCompile<BAR>:VimtexClean<CR>
nnoremap <leader>cxt :VimtexTocToggle<CR>
nnoremap <leader>cxv :VimtexView<CR>

" Python commands

" Zsh/shell/bash commands
" @todo add zsh helper commands 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" e => editing                                                                              """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @todo add more edit commands
"let g:leader_map.e = { 
"  \ 'name' : '+edit',
"  \ 'a' : { 'name' : '+edit-align' },
"  \ 'b' : { 'name' : '+edit-buffers' },
"  \ 'c' : { 'name' : '+edit-comment' },
"  \ 'f' : { 'name' : '+edit-find-replace' },
"  \ 'i' : { 'name' : '+edit-isolated' },
"  \ 's' : { 'name' : '+edit-snippet' },
"  \ 't' : { 'name' : '+edit-tags' },
"  \ 'w' : { 'name' : '+edit-saving' } 
"  \ }

let g:leader_map.e.b.C = 'copy-selection-new-buffer'
let g:leader_map.e.b.D = 'cut-selection-new-buffer'
let g:leader_map.e.b.G = 'open-gitgrep-new-buffer'
let g:leader_map.e.b.H = 'open-home-file-new-buffer'
let g:leader_map.e.b.N = 'prev-buffer'
let g:leader_map.e.b.O = 'open-file-new-buffer'
let g:leader_map.e.b.b = 'open-file-new-buffer'
let g:leader_map.e.b.c = 'copy-selection-split'
let g:leader_map.e.b.d = 'cut-selection-split'
let g:leader_map.e.b.g = 'open-gitgrep-split'
let g:leader_map.e.b.h = 'open-home-file-split'
let g:leader_map.e.b.l = 'select-buffers'
let g:leader_map.e.b.n = 'next-buffer'
let g:leader_map.e.b.o = 'open-project-file-split'
let g:leader_map.e.b.s = 'open-buffer-split'
nnoremap <leader>ebN :bprev<CR>
nnoremap <leader>ebO :enew<bar>:Files<CR>
nnoremap <leader>ebb :enew<bar>:Files<CR>
nnoremap <leader>ebh :vsplit<BAR>:Files $HOME<CR>
nnoremap <leader>ebl :Buffers<CR>
nnoremap <leader>ebn :bnext<CR>
nnoremap <leader>ebs :vpslit<bar>:Buffers<CR>
vnoremap <leader>eiC :copy<BAR>:enew<BAR>:paste<CR>
vnoremap <leader>eiD :delete<BAR>:enew<BAR>:paste<CR>
vnoremap <leader>eic :copy<BAR>:vsplit<BAR>:paste<CR>
vnoremap <leader>eid :delete<BAR>:vsplit<BAR>:paste<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" f => find                                                                                 """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @todo add more find commands
"let g:leader_map.f = { 
"  \ 'name' : '+find',
"  \ 'b' : { 'name' : '+find-buffers' },
"  \ 'd' : { 'name' : '+find-diagnostics' },
"  \ 'e' : { 'name' : '+find-explorer' },
"  \ 'f' : { 'name' : '+find-files' },
"  \ 'h' : { 'name' : '+find-home' },
"  \ 'o' : { 'name' : '+find-outline' },
"  \ 'z' : { 'name' : '+find-fzf' } 
"  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" g => git                                                                                  """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:leader_map.g = { 
  \ 'name' : '+git',
  \ 'a' : { 'name' : '+git-add' },
  \ 'c' : { 'name' : '+git-checkout' },
  \ 'd' : { 'name' : '+git-diff' },
  \ 'g' : { 'name' : '+git-general' },
  \ 'h' : { 'name' : '+git-github-general' },
  \ 'l' : { 'name' : '+git-log' },
  \ 's' : { 'name' : '+git-stash' } 
  \ }

" Git add commands
let g:leader_map.g.a.a = 'git-add-all'
let g:leader_map.g.a.c = 'git-add-current-file'
let g:leader_map.g.a.d = 'git-add-current-directory'
let g:leader_map.g.a.f = 'git-add-specific-file'
let g:leader_map.g.a.u = 'git-add-all-untracked'
let g:leader_map.g.a.C = 'git-add-commit-chore'
let g:leader_map.g.a.D = 'git-add-commit-docs'
let g:leader_map.g.a.F = 'git-add-commit-feat'
let g:leader_map.g.a.I = 'git-add-commit-ci'
let g:leader_map.g.a.R = 'git-add-commit-refactor'
let g:leader_map.g.a.S = 'git-add-commit-style'
let g:leader_map.g.a.T = 'git-add-commit-test'
let g:leader_map.g.a.X = 'git-add-commit-fix'
nnoremap <leader>gaa :wa<BAR>:Git add --all<CR>
nnoremap <leader>gac :w<BAR>:Git add %<CR>
nnoremap <leader>gad :wa<BAR>:Git add .<CR>
nnoremap <leader>gaf :wa<BAR>:Git add --force<SPACE>
nnoremap <leader>gau :wa<BAR>:Git add --untracked<CR>
nnoremap <leader>gaC :w<BAR>:Git add %<BAR>:FloatermNew git chore<CR>
nnoremap <leader>gaD :w<BAR>:Git add %<BAR>:FloatermNew git docs<CR>
nnoremap <leader>gaF :w<BAR>:Git add %<BAR>:FloatermNew git feat<CR>
nnoremap <leader>gaI :w<BAR>:Git add %<BAR>:FloatermNew git ci<CR>
nnoremap <leader>gaR :w<BAR>:Git add %<BAR>:FloatermNew git refactor<CR>
nnoremap <leader>gaS :w<BAR>:Git add %<BAR>:FloatermNew git style<CR>
nnoremap <leader>gaS :w<BAR>:Git add %<BAR>:FloatermNew git test<CR>
nnoremap <leader>gaX :w<BAR>:Git add %<BAR>:FloatermNew git fix<CR>

" Git checkout commands
let g:leader_map.g.c.b = 'git-checkout-new-branch'
let g:leader_map.g.c.c = 'git-checkout-commit'
let g:leader_map.g.c.d = 'git-checkout-default-branch'
let g:leader_map.g.c.t = 'git-checkout-tag'
let g:leader_map.g.c.w = 'git-checkout-workspace'
nnoremap <leader>gcb :Git checkout -b<SPACE>
nnoremap <leader>gcc :Commits<CR>
nnoremap <leader>gcd :Git checkout main<CR>
nnoremap <leader>gco :GBranches checkout<CR>
nnoremap <leader>gct :GTags checkout<CR>
nnoremap <leader>gcw :Files $HOME/Code/github.com<CR>

" Git diff commands 
let g:leader_map.g.d.c = 'git-diff-cached'
let g:leader_map.g.d.d = 'git-diff-local-default-branch'
let g:leader_map.g.d.o = 'git-diff-origin-default-branch'
let g:leader_map.g.d.u = 'git-diff-upstream-branch'
nnoremap <leader>gdc :FloatermNew --autoclose=0 ydiff -s -w0 --cached<CR>
nnoremap <leader>gdd :FloatermNew --autoclose=0 ydiff -s -w0 $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')<CR>
nnoremap <leader>gdo :FloatermNew --autoclose=0 ydiff -s -w0 origin $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')<CR>
nnoremap <leader>gdu :FloatermNew --autoclose=0 ydiff -s -w0 origin $(git branch --show-current)<CR>

" Git general commands
let g:leader_map.g.g.c = 'git-edit-gitconfig'
let g:leader_map.g.g.f = 'git-fetch-all-and-prune'
let g:leader_map.g.g.i = 'git-edit-gitignore'
let g:leader_map.g.g.l = 'git-pull-rebase'
let g:leader_map.g.g.p = 'git-push-rebase'
let g:leader_map.g.g.r = 'git-grep'
let g:leader_map.g.g.s = 'git-status'
nnoremap <leader>ggc :FloatermNew vim $HOME/.gitconfig<CR>
nnoremap <leader>ggf :FloatermNew --autoclose=0 git fetch --all --prune<CR>
nnoremap <leader>ggi :FloatermNew vim .gitignore<CR>
nnoremap <leader>ggl :FloatermNew --autoclose=0 git pull --rebase<CR>
nnoremap <leader>ggp :FloatermNew --autoclose=0 git push -u origin $(git branch --show-current)<CR>
nnoremap <leader>ggr :Ggrep<space>
nnoremap <leader>ggs :FloatermNew --autoclose=0 git status --verbose --branch<CR>

" Git github commands
let g:leader_map.g.h.c = 'git-clone-repo-native'
let g:leader_map.g.h.i = 'git-github-issue-list'
let g:leader_map.g.h.p = 'git-github-pr-list'
let g:leader_map.g.h.q = 'git-clone-repo-ghq'
let g:leader_map.g.h.r = 'git-github-release-list'
let g:leader_map.g.h.v = 'git-github-readme-view'
nnoremap <leader>ghc :FloatermNew --git clone<space>
nnoremap <leader>ghi :FloatermNew --silent gh issue list --web<CR>
nnoremap <leader>ghp :FloatermNew --silent gh pr list --web<CR>
nnoremap <leader>ghq :FloatermNew ghqq get github.com/
nnoremap <leader>ghr :FloatermNew --silent gh release view --web<CR>
nnoremap <leader>ghv :FloatermNew --silent gh repo view --web<CR>

" Git log commands 
let g:leader_map.g.l.c = 'git-log-full-commits'
let g:leader_map.g.l.C = 'git-log-chore-commits'
let g:leader_map.g.l.d = 'git-log-with-diffs'
let g:leader_map.g.l.D = 'git-log-docs-commits'
let g:leader_map.g.l.f = 'git-log-search'
let g:leader_map.g.l.F = 'git-log-feat-commits'
let g:leader_map.g.l.i = 'git-log-issues-commits'
let g:leader_map.g.l.l = 'git-log-recent-commits'
let g:leader_map.g.l.m = 'git-log-merge-commits'
let g:leader_map.g.l.R = 'git-log-refactor-commits'
let g:leader_map.g.l.S = 'git-log-style-commits'
let g:leader_map.g.l.t = 'git-log-tag-commits'
let g:leader_map.g.l.T = 'git-log-test-commits'
let g:leader_map.g.l.X = 'git-log-fix-commits'
nnoremap <leader>glc :FloatermNew git log -n 100 --color=always | fzf --ansi --no-sort -tiebreak=index<CR>
nnoremap <leader>glC :FloatermNew git log -n 100 --color=always --notes --grep=chore -p | ydiff -s -w0<CR>
nnoremap <leader>gld :FloatermNew git log -n 100 -p | ydiff -s -w0<CR>
nnoremap <leader>glD :FloatermNew git log -n 100 --color=always --notes --grep=docs -p | ydiff -s -w0<CR>
nnoremap <leader>glf :FloatermNew git log -n 100 --color=always --notes | fzf --ansi --no-sort --tiebreak=index<CR>
nnoremap <leader>glF :FloatermNew git log -n 100 --color=always --notes --grep=feat -p | ydiff -s -w0<CR>
nnoremap <leader>gli :FloatermNew git log -n 100 --color=always --notes --grep=issue --grep=Issue --grep=ISSUE -p | ydiff -s -w0<CR>
nnoremap <leader>gll :FloatermNew git log -n 100 --color=always --abbrev-commit | fzf --ansi --no-sort -tiebreak=index<CR>
nnoremap <leader>glm :FloatermNew git log -n 100 --color=always --notes --grep=merge --grep=Merge --grep=MERGE -p | ydiff -s -w0<CR>
nnoremap <leader>glR :FloatermNew git log -n 100 --color=always --notes --grep=refactor -p | ydiff -s -w0<CR>
nnoremap <leader>glS :FloatermNew git log -n 100 --color=always --notes --grep=style -p | ydiff -s -w0<CR>
nnoremap <leader>glt :FloatermNew git log -n 100 --color=always --graph | fzf --ansi --no-sort --tiebreak=index<CR>
nnoremap <leader>glT :FloatermNew git log -n 100 --color=always --notes --grep=test -p | ydiff -s -w0<CR>
nnoreamp <leader>glX :FloatermNew git log -n 100 --color=always --notes --grep=fix -p | ydiff -s -w0<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" G => github                                                                               """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @todo add github shortcuts
"let g:leader_map.G = { 
"  \ 'name' : '+git',
"  \ 'a' : { 'name' : '+github-action' },
"  \ 'c' : { 'name' : '+github-config' },
"  \ 'g' : { 'name' : '+github-gist' },
"  \ 'i' : { 'name' : '+github-issue' },
"  \ 'p' : { 'name' : '+github-pr' },
"  \ 'r' : { 'name' : '+github-release' },
"  \ 's' : { 'name' : '+github-secret' },
"  \ 'w' : { 'name' : '+github-workflow' }
"  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" p => preferences                                                                          """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @todo add preferences/settings shortcuts
"let g:leader_map.G = { 
"  \ 'name' : '+prefs',
"  \ 'a' : { 'name' : '+prefs-appearence' },
"  \ 'f' : { 'name' : '+prefs-filesystem' },
"  \ 'g' : { 'name' : '+prefs-gutter' },
"  \ 's' : { 'name' : '+prefs-spacing' },
"  \ 't' : { 'name' : '+prefs-theme' }
"  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" s => splits                                                                               """
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @todo add split shortcuts
"let g:leader_map.G = { 
"  \ 'name' : '+splits',
"  \ 'h' : { 'name' : '+splits-horizontal' },
"  \ 'm' : { 'name' : '+splits-multiplexer/tmux' },
"  \ 'p' : { 'name' : '+splits-projects' },
"  \ 's' : { 'name' : '+splits-size' },
"  \ 't' : { 'name' : '+splits-terminal' }
"  \ 'v' : { 'name' : '+splits-vertical' }
"  \ }


call which_key#register('<Space>', "g:leader_map")
