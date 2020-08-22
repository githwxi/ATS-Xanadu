#!/bin/bash

######

set -e

######

ATS2VER=$1
ATS2PKG=\
ATS2-Postiats-$ATS2VER
ATS2PKGTGZ=$ATS2PKG.tgz

######

ATS2LANGURL_srcfg=\
https://sourceforge.net/projects/ats2-lang

######

TARZX="tar zx"
WGETQ="wget -q"

######

ATS2LANGURL_download=\
"\
${ATS2LANGURL_srcfg}/files\
/ats2-lang/ats2-postiats-$ATS2VER/$ATS2PKGTGZ"

ATS2LANGURL_download=\
"\
http://ats-lang.sourceforge.net\
/IMPLEMENT/Postiats/ATS2-Postiats-gmp-$ATS2VER.tgz"

######

ATS2HOME=$2 # =${PATS2HOME}

######
#
# HX-2019-06:
# ATS2PACKgmp is the default
#
# ATS2PACKint=\
# ATS2-Postiats-int-$ATS2VER
# ATS2PACKgmp=\
# ATS2-Postiats-gmp-$ATS2VER
#
######

( \
cd $HOME && mkdir -p $ATS2HOME &&
$WGETQ -O- $ATS2LANGURL_download | $TARZX -C $ATS2HOME --strip 1)

######

(cd $ATS2HOME && ./configure && make all)

######

###### end of [install-ats2.sh] ######
