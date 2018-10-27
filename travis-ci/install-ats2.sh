#!/bin/bash


ATS2VERSION=$1
ATS2PKG=ATS2-Postiats-$ATS2VERSION
ATS2PKGTAR=$ATS2PKG.tgz

cd $HOME
wget https://sourceforge.net/projects/ats2-lang/files/ats2-lang/ats2-postiats-$ATS2VERSION/$ATS2PKGTAR/download

tar -xzf download

mv $ATS2PKG $HOME/ats2
cd $HOME/ats2
./configure
make all
