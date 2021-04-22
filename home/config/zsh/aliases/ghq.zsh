function HELPER_ghq_and_update_ghqfile() {
    ghq $@
    { ghq list ; cat $DOT_DIR/home/ghqrepos } | sort | uniq -u > $DOT_DIR/home/ghqrepos
}
alias gh=HELPER_ghq_and_update_ghqfile
