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
#symload lctn with s1arg_get_lctn
#symload node with s1arg_get_node
#symload lctn with s1mag_get_lctn
#symload node with s1mag_get_node
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with t1arg_get_lctn
#symload node with t1arg_get_node
#symload lctn with t1mag_get_lctn
#symload node with t1mag_get_node
(* ****** ****** *)
#symload lctn with s1qua_get_lctn
#symload node with s1qua_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
//
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
//
(* ****** ****** *)

#implfun
trans12_sort1
( env0,s1t0 ) = let
// (*
val
loc0 = s1t0.lctn()
(*
val () =
prerrln
("trans12_sort1: s1t0 = ", s1t0)
*)
// *)
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
(tid1) = s1t0.node()
val
topt =
tr12env_find_s2tex(env0,tid1)
//
in//let
//
case+ topt of
//
| ~
optn_vt_nil() => S2Tid0(tid1)
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
prerrln
("trans_sort1: f0_a2pp: s1t0 = ", s1t0)
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
  S2Tfun1(s2ts, s2t3)) where
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
trans12_s1tex
( env0,s1t0 ) = let
//
(*
val
loc0 = s1t0.lctn()
val () =
prerrln
("trans12_s1tex: s1t0 = ", s1t0)
*)
//
in//let
//
case+
s1t0.node() of
//
|
S1Tid0(tid1) =>
(
case+ topt of
//
| ~
optn_vt_nil() =>
(
let
val
s2t1 =
S2Tid0(tid1) in
S2TEXsrt(s2t1) end
)
| ~
optn_vt_cons(s2tx) => s2tx
) where
{
val
topt =
tr12env_find_s2tex(env0,tid1)
} (*where*) // end of [S1Tid0]
//
|
_(*non-S1Tid0*) =>
S2TEXsrt(trans12_sort1(env0, s1t0))
//
end (*let*) // end of [trans12_s1tex(env0,s1t0)]

(* ****** ****** *)

#implfun
trans12_s1arg
( env0,s1a0 ) =
(
case+
s1a0.node() of
|
S1ARGsome
(tok1, topt) =>
let
//
val sym1 =
sargid_sym(tok1)
//
in//let
//
case+ topt of
|
optn_nil() =>
s2var_make_name(sym1)
|
optn_cons(s1t2) =>
(
    s2v1 ) where
{
val s2t2 =
trans12_sort1(env0, s1t2)
val s2v1 =
s2var_make_idst(sym1, s2t2)
val (  ) =
tr12env_add0_s2var(env0, s2v1)}
//
end (*let*) // end of [S1ARGsome]
) where
{
  // HX-2022-10-24: nothing
} (*where*) // end of [trans12_s1arg(env0,s1a0)

(* ****** ****** *)

#implfun
trans12_s1mag
( env0,s1ma ) =
(
case+
s1ma.node() of
|
S1MAGlist(s1as) =>
trans12_s1arglst(env0, s1as)) where
{
//
(*
val
loc0 = s1ma.lctn()
val () =
prerrln("trans12_s1mag: s1ma = ", s1ma)
*)
//
} (*where*) // end of [trans12_s1mag(env0,s1ma)

(* ****** ****** *)

#implfun
trans12_t1arg
( env0,t1a0 ) =
(
case+
t1a0.node() of
|
T1ARGsome
(s1t1, topt) =>
trans12_sort1(env0, s1t1)) where
{
//
(*
val
loc0 = t1a0.lctn()
val () =
prerrln("trans12_t1arg: t1a0 = ", t1a0)
*)
//
} (*where*) // end of [trans12_t1arg(env0,t1a0)

(* ****** ****** *)

