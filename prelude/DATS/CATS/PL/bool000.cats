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
## ATS is free software; you can redistribute it and/or modify it under
## the terms of the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
## Free Software Foundation; either version 3, or (at your option) any
## later version.
##
## ATS is distributed in the hope that it will be useful, but WITHOUT ANY
## WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
## for more details.
##
## You should have received a copy of the GNU General Public License
## along with ATS; see the file COPYING. If not, please write to the
## Free Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301, USA.
##

########################################################################.
########################################################################.
##
## Author: Hongwei Xi
## Sun Jun 28 11:49:14 AM EDT 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
########################################################################.
##
## HX-2026-06-28:
## This one is translate by ChatGPT from
## [PY/bool000.cats] and then edited by me!
##
########################################################################.
##
sub XATS2PL_bool_lt {
  my ($b1, $b2) = @_;
  return ($b1 < $b2); ## HX: lt
}
sub XATS2PL_bool_gt {
  my ($b1, $b2) = @_;
  return ($b1 > $b2); ## HX: gt
}
sub XATS2PL_bool_eq {
  my ($b1, $b2) = @_;
  return ($b1 == $b2); ## HX: eq
}
##
sub XATS2PL_bool_lte {
  my ($b1, $b2) = @_;
  return ($b1 <= $b2); ## HX: lte
}
sub XATS2PL_bool_gte {
  my ($b1, $b2) = @_;
  return ($b1 >= $b2); ## HX: gte
}
sub XATS2PL_bool_neq {
  my ($b1, $b2) = @_;
  return ($b1 != $b2); ## HX: neq
}
##
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_bool000.cats]
########################################################################.
########################################################################.
