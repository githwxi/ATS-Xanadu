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
Sun 11 Sep 2022 02:28:00 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
_(*TRANS12*) = "./trans12.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)

#implfun
trans12_sort1
( tenv,s1t0 ) = let
(*
val
loc0 = s1t0.lctn()
val () =
prerrln
("trans12_sort1: s1t0 = ", s1t0)
*)
in//let
//
case+
s1t0.node() of
//
|S1Tint(tok) =>
sort2_int(token2sint(tok))
//
| S1Tnone0 () => sort2_none1(s1t0)
| S1Tnone1 (s0t0) => sort2_none1(s1t0)
//
end where
{
} (*where*) // end of [trans12_sort1(tenv,s1t0)]

(* ****** ****** *)

#implfun
trans12_s1exp
( tenv,s1e0 ) = let
//
(*
val
loc0 = s1e0.lctn()
val () =
prerrln
("trans12_s1exp: s1e0 = ", s1e0)
*)
//
in//let
//
case+
s1e0.node() of
//
|S1Eint(tok) =>
s2exp_int(token2sint(tok))
|S1Echr(tok) =>
s2exp_chr(token2schr(tok))
|S1Eflt(tok) =>
s2exp_flt(token2sflt(tok))
|S1Estr(tok) =>
s2exp_str(token2sstr(tok))
//
|
S1Eb0sh _ => s2exp_none1(s1e0)
|
S1Eb1sh _ => f0_b1sh(tenv, s1e0)
//
|
S1El1st _ => f0_l1st(tenv, s1e0)
|
S1El2st _ => f0_l2st(tenv, s1e0)
//
|
S1Et1up _ => f0_t1up(tenv, s1e0)
//
|
S1Eanno _ => f0_anno(tenv, s1e0)
//
| _(* otherwise *) => s2exp_none1(s1e0)
//
end where
{
//
(* ****** ****** *)
//
fun
f0_b1sh
( tenv:
! tr12env
, s1e0: s1exp): s2exp =
(
trans12_s1exp(tenv, s1e1)) where
{
  val-S1Eb1sh(s1e1) = s1e0.node()
} (*where*) // end of [f0_b1sh(tenv, s1e0)]
//
(* ****** ****** *)
//
fun
f0_l1st
( tenv:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1El1st(s1es) = s1e0.node()
//
(*
val
loc0 = s1e0.lctn()
val ( ) =
println
("trans12_s1exp: f0_l1st: loc0 = ", loc0)
val ( ) =
println
("trans12_s1exp: f0_l1st: s1e0 = ", s1e0)
*)
//
in
if
list_singq(s1es)
then
let
val-
list_cons(s1e1, _) = s1es
in//let
  trans12_s1exp(tenv, s1e1)
end (*let*) // end of [then]
else
(
s2exp_l1st(trans12_s1explst(tenv, s1es))
)
end (*let*) // end of [f0_l1st(tenv, s1e0)]
//
(* ****** ****** *)
//
fun
f0_l2st
( tenv:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1El2st
(ses1, ses2) = s1e0.node()
//
(*
val
loc0 = s1e0.lctn()
val ( ) =
println
("trans12_s1exp: f0_l2st: loc0 = ", loc0)
val ( ) =
println
("trans12_s1exp: f0_l2st: s1e0 = ", s1e0)
*)
//
in
if
list_nilq(ses1)
then
(
s2exp_l1st(ses2) where
{
val ses2 = trans12_s1explst(tenv, ses2) }
)
else
(
s2exp_l2st(ses1, ses2) where
{
val ses1 = trans12_s1explst(tenv, ses1)
val ses2 = trans12_s1explst(tenv, ses2) }
)
end (*let*) // end of [f0_l2st(tenv, s1e0)]
//
(* ****** ****** *)
//
fun
f0_t1up
( tenv:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Et1up
(tknd, s1es) = s1e0.node()
//
(*
val
loc0 = s1e0.lctn()
val ( ) =
println
("trans12_s1exp: f0_t1up: loc0 = ", loc0)
val ( ) =
println
("trans12_s1exp: f0_t1up: s1e0 = ", s1e0)
*)
//
in
(
  s2exp_t1up(tknd, s2es)
) where
{
  val s2es =
  trans12_s1explst_impr(tenv, s1es) }
end (*let*) // end of [f0_t1up(tenv, s1e0)]
//
(* ****** ****** *)
//
fun
f0_t2up
( tenv:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Et2up
( tknd
, ses1, ses2) = s1e0.node()
//
(*
val
loc0 = s1e0.lctn()
val ( ) =
println
("trans12_s1exp: f0_t2up: loc0 = ", loc0)
val ( ) =
println
("trans12_s1exp: f0_t2up: s1e0 = ", s1e0)
*)
//
in
(
  s2exp_t2up(tknd, ses1, ses2)
) where
{
  val ses1 =
  trans12_s1explst_impr(tenv, ses1)
  val ses2 =
  trans12_s1explst_prgm(tenv, ses2) }
end (*let*) // end of [f0_t2up(tenv, s1e0)]
//
(* ****** ****** *)
//
fun
f0_r1cd
( tenv:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Er1cd
(tknd, lses) = s1e0.node()
//
(*
val
loc0 = s1e0.lctn()
val ( ) =
println
("trans12_s1exp: f0_r1cd: loc0 = ", loc0)
val ( ) =
println
("trans12_s1exp: f0_r1cd: s1e0 = ", s1e0)
*)
//
in
(
  s2exp_r1cd(tknd, lses)
) where
{
  val lses =
  trans12_l1s1elst_impr(tenv, lses) }
end (*let*) // end of [f0_r1cd(tenv, s1e0)]
//
(* ****** ****** *)
//
fun
f0_anno
( tenv:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Eanno
(s1e1, s1t2) = s1e0.node()
val
s2t2 = trans12_sort1(tenv, s1t2)
in//let
  trans12_s1exp_sort(tenv, s1e1, s2t2)
end (*let*) // end of [f0_anno(tenv, s1e0)]
//
(* ****** ****** *)
//
} (*where*) // end of [trans12_s1exp(tenv,s1e0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_staexp.dats] *)
