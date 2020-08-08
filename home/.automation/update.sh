brew update
brew upgrade
conda env list --json\
    | grep miniconda\
    | tr -d '",'\
    | xargs -n1 conda update --update-all --prefix
