function HELPER_build_tex() {
    curdir=$(pwd)
    base="$(basename $1 .tex)"
    texdir="$(dirname $1)"
    filename="$base.tex"
    pdfname="$base.pdf"

    cd $texdir

    pdflatex -interaction=nonstopmode $filename
    biber $fileprefix
    pdflatex -interaction=nonstopmode $filename
    latexmk -c
    open $pdfname

    cd $curdir
}
alias tcompile=HELPER_build_tex