#implfun
trans12_t1mag
( env0,t1ma ) =
(
case+
t1ma.node() of
|
T1MAGlist(t1as) =>
trans12_t1arglst(env0, t1as)) where
{
//
(*
val
loc0 = t1ma.lctn()
val () =
prerrln("trans12_t1mag: t1ma = ", t1ma)
*)
//
} (*where*) // end of [trans12_t1mag(env0,t1ma)

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
|
S1Eid0 _ =>
f0_id0(env0, s1e0)
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
S1Ea1pp _ => f0_a1pp(env0, s1e0)
|
S1Ea2pp _ => f0_a2pp(env0, s1e0)
//
|
S1Et1up _ => f0_t1up(env0, s1e0)
|
S1Et2up _ => f0_t2up(env0, s1e0)
|
S1Er1cd _ => f0_r1cd(env0, s1e0)
|
S1Er2cd _ => f0_r2cd(env0, s1e0)
//
|
S1Elam0 _ => f0_lam0(env0, s1e0)
//
|
S1Eannot _ => f0_annot(env0, s1e0)
//
|
S1Equal0 _ => f0_qual0(env0, s1e0)
//
| _(* otherwise *) => s2exp_none1(s1e0)
//
end where
{
//
(* ****** ****** *)
fun
isANY
( s1e0
: s1exp): bool =
(
case+
s1e0.node() of
| S1Eid0(sid1) =>
  (sid1 = WCARD_symbl)
| _(*non-S1Eid0*) => false)
(* ****** ****** *)
//
fun
f0_id0
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
val-
S1Eid0(sid1) = s1e0.node()
val
sopt =
tr12env_find_s2itm(env0,sid1)
in//let
case+ sopt of
| ~
optn_vt_nil
() => s2exp_none1(s1e0)
| ~
optn_vt_cons
(s2i0) => f0_id0_s2i(env0,s1e0,s2i0)
end (*let*) // end of [f0_id0(env0,s1e0)]
//
and
f0_id0_s2i
( env0:
! tr12env
, s1e0: s1exp
, s2i0: s2itm): s2exp =
(
//
case- s2i0 of
|
S2ITMvar
( s2v0 ) => f0_id0_s2v(env0,s1e0,s2v0)
|
S2ITMcst
( s2cs ) => f0_id0_s2c(env0,s1e0,s2cs)
//
) (*case-*) // end of [f0_id0_s2i(env0,...)]
//
and
f0_id0_s2v
( env0:
! tr12env
, s1e0: s1exp
, s2v0: s2var): s2exp = s2exp_var(s2v0)
//
and
f0_id0_s2c
( env0:
! tr12env
, s1e0: s1exp
, s2cs: s2cstlst): s2exp =
let
//
val () =
prerrln
("f0_id0_s2c: s1e0 = ", s1e0)
val () =
prerrln
("f0_id0_s2c: s2cs = ", s2cs)
//
val
opt0 = s2cst_select_any(s2cs)
in//let
case+ opt0 of
| ~optn_vt_nil() => s2exp_none1(s1e0)
| ~optn_vt_cons(s2c0) => s2exp_cst(s2c0)
end (*let*) // end of [f0_id0_cst(env0,...)]
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
val loc0 = s1e0.lctn()
//
val-
S1El1st(s1es) = s1e0.node()
//
(*
val ( ) =
prerrln
("trans12_s1exp: f0_l1st: loc0 = ", loc0)
val ( ) =
prerrln
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
s2exp_l1st
(loc0, trans12_s1explst(env0, s1es))
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
val loc0 = s1e0.lctn()
//
val-
S1El2st
(ses1, ses2) = s1e0.node()
//
(*
val
loc0 = s1e0.lctn()
val ( ) =
prerrln
("trans12_s1exp: f0_l2st: loc0 = ", loc0)
val ( ) =
prerrln
("trans12_s1exp: f0_l2st: s1e0 = ", s1e0)
*)
//
in
if
list_nilq(ses1)
then
(
s2exp_l1st(loc0, ses2) where
{
val ses2 =
trans12_s1explst_impr(env0, ses2) }
)
else
(
s2exp_l2st(loc0, ses1, ses2) where
{
val ses1 =
  trans12_s1explst_impr(env0, ses1)
val ses2 =
  trans12_s1explst_prgm(env0, ses2) }
)
end (*let*) // end of [f0_l2st(env0, s1e0)]
//
(* ****** ****** *)
//
fun
isEXTP
( s1e0
: s1exp): bool =
(
case+
s1e0.node() of
| S1Eid0(sid1) =>
(
if
(sid1 =
 DLR_EXTBOX_symbl)
then true else
(sid1 =
 DLR_EXTYPE_symbl) )
| _(*non-S1Eid0*) => false
) (*case+*) // end-of-(isEXTP)
//
fun
f0_a1pp
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Ea1pp
(s1f0, s1e1) = s1e0.node()
//
in(*in-of-let*)
//
case+
s1f0.node() of
//
| S1Euni0 _ =>
  f0_a1pp_uni0( env0, s1e0 )
| S1Eexi0 _ =>
  f0_a1pp_exi0( env0, s1e0 )
//
(*
| _ when
  isCBV0(s1f0) =>
  f0_a1pp_cbv0( env0, s1e0 )
| _ when
  isCBV1(s1f0) =>
  f0_a1pp_cbv1( env0, s1e0 )
| _ when
  isCBRF(s1f0) =>
  f0_a1pp_cbrf( env0, s1e0 )
*)
//
(*
| _ when
  isTOP0(s1f0) =>
  f0_a1pp_top0( env0, s1e0 )
| _ when
  isTOP1(s1f0) =>
  f0_a1pp_top1( env0, s1e0 )
//
*)
| _ when
  isEXTP(s1f0) =>
(
  f0_a1pp_extp( env0, s1e0 ))
//
|
_(*S1E...*) => f0_a1pp_else(env0, s1e0)
//
end (*let*) // end of [f0_a1pp(env0, s1e0)]

(* ****** ****** *)

and
f0_a1pp_uni0
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Ea1pp
(s1f0, s1e1) = s1e0.node()
//
val-
S1Euni0(s1qs) = s1f0.node()
//
(*
val () =
prerrln
("trans12_s1exp: f0_a1pp_uni0: s1qs = ", s1qs)
*)
//
val () =
tr12env_pshlam0(env0)
//
val
(s2vs, s2ps) =
trans12_s1qualst(env0, s1qs)
//
val
s2e1 =
trans12_s1exp_impr(env0, s1e1)
//
val () = tr12env_poplam0(env0)
//
in
//
s2exp_uni0(s2vs, s2ps, s2e1(*body*))
end (*let*) // end of [f0_a1pp_uni0(...)]

(* ****** ****** *)

and
f0_a1pp_exi0
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Ea1pp
(s1f0, s1e1) = s1e0.node()
//
val-
S1Eexi0
( tknd, s1qs ) = s1f0.node()
//
(*
val () =
prerrln
("trans12_s1exp: f0_a1pp_exi0: s1qs = ", s1qs)
*)
//
val () =
tr12env_pshlam0(env0)
//
val
(s2vs, s2ps) =
trans12_s1qualst(env0, s1qs)
//
val
s2e1 =
trans12_s1exp_impr(env0, s1e1)
//
val () = tr12env_poplam0(env0)
//
in
//
s2exp_exi0(s2vs, s2ps, s2e1(*body*))
end (*let*) // end of [f0_a1pp_exi0(...)]

(* ****** ****** *)

and
f0_a1pp_extp
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Ea1pp
(s1f0, s1e1) = s1e0.node()
//
val
targ = the_sort2_type
//
val tres =
let
val-
S1Eid0(sid1) = s1f0.node()
in//let
if
(
sid1 =
DLR_EXTBOX_symbl)
then the_sort2_tbox
else the_sort2_type end : sort2
//
val s1es =
(
case+
s1e1.node() of
|
S1El1st(s1es) => s1es
|
_(*non-list*) => list_sing(s1e1)
) : s1explst // end [ val(s1es) ]
//
val
tnm1 =
(
case+ s1es of
|
list_nil() => "*ERROR*"
|
list_cons
(s1nm, s1es) =>
(
case+ s1nm.node() of
|
S1Estr(s0) =>
token2sstr(s0) | _ => "*ERROR*")
) : string // end of [ val(tnm1) ]
//
val
s2es =
(
case+ s1es of
|
list_nil() =>
list_nil()
|
list_cons
(s1nm, s1es) =>
trans12_s1explst_stck1(env0,s1es,targ))
: s2explst // end of [ val(s2es) ]
//
in//let
s2exp_make_node(tres,S2Etext(tnm1,s2es))
end (*let*) // end of [f0_a1pp_extp(...)]

(* ****** ****** *)

and
f0_a1pp_else
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Ea1pp
(s1f0, s1e1) = s1e0.node()
//
val
s2cs =
s1exp_get_s2cstlst(env0,s1f0)
//
in//let
//
case+ s2cs of
|
list_nil() =>
(
  f0_a1pp_els0(env0, s1e0) )
|
list_cons
(s2c1, scs2) =>
(
if
list_nilq(scs2)
then
let
  val s2f0 = s2exp_cst(s2c1)
in
  f0_a1pp_els1(env0, s1e0, s2f0)
end (*let*) // then
else
(
  f0_a1pp_els2(env0, s1e0, s2cs)
) (* end of [else] *)
)
end (*let*) // end of [f0_a1pp_else(env0,s1e0)]

and
f0_a1pp_els0
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Ea1pp
(s1f0, s1e1) = s1e0.node()
//
val
s2f0 = trans12_s1exp(env0, s1f0)
//
in//let
  f0_a1pp_els1(env0, s1e0, s2f0)
end (*let*) // end of [f0_a1pp_els0(...)]

and
f0_a1pp_els1
( env0:
! tr12env
, s1e0: s1exp
, s2f0: s2exp): s2exp =
let
//
val-
S1Ea1pp
(s1f0, s1e1) = s1e0.node()
//
val s1es =
(
case+
s1e1.node() of
|
S1El1st(s1es) => s1es
|
_(*non-list*) => list_sing(s1e1)
) : s1explst // end of [val (s1es)]
//
val s2ts =
(
case+
s2f0.sort() of
|
S2Tfun1(s2ts, _) => s2ts
|
_(*non-S2Tfun1*) => list_nil(*nil*)
) : sort2lst // end of [val (s2ts) ]
//
in//let
( s2exp_apps
  (loc0, s2f0, s2es) ) where
{
//
val loc0 = s1e0.lctn()
//
val s2es =
trans12_s1explst_stcks(env0, s1es, s2ts) }
//
end (*let*) // end of [f0_a1pp_els1(...)]

and
f0_a1pp_els2
( env0:
! tr12env
, s1e0: s1exp
, s2cs: s2cstlst): s2exp =
let
//
val-
S1Ea1pp
(s1f0, s1e1) = s1e0.node()
//
val s1es =
(
case+
s1e1.node() of
|
S1El1st(s1es) => s1es
|
_(*non-list*) => list_sing(s1e1)
) : s1explst // end of [val (s1es)]
//
val
s2es =
trans12_s1explst(env0, s1es)
//
val scs1 =
s2cst_selects_list(s2cs, s2es)
//
in//let
//
case+ scs1 of
|list_nil() =>
f0_a1pp_els0(env0, s1e0)
|list_cons _ =>
f0_a1pp_els1(env0,s1e0,s2exp_csts(scs1))
//
end (*let*) // end of [f0_a1pp_els2(...)]

(* ****** ****** *)
//
fun
isAXCG
( s1e0
: s1exp): bool =
(
case+
s1e0.node() of
| S1Eid0(sid1) =>
  (sid1 = AXCG_symbl)
| _(*non-S1Eid0*) => false
)
fun
isARRW
( s1e0
: s1exp): bool =
(
case+
s1e0.node() of
| S1Eid0(sid1) =>
  (sid1 = MSGT_symbl)
| _(*non-S1Eid0*) => false
)
//
(* ****** ****** *)
//
fun
f0_a2pp
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
(*
val () =
prerrln
("trans12_s1exp: f0_a2pp: s1e0 = ", s1e0)
*)
//
val-
S1Ea2pp
(s1f0
,s1e1, s2e2) = s1e0.node()
//
val
s2cs =
s1exp_get_s2cstlst(env0,s1f0)
//
(*
val () =
prerrln
("trans12_s1exp: f0_a2pp: s2cs = ", s2cs)
*)
//
in//let
//
case+ s2cs of
|
list_nil
((*void*)) =>
(
  f0_a2pp_els0(env0, s1e0) )
|
list_cons
(s2c1, scs2) =>
(
if
list_nilq(scs2)
then
let
val s2f0 = s2exp_cst(s2c1)
in//let
  f0_a2pp_els1(env0, s1e0, s2f0)
end
else
(
  f0_a2pp_els2(env0, s1e0, s2cs))
) (* end of [list_cons] *)
//
end (*let*) // end of [f0_a2pp(env0, s1e0)]
//
(* ****** ****** *)

and
f0_a2pp_els0
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Ea2pp
(s1f0
,s1e1, s1e2) = s1e0.node()
//
in//let
//
if
isARRW(s1f0)
then let
//
val s2es =
(
case+
s1e1.node() of
|
S1El1st(s1es) =>
trans12_s1explst_impr(env0, s1es)
|
S1El2st(ses1, ses2) =>
(
list_append(ses1, ses2)) where
{
val ses1 =
trans12_s1explst_impr(env0, ses1)
val ses2 =
trans12_s1explst_prgm(env0, ses2)
}
| _(*non-S1El?st*) =>
list_sing
(
trans12_s1exp_impr(env0, s1e1))
) : s2explst // end-of-val(s2es)
//
val npf1 =
(
case+
s1e1.node() of
|
S1El2st(xs, _) =>
list_length(xs) | _ => -1): sint
//
in//let
  s2exp_fun1_all
  (npf1, s2es, s2e2) where
{ val
  s2e2 =
  trans12_s1exp_impr(env0, s1e2) }
end // end of [then]
else
(
case+
s1f0.node() of
|
_ (* non-S2Earrw(...) *) =>
let
val
s2f0 =
trans12_s1exp(env0, s1f0)
in//let
  f0_a2pp_els1(env0, s1e0, s2f0)
end (*let*) // end of [non-S2Earrw]
) (*case+*) // end of [else]
//
end (*let*) // end of [f0_a2pp_els0(...)]

(* ****** ****** *)

and
f0_a2pp_els1
( env0:
! tr12env
, s1e0: s1exp
, s2f0: s2exp): s2exp =
let
//
val loc0 = s1e0.lctn()
//
val-
S1Ea2pp
(s1f0
,s1e1, s1e2) = s1e0.node()
//
val s2t1 =
(
case+
s2f0.sort() of
| S2Tfun1(s2ts, _) =>
  list_get_at(s2ts, 0)
| _(*non-S2Tfun*) => S2Tnone0()
) : sort2 // end of [val s2t1]
//
val s2t2 =
(
case+
s2f0.sort() of
| S2Tfun1(s2ts, _) =>
  list_get_at(s2ts, 1)
| _(*non-S2Tfun*) => S2Tnone0()
) : sort2 // end of [val s2t2]
//
val s2e1 =
trans12_s1exp_stck(env0, s1e1, s2t1)
val s2e2 =
trans12_s1exp_stck(env0, s1e2, s2t2)
//
in
  s2exp_a2pp(loc0, s2f0, s2e1, s2e2)
end (*let*) // end of [f0_a2pp_els1(...)]

(* ****** ****** *)

and
f0_a2pp_els2
( env0:
! tr12env
, s1e0: s1exp
, s2cs: s2cstlst): s2exp =
let
//
val-
S1Ea2pp
(s1f0
,s1e1, s1e2) = s1e0.node()
//
val
s2e1 = trans12_s1exp(env0, s1e1)
val
s2e2 = trans12_s1exp(env0, s1e2)
//
val scs1 =
s2cst_selects_bin
(s2cs, s2t1, s2t2) where
{
val
s2t1=s2e1.sort() and s2t2=s2e2.sort()}
//
in//let
//
case+ scs1 of
|list_nil() =>
f0_a2pp_els0(env0, s1e0)
|list_cons _ =>
f0_a2pp_els1(env0,s1e0,s2exp_csts(scs1))
//
end (*let*) // end of [f0_a2pp_els2(...)]

(* ****** ****** *)
//
fun
f0_t1up
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val
loc0 = s1e0.lctn()
val-
S1Et1up
(tknd, s1es) = s1e0.node()
//
(*
val ( ) =
prerrln
("trans12_s1exp: f0_t1up: loc0 = ", loc0)
val ( ) =
prerrln
("trans12_s1exp: f0_t1up: s1e0 = ", s1e0)
*)
//
in//let
(
  s2exp_t1up
  (loc0, tknd, s2es)) where
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
val
loc0 = s1e0.lctn()
val-
S1Et2up
( tknd
, ses1, ses2) = s1e0.node()
//
(*
val ( ) =
prerrln
("trans12_s1exp: f0_t2up: loc0 = ", loc0)
val ( ) =
prerrln
("trans12_s1exp: f0_t2up: s1e0 = ", s1e0)
*)
//
in//let
(
  s2exp_t2up
  (loc0, tknd, ses1, ses2)) where
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
val
loc0 = s1e0.lctn()
val-
S1Er1cd
(tknd, lses) = s1e0.node()
//
(*
val ( ) =
prerrln
("trans12_s1exp: f0_r1cd: loc0 = ", loc0)
val ( ) =
prerrln
("trans12_s1exp: f0_r1cd: s1e0 = ", s1e0)
*)
//
in//let
(
  s2exp_r1cd
  (loc0, tknd, lses)) where
{
  val lses =
  trans12_l1s1elst_impr(env0, lses)
  val () =
  prerrln
  ("trans12_s1exp: f0_r1cd: lses = ", lses)
}
end (*let*) // end of [f0_r1cd(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_r2cd
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val
loc0 = s1e0.lctn()
val-
S1Er2cd
( tknd
, lss1, lss2) = s1e0.node()
//
(*
val ( ) =
prerrln
("trans12_s1exp: f0_r2cd: loc0 = ", loc0)
val ( ) =
prerrln
("trans12_s1exp: f0_r2cd: s1e0 = ", s1e0)
*)
//
in//let
(
  s2exp_r2cd
  (loc0, tknd, lss1, lss2)) where
{
  val lss1 =
  trans12_l1s1elst_impr(env0, lss1)
  val lss2 =
  trans12_l1s1elst_prgm(env0, lss2) }
end (*let*) // end of [f0_r2cd(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Elam0
( smas
, tres, s1e1) = s1e0.node()
//
val
svss =
trans12_s1maglst(env0, smas)
val
tres =
trans12_sort1opt(env0, tres)
//
in//let
  s2exp_lams(svss, s2e1) where
{
val
s2e1 =
(
case+ tres of
|optn_nil() =>
trans12_s1exp(env0, s1e1)
|optn_cons(s2t1) =>
trans12_s1exp_stck(env0, s1e1, s2t1)
) : s2exp // end of [val(s2e1)]
}
end (*let*) // end of [f0_lam0(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val-
S1Eannot
(s1e1, s1t2) = s1e0.node()
val
s2t2 = trans12_sort1(env0, s1t2)
in//let
  trans12_s1exp_stck(env0, s1e1, s2t2)
end (*let*) // end of [f0_annot(env0, s1e0)]
//
(* ****** ****** *)
//
fun
f0_qual0
( env0:
! tr12env
, s1e0: s1exp): s2exp =
let
//
val loc0 = s1e0.lctn()
//
val-
S1Equal0
(tok1, s1e2) = s1e0.node()
//
val () =
prerrln("f0_qual0: tok1 = ", tok1)
val () =
prerrln("f0_qual0: s1e2 = ", s1e2)
//
in//let
case+
tok1.node() of
|
T_IDQUA(name) =>
let
val
sym1 =
symbl_make_name(name)
val
opt1 =
tr12env_find_s2itm(env0, sym1)
val () =
prerrln("f0_qual0: opt1 = ", opt1)
in//let
case+ opt1 of
| ~
optn_vt_nil() =>
s2exp_none1(s1e0)
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
| S2ITMenv(envs) =>
  f1_s2exp(envs, s1e2)
|
_(*non-S2ITMenv*) => s2exp_none1(s1e0)
)
end (*let*)//end-of-[T_IDQUA(...)]
|_(*non-T_IDQUA*) => s2exp_none1(s1e0)
end where
{
fun
f1_s2exp
( envs
: f2envlst, sexp: s1exp): s2exp =
(
case+
sexp.node() of
|S1Eid0(seid) =>
let
val dopt =
f2envlst_find_d2itm(envs, seid)
in//let
case+ dopt of
| ~
optn_vt_nil() => s2exp_none1(sexp)
| ~
optn_vt_cons(sitm) =>
(
case+ sitm of
|S2ITMcst(s2cs) =>
let
val
sopt = s2cst_select_any(s2cs)
in//let
case+ sopt of
| ~
optn_vt_nil() => s2exp_none1(sexp)
| ~
optn_vt_cons(scst) => s2exp_cst(scst)
end
|_(*non-con-cst*) => s2exp_none1(sexp)
)
end(*let*)//end of [ S1Eid0(seid) ]
|_(* otherwise *) => s2exp_none1(sexp)
)
}(*where*)//end of [f0_qual0(env0,s1e0)]

(* ****** ****** *)
//
} (*where*)//end of [trans12_s1exp(env0,s1e0)]
//
(* ****** ****** *)

