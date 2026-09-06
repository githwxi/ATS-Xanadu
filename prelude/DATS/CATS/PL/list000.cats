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
## from ./..PY/char000.cats
##
sub
XATS2PL_list_vt_foritm0_f1un {
  my ($xs, $work) = @_;
  while (!XATS2PL_list_vt_nilq1($xs)) {
    my $x1 = XATS2PL_list_vt_head_raw1($xs);
    $work->($x1);
    $xs = XATS2PL_list_vt_tail_raw0($xs);
  }
  return;
}
##
sub
XATS2PL_list_vt_forall0_f1un {
  my ($xs, $test, $free) = @_;
  while (!XATS2PL_list_vt_nilq1($xs)) {
    my $x1 = XATS2PL_list_vt_head_raw1($xs);
    if ($test->($x1)) {
      $xs = XATS2PL_list_vt_tail_raw0($xs);
    } else {
      $xs = XATS2PL_list_vt_tail_raw0($xs);
      XATS2PL_list_vt_foritm0_f1un($xs, $free);
      return 0;
    }
  }
  return 1;
}
##
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_list000.cats]
########################################################################.
