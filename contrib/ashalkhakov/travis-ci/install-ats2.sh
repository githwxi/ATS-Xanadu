#!/usr/bin/env sh

######################################

ATSVER=$1
ATSPACK=\
ATS2-Postiats-$ATSVER
ATSPACKTGZ=$ATSPACK.tgz

######################################

cd $HOME
wget https://sourceforge.net/projects/ats2-lang/files/ats2-lang/ats2-postiats-$ATSVER/$ATSPACKTGZ/download

######################################

tar -xzf download

######################################

(mv -f ${ATSPACK} ${HOME}/ATS2)

###### end of [install-ats2.sh] ######
