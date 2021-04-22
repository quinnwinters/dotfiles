nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let mapleader=" "
let g:leader_map={}
let g:which_key_sep='-'

" Top level helpers
let g:leader_map['?'] = ['map', 'show-keybindings']
let g:leader_map[' '] = [':CocFzfList commands', 'show-commands']
let g:leader_map['w'] = [':wa', 'save']


" buffer
"nnoremap <leader>bb :enew<CR>
"nnoremap <leader>bo :vsplit<BAR>:Files <CR>
"nnoremap <leader>bO :enew<BAR>:Files<CR>
"nnoremap <leader>bg :vsplit<BAR>:GGrep<CR>
"nnoremap <leader>bG :enew<BAR>:GGrep<CR>
"nnoremap <leader>bh :vsplit<BAR>:Files $HOME<CR>
"nnoremap <leader>bH :enew<BAR>:Files $HOME<CR>
"vnoremap <leader>bc :copy<BAR>:vsplit<BAR>:paste<CR>
"vnoremap <leader>bC :copy<BAR>:enew<BAR>:paste<CR>
"vnoremap <leader>bd :delete<BAR>:vsplit<BAR>:paste<CR>
"vnoremap <leader>bD :delete<BAR>:enew<BAR>:paste<CR>
"nnoremap <leader>bn :bnext<CR>
"nnoremap <leader>bN :bprev<CR>
let g:leader_map['b'] = {
	\ 'name' : '+buffer',
    \ 'b' : [':enew<CR>', 'buffer-new'],
    \ 'o' : [':vsplit<BAR>:Files <CR>', 'open-project-file-split'],
    \ 'O' : [':enew<BAR>:Files<CR>', 'open-project-file-new-buffer'],
    \ 'g' : [':vsplit<BAR>:GGrep<CR>', 'open-gitgrep-split'],
    \ 'G' : [':enew<BAR>:GGrep<CR>', 'open-gitgrep-new-buffer'],
    \ 'h' : [':vsplit<BAR>:Files $HOME<CR>', 'open-home-file-split'],
    \ 'H' : [':enew<BAR>:Files $HOME<CR>', 'open-home-file-new-buffer'],
    \ 'c' : [':copy<BAR>:vsplit<BAR>:paste<CR>', 'copy-selection-split'],
    \ 'C' : [':copy<BAR>:enew<BAR>:paste<CR>', 'copy-selection-new-buffer'],
    \ 'd' : [':delete<BAR>:vsplit<BAR>:paste<CR>', 'cut-selection-split'],
    \ 'D' : [':delete<BAR>:enew<BAR>:paste<CR>', 'cut-selection-new-buffer'],
    \ 'n' : [':bnext<CR>', 'next-buffer'],
    \ 'N' : [':bprev<CR>', 'prev-buffer'],
    \ 'l' : [':ls<CR>', 'list-buffers']
	\}

" CoC
"nnoremap <leader>cf <Plug>(coc-format-selected)
"vnoremap <leader>cf <Plug>(coc-format-selected)
"nnoremap <leader>ca <Plug>(coc-codeaction)
"nnoremap <leader>cx <Plug>(coc-fix-current)
"nnoremap <leader>cr <Plug>(coc-rename)
let g:leader_map['c'] = {
	\ 'name' : '+code',
	\ 'f' : ['<Plug>(coc-format-selected)', 'code-format'],
	\ 'a' : ['<Plug>(coc-codeaction)', 'code-action'],
	\ 'x' : ['<Plug>(coc-fix-current)', 'code-quickfix'],
	\ 'r' : ['<Plug>(coc-rename)', 'code-rename']
	\}


" explorer
"nnoremap <silent> <leader>ee :<C-u>CocCommand explorer<CR>
"nnoremap <silent> <leader>ed :<C-u>CocCommand explorer --preset .vim<CR>
"nnoremap <silent> <leader>ef :<C-u>CocCommand explorer --preset floating<CR>
"nnoremap <silent> <leader>ec :<C-u>CocCommand explorer --preset cocConfig<CR>
"nnoremap <silent> <leader>eb :<C-u>CocCommand explorer --preset buffer<CR>
"nnoremap <silent> <leader>el :<C-u>CocCommand explPresets
let g:leader_map['e'] = {
    \ 'name': '+explorer',
    \ 'e' : [':<C-u>CocCommand explorer<CR>', 'coc-explorer'],
    \ 'd' : [':<C-u>CocCommand explorer --preset .vim<CR>', 'coc-explorer-.vim'],
    \ 'f' : [':<C-u>CocCommand explorer --preset floating<CR>', 'coc-explorer-floating'],
    \ 'c' : [':<C-u>CocCommand explorer --preset cocConfig<CR>', 'coc-explorer-coc.config'],
    \ 'b' : [':<C-u>CocCommand explorer --preset buffer<CR>', 'coc-explorer-buffer'],
    \ 'l' : [':<C-u>CocCommand explPresets', 'coc-explorer-list-presets']
    \ }

