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

fun
isPLUS
( s1t0
: sort1): bool =
(
case+
s1t0.node() of
| S1Tid0(tid0) =>
  (tid0 = ADD_symbl)
| _(*non-S1Tid0*) => false
)
fun
isMNUS
( s1t0
: sort1): bool =
(
case+
s1t0.node() of
| S1Tid0(tid0) =>
  (tid0 = SUB_symbl)
| _(*non-S1Tid0*) => false
)
fun
isARRW
( s1t0
: sort1): bool =
(
case+
s1t0.node() of
| S1Tid0(tid0) =>
  (tid0 = MSGT_symbl)
| _(*non-S1Tid0*) => false
)

(* ****** ****** *)

#implfun
trans12_sort1
( env0,s1t0 ) = let
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
|S1Tid0 _ =>
f0_id0(env0, s1t0)
//
|S1Tint(tok) =>
sort2_int(token2sint(tok))
//
|S1Ta0pp _ => sort2_none1(s1t0)
//
|
S1Ta1pp _ => f0_a1pp(env0, s1t0)
|
S1Ta2pp _ => f0_a2pp(env0, s1t0)
//
|
S1Tlist _ => f0_list(env0, s1t0)
//
| S1Tqual _ => sort2_none1(s1t0)
//
| S1Tnone0() => sort2_none1(s1t0)
| S1Tnone1(s0t0) => sort2_none1(s1t0)
//
end where
{
//
(* ****** ****** *)
//
fun
f0_id0
( env0:
! tr12env
, s1t0: sort1): sort2 = let
//
val-
S1Tid0
(tid0) = s1t0.node()
val
topt =
tr12env_find_s2tex(env0,tid0)
//
in//let
//
case+ topt of
//
| ~
optn_vt_nil() => S2Tid0(tid0)
//
| ~
optn_vt_cons(s2t0) =>
(
case+ s2t0 of
| S2TEXsrt(s2t1) => s2t1
| S2TEXsub(s2v1, _) => s2v1.sort()
(*
| S2TEXerr _(*loc*) => S2Tnone1(s1t0)
*)
) (* end of [optn_vt_cons] *)
//
end (*let*) // end of [f0_id0(env0,s1t0)]
//
(* ****** ****** *)
//
fun
f0_a1pp
( env0:
! tr12env
, s1t0: sort1): sort2 =
let
//
val-
S1Ta1pp
(s1t1, s1t2) = s1t0.node()
//
in
//
if
isPLUS(s1t1)
then
sort2_polpos
(trans12_sort1(env0,s1t2))
else
if
isMNUS(s1t1)
then
sort2_polneg
(trans12_sort1(env0,s1t2))
else
let
//
val
s2t1 = trans12_sort1(env0,s1t1)
val
s2ts =
(
case+
s1t2.node() of
|
S1Tlist(s1ts) =>
trans12_sort1lst(env0,s1ts)
|
_(*non-S1Tlist*) =>
list_sing(trans12_sort1(env0,s1t2))
) : sort2lst // end of [val]
//
in
  S2Tapps(s2t1, s2ts)
end (*let*) // end-of-[else]
//
end (*let*) // end-of-[f0_a1pp(env0,s1t0)]
//
fun
f0_a2pp
( env0:
! tr12env
, s1t0: sort1): sort2 =
let
//
(*
val () =
println!
("\
trans12_sort1: f0_a2pp: s1t0 = ", s1t0)
*)
//
val-
S1Ta2pp
( s1t1
, s1t2, s1t3) = s1t0.node()
//
in//let
//
if
isARRW(s1t1)
then
(
  S2Tf1un(s2ts, s2t3)) where
{
val s2ts =
(
case+
s1t2.node() of
| S1Tlist(s1ts) =>
trans12_sort1lst(env0, s1ts)
| _(*non-S1Tlist*) =>
list_sing(trans12_sort1(env0, s1t2))
) : sort2lst // [val s2ts]
val s2t3 = trans12_sort1(env0, s1t3)
} (*where*) // end-of-then
else let
val s2t1 = trans12_sort1(env0, s1t1)
val s2t2 = trans12_sort1(env0, s1t2)
val s2t3 = trans12_sort1(env0, s1t3)
in//let
  S2Tapps(s2t1, list_pair(s2t2, s2t3))
end (*let*) // end of-else
//
end (*let*) // end-of-[f0_a2pp(env0,s1t0)]
//
(* ****** ****** *)
//
fun
f0_list
( env0:
! tr12env
, s1t0: sort1): sort2 =
let
//
val-
S1Tlist(s1ts) = s1t0.node()
//
in
if
list_singq(s1ts)
then
(
  trans12_sort1(env0, s1t1)
) where
{
  val s1t1 = list_head(s1ts)
}
else
(
S2Ttup
(trans12_sort1lst(env0, s1ts))
)
end (*let*) // end of [f0_list(env0,s1t0)]
//
(* ****** ****** *)
//
} (*where*) // end of [trans12_sort1(env0,s1t0)]