#implfun
trans12_s1exp_impr
( env0,s1e0 ) = let
val
s2e0 =
trans12_s1exp(env0, s1e0)
val
s2t0 = s2e0.sort((*void*))
in//let
if
lte_sort2_sort2
(s2t0, the_sort2_view)
then s2e0 else
s2exp_impr(s1e0.lctn(), s2e0)
end (*let*)//end-of[trans12_s1exp_impr(env0,s1e0)]

#implfun
trans12_l1s1e_impr
( env0,ls1e ) =
(
S2LAB(l0, s2e0)) where
{
val
S1LAB(l0, s1e0) = ls1e
val s2e0 =
trans12_s1exp_impr(env0, s1e0)
} (*where*)//end-of[trans12_l1s1e_impr(env0,ls1e)]

(* ****** ****** *)

#implfun
trans12_s1exp_prgm
( env0,s1e0 ) = let
val
s2e0 =
trans12_s1exp(env0, s1e0)
val
s2t0 = s2e0.sort((*void*))
in//let
if
lte_sort2_sort2
(s2t0, the_sort2_vwtp)
then s2e0 else
s2exp_prgm(s1e0.lctn(), s2e0)
end (*let*)//end-of[trans12_s1exp_impr(env0,s1e0)]

#implfun
trans12_l1s1e_prgm
( env0,ls1e ) =
(
S2LAB(l0, s2e0)) where
{
val
S1LAB(l0, s1e0) = ls1e
val s2e0 =
trans12_s1exp_prgm(env0, s1e0)
} (*where*)//end-of[trans12_l1s1e_prgm(env0,ls1e)]

