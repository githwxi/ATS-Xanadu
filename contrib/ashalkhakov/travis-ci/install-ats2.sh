#!/usr/bin/env sh

######################################

ATSVER=$1
ATSPACK=\
ATS2-Postiats-$ATSVER
ATSPACKTGZ=$ATSPACK.tgz

######################################

MV=mv
TARZX="tar zx"
WGETQ="wget -q"

ATSLANGURL_srcfg=\
https://sourceforge.net/projects/ats2-lang

######################################

ATSPACKTGZURL_download=\
"\
${ATSLANGURL_srcfg}/files\
/ats2-lang/ats2-postiats-$ATSVER/$ATSPACKTGZ"

######################################
#
# HX-2019-06:
# ATSPACKgmp is the default
#
# ATSPACKint=\
# ATS2-Postiats-int-$ATSVER
# ATSPACKgmp=\
# ATS2-Postiats-gmp-$ATSVER
#
######################################

( \
cd $HOME && \
$WGETQ -O- $ATSPACKTGZURL_download | $TARZX -C ATS2 --strip 1)

######################################

###### end of [install-ats2.sh] ######
