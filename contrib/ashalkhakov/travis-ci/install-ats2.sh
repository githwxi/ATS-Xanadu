#!/usr/bin/env sh

######################################

ATS2VER=$1
ATS2PACK=\
ATS2-Postiats-$ATS2VER
ATS2PACKTGZ=$ATS2PACK.tgz

######################################

MV=mv
TARZX="tar zx"
WGETQ="wget -q"

ATS2LANGURL_srcfg=\
https://sourceforge.net/projects/ats2-lang

######################################
#
ATS2PACKTGZURL_download=\
"\
${ATS2LANGURL_srcfg}/files\
/ats2-lang/ats2-postiats-$ATS2VER/$ATS2PACKTGZ"
#
ATS2PACKTGZURL_download=\
"\
http://ats-lang.sourceforge.net\
/IMPLEMENT/Postiats/ATS2-Postiats-gmp-$ATS2VER.tgz"
#
######################################
#
# HX-2019-06:
# ATS2PACKgmp is the default
#
# ATS2PACKint=\
# ATS2-Postiats-int-$ATS2VER
# ATS2PACKgmp=\
# ATS2-Postiats-gmp-$ATS2VER
#
######################################

( \
cd $HOME && mkdir -p ATS2 && \
$WGETQ -O- $ATS2PACKTGZURL_download | $TARZX -C ATS2 --strip 1)

######################################

###### end of [install-ats2.sh] ######
