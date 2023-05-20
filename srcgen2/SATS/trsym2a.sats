(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 11 Feb 2023 05:06:27 PM EST
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
(*
HX-2023-02-12: pre-type-inference
The main purpose of this translation
is for resolving overloaded symbols!
This one is a continuation of [trans2a]
*)
(* ****** ****** *)
#staload "./trans2a.sats"
(* ****** ****** *)
//
(*
HX-2023-05-20:
Note that the name is
not [d2parsed_of_trsym2a]
*)
fun
trsym2a_at_d2parsed
( dpar : d2parsed ): (void)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_trsym2a_fnp
( e1:
! tr2aenv
, xs: list(x0)
, (!tr2aenv, x0) -> void): void
fun
<x0:t0>
<y0:t0>
optn_trsym2a_fnp
( e1:
! tr2aenv
, xs: optn(x0)
, (!tr2aenv, x0) -> void): void
//
(* ****** ****** *)
//
fun
trsym2a_d2pat
(env0: !tr2aenv, d2p0: d2pat): void
//
fun
trsym2a_d2exp
(env0: !tr2aenv, d2e0: d2exp): void
//
(* ****** ****** *)
//
fun
trsym2a_l2d2p
(env0: !tr2aenv, ld2p: l2d2p): void
//
fun
trsym2a_l2d2e
(env0: !tr2aenv, ld2e: l2d2e): void
//
(* ****** ****** *)
//
fun
trsym2a_f2arg
(env0: !tr2aenv, f2a0: f2arg): void
//
(* ****** ****** *)
//
fun
trsym2a_d2gua
(env0: !tr2aenv, dgua: d2gua): void
fun
trsym2a_d2gpt
(env0: !tr2aenv, dgpt: d2gpt): void
fun
trsym2a_d2cls
(env0: !tr2aenv, dcls: d2cls): void
//
(* ****** ****** *)
//
fun
trsym2a_d2ecl
(env0: !tr2aenv, d2cl: d2ecl): void
//
(* ****** ****** *)
//
fun
trsym2a_d2patlst
(env0: !tr2aenv, d2ps: d2patlst): void
fun
trsym2a_d2expopt
(env0: !tr2aenv, dopt: d2expopt): void
fun
trsym2a_d2explst
(env0: !tr2aenv, d2es: d2explst): void
//
(* ****** ****** *)
//
fun
trsym2a_l2d2plst
(env0: !tr2aenv, ldps: l2d2plst): void
fun
trsym2a_l2d2elst
(env0: !tr2aenv, ldes: l2d2elst): void
//
(* ****** ****** *)
//
fun
trsym2a_f2arglst
(env0: !tr2aenv, f2as: f2arglst): void
//
(* ****** ****** *)
//
fun
trsym2a_d2gualst
(env0: !tr2aenv, d2gs: d2gualst): void
//
fun
trsym2a_d2clslst
(env0: !tr2aenv, dcls: d2clslst): void
//
(* ****** ****** *)
//
fun
trsym2a_d2eclist
(env0: !tr2aenv, d2cs: d2eclist): void
//
(* ****** ****** *)
fun
trsym2a_teqd2exp
(env0: !tr2aenv, tdxp: teqd2exp): void
(* ****** ****** *)
//
fun
trsym2a_d2valdcl
(env0: !tr2aenv, dval: d2valdcl): void
fun
trsym2a_d2vardcl
(env0: !tr2aenv, dvar: d2vardcl): void
fun
trsym2a_d2fundcl
(env0: !tr2aenv, dfun: d2fundcl): void
//
(* ****** ****** *)
//
fun
trsym2a_d2valdclist
(env0: !tr2aenv, d2vs: d2valdclist): void
fun
trsym2a_d2vardclist
(env0: !tr2aenv, d2vs: d2vardclist): void
fun
trsym2a_d2fundclist
(env0: !tr2aenv, d2fs: d2fundclist): void
//
(* ****** ****** *)
fun
trsym2a_d2eclistopt
(env0: !tr2aenv, dopt: d2eclistopt): void
(* ****** ****** *)

(*
HX-2023-02-08:
Various matching functions
for resolving overloaded symbols
*)
(* ****** ****** *)
//
fun
match2a_d2var
( env0:
! tr2aenv, d2v0:d2var, t2p0:s2typ): bool
//
(* ****** ****** *)
//
fun
match2a_d2con
( env0:
! tr2aenv, d2c0:d2con, t2p0:s2typ): bool
fun
match2a_d2cst
( env0:
! tr2aenv, d2c0:d2cst, t2p0:s2typ): bool
//
(* ****** ****** *)
//
fun
match2a_d2itm
( env0:
! tr2aenv, ditm:d2itm, t2p0:s2typ): d2itmopt
fun
match2a_d2ptm
( env0:
! tr2aenv, dptm:d2ptm, t2p0:s2typ): d2ptmopt
//
(* ****** ****** *)
//
fun
match2a_d2ptmlst
( env0:
! tr2aenv, dpis:d2ptmlst, t2p0:s2typ): d2ptmlst
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trsym2a.sats] *)
