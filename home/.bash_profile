# Source work specific information which should be added on work computers only in the work/ folder
if [[ -d ~/.work/sourceable ]] ; then
  for f in ~/.work/sourceable/* ; do source $f ; done
fi