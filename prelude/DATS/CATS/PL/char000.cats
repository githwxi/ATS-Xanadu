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
sub
XATS2PL_char_lt {
  my ($c1, $c2) = @_;
  return ($c1 < $c2);
}
##
sub
XATS2PL_char_gt {
  my ($c1, $c2) = @_;
  return ($c1 > $c2);
}
##
sub
XATS2PL_char_eq {
  my ($c1, $c2) = @_;
  return ($c1 == $c2);
}
##
sub
XATS2PL_char_lte {
  my ($c1, $c2) = @_;
  return ($c1 <= $c2);
}
##
sub
XATS2PL_char_gte {
  my ($c1, $c2) = @_;
  return ($c1 >= $c2);
}
##
sub
XATS2PL_char_neq {
  my ($c1, $c2) = @_;
  return ($c1 != $c2);
}
##
########################################################################.
##
sub
XATS2PL_char_add_sint {
  my ($c1, $i2) = @_;
  return (($c1 + $i2) % 256); ## char=int8
}
##
sub
XATS2PL_char_sub_char {
  my ($c1, $c2) = @_;
  return ($c1 - $c2);
}
##
sub
XATS2PL_char_make_sint {
  my ($i0) = @_; return $i0;
}
##
sub
XATS2PL_sint_make_char {
  my ($ch) = @_; return $ch;
}
##
########################################################################.
##
sub
XATS2PL_char_print {
  my ($c0) = @_;
  XATS2PL_strn_print(chr($c0)); return;
}
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/char000.cats]
########################################################################.
########################################################################.
