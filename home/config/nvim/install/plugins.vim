if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " coc support
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " latex support
    Plug 'lervag/vimtex'

    " better editing experience
    Plug 'terryma/vim-multiple-cursors'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-obsession'

    " git/github support
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'stsewd/fzf-checkout.vim'

    " fzf support
    Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
    Plug 'junegunn/fzf.vim'
    Plug 'antoinemadec/coc-fzf'

    " tmux support
    Plug 'christoomey/vim-tmux-navigator'

    " terminal support 
    Plug 'voldikss/vim-floaterm'

    " hint support
    Plug 'liuchengxu/vim-which-key'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
