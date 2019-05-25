#!/bin/bash

ATS2VERSION=$1
ATS2PKG=ATS2-Postiats-$ATS2VERSION
ATS2PKGTGZ=$ATS2PKG.tgz

cd $HOME
wget https://sourceforge.net/projects/ats2-lang/files/ats2-lang/ats2-postiats-$ATS2VERSION/$ATS2PKGTGZ/download

tar -xzf download

mv $ATS2PKG $HOME/ATS2

###### end of [install-ats2.sh] ######
