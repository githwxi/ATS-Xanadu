#!/bin/sh

set -e

echo 'running unit-tests'
(cd $XATSHOME/srcgenx/UTIL/TEST && make testall)
(cd $XATSHOME/srcgenx/UTIL/TEST/Posix && make testall)

echo 'running integration tests...'
(cd $XATSHOME/srcgenx/TEST/ && make XATSOPT=$XATSHOME/bin/xatsopt -f Makefile_test all)