(* ****** ****** *)

#implfun
trans12_s1exp_stck
(env0, s1e1, s2t2) =
let
val
s2e1 =
trans12_s1exp(env0, s1e1)
val
s2t1 = s2e1.sort((*void*))
val
subq =
lte_sort2_sort2(s2t1, s2t2)
in//let
if subq
then s2e1 else
s2exp_cast(s1e1.lctn(), s2e1, s2t2)
end (*let*)//end-of[trans12_s1exp_stck(env0,...)]

(* ****** ****** *)
//
#implfun
trans12_sort1lst
  (env0, s1ts) =
list_trans12_fnp(env0, s1ts, trans12_sort1)
#implfun
trans12_sort1opt
  (env0, sopt) =
optn_trans12_fnp(env0, sopt, trans12_sort1)
//
(* ****** ****** *)

#implfun
trans12_s1arglst
  (env0, s1as) =
list_trans12_fnp(env0, s1as, trans12_s1arg)

(* ****** ****** *)

#implfun
trans12_s1maglst
  (env0, smas) =
list_trans12_fnp(env0, smas, trans12_s1mag)

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
//
#implfun
trans12_s1explst
  (env0, s1es) =
list_trans12_fnp(env0, s1es, trans12_s1exp)
//
#implfun
trans12_s1expopt
  (env0, sopt) =
