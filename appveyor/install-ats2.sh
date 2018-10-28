#!/bin/bash
set -e

ATS2VERSION=$1
ATS2PKG=ATS2-Postiats-$ATS2VERSION
ATS2PKGTGZ=$ATS2PKG.tgz
ATS2HOME=$2 #${PATSHOME:-$2}
ATS2URL="https://sourceforge.net/projects/ats2-lang/files/ats2-lang/ats2-postiats-$ATS2VERSION/$ATS2PKGTGZ/download"

mkdir -p $ATS2HOME
cd $ATS2HOME
wget -qO- $ATS2URL | tar xz -C $ATS2HOME --strip 1

./configure
make all

###### end of [install-ats2.sh] ######
