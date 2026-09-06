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
## Sun Sep  6 11:33:33 AM EDT 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
########################################################################.
##
use POSIX ();
##
########################################################################.
##
sub
XATS2PL_dflt_lt_dflt {
  my ($f1, $f2) = @_;
  return ($f1 < $f2);
}
##
sub
XATS2PL_dflt_gt_dflt {
  my ($f1, $f2) = @_;
  return ($f1 > $f2);
}
##
sub
XATS2PL_dflt_eq_dflt {
  my ($f1, $f2) = @_;
  return ($f1 == $f2);
}
##
sub
XATS2PL_dflt_lte_dflt {
  my ($f1, $f2) = @_;
  return ($f1 <= $f2);
}
##
sub
XATS2PL_dflt_gte_dflt {
  my ($f1, $f2) = @_;
  return ($f1 >= $f2);
}
##
sub
XATS2PL_dflt_neq_dflt {
  my ($f1, $f2) = @_;
  return ($f1 != $f2);
}
##
sub
XATS2PL_dflt_neg {
  my ($f1) = @_;
  return -$f1;
}
##
########################################################################.
##
sub
XATS2PL_dflt_add_dflt {
  my ($f1, $f2) = @_;
  return ($f1 + $f2);
}
##
sub
XATS2PL_dflt_sub_dflt {
  my ($f1, $f2) = @_;
  return ($f1 - $f2);
}
##
sub
XATS2PL_dflt_mul_dflt {
  my ($f1, $f2) = @_;
  return ($f1 * $f2);
}
##
sub
XATS2PL_dflt_abs {
  my ($df) = @_;
  return $df >= 0.0 ? $df : -$df;
}
##
sub
XATS2PL_dflt_sqrt {
  my ($df) = @_;
  return sqrt($df);
}
##
sub
XATS2PL_dflt_cbrt {
  my ($df) = @_;
  return POSIX::cbrt($df);
}
##
sub
XATS2PL_dflt_ceil {
  my ($df) = @_;
  return POSIX::ceil($df);
}
##
sub
XATS2PL_dflt_floor {
  my ($df) = @_;
  return POSIX::floor($df);
}
##
sub
XATS2PL_dflt_trunc {
  my ($df) = @_;
  return POSIX::trunc($df);
}
##
sub
XATS2PL_dflt_div_dflt {
  my ($f1, $f2) = @_;
  return ($f1 / $f2);
}
##
sub
XATS2PL_dflt_mod_dflt {
  my ($f1, $f2) = @_;
  ## Perl % coerces to integers;
  ## [fmod] preserves the fractional part.
  my $r = POSIX::fmod($f1, $f2);
  if ($r == 0.0) {
    $r = POSIX::copysign(0.0, $f2);
  } else {
    $r += $f2 if (($r < 0.0) != ($f2 < 0.0));
  }
  return $r;
}
##
########################################################################.
##
sub
XATS2PL_dflt_round {
  my ($df) = @_;
  my $lo = POSIX::floor($df);
  my $frac = $df - $lo;
  return $lo if $frac < 0.5;
  return $lo + 1 if $frac > 0.5;
  return POSIX::fmod($lo, 2.0) == 0.0 ? $lo : $lo + 1;
}
##
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_gflt000.cats]
########################################################################.
