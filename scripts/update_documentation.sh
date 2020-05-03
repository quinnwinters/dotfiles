#!/bin/bash

DOCS=$(find $DOT_DIR/* -name _desc.md -type f)
README=$DOT_DIR/docs/README.md
for docfile in $DOCS ; do 
    cat $README $docfile > $README 
done