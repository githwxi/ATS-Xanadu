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
## Sun Sep  6 10:28:50 AM EDT 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
########################################################################.
##
## Translated
## from ./..PY/strm000.cats
##
sub XATS2PL_strm_vt_forall0_f1un {
  my ($fxs, $test) = @_;
  while (1) {
    my $cxs = XATS2PL_lazy_vt_eval($fxs);
    last if XATS2PL_strmcon_vt_nilq1($cxs);
    my $x01 = XATS2PL_strmcon_vt_head_raw1($cxs);
    if ($test->($x01)) {
      $fxs = XATS2PL_strmcon_vt_tail_raw0($cxs);
    } else {
      $fxs = XATS2PL_strmcon_vt_tail_raw0($cxs);
      XATS2PL_lazy_vt_free($fxs);
      return 0;
    }
  }
  return 1;
}
##
sub XATS2PL_strm_vt_filter0_f1un {
  my ($fxs, $test, $free) = @_;
  return XATS2PL_lazy_vt_make_f0un(sub {
    return XATS2PL_strmcon_vt_filter0_f1un(
      XATS2PL_lazy_vt_eval($fxs), $test, $free);
  });
}
##
sub XATS2PL_strmcon_vt_filter0_f1un {
  my ($cxs, $test, $free) = @_;
  while (1) {
    if ## if
    (
      XATS2PL_strmcon_vt_nilq1($cxs)
    ) { ## then
      return XATS2PL_strmcon_vt_nil();
    }
    my $x01 = XATS2PL_strmcon_vt_head_raw1($cxs);
    my $fxs = XATS2PL_strmcon_vt_tail_raw0($cxs);
    if ($test->($x01)) {
      return XATS2PL_strmcon_vt_cons(
        $x01, XATS2PL_strm_vt_filter0_f1un($fxs, $test, $free));
    } else {
      $free->($x01);
      $cxs = XATS2PL_lazy_vt_eval($fxs);
    }
  }
}
##
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/strm000.cats]
########################################################################.
