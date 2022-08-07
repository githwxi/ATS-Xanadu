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
#typedef d0parsed = $D0E.d0parsed
#typedef d1parsed = $D1E.d1parsed
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

(* HX: trans01_decl00 *)

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
//
#typedef d0eclistopt = optn(d0eclist)
#typedef d1eclistopt = optn(d1eclist)
//
fun
trans01_d0eclistopt:
  (!tr01env, d0eclistopt)->d1eclistopt
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01.sats] *)
