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
  boot1_xjsemit.sh)
    ${MAKE} -f Makefile_xjsemit lib2xatsopt
    ${MAKE} -C xats2js/srcgen1 -f Makefile_xjsemit lib2xatsopt
    ${MAKE} -C xats2js/srcgen1/UTIL -f Makefile_xjsemit xats2js_jsemit00
    echo "Please find: (./xats2js/srcgen1/UTIL/xats2js_jsemit00_ats3.js)!"
    exit 0
    ;;
  *)
    echo "prog: " $prog
    echo "This is a script for build_xjsemit."
    echo "The script should be symbolically named as [xats2js]."
    exit 1
    ;;
esac
#
##################################################################
#
# end of [$(XATSHOME)/xassets/bin/xats2js_node.sh]
#
##################################################################
