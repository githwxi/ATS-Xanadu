#!/bin/sh

set -e

echo 'building ATS-Xanadu...'
cd $XATSHOME/srcgen/xats
make all
