## Tue Sep 22 01:15:38 AM EDT 2026
########################################################################
########################################################################
##
## the beg of
## [ATS3-XANADU
## /srcgen2/xats2pl/srcgen1/xshared/runtime/srcgen2_prelude.pl]
##
########################################################################
########################################################################
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
## Sun Sep  6 12:00:01 AM EDT 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
##
## HX-2026-09-06: Nothing yet!
##
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_xtop000.cats]
########################################################################.
########################################################################.
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
##
## HX-2026-09-06: Nothing yet!
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/gbas000.cats]
########################################################################.
########################################################################.
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
my
$XATS2PL_bool_assert_errmsg =
sub {
  my ($cond, $emsg) = @_;
  die "XATS2PL_bool_assert_errmsg: emsg = " . $emsg . "\n" unless $cond;
  return;
}
;
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/gdbg000.cats]
########################################################################.
########################################################################.
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
my #
$XATS2PL_sint_lt_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 < $i2);
};
##
my #
$XATS2PL_sint_gt_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 > $i2);
};
##
my #
$XATS2PL_sint_eq_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 == $i2);
};
##
my #
$XATS2PL_sint_lte_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 <= $i2);
};
##
my #
$XATS2PL_sint_gte_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 >= $i2);
};
##
my #
$XATS2PL_sint_neq_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 != $i2);
};
##
########################################################################.
##
my #
$XATS2PL_sint_neg =
sub {
  my ($i1) = @_;
  return -( $i1 ); };
##
my #
$XATS2PL_sint_abs =
sub {
  my ($i1) = @_;
  return
  ( $i1 >= 0 ) ?
  ( $i1 ) : -( $i1 ); };
##
########################################################################.
##
my #
$XATS2PL_sint_add_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 + $i2); };
##
my #
$XATS2PL_sint_sub_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 - $i2); };
##
my #
$XATS2PL_sint_mul_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 * $i2); };
##
########################################################################.
##
my #
$XATS2PL_sint_mod_sint =
sub {
  my ($i1, $i2) = @_;
  return ($i1 % $i2); };
##
my #
$XATS2PL_sint_div_sint =
sub {
  my ($i1, $i2) = @_;
  return int($i1 / $i2); };
