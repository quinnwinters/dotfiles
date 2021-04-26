source ~/.vimrc

" Install all the plugins
source ~/.config/nvim/install/plugins.vim

" Load actual neovim specific settings (based on plugins)
source ~/.config/nvim/settings/appearence.vim
source ~/.config/nvim/settings/environment.vim
source ~/.config/nvim/settings/functions.vim

" Load plugin specific configurations
source ~/.config/nvim/extensions/coc.vim
source ~/.config/nvim/extensions/floaterm.vim
source ~/.config/nvim/extensions/fzf.vim
source ~/.config/nvim/extensions/vimtex.vim

" Load shortcuts for leader, localleader, and <C-*>
source ~/.config/nvim/shortcuts/ctrl.vim
source ~/.config/nvim/shortcuts/leader.vim
source ~/.config/nvim/shortcuts/localleader.vim
