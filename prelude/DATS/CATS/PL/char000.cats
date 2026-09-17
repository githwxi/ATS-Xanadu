########################################################################.
##                                                                    ##.
##                         Applied Type System                        ##.
##                                                                    ##.
########################################################################.

##
## ATS/Xanadu - Unleashing the Potential of Types!
## Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
## All rights reserved
##
## ATS is free software;  you can  redistribute it and/or modify it under
## the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
## Free Software Foundation; either version 3, or (at  your  option)  any
## later version.
## 
## ATS is distributed in the hope that it will be useful, but WITHOUT ANY
## WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
## for more details.
## 
## You  should  have  received  a  copy of the GNU General Public License
## along  with  ATS;  see the  file COPYING.  If not, please write to the
## Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301, USA.
##

########################################################################.
########################################################################.
##
## Author: Hongwei Xi
## Sun Sep  6 12:08:27 AM EDT 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
########################################################################.
##
## Translated by Codex
## from ./../PY/char000.cats
##
########################################################################.
##
my
$XATS2PL_char_lt =
sub {
  my ($c1, $c2) = @_;
  return ($c1 < $c2);
}
;
##
my
$XATS2PL_char_gt =
sub {
  my ($c1, $c2) = @_;
  return ($c1 > $c2);
}
;
##
my
$XATS2PL_char_eq =
sub {
  my ($c1, $c2) = @_;
  return ($c1 == $c2);
}
;
##
my
$XATS2PL_char_lte =
sub {
  my ($c1, $c2) = @_;
  return ($c1 <= $c2);
}
;
##
my
$XATS2PL_char_gte =
sub {
  my ($c1, $c2) = @_;
  return ($c1 >= $c2);
}
;
##
my
$XATS2PL_char_neq =
sub {
  my ($c1, $c2) = @_;
  return ($c1 != $c2);
}
;
##
########################################################################.
##
my
$XATS2PL_char_add_sint =
sub {
  my ($c1, $i2) = @_;
  return (($c1 + $i2) % 256); ## char=int8
}
;
##
my
$XATS2PL_char_sub_char =
sub {
  my ($c1, $c2) = @_;
  return ($c1 - $c2);
}
;
##
my
$XATS2PL_char_make_sint =
sub {
  my ($i0) = @_; return $i0;
}
;
##
my
$XATS2PL_sint_make_char =
sub {
  my ($ch) = @_; return $ch;
}
;
##
########################################################################.
##
my
$XATS2PL_char_print =
sub {
  my ($c0) = @_;
  $XATS2PL_strn_print->(chr($c0)); return;
}
;
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/char000.cats]
########################################################################.
########################################################################.