##
########################################################################.
##
my #
$XATS2PL_sint_print =
sub {
  my ($i0) = @_; print STDOUT $i0; return; };
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/gint000.cats]
########################################################################.
########################################################################.
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
my
$XATS2PL_bool_lt =
sub {
  my ($b1, $b2) = @_;
  return ($b1 < $b2); ## HX: lt
}
;
my
$XATS2PL_bool_gt =
sub {
  my ($b1, $b2) = @_;
  return ($b1 > $b2); ## HX: gt
}
;
my
$XATS2PL_bool_eq =
sub {
  my ($b1, $b2) = @_;
  return ($b1 == $b2); ## HX: eq
}
;
##
my
$XATS2PL_bool_lte =
sub {
  my ($b1, $b2) = @_;
  return ($b1 <= $b2); ## HX: lte
}
;
my
$XATS2PL_bool_gte =
sub {
  my ($b1, $b2) = @_;
  return ($b1 >= $b2); ## HX: gte
}
;
my
$XATS2PL_bool_neq =
sub {
  my ($b1, $b2) = @_;
  return ($b1 != $b2); ## HX: neq
}
;
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/bool000.cats]
########################################################################.
########################################################################.
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
## from ./../PY/char000.cats
##
########################################################################.
##
my
$XATS2PL_char_lt =
sub {
  my ($c1, $c2) = @_;
  return ($c1 < $c2);
};
##
my
$XATS2PL_char_gt =
sub {
  my ($c1, $c2) = @_;
  return ($c1 > $c2);
};
##
my
$XATS2PL_char_eq =
sub {
  my ($c1, $c2) = @_;
  return ($c1 == $c2);
};
##
my
$XATS2PL_char_lte =
sub {
  my ($c1, $c2) = @_;
  return ($c1 <= $c2);
};
##
my
$XATS2PL_char_gte =
sub {
  my ($c1, $c2) = @_;
  return ($c1 >= $c2);
};
##
my
$XATS2PL_char_neq =
sub {
  my ($c1, $c2) = @_;
  return ($c1 != $c2);
};
##
########################################################################.
##
my
$XATS2PL_char_sub_char =
sub {
  my ($c1, $c2) = @_;
  return ($c1 - $c2);
};
##
my
$XATS2PL_char_add_sint =
sub {
  my ($c1, $i2) = @_;
  return
  (($c1 + $i2) % 256);
};
##
########################################################################.
##
my
$XATS2PL_char_make_sint =
sub {
  my ($i0) = @_; return $i0;
};
##
my
$XATS2PL_sint_make_char =
sub {
  my ($ch) = @_; return $ch;
};
##
########################################################################.
##
my
$XATS2PL_strn_print = undef;
##
my
$XATS2PL_char_print =
sub {
  my ($c0) = @_;
  $XATS2PL_strn_print->(chr($c0)); return;
};
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/char000.cats]
########################################################################.
########################################################################.
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
my #
$XATS2PL_dflt_lt_dflt =
sub {
  my ($f1, $f2) = @_;
  return ($f1 < $f2);
}
;
##
my #
$XATS2PL_dflt_gt_dflt =
sub {
  my ($f1, $f2) = @_;
  return ($f1 > $f2);
}
;
##
my #
$XATS2PL_dflt_eq_dflt =
sub {
  my ($f1, $f2) = @_;
  return ($f1 == $f2);
}
;
##
my #
$XATS2PL_dflt_lte_dflt =
sub {
  my ($f1, $f2) = @_;
  return ($f1 <= $f2);
}
;
##
my #
$XATS2PL_dflt_gte_dflt =
sub {
  my ($f1, $f2) = @_;
  return ($f1 >= $f2);
}
;
##
my #
$XATS2PL_dflt_neq_dflt =
sub {
  my ($f1, $f2) = @_;
  return ($f1 != $f2);
}
;
##
########################################################################.
##
my #
$XATS2PL_dflt_neg =
sub {
  my ($f1) = @_; return -($f1);
}
;
##
my #
$XATS2PL_dflt_abs =
sub {
  my ($df) = @_;
  return ($df >= 0.0 ? $df : -$df);
}
;
##
########################################################################.
##
my #
$XATS2PL_dflt_add_dflt =
sub {
  my ($f1, $f2) = @_; return ($f1 + $f2);
}
;
##
my #
$XATS2PL_dflt_sub_dflt =
sub {
  my ($f1, $f2) = @_; return ($f1 - $f2);
}
;
##
my #
$XATS2PL_dflt_mul_dflt =
sub {
  my ($f1, $f2) = @_; return ($f1 * $f2);
}
;
##
########################################################################.
##
my #
$XATS2PL_dflt_div_dflt =
sub {
  my ($f1, $f2) = @_; return ($f1 / $f2);
}
;
##
my #
$XATS2PL_dflt_mod_dflt =
sub {
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
;
##
########################################################################.
##
my #
$XATS2PL_dflt_sqrt =
sub {
  my ($df) = @_; return sqrt($df);
}
;
##
my #
$XATS2PL_dflt_cbrt =
sub {
  my ($df) = @_; return POSIX::cbrt($df);
}
;
##
########################################################################.
##
my #
$XATS2PL_dflt_ceil =
sub {
  my ($df) = @_; return POSIX::ceil($df);
}
;
##
my #
$XATS2PL_dflt_floor =
sub {
  my ($df) = @_; return POSIX::floor($df);
}
;
##
my #
$XATS2PL_dflt_trunc =
sub {
  my ($df) = @_; return POSIX::trunc($df);
}
;
##
my #
$XATS2PL_dflt_round =
sub {
  my ($df) = @_;
  my $lo = POSIX::floor($df);
  my $frac = $df - $lo;
  return $lo if $frac < 0.5;
  return $lo + 1 if $frac > 0.5;
  return POSIX::fmod($lo, 2.0) == 0.0 ? $lo : $lo + 1;
}
;
##
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_gflt000.cats]
########################################################################.
########################################################################.
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
  my $n0 =
  ($n1 <= $n2 ? $n1 : $n2);
  for (
    my $i0 = 0;
       $i0 < $n0; $i0 += 1) {
    my $df = ord(substr($x1, $i0, 1)) - ord(substr($x2, $i0, 1));
    return $df if ($df != 0);
  }
  return (   $n1   -   $n2   );
};
##
########################################################################.
##
# my
$XATS2PL_strn_print =
sub {
  my ($cs) = @_;
  print STDOUT $cs; return;
};
my #
$XATS000_strn_print =
sub {
  my ($cs) = @_;
  $XATS2PL_strn_print->($cs); return;
};
##
########################################################################.
##
my #
$XATS2PL_strn_length =
sub {
  my ($cs) = @_;
  return length($cs);
};
my #
$XATS000_strn_length =
sub {
  my ($cs) = @_;
  return
  $XATS2PL_strn_length->($cs);
};
##
########################################################################.
##
my #
$XATS2PL_strn_get_at_raw =
sub {
  my ($cs, $i0) = @_;
  return ord(substr($cs, $i0, 1));
};
##
my #
$XATS000_strn_get_at_raw =
sub {
  my ($cs, $i0) = @_;
  return
  $XATS2PL_strn_get_at_raw->($cs, $i0);
};
##
########################################################################.
##
my #
$XATS2PL_strn_make_fwork =
sub {
  my ($fwork) = @_;
  my $res = "";
  $fwork->(
    sub { $res .= chr($_[0]); return; });
  return $res;
};
##
my #
$XATS000_strn_make_fwork =
sub {
  my ($fwork) = @_;
  return
  $XATS2PL_strn_make_fwork->($fwork);
};
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
};
my #
$XATS000_strn_make_env_fwork =
sub {
  my ($env, $fwork) = @_;
  return
  $XATS2PL_strn_make_env_fwork->($env, $fwork);
};
##
########################################################################.
##
my #
$XATS2PL_strn_make1_env_fwork =
sub {
  my ($env, $fwork) = @_;
  my $res = "";
  $fwork->(
    $env, sub { $res .= chr($_[0]); return; });
  return $res;
};
##
my #
$XATS000_strn_make1_env_fwork =
sub {
  my ($env, $fwork) = @_;
  return
  $XATS2PL_strn_make1_env_fwork->($env, $fwork);
};
##
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_strn000.cats]
########################################################################.
########################################################################.
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
## Translated by Codex
## from ./../PY/list000.cats
##
########################################################################.
##
my #
$XATS2PL_list_vt_foritm0_f1un =
sub {
  my ($xs, $work) = @_;
  while (!XATS2PL_list_vt_nilq1($xs)) {
    my $x1 = $XATS2PL_list_vt_head_raw1->($xs);
    $work->($x1);
    $xs = $XATS2PL_list_vt_tail_raw0->($xs);
  }
  return;
}
;
##
my #
$XATS2PL_list_vt_forall0_f1un =
sub {
  my ($xs, $test, $free) = @_;
  while (!XATS2PL_list_vt_nilq1($xs)) {
    my $x1 = $XATS2PL_list_vt_head_raw1->($xs);
    if ($test->($x1)) {
      $xs = $XATS2PL_list_vt_tail_raw0->($xs);
    } else {
      $xs = $XATS2PL_list_vt_tail_raw0->($xs);
      $XATS2PL_list_vt_foritm0_f1un->($xs, $free);
      return FALSE;
    }
  }
  return TRUE;
}
;
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/list000.cats]
########################################################################.
########################################################################.
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
## Sat Jan  3 05:24:14 PM EST 2026
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
##
## HX-2026-09-06: Nothing yet!
##
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_optn000.cats]
########################################################################.
########################################################################.
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
## Translated by Codex
## from ./../PY/strm000.cats
##
########################################################################.
##
my #
$XATS2PL_strm_vt_forall0_f1un =
sub {
  my ($fxs, $test) = @_;
  while (TRUE) {
    my $cxs = $XATS2PL_lazy_vt_eval->($fxs);
    last if $XATS2PL_strmcon_vt_nilq1->($cxs);
    my $x01 = $XATS2PL_strmcon_vt_head_raw1->($cxs);
    if ($test->($x01)) {
      $fxs = $XATS2PL_strmcon_vt_tail_raw0->($cxs);
    } else {
      $fxs = $XATS2PL_strmcon_vt_tail_raw0->($cxs);
      $XATS2PL_lazy_vt_free->($fxs);
      return FALSE;
    }
  }
  return TRUE;
}
;
##
########################################################################.
##
my #
$XATS2PL_strm_vt_filter0_f1un =
sub {
  my ($fxs, $test, $free) = @_;
  return $XATS2PL_lazy_vt_make_f0un->(sub {
    return $XATS2PL_strmcon_vt_filter0_f1un->(
      $XATS2PL_lazy_vt_eval->($fxs), $test, $free);
  });
}
;
##
my #
$XATS2PL_strmcon_vt_filter0_f1un =
sub {
  my ($cxs, $test, $free) = @_;
  while (TRUE) {
    if ## if
    (
      $XATS2PL_strmcon_vt_nilq1->($cxs)
    ) { ## then
      return $XATS2PL_strmcon_vt_nil->();
    }
    my $x01 = $XATS2PL_strmcon_vt_head_raw1->($cxs);
    my $fxs = $XATS2PL_strmcon_vt_tail_raw0->($cxs);
    if ($test->($x01)) {
      return $XATS2PL_strmcon_vt_cons->(
        $x01, $XATS2PL_strm_vt_filter0_f1un->($fxs, $test, $free));
    } else {
      $free->($x01);
      $cxs = $XATS2PL_lazy_vt_eval->($fxs);
    }
  }
}
;
##
########################################################################.
########################################################################.
## end of [ATS3-XANADU/prelude/DATS/CATS/PL/strm000.cats]
########################################################################.
########################################################################.
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
##
my #
$XATS2PL_strx_vt_forall0_f1un =
sub {
  my ($fxs, $test) = @_;
  while (TRUE) {
    my $cxs = $XATS2PL_lazy_vt_eval->($fxs);
    my $x01 = $XATS2PL_strxcon_vt_head_raw1->($cxs);
    if ($test->($x01)) {
      $fxs = $XATS2PL_strxcon_vt_tail_raw0->($cxs);
    } else {
      $fxs = $XATS2PL_strxcon_vt_tail_raw0->($cxs);
      $XATS2PL_lazy_vt_free->($fxs);
      return FALSE;
    }
  }
  return TRUE;
}
;
##
########################################################################.
##
my #
$XATS2PL_strx_vt_filter0_f1un =
sub {
  my ($fxs, $test, $free) = @_;
  return $XATS2PL_lazy_vt_make_f0un->(sub {
    return $XATS2PL_strxcon_vt_filter0_f1un->(
      $XATS2PL_lazy_vt_eval->($fxs), $test, $free);
  });
}
;
##
my #
$XATS2PL_strxcon_vt_filter0_f1un =
sub {
  my ($cxs, $test, $free) = @_;
  while (TRUE) {
    my $x01 = $XATS2PL_strxcon_vt_head_raw1->($cxs);
    my $fxs = $XATS2PL_strxcon_vt_tail_raw0->($cxs);
    if ($test->($x01)) {
      return $XATS2PL_strxcon_vt_cons->(
        $x01, $XATS2PL_strx_vt_filter0_f1un->($fxs, $test, $free));
    } else {
      $free->($x01);
      $cxs = $XATS2PL_lazy_vt_eval->($fxs);
    }
  }
}
;
##
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_strx000.cats]
########################################################################.
########################################################################.
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
my
$XATS2PL_a0rf_lget =
sub {
  my ($A) = @_;
  return $A->[0];
}
;
##
my
$XATS2PL_a0rf_lset =
sub {
  my ($A, $x1) = @_;
  $A->[0] = $x1; return;
}
;
##
########################################################################.
##
my
$XATS2PL_a1rf_lget_at =
sub {
  my ($A, $i0) = @_;
  return ($A->[$i0]);
}
;
##
my
$XATS2PL_a1rf_lset_at =
sub {
  my ($A, $i0, $x1) = @_;
  $A->[$i0] = $x1; return;
}
;
##
########################################################################.
##
my
$XATS2PL_a0rf_make_1val =
sub {
  my ($x0) = @_; return [$x0];
}
;
##
my
$XATS2PL_a1rf_make_ncpy =
sub {
  my ($n0, $x0) = @_;
  my $A0 = [];
  for ## for
  (my $i0 = 0; $i0 < $n0; $i0 += 1)
  {
    push @$A0, $x0;
  }
  return $A0;
}
;
##
my
$XATS2PL_a1rf_make_nfun =
sub {
  my ($n0, $fopr) = @_;
  my $A0 = [];
  for
  (my $i0 = 0; $i0 < $n0; $i0 += 1) {
    push @$A0, $fopr->($i0);
  }
  return $A0;
}
;
########################################################################.
########################################################################.
## end of [ATS3/XANADU_prelude_DATS_CATS_PL_axrf000.cats]
########################################################################.
########################################################################.
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