optn_trans12_fnp(env0, sopt, trans12_s1exp)
//
(* ****** ****** *)
//
#implfun
trans12_s1explst_stck1
  (env0, s1es, s2t2) =
(
list_map_e1nv
<x0><y0><e1>(s1es, env0)) where
{
//
#typedef x0 = s1exp
#typedef y0 = s2exp
#vwtpdef e1 = tr12env
//
#impltmp
map$fopr_e1nv
<x0><y0><e1>(s1e1, env0) =
trans12_s1exp_stck(env0, s1e1, s2t2)
} (*where*)//end of [trans12_s1explst_stck1]
//
(* ****** ****** *)
//
#implfun
trans12_s1explst_stcks
  (env0, s1es, s2ts) =
(
auxlst
(env0, s1es, s2ts)) where
{
//
fun
auxlst
( env0:
! tr12env
, s1es: s1explst
, s2ts: sort2lst): s2explst =
(
case+ s1es of
|
list_nil() =>
(
case+ s2ts of
|
list_nil() =>
list_nil()
|
list_cons(s2t1, s2ts) =>
list_cons(s2e1, s2es) where
{
val s2e1 =
s2exp_make_node
(s2t1, S2Enone0())
val s2es = auxlst(env0, s1es, s2ts)
}
)
|
list_cons(s1e1, s1es) =>
(
case+ s2ts of
|
list_nil() =>
list_cons(s2e1, s2es) where
{
val s2e1 =
let
val
s2t1 =
sort2_none0()
in//let
trans12_s1exp_stck
( env0, s1e1, s2t1 )
end//end-[val(s2e1)]
val s2es = auxlst(env0, s1es, s2ts) }
|
list_cons(s2t1, s2ts) =>
list_cons(s2e1, s2es) where
{
val s2e1 =
trans12_s1exp_stck
( env0, s1e1, s2t1 )
val s2es = auxlst(env0, s1es, s2ts) }
)
) (*case+*)//end of [auxlst(env0,s1es,s2ts)]
//
} (*where*)//end of [trans12_s1explst_stck1]
//
(* ****** ****** *)
//
#implfun
trans12_s1explst_impr
  (env0, s1es) =
