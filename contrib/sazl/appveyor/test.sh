#!/bin/sh

set -e

echo 'running unit-tests'
cd $XATSHOME/srcgen/util/TEST
make testall

echo 'running integration tests...'
cd $XATSHOME/srcgen/xats/TEST
make XATSOPT=./../xatsopt testall
