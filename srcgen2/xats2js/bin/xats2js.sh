#!/bin/sh

if [ ! "$XATSHOME" ] ; then
  export \
  XATSHOME=/home/hwxi/Research/ATS-Xanadu
fi # end-if

export NODE=node
export XATS2JS_OUT=\
"${XATSHOME}/srcgen2/xats2js/srcgenx/bin/xats2js.out"

if [ -f "$XATS2JS_OUT" ] ; then
  ${NODE} ${XATS2JS_OUT} "$@"
else
  # if build failed or "make cleanall" was executed
  echo "please execute `make all` to build [xats2js.out]"
fi # end-if