list_trans12_fnp(env0, s1es, trans12_s1exp_impr)
//
#implfun
trans12_s1explst_prgm
  (env0, s1es) =
list_trans12_fnp(env0, s1es, trans12_s1exp_prgm)
//
(* ****** ****** *)
//
#implfun
trans12_l1s1elst_impr
  (env0, s1es) =
list_trans12_fnp(env0, s1es, trans12_l1s1e_impr)
//
#implfun
trans12_l1s1elst_prgm
  (env0, s1es) =
list_trans12_fnp(env0, s1es, trans12_l1s1e_prgm)
//
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
(*
HX-2022-11-19:
[auxs2vs]:
Note that:
The newly created s2vs are
immediately added to [env0]!
*)
fun
auxs2vs
( env0:
! tr12env
, toks
: tokenlst
, tvar: sort2
, s2vs
: s2varlst_vt): s2varlst_vt =
(
case+ toks of
|
list_nil() => s2vs
|
list_cons(tok1, toks) =>
(
auxs2vs
( env0, toks, tvar
, list_vt_cons(s2v1, s2vs))) where
{
val sym1 = sargid_sym(tok1)
val s2v1 = s2var_make_idst(sym1, tvar)
val (  ) = tr12env_add0_s2var(env0, s2v1)
}
) (*case+*) // end of [auxs2vs[env0,toks,...])
//
(* ****** ****** *)
//
fun
auxloop
( env0:
! tr12env
, s1qs: s1qualst
, s2vs: s2varlst_vt
, s2ps: s2explst_vt)
: (s2varlst, s2explst) =
(
case+ s1qs of
|
list_nil() =>
(s2vs, s2ps) where
{
val
s2vs =
list_vt2t
(list_vt_reverse0(s2vs))
val
s2ps =
list_vt2t
(list_vt_reverse0(s2ps)) }
|
list_cons
(s1q1, s1qs) =>
(
case+
s1q1.node() of
|
S1QUAprop(s1p1) =>
let
//
val tbtf =
the_sort2_bool
val s2p1 =
trans12_s1exp_stck
(env0, s1p1, tbtf)
val s2ps =
list_vt_cons(s2p1, s2ps)
//
in//let
  auxloop(env0, s1qs, s2vs, s2ps)
end (*let*) // end-of-(S1QUAprop)
|
S1QUAvars(toks, topt) =>
let
val
topt =
trans12_sort1opt(env0, topt)
val
tvar =
(
case+ topt of
|
optn_nil() =>
sort2_none0()
|
optn_cons(s2t0) => s2t0):sort2
//
val
s2vs =
auxs2vs(env0, toks, tvar, s2vs)
//
in//let
  auxloop(env0, s1qs, s2vs, s2ps)
end (*let*) // end of [S1QUAvars(...)]
)
) (*case+*) // end of [auxloop(env0,s1qs,...)]
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
trans12_s1qualst
  (env0, s1qs) =
