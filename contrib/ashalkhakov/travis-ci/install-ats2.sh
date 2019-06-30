#!/usr/bin/env sh

######################################

ATSVER=$1
ATSPACK=\
ATS2-Postiats-$ATSVER
ATSPACKTGZ=$ATSPACK.tgz

######################################

MV=mv
WGETQ="wget -q"
TARZXF="tar zxf"

ATSLANGURL_srcfg=\
https://sourceforge.net/projects/ats2-lang

cd $HOME
$WGETQ ${ATSLANGURL_srcfg}/files/ats2-lang/ats2-postiats-$ATSVER/$ATSPACKTGZ

######################################

$TARZXF ${ATSPACKTGZ}

######################################
#
# HX-2019-06:
# ATSPACKgmp is the default
#
ATSPACKint=\
ATS2-Postiats-int-$ATSVER
ATSPACKgmp=\
ATS2-Postiats-gmp-$ATSVER
######################################
#
(${MV} -f ${ATSPACKgmp} ${HOME}/ATS2)
#
######################################

###### end of [install-ats2.sh] ######
