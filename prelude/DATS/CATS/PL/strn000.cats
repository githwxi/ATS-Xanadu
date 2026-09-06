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
sub
XATS2PL_strn_cmp {
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
##
########################################################################.
##
sub
XATS2PL_strn_print {
  my ($cs) = @_;
  print STDOUT $cs; return;
}
sub
XATS000_strn_print {
  return XATS2PL_strn_print(@_);
}
##
########################################################################.
##
sub
XATS2PL_strn_length {
  my ($cs) = @_;
  return length($cs);
}
sub
XATS000_strn_length {
  return XATS2PL_strn_length(@_);
}
##
########################################################################.
##
sub
XATS2PL_strn_get_at_raw {
  my ($cs, $i0) = @_;
  return ord(substr($cs, $i0, 1));
}
##
##
sub XATS000_strn_get_at_raw {
  return XATS2PL_strn_get_at_raw(@_);
}
##
########################################################################.
##
sub
XATS000_strn_make_fwork {
  return XATS2PL_strn_make_fwork(@_);
}
##
sub
XATS000_strn_make_env_fwork {
  return XATS2PL_strn_make_env_fwork(@_);
}
##
sub
XATS000_strn_make1_env_fwork {
  return XATS2PL_strn_make1_env_fwork(@_);
}
##
########################################################################.
##
sub XATS2PL_strn_make_fwork {
  my ($fwork) = @_;
  my $res = "";
  $fwork->(sub { $res .= chr($_[0]); return; });
  return $res;
}
##
##
sub XATS2PL_strn_make_env_fwork {
  my ($env, $fwork) = @_;
  my $res = "";
  $fwork->($env, sub { $res .= chr($_[0]); return; });
  return $res;
}
##
sub XATS2PL_strn_make1_env_fwork {
  my ($env, $fwork) = @_;
  my $res = "";
  $fwork->($env, sub { $res .= chr($_[0]); return; });
  return $res;
}
##
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_strn000.cats]
########################################################################.
