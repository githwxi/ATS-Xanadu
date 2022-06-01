#!/bin/sh

set -e

echo 'running unit-tests'
(cd $XATSHOME/srcgen/UTIL/TEST && make testall)
(cd $XATSHOME/srcgen/UTIL/TEST/Posix && make testall)

echo 'running integration tests...'
(cd $XATSHOME/srcgen/TEST/. && make XATSOPT=./../xatsopt -f Makefile_test all)
