(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Mon Jul 25 11:30:41 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
#staload
MAP = "./xsymmap.sats"
#staload
FIX = "./xfixity.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef sym_t = $SYM.sym_t
(*
#typedef fixty = $FIX.fixty
*)
#typedef token = $LEX.token
//
(* ****** ****** *)
//
#vwtpdef
fixty = $FIX.fixty
#vwtpdef
fixtyopt_vt = optn_vt(fixty)
//
(* ****** ****** *)
//
#staload
FIL = "./filpath.sats"
#typedef fpath = $FIL.fpath
//
(* ****** ****** *)
#staload S0E = "./staexp0.sats"
#staload D0E = "./dynexp0.sats"
(* ****** ****** *)
#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
(* ****** ****** *)
//
#typedef i0dnt = $S0E.i0dnt
#typedef t0int = $S0E.t0int
#typedef t0chr = $S0E.t0chr
#typedef t0flt = $S0E.t0flt
#typedef t0str = $S0E.t0str
//
#typedef i1dnt = $S1E.i1dnt
#typedef t1int = $S1E.t1int
#typedef t1chr = $S1E.t1chr
#typedef t1flt = $S1E.t1flt
#typedef t1str = $S1E.t1str
//
(* ****** ****** *)
#typedef i0dntlst = $S0E.i0dntlst
#typedef i1dntlst = $S1E.i1dntlst
#typedef i0dntopt = $S0E.i0dntopt
#typedef i1dntopt = $S1E.i1dntopt
(* ****** ****** *)
//
#typedef s0qid = $S0E.s0qid
#typedef d0qid = $S0E.d0qid
#typedef s1qid = $S1E.s1qid
#typedef d1qid = $S1E.d1qid
//
(* ****** ****** *)
//
#typedef g0nam = $S0E.g0nam
#typedef g0exp = $S0E.g0exp
#typedef g1nam = $S1E.g1nam
#typedef g1exp = $S1E.g1exp
//
#typedef g0namlst = $S0E.g0namlst
#typedef g0explst = $S0E.g0explst
#typedef g1namlst = $S1E.g1namlst
#typedef g1explst = $S1E.g1explst
//
(* ****** ****** *)
//
#typedef sort0 = $S0E.sort0
#typedef s0exp = $S0E.s0exp
#typedef l0s0e = $S0E.l0s0e
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
#typedef l0s1e = $S1E.l0s1e
//
#typedef sort0lst = $S0E.sort0lst
#typedef s0explst = $S0E.s0explst
#typedef l0s0elst = $S0E.l0s0elst
#typedef sort1lst = $S1E.sort1lst
#typedef s1explst = $S1E.s1explst
#typedef l0s1elst = $S1E.l0s1elst
//
#typedef sort0opt = $S0E.sort0opt
#typedef s0expopt = $S0E.s0expopt
#typedef sort1opt = $S1E.sort1opt
#typedef s1expopt = $S1E.s1expopt
//
(* ****** ****** *)
#typedef s0arg = $S0E.s0arg
#typedef s1arg = $S1E.s1arg
#typedef s0mag = $S0E.s0mag
#typedef s1mag = $S1E.s1mag
#typedef s0arglst = $S0E.s0arglst
#typedef s1arglst = $S1E.s1arglst
#typedef s0maglst = $S0E.s0maglst
#typedef s1maglst = $S1E.s1maglst
(* ****** ****** *)
#typedef t0arg = $S0E.t0arg
#typedef t1arg = $S1E.t1arg
#typedef t0mag = $S0E.t0mag
#typedef t1mag = $S1E.t1mag
#typedef t0arglst = $S0E.t0arglst
#typedef t1arglst = $S1E.t1arglst
#typedef t0maglst = $S0E.t0maglst
#typedef t1maglst = $S1E.t1maglst
(* ****** ****** *)
#typedef s0qua = $S0E.s0qua
#typedef s1qua = $S1E.s1qua
#typedef s0qualst = $S0E.s0qualst
#typedef s1qualst = $S1E.s1qualst
(* ****** ****** *)
#typedef s0tcn = $S0E.s0tcn
#typedef s1tcn = $S1E.s1tcn
#typedef s0tcnlst = $S0E.s0tcnlst
#typedef s1tcnlst = $S1E.s1tcnlst
(* ****** ****** *)
#typedef d0tst = $S0E.d0tst
#typedef d1tst = $S1E.d1tst
#typedef d0tstlst = $S0E.d0tstlst
#typedef d1tstlst = $S1E.d1tstlst
(* ****** ****** *)
#typedef s0uni = $S0E.s0uni
#typedef s1uni = $S1E.s1uni
#typedef s0unilst = $S0E.s0unilst
#typedef s1unilst = $S1E.s1unilst
(* ****** ****** *)
#typedef d0tcn = $S0E.d0tcn
#typedef d1tcn = $S1E.d1tcn
#typedef d0tcnlst = $S0E.d0tcnlst
#typedef d1tcnlst = $S1E.d1tcnlst
(* ****** ****** *)
#typedef d0typ = $S0E.d0typ
#typedef d1typ = $S1E.d1typ
#typedef d0typlst = $S0E.d0typlst
#typedef d1typlst = $S1E.d1typlst
(* ****** ****** *)
//
#typedef d0pat = $D0E.d0pat
#typedef d0exp = $D0E.d0exp
#typedef d0ecl = $D0E.d0ecl
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
#typedef d1ecl = $D1E.d1ecl
//
#typedef d0patlst = $D0E.d0patlst
#typedef d0explst = $D0E.d0explst
#typedef d0eclist = $D0E.d0eclist
#typedef d1patlst = $D1E.d1patlst
#typedef d1explst = $D1E.d1explst
#typedef d1eclist = $D1E.d1eclist
//
(* ****** ****** *)
#typedef d0gua = $D0E.d0gua
#typedef d0gpt = $D0E.d0gpt
#typedef d0cls = $D0E.d0cls
#typedef d1gua = $D1E.d1gua
#typedef d1gpt = $D1E.d1gpt
#typedef d1cls = $D1E.d1cls
(* ****** ****** *)
#typedef d0gualst = $D0E.d0gualst
#typedef d0clslst = $D0E.d0clslst
#typedef d1gualst = $D1E.d1gualst
#typedef d1clslst = $D1E.d1clslst
(* ****** ****** *)
//
#typedef q0arg = $D0E.q0arg
#typedef s0qag = $D0E.s0qag
#typedef t0qag = $D0E.t0qag
#typedef q1arg = q1arg_tbox
#typedef s1qag = s1qag_tbox
#typedef t1qag = t1qag_tbox
//
#typedef t0iag = $D0E.t0iag
#typedef t1iag = t1iag_tbox
//
(* ****** ****** *)
#typedef q0arglst = $D0E.q0arglst
#typedef s0qaglst = $D0E.s0qaglst
#typedef t0qaglst = $D0E.t0qaglst
#typedef q1arglst = $D1E.q1arglst
#typedef s1qaglst = $D1E.s1qaglst
#typedef t1qaglst = $D1E.t1qaglst
(* ****** ****** *)
#typedef t0iaglst = $D0E.t0iaglst
#typedef t1iaglst = $D1E.t1iaglst
(* ****** ****** *)
#typedef teqd0exp = $D0E.teqd0exp
#typedef teqd1exp = $D1E.teqd1exp
(* ****** ****** *)
#typedef wths0exp = $D0E.wths0exp
#typedef wths1exp = $D1E.wths1exp
(* ****** ****** *)
#typedef d0valdcl = $D0E.d0valdcl
#typedef d0vardcl = $D0E.d0vardcl
#typedef d0fundcl = $D0E.d0fundcl
#typedef d1valdcl = $D1E.d1valdcl
#typedef d1vardcl = $D1E.d1vardcl
#typedef d1fundcl = $D1E.d1fundcl
(* ****** ****** *)
#typedef d0cstdcl = $D0E.d0cstdcl
#typedef d1cstdcl = $D1E.d1cstdcl
(* ****** ****** *)
#typedef d0parsed = $D0E.d0parsed
#typedef d1parsed = $D1E.d1parsed
(* ****** ****** *)
#typedef wd0eclseq = $D0E.wd0eclseq
#typedef wd1eclseq = $D1E.wd1eclseq
(* ****** ****** *)
#typedef d0valdclist = $D0E.d0valdclist
#typedef d1valdclist = $D1E.d1valdclist
#typedef d0vardclist = $D0E.d0vardclist
#typedef d1vardclist = $D1E.d1vardclist
#typedef d0fundclist = $D0E.d0fundclist
#typedef d1fundclist = $D1E.d1fundclist
(* ****** ****** *)
#typedef d0cstdclist = $D0E.d0cstdclist
#typedef d1cstdclist = $D1E.d1cstdclist
(* ****** ****** *)
//
fun
d1parsed_from_trans
(  dpar: d0parsed  ): d1parsed
//
(* ****** ****** *)
#absvtbx tr01env_vtbx
#vwtpdef tr01env = tr01env_vtbx
(* ****** ****** *)
//
fun
tr01env_search_opt
( env:
! tr01env, key: sym_t): fixtyopt_vt
fun
tr01env_insert_any
( env:
! tr01env, key: sym_t, itm: fixty): void
//
fun
tr01env_make_nil((*void*)): tr01env
fun
tr01env_free_top(env: ~tr01env): void
//
fun
tr01env_popfree( env: !tr01env ): void
fun
tr01env_pushnil( env: !tr01env ): void
fun
tr01env_locjoin( env: !tr01env ): void
//
(* ****** ****** *)

(* HX: transing basics *)

(* ****** ****** *)
fun token2sint: token -> sint
fun token2dint: token -> sint
(* ****** ****** *)
fun token2sbtf: token -> bool
fun token2dbtf: token -> bool
(* ****** ****** *)
fun token2schr: token -> char
fun token2dchr: token -> char
(* ****** ****** *)
fun token2sflt: token -> double
fun token2dflt: token -> double
(* ****** ****** *)
fun token2sstr: token -> string
fun token2dstr: token -> string
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trans01_fnp
( e1:
! tr01env
, xs: list(x0)
, (!tr01env, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trans01_fnp
( e1:
! tr01env
, xs: optn(x0)
, (!tr01env, x0) -> y0): optn(y0)
//
(* ****** ****** *)

(* HX: transing staexp *)

(* ****** ****** *)
fun trans01_i0dnt:
  (!tr01env, i0dnt)->i1dnt
fun trans01_t0int:
  (!tr01env, t0int)->t1int
fun trans01_t0chr:
  (!tr01env, t0chr)->t1chr
fun trans01_t0flt:
  (!tr01env, t0flt)->t1flt
fun trans01_t0str:
  (!tr01env, t0str)->t1str
(* ****** ****** *)
fun
trans01_i0dntlst:
  (!tr01env, i0dntlst)->i1dntlst
fun
trans01_i0dntopt:
  (!tr01env, i0dntopt)->i1dntopt
(* ****** ****** *)
fun trans01_s0qid:
  (!tr01env, s0qid)->s1qid
fun trans01_d0qid:
  (!tr01env, d0qid)->d1qid
(* ****** ****** *)
//
fun trans01_g0nam:
  (!tr01env, g0nam)->g1nam
fun trans01_g0exp:
  (!tr01env, g0exp)->g1exp
//
fun
trans01_g0namlst:
  (!tr01env, g0namlst)->g1namlst
fun
trans01_g0explst:
  (!tr01env, g0explst)->g1explst
//
(* ****** ****** *)
//
fun trans01_sort0:
  (!tr01env, sort0)->sort1
fun trans01_s0exp:
  (!tr01env, s0exp)->s1exp
fun trans01_l0s0e:
  (!tr01env, l0s0e)->l0s1e
//
fun
trans01_sort0lst:
  (!tr01env, sort0lst)->sort1lst
fun
trans01_s0explst:
  (!tr01env, s0explst)->s1explst
fun
trans01_l0s0elst:
  (!tr01env, l0s0elst)->l0s1elst
//
fun
trans01_sort0opt:
  (!tr01env, sort0opt)->sort1opt
fun
trans01_s0expopt:
  (!tr01env, s0expopt)->s1expopt
//
(* ****** ****** *)
//
fun trans01_s0tcn:
  (!tr01env, s0tcn)->s1tcn
fun trans01_d0tst:
  (!tr01env, d0tst)->d1tst
//
fun
trans01_s0tcnlst:
  (!tr01env, s0tcnlst)->s1tcnlst
fun
trans01_d0tstlst:
  (!tr01env, d0tstlst)->d1tstlst
(* ****** ****** *)
//
fun trans01_s0arg:
  (!tr01env, s0arg)->s1arg
fun trans01_s0mag:
  (!tr01env, s0mag)->s1mag
fun trans01_t0arg:
  (!tr01env, t0arg)->t1arg
fun trans01_t0mag:
  (!tr01env, t0mag)->t1mag
fun trans01_s0qua:
  (!tr01env, s0qua)->s1qua
//
(* ****** ****** *)
fun trans01_s0uni:
  (!tr01env, s0uni)->s1uni
fun trans01_d0tcn:
  (!tr01env, d0tcn)->d1tcn
fun trans01_d0typ:
  (!tr01env, d0typ)->d1typ
(* ****** ****** *)
fun
trans01_s0arglst:
  (!tr01env, s0arglst)->s1arglst
fun
trans01_s0maglst:
  (!tr01env, s0maglst)->s1maglst
fun
trans01_t0arglst:
  (!tr01env, t0arglst)->t1arglst
fun
trans01_t0maglst:
  (!tr01env, t0maglst)->t1maglst
(* ****** ****** *)
fun
trans01_s0qualst:
  (!tr01env, s0qualst)->s1qualst
(* ****** ****** *)
fun
trans01_s0unilst:
  (!tr01env, s0unilst)->s1unilst
fun
trans01_d0tcnlst:
  (!tr01env, d0tcnlst)->d1tcnlst
fun
trans01_d0typlst:
  (!tr01env, d0typlst)->d1typlst
(* ****** ****** *)

(* HX: transing dynexp *)

(* ****** ****** *)
//
fun trans01_d0pat:
  (!tr01env, d0pat)->d1pat
fun trans01_d0exp:
  (!tr01env, d0exp)->d1exp
//
fun
trans01_d0patlst:
  (!tr01env, d0patlst)->d1patlst
fun
trans01_d0explst:
  (!tr01env, d0explst)->d1explst
//
(* ****** ****** *)
//
fun trans01_d0gua:
  (!tr01env, d0gua)->d1gua
fun trans01_d0gpt:
  (!tr01env, d0gpt)->d1gpt
fun trans01_d0cls:
  (!tr01env, d0cls)->d1cls
//
fun
trans01_d0gualst:
  (!tr01env, d0gualst)->d1gualst
fun
trans01_d0clslst:
  (!tr01env, d0clslst)->d1clslst
//
(* ****** ****** *)

(* HX: trans01_decl00 *)

(* ****** ****** *)
//
fun
trans01_s0qag:
  (!tr01env, s0qag)->s1qag
fun
trans01_t0qag:
  (!tr01env, t0qag)->t1qag
//
fun
trans01_s0qaglst:
  (!tr01env, s0qaglst)->s1qaglst
fun
trans01_t0qaglst:
  (!tr01env, t0qaglst)->t1qaglst
//
(* ****** ****** *)
//
fun
trans01_d0ecl:
  (!tr01env, d0ecl)->d1ecl
//
fun
trans01_d0eclist:
  (!tr01env, d0eclist)->d1eclist
(* ****** ****** *)
fun
trans01_wd0eclseq:
  (!tr01env, wd0eclseq)->wd1eclseq
(* ****** ****** *)
//
#typedef d0eclistopt = optn(d0eclist)
#typedef d1eclistopt = optn(d1eclist)
//
fun
trans01_d0eclistopt:
  (!tr01env, d0eclistopt)->d1eclistopt
//
(* ****** ****** *)
//
fun
trans01_teqd0exp:
  (!tr01env, teqd0exp)->teqd1exp
fun
trans01_wths0exp:
  (!tr01env, wths0exp)->wths1exp
//
(* ****** ****** *)
//
fun
trans01_d0valdcl:
  (!tr01env, d0valdcl)->d1valdcl
fun
trans01_d0vardcl:
  (!tr01env, d0vardcl)->d1vardcl
fun
trans01_d0fundcl:
  (!tr01env, d0fundcl)->d1fundcl
fun
trans01_d0cstdcl:
  (!tr01env, d0cstdcl)->d1cstdcl
//
fun
trans01_d0valdclist:
  (!tr01env, d0valdclist)->d1valdclist
fun
trans01_d0vardclist:
  (!tr01env, d0vardclist)->d1vardclist
fun
trans01_d0fundclist:
  (!tr01env, d0fundclist)->d1fundclist
fun
trans01_d0cstdclist:
  (!tr01env, d0cstdclist)->d1cstdclist
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01.sats] *)
