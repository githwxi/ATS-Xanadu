#!/bin/sh

if [ ! "$XATSHOME" ] ; then
  export \
  XATSHOME=/home/hwxi/Research/ATS-Xanadu
fi # end-if

export XATS2JS=\
"${XATSHOME}/srcgen1/xats2js/srcgenx/bin/xats2js"

if [ -f "$XATS2JS" ] ; then
  "$XATS2JS" "$@"
else
  # if build failed or "make cleanall" was executed
  echo "please execute `make all` to build [xats2js]"
fi # end-if