" fzf
"nnoremap <silent> <leader>ff :<C-u>Files<CR>
"nnoremap <silent> <leader>fg :<C-u>Ggrep<CR>
"nnoremap <silent> <leader>fa :<C-u>CocFzfList diagnostics<CR>
"nnoremap <silent> <leader>fb :<C-u>CocFzfList diagnostics --current-buf<CR>
"nnoremap <silent> <leader>fc :<C-u>CocFzfList commands<CR>
"nnoremap <silent> <leader>fe :<C-u>CocFzfList extensions<CR>
"nnoremap <silent> <leader>fl :<C-u>CocFzfList location<CR>
"nnoremap <silent> <leader>fo :<C-u>CocFzfList outline<CR>
"nnoremap <silent> <leader>fs :<C-u>CocFzfList symbols<CR>
let g:leader_map['f'] = { 
    \ 'name': '+fzf',
    \ 'f' : [':<C-u>CocFzfList<CR>', 'coc-fzf-list'],
    \ 'a' : [':<C-u>CocFzfList diagnostics<CR>', 'coc-fzf-errors'],
    \ 'b' : [':<C-u>CocFzfList diagnostics --current-buf<CR>', 'coc-fzf-errors-in-file'],
    \ 'c' : [':<C-u>CocFzfList commands<CR>', 'coc-fzf-commands'],
    \ 'e' : [':<C-u>CocFzfList extensions<CR>', 'coc-fzf-extensions'],
    \ 'l' : [':<C-u>CocFzfList location<CR>', 'coc-fzf-location'],
    \ 'o' : [':<C-u>CocFzfList outline<CR>', 'coc-fzf-outline'],
    \ 's' : [':<C-u>CocFzfList symbols<CR>', 'coc-fzf-symbols'],
    \ 'p' : [':<C-u>CocFzfListResume<CR>', 'coc-fzf-list-resume']
    \ }

" git
"nnoremap <silent> <leader>gi :<C-u>CocCommand git.chunkInfo<CR>
"nnoremap <silent> <leader>ga :<C-u>CocCommand git.chunkStage<CR>
"nnoremap <silent> <leader>gu :<C-u>CocCommand git.chunkUndo<CR>
"nnoremap <silent> <leader>gd :<C-u>CocCommand git.diffCached<CR>
"nnoremap <silent> <leader>gp :<C-u>CocCommand git.push<CR>
"nnoremap <silent> <leader>gf :<C-u>CocCommand git.foldUnchanged<CR>
let g:leader_map['g'] = { 
    \ 'name': '+git',
    \ 'i' : [':<C-u>CocCommand git.chunkInfo<CR>', 'coc-git-chunk-info'],
    \ 'a' : [':<C-u>CocCommand git.chunkStage<CR>', 'coc-git-chunk-stage'],
    \ 'u' : [':<C-u>CocCommand git.chunkUndo<CR>', 'coc-git-chunk-undo'],
    \ 'd' : [':<C-u>CocCommand git.diffCached<CR>', 'coc-git-diff-cached'],
    \ 'p' : [':<C-u>CocCommand git.push<CR>', 'coc-git-push'],
    \ 'f' : [':<C-u>CocCommand git.foldUnchanged<CR>', 'coc-git-fold-unchanged']
    \ }

" tex 
"nnoremap <silent> <leader>xi :<C-u>VimtexInfo<CR>
"nnoremap <silent> <leader>xt :<C-u>VimtexTocToggle<CR>
"nnoremap <silent> <leader>xo :<C-u>VimtexCompile<BAR>:VimtexClean<CR>
"nnoremap <silent> <leader>xv :<C-u>VimtexView<CR>
let g:leader_map['x'] = { 
    \ 'name': '+tex',
    \ 'i' :  [':<C-u>VimtexInfo<CR>', 'vimtex-document-info'],
    \ 't' :  [':<C-u>VimtexTocToggle<CR>', 'vimtex-toc-sidebar'],
    \ 'o' :  [':<C-u>VimtexCompile<BAR>:VimtexClean<CR>', 'vimtex-compile'],
    \ 'v' :  [':<C-u>VimtexView<CR>', 'vimtex-open-no-compile']
    \ }

call which_key#register('<Space>', "g:leader_map")
