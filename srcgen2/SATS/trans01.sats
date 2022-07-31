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
#typedef i0dnt = $S0E.i0dnt
#typedef i1dnt = $S1E.i1dnt
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
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
//
#typedef sort0lst = $S0E.sort0lst
#typedef s0explst = $S0E.s0explst
#typedef sort1lst = $S1E.sort1lst
#typedef s1explst = $S1E.s1explst
//
(* ****** ****** *)
#typedef s0mag = $S0E.s0mag
#typedef s1mag = $S1E.s1mag
#typedef s0maglst = $S0E.s0maglst
#typedef s1maglst = $S1E.s1maglst
(* ****** ****** *)
#typedef t0mag = $S0E.t0mag
#typedef t1mag = $S1E.t1mag
#typedef t0maglst = $S0E.t0maglst
#typedef t1maglst = $S1E.t1maglst
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
//
fun
the_fxtyenv_search
(key: sym_t): fixtyopt_vt
fun
the_fxtyenv_insert
(key: sym_t, itm: fixty): void
//
(* ****** ****** *)
//
#absview
fxtyenv_view
#viewdef
fxtyenv = fxtyenv_view
//
fun
the_fxtyenv_pop
( fxtyenv
| (*none*) )
: $MAP.symmap(fixty)
fun
the_fxtyenv_popfree
( fxtyenv | (*none*) ): void
//
fun
the_fxtyenv_pushnil
( (*void*) ):(fxtyenv | void)
//
(* ****** ****** *)
//
fun
the_fxtyenv_locjoin
(
  pf1: fxtyenv
, pf2: fxtyenv | (*none*)
) : void // end of [the_fxtyenv_locjoin]
//
(* ****** ****** *)
//
fun // p: pervasive
the_fxtyenv_ptopmrg
( map: $MAP.symmap(fixty) ): void
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
fun trans01_i0dnt: (i0dnt)->i1dnt
(* ****** ****** *)
//
fun trans01_g0nam: (g0nam)->g1nam
fun trans01_g0exp: (g0exp)->g1exp
//
fun
trans01_g0namlst: (g0namlst)->g1namlst
fun
trans01_g0explst: (g0explst)->g1explst
//
(* ****** ****** *)
//
fun trans01_sort0: (sort0)->sort1
fun trans01_s0exp: (s0exp)->s1exp
//
fun
trans01_sort0lst: (sort0lst)->sort1lst
fun
trans01_s0explst: (s0explst)->s1explst
//
(* ****** ****** *)
fun trans01_s0mag: (s0mag)->s1mag
fun trans01_t0mag: (t0mag)->t1mag
(* ****** ****** *)
fun
trans01_s0maglst: (s0maglst)->s1maglst
fun
trans01_t0maglst: (t0maglst)->t1maglst
(* ****** ****** *)

(* HX: transing dynexp *)

(* ****** ****** *)
//
fun trans01_d0pat: (d0pat)->d1pat
fun trans01_d0exp: (d0exp)->d1exp
//
fun
trans01_d0patlst: (d0patlst)->d1patlst
fun
trans01_d0explst: (d0explst)->d1explst
//
(* ****** ****** *)

(* HX: trans01_decl00 *)

(* ****** ****** *)
//
fun
trans01_d0ecl: (d0ecl)->d1ecl
//
fun
trans01_d0eclist: (d0eclist)->d1eclist
(* ****** ****** *)
//
#typedef d0eclistopt = optn(d0eclist)
#typedef d1eclistopt = optn(d1eclist)
//
fun
trans01_d0eclistopt: (d0eclistopt)->d1eclistopt
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01.sats] *)
