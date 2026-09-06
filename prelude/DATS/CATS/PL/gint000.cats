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
## from ./../PY/gint000.cats
##
########################################################################.
##
sub
XATS2PL_sint_lt_sint
{
  my ($i1, $i2) = @_;
  return ($i1 < $i2);
}
##
sub
XATS2PL_sint_gt_sint
{
  my ($i1, $i2) = @_;
  return ($i1 > $i2);
}
##
sub
XATS2PL_sint_eq_sint
{
  my ($i1, $i2) = @_;
  return ($i1 == $i2);
}
##
sub
XATS2PL_sint_lte_sint
{
  my ($i1, $i2) = @_;
  return ($i1 <= $i2);
}
##
sub
XATS2PL_sint_gte_sint
{
  my ($i1, $i2) = @_;
  return ($i1 >= $i2);
}
##
sub
XATS2PL_sint_neq_sint
{
  my ($i1, $i2) = @_;
  return ($i1 != $i2);
}
##
########################################################################.
##
sub
XATS2PL_sint_neg
{
  my ($i1) = @_;
  return ( -$i1 );
}
##
########################################################################.
##
sub
XATS2PL_sint_add_sint
{
  my ($i1, $i2) = @_;
  return ($i1 + $i2);
}
##
sub
XATS2PL_sint_sub_sint
{
  my ($i1, $i2) = @_;
  return ($i1 - $i2);
}
##
sub
XATS2PL_sint_mul_sint
{
  my ($i1, $i2) = @_;
  return ($i1 * $i2);
}
##
sub
XATS2PL_sint_mod_sint
{
  my ($i1, $i2) = @_;
  return ($i1 % $i2);
}
##
sub
XATS2PL_sint_div_sint
{
  my ($i1, $i2) = @_;
  return int($i1 / $i2);
}
##
########################################################################.
##
sub
XATS2PL_sint_print {
  my ($i0) = @_;
  print STDOUT $i0; return;
}
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/gint000.cats]
########################################################################.
########################################################################.
