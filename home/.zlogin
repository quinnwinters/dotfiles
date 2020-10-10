# Source work specific information which should be added on work computers only in the work/ folder
if [[ -d ~/.work ]] ; then
  for f in ~/.work/**/* ; do source $f ; done
fi