(* ****** ****** *)

#implfun
trans12_s1exp
( env0,s1e0 ) = let
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
S1Eb1sh _ => f0_b1sh(env0, s1e0)
//
|
S1El1st _ => f0_l1st(env0, s1e0)
|
S1El2st _ => f0_l2st(env0, s1e0)
//
|
S1Et1up _ => f0_t1up(env0, s1e0)
//
|
S1Eanno _ => f0_anno(env0, s1e0)
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
( env0:
! tr12env
, s1e0: s1exp): s2exp =
(
trans12_s1exp(env0, s1e1)) where
{
  val-S1Eb1sh(s1e1) = s1e0.node()
} (*where*) // end of [f0_b1sh(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_l1st
( env0:
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
  trans12_s1exp(env0, s1e1)
end (*let*) // end of [then]
else
(
s2exp_l1st(trans12_s1explst(env0, s1es))
)
end (*let*) // end of [f0_l1st(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_l2st
( env0:
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
val ses2 = trans12_s1explst(env0, ses2) }
)
else
(
s2exp_l2st(ses1, ses2) where
{
val ses1 = trans12_s1explst(env0, ses1)
val ses2 = trans12_s1explst(env0, ses2) }
)
end (*let*) // end of [f0_l2st(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_t1up
( env0:
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
  trans12_s1explst_impr(env0, s1es) }
end (*let*) // end of [f0_t1up(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_t2up
( env0:
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
  trans12_s1explst_impr(env0, ses1)
  val ses2 =
  trans12_s1explst_prgm(env0, ses2) }
end (*let*) // end of [f0_t2up(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_r1cd
( env0:
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
  trans12_l1s1elst_impr(env0, lses) }
end (*let*) // end of [f0_r1cd(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_anno
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Eanno
(s1e1, s1t2) = s1e0.node()
val
s2t2 = trans12_sort1(env0, s1t2)
in//let
  trans12_s1exp_sort(env0, s1e1, s2t2)
end (*let*) // end of [f0_anno(env0, s1e0)]
//
(* ****** ****** *)
//
} (*where*) // end of [trans12_s1exp(env0,s1e0)]

(* ****** ****** *)

#implfun
trans12_sort1lst
  (env0, s1ts) =
list_trans12_fnp(env0, s1ts, trans12_sort1)

(* ****** ****** *)

#implfun
trans12_t1arglst
  (env0, t1as) =
list_trans12_fnp(env0, t1as, trans12_t1arg)

(* ****** ****** *)

#implfun
trans12_t1maglst
  (env0, tmas) =
list_trans12_fnp(env0, tmas, trans12_t1mag)

(* ****** ****** *)

#implfun
trans12_s1explst
  (env0, s1es) =
list_trans12_fnp(env0, s1es, trans12_s1exp)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_staexp.dats] *)
