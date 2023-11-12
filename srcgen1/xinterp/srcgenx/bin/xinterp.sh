#!/bin/sh

if [ ! "$XATSHOME" ] ; then
  export \
  XATSHOME=/home/hwxi/Research/ATS-Xanadu
fi # end-if

export XINTERP=\
"${XATSHOME}/srcgen1/xinterp/srcgenx/bin/xinterp"

if [ -f "$XINTERP" ] ; then
  "$XINTERP" "$@"
else
  # if build failed or "make cleanall" was executed
  echo "please execute `make all` to build [xinterp]"
fi # end-if
