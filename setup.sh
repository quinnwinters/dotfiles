#!/bin/sh 
export DOT_DIR="$(pwd)"


# ========================================================= #
# |     RUN ONE TIME SCRIPTS                              | #
# ========================================================= #
if [[ $* == *--fresh-install* ]] ; then 
    for script in ./scripts/fresh-install/* ; do sh $script ; done
fi


# ========================================================= #
# |     SETUP HOME CONFIGS                                | #
# ========================================================= #
ln $DOT_DIR/home/bashrc $HOME/.bashrc
ln $DOT_DIR/home/brewfile $HOME/.brewfile
ln $DOT_DIR/home/editorconfig $HOME/.editorconfig
ln $DOT_DIR/home/ghqrepos $HOME/.ghqrepos
ln $DOT_DIR/home/gitconfig $HOME/.gitconfig
ln $DOT_DIR/home/gitignore $HOME/.gitignore
ln $DOT_DIR/home/ssh/config $HOME/.ssh/config
ln $DOT_DIR/home/tmux.cfg $HOME/.tmux.cfg
ln $DOT_DIR/home/vimrc $HOME/.vimrc
ln $DOT_DIR/home/zlogin $HOME/.zlogin
ln $DOT_DIR/home/zshrc $HOME/.zshrc

# ========================================================= #
# |     INSTALL REQUIRED TOOLS                            | #
# ========================================================= #
if [[ ! $* == *--skip-brew* ]] ; then 
    brew update 
    brew upgrade
    brew-file install -f ./home/brewfile
    brew cleanup
fi 

# ========================================================= #
# |     RUN REGULAR SCRIPTS                               | #
# ========================================================= #
if [[ ! $* == *--skip-scripts* ]] ; then 
    for script in ./scripts/refreshable/* ; do sh $script ; done 
fi 
