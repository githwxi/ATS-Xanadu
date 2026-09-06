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
## Sun Sep  6 01:08:28 PM EDT 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
########################################################################.
##
## Translated by Codex
## from ./../PY/strx000.cats
##
########################################################################.
sub
XATS2PL_strx_vt_forall0_f1un {
  my ($fxs, $test) = @_;
  while (1) {
    my $cxs = XATS2PL_lazy_vt_eval($fxs);
    my $x01 = XATS2PL_strxcon_vt_head_raw1($cxs);
    if ($test->($x01)) {
      $fxs = XATS2PL_strxcon_vt_tail_raw0($cxs);
    } else {
      $fxs = XATS2PL_strxcon_vt_tail_raw0($cxs);
      XATS2PL_lazy_vt_free($fxs);
      return 0;
    }
  }
  return 1;
}
##
########################################################################.
##
sub
XATS2PL_strx_vt_filter0_f1un {
  my ($fxs, $test, $free) = @_;
  return XATS2PL_lazy_vt_make_f0un(sub {
    return XATS2PL_strxcon_vt_filter0_f1un(
      XATS2PL_lazy_vt_eval($fxs), $test, $free);
  });
}
##
sub
XATS2PL_strxcon_vt_filter0_f1un {
  my ($cxs, $test, $free) = @_;
  while (1) {
    my $x01 = XATS2PL_strxcon_vt_head_raw1($cxs);
    my $fxs = XATS2PL_strxcon_vt_tail_raw0($cxs);
    if ($test->($x01)) {
      return XATS2PL_strxcon_vt_cons(
        $x01, XATS2PL_strx_vt_filter0_f1un($fxs, $test, $free));
    } else {
      $free->($x01);
      $cxs = XATS2PL_lazy_vt_eval($fxs);
    }
  }
}
##
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_strx000.cats]
########################################################################.
