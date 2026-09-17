########################################################################.
##                                                                    ##.
##                         Applied Type System                        ##.
##                                                                    ##.
########################################################################.

##
## ATS/Xanadu - Unleashing the Potential of Types!
## Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
## Wed Jan  8 02:46:58 AM EST 2025
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
########################################################################.
##
## Translated by Codex
## from ./../PY/strn000.cats
##
########################################################################.
##
my #
$XATS2PL_strn_cmp =
sub {
  my ($x1, $x2) = @_;
  my $n1 = length($x1);
  my $n2 = length($x2);
  my $n0 = $n1 <= $n2 ? $n1 : $n2;
  for (my $i0 = 0; $i0 < $n0; $i0 += 1) {
    my $df = ord(substr($x1, $i0, 1)) - ord(substr($x2, $i0, 1));
    return $df if $df != 0;
  }
  return ($n1 - $n2);
}
;
##
########################################################################.
##
my #
$XATS2PL_strn_print =
sub {
  my ($cs) = @_;
  print STDOUT $cs; return;
}
;
my #
$XATS000_strn_print =
sub {
  my ($cs) = @_;
  $XATS2PL_strn_print->(cs); return;
}
;
##
########################################################################.
##
my #
$XATS2PL_strn_length =
sub {
  my ($cs) = @_;
  return length($cs);
}
;
my #
$XATS000_strn_length =
sub {
  my ($cs) = @_;
  return
  $XATS2PL_strn_length->(cs);
}
;
##
########################################################################.
##
my #
$XATS2PL_strn_get_at_raw =
sub {
  my ($cs, $i0) = @_;
  return ord(substr($cs, $i0, 1));
}
;
##
my #
$XATS000_strn_get_at_raw =
sub {
  my ($cs, $i0) = @_;
  return
  $XATS2PL_strn_get_at_raw->(cs, i0);
}
;
##
########################################################################.
##
my #
$XATS000_strn_make_fwork =
sub {
  my ($fwork) = @_;
  return
  $XATS2PL_strn_make_fwork->($fwork);
}
;
my #
$XATS2PL_strn_make_fwork =
sub {
  my ($fwork) = @_;
  my $res = "";
  $fwork->(
    sub { $res .= chr($_[0]); return; });
  return $res;
}
;
##
########################################################################.
##
my #
$XATS2PL_strn_make_env_fwork =
sub {
  my ($env, $fwork) = @_;
  my $res = "";
  $fwork->(
    $env, sub { $res .= chr($_[0]); return; });
  return $res;
}
;
my #
$XATS000_strn_make_env_fwork =
sub {
  my ($env, $fwork) = @_;
  return
  $XATS2PL_strn_make_env_fwork->($env, $fwork);
}
;
##
my #
$XATS2PL_strn_make1_env_fwork =
sub {
  my ($env, $fwork) = @_;
  my $res = "";
  $fwork->(
    $env, sub { $res .= chr($_[0]); return; });
  return $res;
}
;
my #
$XATS000_strn_make1_env_fwork =
sub {
  my ($env, $fwork) = @_;
  return
  $XATS2PL_strn_make1_env_fwork->($env, $fwork);
}
;
##
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_strn000.cats]
########################################################################.
########################################################################.
