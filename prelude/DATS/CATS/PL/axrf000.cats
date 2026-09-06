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
## Sun Sep  6 10:51:25 AM EDT 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
########################################################################.
##
## Translated by Codex
## from ./../PY/axrf000.cats
##
########################################################################.
##
sub
XATS2PL_a0rf_lget {
  my ($A) = @_;
  return $A->[0];
}
##
sub
XATS2PL_a0rf_lset {
  my ($A, $x1) = @_;
  $A->[0] = $x1; return;
}
##
########################################################################.
##
sub
XATS2PL_a1rf_lget_at {
  my ($A, $i0) = @_;
  return ($A->[$i0]);
}
##
sub
XATS2PL_a1rf_lset_at {
  my ($A, $i0, $x1) = @_;
  $A->[$i0] = $x1; return;
}
##
########################################################################.
##
sub
XATS2PL_a0rf_make_1val {
  my ($x0) = @_; return [$x0];
}
##
sub
XATS2PL_a1rf_make_ncpy {
  my ($n0, $x0) = @_;
  my $A0 = [];
  for ## for
  (my $i0 = 0; $i0 < $n0; $i0 += 1)
  {
    push @$A0, $x0;
  }
  return $A0;
}
##
sub
XATS2PL_a1rf_make_nfun {
  my ($n0, $fopr) = @_;
  my $A0 = [];
  for
  (my $i0 = 0; $i0 < $n0; $i0 += 1) {
    push @$A0, $fopr->($i0);
  }
  return $A0;
}
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_axrf000.cats]
########################################################################.
########################################################################.