(
auxloop
( env0, s1qs
, s2vs, s2ps)) where
{
val s2vs = list_vt_nil() and s2ps = list_vt_nil()
} (*where*) // end of [trans12_s1qualst(env0, s1qs)]
//
end (*local*) // end of [local(trans12_s1qualst(...))]
//
(* ****** ****** *)

#implfun
trans12_s1arg_tsub
  (env0, s1a0) =
(
//
case+
s1a0.node() of
|
S1ARGsome
(tok1, topt) =>
let
val
sid1 = sargid_sym(tok1)
in//let
//
case+ topt of
|
optn_nil() =>
(s2v1, sps1) where
{
val
sps1 = list_nil()
val
s2v1 = s2var_make_name(sid1) }
|
optn_cons(s1t1) =>
let
//
val s2tx =
trans12_s1tex(env0, s1t1)
//
in//let
//
case+ s2tx of
|
S2TEXsrt
(   s2t1   ) =>
(s2v1, sps1) where
{
val sps1 = list_nil()
val s2v1 =
s2var_make_idst(sid1, s2t1) }
|
S2TEXsub
(s2v0, sps0) =>
(s2v1, sps1) where
{
  val s2t1 = s2v0.sort()
  val s2v1 =
  s2var_make_idst(sid1, s2t1)
  val sps1 =
  s2explst_revar0(sps0,s2v0,s2v1) }
//
end (*let*) // end of [optn_cons(...)]
end (*let*) // end of [S1ARGsome(...)]
//
) where {
(*
  val () =
  prerrln("trans12_s1arg_tsub: s1a0 = ", s1a0)
*)
} (*where*) // end of [trans12_s1arg_tsub(env0,s1a0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_staexp.dats] *)
