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
## from ./../PY/axsz000.cats
##
########################################################################.
##
my
$XATS2PL_a1sz_length =
sub {
  my ($A0) = @_;
  return scalar @$A0;
}
;
##
########################################################################.
##
my
$XATS2PL_a1sz_lget_at =
sub {
  my ($A, $i0) = @_;
  return $A->[$i0];
}
;
##
my
$XATS2PL_a1sz_lset_at =
sub {
  my ($A, $i0, $x1) = @_;
  $A->[$i0] = $x1; return;
}
;
##
########################################################################.
##
my
$XATS2PL_a1sz_make_ncpy =
sub {
  my ($n0, $x0) = @_;
  my $A0 = [];
  for (my $i0 = 0; $i0 < $n0; $i0 += 1) {
    push @$A0, $x0;
  }
  return $A0;
}
;
##
my
$XATS2PL_a1sz_make_nfun =
sub {
  my ($n0, $fopr) = @_;
  my $A0 = [];
  for (my $i0 = 0; $i0 < $n0; $i0 += 1) {
    push @$A0, $fopr->($i0);
  }
  return $A0;
}
;
##
########################################################################.
##
my
$XATS2PL_a1sz_make_fwork =
sub {
  my ($fwork) = @_;
  my $A0 = [];
  $fwork->(sub { push @$A0, $_[0]; return; });
  return $A0;
}
;
##
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_axsz000.cats]
########################################################################.
########################################################################.
