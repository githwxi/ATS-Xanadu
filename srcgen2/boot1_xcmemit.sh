#!/bin/sh
##################################################################
MAKE="make"
##################################################################
prog=`basename $0`
##################################################################
#
if [ ! "$XATSHOME" ] ; then
  echo "XATSHOME should have been defined!"; exit 1
fi
#
##################################################################
#
if [ ! -d "$XATSHOME" ] ; then
  echo "XATSHOME should have been available at '${XATSHOME}'";
  exit 1
fi
#
##################################################################
#
case $prog in
  boot1_xcmemit.sh)
    ${MAKE} -f Makefile_xcmemit lib2xatsopt
    ${MAKE} -C xats2cm/srcgen1 -f Makefile_xcmemit lib2xats2cm
    ${MAKE} -C xats2cm/srcgen1/UTIL -f Makefile_xcmemit xats2cm_cmemit00
    ${MAKE} -C xats2cm/srcgen1/UTIL -f Makefile_xcmemit xats2cm_cmemit01
    echo "Please find: (./xats2cm/srcgen1/UTIL/xats2cm_cmemit00_ats3.cm)!"
    exit 0
    ;;
  *)
    echo "prog: " $prog
    echo "This is a script for build_xcmemit."
    echo "The script should be symbolically named as [boot1_xcmemit.sh]."
    exit 1
    ;;
esac
#
##################################################################
#
# end of [ATS-Xanadu/srcgen2/boot1_xcmemit.sh]
#
##################################################################
