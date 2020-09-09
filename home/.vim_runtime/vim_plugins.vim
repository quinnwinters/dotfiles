set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

Plugin 'lervag/vimtex'

Plugin 'evandew/supertab'

Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'valloric/youcompleteme'

Plugin 'tpope/vim-surround'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'tomasr/molokai'
call vundle#end()

filetype plugin indent on
