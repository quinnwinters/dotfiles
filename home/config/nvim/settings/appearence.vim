" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode


" Configure airline viewing preferences
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Integrate Airline with vim-obsession
function! AirlineInit()
    let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
