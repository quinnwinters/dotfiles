" Basic fzf settings for coc-fzf
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-o': 'vsplit',
  \ 'ctrl-s': 'split'
  \ }

" fzf doesn't show status bar in fzf window
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" Fzf over files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(
    \   <q-args>,
    \   fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}),
    \   <bang>0)

" fzf over git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}),
  \   <bang>0)
