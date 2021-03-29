## dotfiles

MacOS dotfiles with a bias towards using the iTerm+Clis for as many things as possible. Feel free to
fork and modify to your heart's content! 

### Folder structure

* backups - backed up version of iTerm profiles and Karabiner shortcuts
* home - dotfiles for all configurable software
* keyboards - firmware configuration for mechanical keyboards I use (ergodox and atreus62)
* scripts - installation scripts
    * environment - one time setup scripts to install tools and setup environment variables
    * install - install brew formulae, github repos, node clis, and vim plugins
    * preferences - configure mac preferences and dock 
* snippets - UltiSnips-style completion snippet for TeX/BibTex, Markdown, Json, and Python
* templates - templates used by install scripts for bashrc/bash_profile

### Features

Here are just a few of the features in the dotfiles (and these may change over time). If you want to
add anything please feel free to fork/pr!

#### Shell
* zsh through oh-my-zsh with compleition and nice aliases
* helpful functions for navigation and fuzzy finding
* aliases for piping to grep, head, tail, sort, and pbcopy 
* tmux aliases and iterm profiles that start in a tmux session
* todo.txt cli support that integrates with my todo.txt-actions
* ranger and gtop to replace finder and activity monitor
* conda for python environments

#### Git
* ghq for managing repos centerally under `~/Code`
* gh to execute a ghq command and then update the ghqrepos file
* gitconfig aliases for pretty logging and cleaning up branhes
* gitconfig aliases for semantic commit messages (e.g. `git feat "new feature"`)
* github over ssh by default along with script to help you set it up in the beginning

#### Vim
* neovim as the primary editor along with coc as a completion engine
* custom conda environment just for neovim and neovim's packages
* vim/tmux navigation fixes so that everything works with <C-hjkl>
* thorough set of leader shortcuts and vim_which_key mappings to help for forgetful people 
* unified whitespace and editing preferences with editorconfig
* floaterm for in vim terminal access 
* integrated virtual repl to see the result of code inline 
* snippets for python, markdown, and json
* especially thorough snippets for LaTeX to enable live TeXing lectures and conference presentations (and vimtex to add compile shortcuts)
 
#### MacOS
* karabiner-based vim shortcut mapping CapLock+hjkl => arrow keys
* keyboard shortcuts for launching iTerm including special profiles for ranger, todo.txt, and editing coding projects
* minimal mac dock by default
* better internationalized defaults for units, date format, keyboards etc
* screenshots automatically saved as png to special screenshots folder
* mackup to save preferences for applications to your backup engine of choice
* vim-like atreus and ergodox mappings including nice window movement

* better default applications for e.g. iterm instead of terminal, vlc instead of quicktime, and brave browser instead of safari
