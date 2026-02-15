(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Tue Jul  1 05:34:24 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/xsyncpy.sats"
#staload
"./../SATS/trxltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload <
with sint_lt$sint of 1099
#symload >
with sint_gt$sint of 1099
#symload =
with sint_eq$sint of 1099
#symload <=
with sint_lte$sint of 1099
#symload >=
with sint_gte$sint of 1099
#symload !=
with sint_neq$sint of 1099
//
#symload +
with sint_add$sint of 1099
#symload -
with sint_sub$sint of 1099
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2var_equal
(x1: d2var
,x2: d2var): bool =
(g_cmp<d2var>(x1, x2) = 0)
#symload = with d2var_equal
//
(* ****** ****** *)
(* ****** ****** *)
//
datavwtp dtpstk =
//
|dtpstk_nil of ()
//
|dtpstk_lam0 of (dtpstk)
|dtpstk_let0 of (dtpstk)
//
|dtpstk_ift0 of (dtpstk)
|dtpstk_cas0 of (dtpstk)
//
|dtpstk_cons of
( d2var, d3typ1, dtpstk )
|dtpstk_updt of
( d2var, d3typ1, dtpstk )
//
(* ****** ****** *)
//
#typedef s2cs = s2cstlst
//
datavwtp
envltck =
ENVLTCK of(dtpstk, stkmap(s2cs))
//
#absimpl envltck_vtbx = envltck
//
(* ****** ****** *)
//
fun
dtpstk_make_nil
(
(* nil *)
): dtpstk = dtpstk_nil(*void*)
//
fun
dtpstk_free_top
(stk0: ~dtpstk): void =
(
case-
stk0 of
//
| ~
dtpstk_nil
((*void*)) => ((*0*))
//
| ~
dtpstk_cons
(d2v1
,t3q1,stk1) => dtpstk_free_top(stk1)
| ~
dtpstk_updt
(d2v1
,t3q1,stk1) => dtpstk_free_top(stk1)
//
)(*case+*)//end-of-[dtpstk_free_top]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_make_nil
  ( (*void*) ) =
(
ENVLTCK(dtpstk, stkmap))
where{
//
val dtpstk = dtpstk_make_nil()
val stkmap = stkmap_make_nil()
}(*where*)//end-of-[envltck_make_nil()]
//
(* ****** ****** *)
//
#implfun
envltck_free_top
  (   env0   ) =
(
case+ env0 of
| ~
ENVLTCK
(dtpstk, stkmap) =>
let
//
var
stkmap = stkmap
val nerr =
stkmap_poptop0(stkmap)
//
val (  ) =
dtpstk_free_top(dtpstk)
val (  ) =
stkmap_free_nil(stkmap) in () end//let
)(*case+*)//endof(envltck_free_top(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_pshlam0
  (  env0  ) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
let
//
val (  ) =
( dtpstk :=
  dtpstk_lam0(dtpstk)) in () end//let
)(*case+*)//end-of-(envltck_pshlam0(env0))  
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_pshlet0
  (  env0  ) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
let
//
val (  ) =
( dtpstk :=
  dtpstk_let0(dtpstk)) in () end//let
)(*case+*)//end-of-(envltck_pshlet0(env0))  
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_pshift0
  (  env0  ) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
let
//
val (  ) =
( dtpstk :=
  dtpstk_ift0(dtpstk)) in () end//let
)(*case+*)//end-of-(envltck_pshift0(env0))  
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_pshcas0
  (  env0  ) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
let
//
val (  ) =
( dtpstk :=
  dtpstk_cas0(dtpstk)) in () end//let
)(*case+*)//end-of-(envltck_pshcas0(env0))  
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_poplam0
( kxs:
& dtpstk >> _): sint =
let
var
err: sint = 0
val
( ) =
(kxs := loop(kxs, err)) in err end
where{
//
fnx
loop
(kxs: dtpstk
,err: &sint >> _): dtpstk =
(
case+ kxs of
|
~ // free
dtpstk_lam0
(   kxs   ) => kxs
|
~ // free
dtpstk_cons
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
(*
val () =
prerrsln("\
dtpstk_poplam0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_poplam0: loop: x1 = ", x1)
*)
//
}(*where*)//end[dtpstk_cons(...)]
//
|
~ // free
dtpstk_updt
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
(*
val () =
prerrsln("\
dtpstk_poplam0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_poplam0: loop: x1 = ", x1)
*)
//
}(*where*)//end[dtpstk_updt(...)]
//
|dtpstk_nil( ) => ( err := 1; kxs )
|dtpstk_let0 _ => ( err := 1; kxs )
|dtpstk_ift0 _ => ( err := 1; kxs )
|dtpstk_cas0 _ => ( err := 1; kxs )
//
)(*case+*)//end-of-[loop( kxs, err )]
//
}(*where*)//end-of-[dtpstk_poplam0(kxs)]
//
#implfun
envltck_poplam0
(     env0     ) = let
//
val+
ENVLTCK(
!dtpstk, !stkmap) = env0
//
in//let
//
let
val nerr =
dtpstk_poplam0(dtpstk)
val nerr =
stkmap_poplam0(stkmap) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(envltck_poplam0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_poplet0
( kxs:
& dtpstk >> _): sint =
let
var
err: sint = 0
val
( ) =
(kxs := loop(kxs, err)) in err end
where{
//
fnx
loop
(kxs: dtpstk
,err: &sint >> _): dtpstk =
(
case+ kxs of
|
~ // free
dtpstk_let0
(   kxs   ) => kxs
|
~ // free
dtpstk_cons
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
(*
val () =
prerrsln("\
dtpstk_poplet0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_poplet0: loop: x1 = ", x1)
*)
//
}(*where*)//end[dtpstk_cons(...)]
//
|
~ // free
dtpstk_updt
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
(*
val () =
prerrsln("\
dtpstk_poplet0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_poplet0: loop: x1 = ", x1)
*)
//
}(*where*)//end[dtpstk_updt(...)]
//
|dtpstk_nil( ) => ( err := 1; kxs )
|dtpstk_lam0 _ => ( err := 1; kxs )
|dtpstk_ift0 _ => ( err := 1; kxs )
|dtpstk_cas0 _ => ( err := 1; kxs )
//
)(*case+*)//end-of-[loop( kxs, err )]
//
}(*where*)//end-of-[dtpstk_poplet0(kxs)]
//
#implfun
envltck_poplet0
(     env0     ) = let
//
val+
ENVLTCK(
!dtpstk, !stkmap) = env0
//
in//let
//
let
val nerr =
dtpstk_poplet0(dtpstk)
val nerr =
stkmap_poplet0(stkmap) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(envltck_poplet0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_popift0
( kxs:
& dtpstk >> _): sint =
let
var
err: sint = 0
val
( ) =
(kxs := loop(kxs, err)) in err end
where{
//
fnx
loop
(kxs: dtpstk
,err: &sint >> _): dtpstk =
(
case+ kxs of
|
~ // free
dtpstk_ift0
(   kxs   ) => kxs
|
~ // free
dtpstk_cons
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
(*
val () =
prerrsln("\
dtpstk_popift0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_popift0: loop: x1 = ", x1)
*)
//
}(*where*)//end[dtpstk_cons(...)]
//
|
~ // free
dtpstk_updt
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
(*
val () =
prerrsln("\
dtpstk_popift0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_popift0: loop: x1 = ", x1)
*)
//
}(*where*)//end[dtpstk_updt(...)]
//
|dtpstk_nil( ) => ( err := 1; kxs )
|dtpstk_lam0 _ => ( err := 1; kxs )
|dtpstk_let0 _ => ( err := 1; kxs )
|dtpstk_cas0 _ => ( err := 1; kxs )
//
)(*case+*)//end-of-[loop( kxs, err )]
//
}(*where*)//end-of-[dtpstk_popift0(kxs)]
//
#implfun
envltck_popift0
(     env0     ) = let
//
val+
ENVLTCK(
!dtpstk, !stkmap) = env0
//
in//let
//
let
val nerr =
dtpstk_popift0(dtpstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(envltck_popift0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_popcas0
( kxs:
& dtpstk >> _): sint =
let
var
err: sint = 0
val
( ) =
(kxs := loop(kxs, err)) in err end
where{
//
fnx
loop
(kxs: dtpstk
,err: &sint >> _): dtpstk =
(
case+ kxs of
|
~ // free
dtpstk_cas0
(   kxs   ) => kxs
|
~ // free
dtpstk_cons
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
(*
val () =
prerrsln("\
dtpstk_popcas0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_popcas0: loop: x1 = ", x1)
*)
//
}(*where*)//end[dtpstk_cons(...)]
//
|
~ // free
dtpstk_updt
(k1, x1, kxs) =>
(
  loop(kxs, err)) where
{
//
(*
val () =
prerrsln("\
dtpstk_popcas0: loop: k1 = ", k1)
val () =
prerrsln("\
dtpstk_popcas0: loop: x1 = ", x1)
*)
//
}(*where*)//end[dtpstk_updt(...)]
//
|dtpstk_nil( ) => ( err := 1; kxs )
|dtpstk_lam0 _ => ( err := 1; kxs )
|dtpstk_let0 _ => ( err := 1; kxs )
|dtpstk_ift0 _ => ( err := 1; kxs )
//
)(*case+*)//end-of-[loop( kxs, err )]
//
}(*where*)//end-of-[dtpstk_popcas0(kxs)]
//
#implfun
envltck_popcas0
(     env0     ) = let
//
val+
ENVLTCK(
!dtpstk, !stkmap) = env0
//
in//let
//
let
val nerr =
dtpstk_popcas0(dtpstk) in $fold(env0)
end(*let*)
//
end(*let*)//end-of-(envltck_popcas0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3typ1_none0
( (*void*) ) =
d3typ1_none$make
(s2typ1_none0((*0*)))
//
fun
dtpstk_dvar$find
( stk0:
! dtpstk
, d2v0: d2var): d3typ1 =
(
case+ stk0 of
|dtpstk_nil
((*void*)) =>
d3typ1_none0((*0*))
//
|dtpstk_lam0
(  stk1  ) =>
dtpstk_dvar$find(stk1, d2v0)
|dtpstk_let0
(  stk1  ) =>
dtpstk_dvar$find(stk1, d2v0)
|dtpstk_ift0
(  stk1  ) =>
dtpstk_dvar$find(stk1, d2v0)
|dtpstk_cas0
(  stk1  ) =>
dtpstk_dvar$find(stk1, d2v0)
//
|dtpstk_cons
(d2v1, t3q1, stk1) =>
(
if
(d2v0 = d2v1)
then ( t3q1 )
else dtpstk_dvar$find(stk1, d2v0))
//
|dtpstk_updt
(d2v1, t3q1, stk1) =>
(
if
(d2v0 = d2v1)
then ( t3q1 )
else dtpstk_dvar$find(stk1, d2v0))
//
)(*case+*)//end-of-(dtpstk_dvar$find(...))
//
(* ****** ****** *)
//
#implfun
envltck_dvar$find
  (env0, dvar) =
let
val+
ENVLTCK
(dtpstk, stkmap) = env0
in//let
(
  dtpstk_dvar$find(dtpstk, dvar))
end where
{
//
// (*
val () =
prerrsln("envltck_dvar$find: dvar = ", dvar)
// *)
//
}(*where*)//end-of-[envltck_dvar$find(env0,...)]
//
(* ****** ****** *)
//
#implfun
envltck_dvar$take
  (env0, dvar) =
let
//
#symload
linq with d3typ1_linq
//
val t3q0 =
envltck_dvar$find(env0, dvar)
//
val (  ) =
prerrsln("\
envltck_dvar$take: t3q0 = ", t3q0)
//
in//let
//
if // if
not(
linq(t3q0)) then t3q0 else
let
//
(*
val t3q1 = t3q0
*)
val t3q1 = d3typ1_t1pize(t3q0)
//
in//let
//
(
  t3q0 ) where
{
val () =
envltck_dvar$updt(env0, dvar, t3q1) }
end//let
//
end where
{
// (*
val () =
prerrsln("envltck_dvar$take: dvar = ", dvar)
// *)
}(*where*)//end-of-(envltck_dvar$take(env0,...))
//
(* ****** ****** *)
//
#implfun
envltck_dvar$updt
(env0, d2v0, t3q0) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
(
dtpstk :=
dtpstk_updt(d2v0, t3q0, dtpstk))
) where
{
//
// (*
val () =
prerrsln("envltck_dvar$updt: d2v0 = ", d2v0)
val () =
prerrsln("envltck_dvar$updt: t3q0 = ", t3q0)
// *)
//
}(*where*)//end-of-(envltck_dvar$updt(env0,...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dlft$find
  (env0, dlft) =
(
case+
dlft.node() of
//
|D3E1var
(   dvar   ) =>
(
envltck_dvar$find(env0, dvar))
//
|D3E1flat
(   d3e1   ) =>
(
d3typ1_out$flat(t3q1))
where{
val t3q1 =
(
envltck_dlft$find(env0, d3e1))}
//
|D3E1proj
(tknd
,lab1, d3e1) =>
(
d3typ1_lab$proj(t3q1, lab1))
where{
val t3q1 =
(
envltck_dlft$find(env0, d3e1))}
//
|_(*otherwise*) => d3typ1_none0((*0*))
) where
{
//
val (  ) =
prerrsln("envltck_dlft$find: dlft = ", dlft)
//
}(*where*)//end-of-[envltck_dlft$find(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dtyp$hnfz
  (env0, t3q0) =
(
case+
t3q0.node() of
//
|
T3P1dvar(d2v1) =>
let
val t3q1 =
envltck_dvar$take(env0, d2v1)
in//let
envltck_dtyp$hnfz(env0, t3q1)
end//let//end-of-[T3P1dvar(d2v1)]
|
_(*otherwise*) => (     t3q0     )
) where
{
//
val (  ) =
prerrsln("envltck_dtyp$hnfz: t3q0 = ", t3q0)
//
}(*where*)//end-of-[envltck_dtyp$hnfz(env0,...)]
//
(* ****** ****** *)
//
#implfun
envltck_dtyp$dtnm
  (env0, t3q0) =
(
  d3typ1_styp$make(t2q0))
where
{
//
val t2q0 =
envltck_dtyp$eval(env0, t3q0)
//
val (  ) =
prerrsln("envltck_dtyp$dtnm: t3q0 = ", t3q0)
val (  ) =
prerrsln("envltck_dtyp$dtnm: t2q0 = ", t2q0)
//
}(*where*)//end-of-[envltck_dtyp$dtnm(env0,...)]
//
(* ****** ****** *)
//
#implfun
envltck_dtyp$eval
  (env0, t3q0) =
(
case+
t3q0.node() of
//
|T3P1none() =>
(
s2typ1_none0((*void*)))
//
|T3P1styp(t2q1) => (t2q1)
//
|T3P1dvar(d2v1) =>
(
let
val t3q1 =
envltck_dvar$take(env0, d2v1)
in//let
envltck_dtyp$eval(env0, t3q1)
end//let//end-of-[T3P1dvar(d2v1)]
)
//
|T3P1dlft(t3q1) =>
(
s2typ1_lft(t2q1)) where
{
val t2q1 =
envltck_dtyp$eval(env0, t3q1)}
//
|T3P1tcon
(dcon, t3qs) =>
(
s2typ1_tcon(dcon, t2qs))
where
{
val t2qs = f0_t3qs(env0, t3qs)
}(*where*)//end(T3P1tcon(dcon,...))
//
|T3P1trcd
(trcd, npf1, ltqs) =>
let
//
val ltqs = f0_ltqs(env0, ltqs)
//
in//let
(
  s2typ1_rcd2(trcd, npf1, ltqs))
end//let//end-of-[T3P1trcd(trcd,...)]
//
) where
{
//
fun
f0_t3qs
( env0:
! envltck
, t3qs
: d3typ1lst): s2typ1lst =
(
case+ t3qs of
|list_nil
( (*void*) ) => list_nil()
|list_cons
(t3q1, t3qs) =>
let
val t2q1 =
envltck_dtyp$eval(env0, t3q1)
in//let
list_cons(t2q1, f0_t3qs(env0, t3qs))
end//let
)(*case+*)//end-of-[f0_t3qs(env0,t3qs)]
//
fun
f0_ltqs
( env0:
! envltck
, ltqs
: l3t3p1lst): l2t2p1lst =
(
case+ ltqs of
|list_nil
( (*void*) ) => list_nil()
|list_cons
(ltq1, ltqs) =>
let
val+
D3LAB
(lab1, t3q1) = ltq1
val t2q1 =
envltck_dtyp$eval(env0, t3q1)
in//let
//
let
val ltq1 =
(
  S2LAB(lab1, t2q1))
in//let
list_cons(ltq1, f0_ltqs(env0, ltqs))
end//let
//
end//let
)(*case+*)//end-of-[f0_ltqs(env0,ltqs)]
//
val () =
prerrsln("envltck_dtyp$eval: t3q0 = ", t3q0)
//
}(*where*)//end-of-[envltck_dtyp$eval(env0,...)]
//
(* ****** ****** *)
//
#implfun
envltck_dtyplst$eval
  (env0, t3qs) =
(
case+ t3qs of
|
list_nil() =>
list_nil()
|
list_cons(t3q1, t3qs) =>
(
list_cons(t2q1, t2qs))
where{
//
val t2q1 = envltck_dtyp$eval(env0, t3q1)
val t2qs = envltck_dtyplst$eval(env0, t3qs)
//
}(*where*)
)(*case+*)//end-of-[envltck_dtyplst$eval(env0,...)]
//
(* ****** ****** *)
//
#implfun
envltck_dvdtp1lst$eval
  ( env0, dvts ) =
(
list_vt2t(
loop(dvts, res0)))
where
{
//
val
res0 = list_vt_nil()
//
fun
loop
( dvts
: dvdtp1lst
, res0
: dvstp1lst_vt): dvstp1lst_vt =
(
case+ dvts of
|list_nil
( (*void*) ) =>
list_vt_reverse0(res0)
|list_cons
(vtp1, dvts) =>
let
//
val d2v1 = vtp1.0
val t3q1 = vtp1.1
val t2q1 =
envltck_dtyp$eval(env0, t3q1)
//
in//let
//
loop(dvts,
  list_vt_cons((d2v1, t2q1), res0))
//
end//let
)(*case+*)//end-of-[loop(dvts,res0)]
//
}(*where*)//endof(envltck_dvdtp1lst$eval(env0,...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dvar$spsh
(env0, dvar, t2q0) =
(
envltck_dvar$dpsh
(env0, dvar, t3q0))
where{
val t3q0 = d3typ1_styp$make(t2q0)
}(*where*)//end(envltck_dvar$spsh)
//
(* ****** ****** *)
//
#implfun
envltck_dvar$dpsh
(env0, dvar, t3q0) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
(
dtpstk :=
dtpstk_cons(dvar, t3q0, dtpstk)))
where
{
//
// (*
val () =
prerrsln("envltck_dvar$dpsh: dvar = ", dvar)
val () =
prerrsln("envltck_dvar$dpsh: t3q1 = ", t3q0)
// *)
//
}(*where*)//end-of-(envltck_dvar$dpsh(env0,...))
//
(* ****** ****** *)
//
#implfun
envltck_dpat$push
  (env0, dpat) =
(
  f0_dpat(env0, dpat))
where
{
//
fun
f0_dpat
( env0:
! envltck
, d3p0: d3pat1): void =
(
case+
d3p0.node() of
//
(* ****** ****** *)
//
|D3P1any _ => ( (*void*) )
//
|D3P1var
(   d2v1   ) =>
let
//
val t2q0 = d3p0.styp((*0*))
//
in//let
envltck_dvar$spsh(env0,d2v1,t2q0)
end//let//end-of-[D3P1var( d2v1 )]
//
(* ****** ****** *)
//
(*
|D3P1bang
(   d3p1   ) => f0_dpat(env0, d3p1)
*)
//
|D3P1flat
(   d3p1   ) => f0_dpat(env0, d3p1)
//
|D3P1free
(   d3p1   ) => f0_dpat(env0, d3p1)
//
(* ****** ****** *)
//
|D3P1dapp
(d3f0
,npf1, d3ps) => f0_d3ps(env0, d3ps)
//
(* ****** ****** *)
//
|D3P1tup0
(npf1, d3ps) => f0_d3ps(env0, d3ps)
//
(* ****** ****** *)
//
|D3P1argtp
(d3p1, t2q2) =>
(
case+
d3p1.node() of
//
|D3P1var
(   d2v1   ) =>
(
case+
t2q2.node() of
//
|T2P1arg1
(knd0, targ) =>
f0_dvar$arg1(env0, d2v1, t2q2)
//
|T2P1atx2
(tbef, taft) =>
(
case+
tbef.node() of
//
|T2P1arg1
(knd0, targ) =>
f0_dvar$arg1(env0, d2v1, tbef)
//
|_(*non-T2P1arg1*) =>
(
envltck_dvar$spsh(env0, d2v1, tbef))
)(*case+*)//end(T2P1atx2(tbef,taft))
//
|_(*non-T2P1arg1/atx2*) =>
(
envltck_dvar$spsh(env0, d2v1, t2q2))
)(*case+*)//end-of-(D3P1var( d2v1 ))
//
|_(*D3P1...*) => f0_dpat( env0, d3p1 )
)(*case+*)//endof(D3P1argtp(d3p1,t2q0))
//
(* ****** ****** *)
//
|D3P1annot
(d3p1
,s1e2
,s2e1, t2q2) =>
(
case+
d3p1.node() of
//
|D3P1var
(   d2v1   ) =>
(
case+
t2q2.node() of
//
|T2P1arg1
(knd0, targ) =>
f0_dvar$arg1(env0, d2v1, t2q2)
//
|T2P1atx2
(tbef, taft) =>
(
case+
tbef.node() of
|T2P1arg1
(knd0, targ) =>
f0_dvar$arg1(env0, d2v1, tbef)
//
|_(*non-T2P1arg1*) =>
envltck_dvar$spsh(env0, d2v1, tbef)
)(*case+*)//end(T2P1atx2(tbef,taft))
//
|_(*non-T2P1arg1/atx2*) =>
(
envltck_dvar$spsh(env0, d2v1, t2q2))
)(*case+*)//end-of-(D3P1var( d2v1 ))
//
|_(*D3P1...*) => f0_dpat(env0, d3p1))
//(*end-of(D3P1annot(d3p1,...,t2q0))*)
//
|
_(*otherwise*) => (     (*void*)     )
)(*case+*)//end-of-[f0_dpat(env0,dpat)]
//
and
f0_d3ps
( env0:
! envltck
, d3ps: d3pat1lst): void =
(
case+ d3ps of
|list_nil() => ()
|list_cons(d3p1, d3ps) =>
(f0_dpat(env0, d3p1); f0_d3ps(env0, d3ps)))
//
(* ****** ****** *)
//
and
f0_dvar$arg1
( env0:
! envltck
, d2v0
: d2var, t2q0: s2typ1): void =
let
val t2q1 =
if // if
(knd0 >= 0)
then targ else s2typ1_lft(targ)
in//let
envltck_dvar$spsh(env0, d2v0, t2q1)
end where
{
val-T2P1arg1(knd0, targ) = t2q0.node()
}(*where*)//end-of-[f0_dvar$arg1(env0,...)]
//
(* ****** ****** *)
//
(*
val ((*void*)) =
prerrsln("envltck_dpat$push: dpat = ", dpat)
*)
//
(* ****** ****** *)
//
}(*where*)//end-of-(envltck_dpat$push(env0,...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_farg$push
  (env0, f3a0) =
(
case+
f3a0.node() of
//
|F3ARG1dapp
(npf1, d3ps) =>
(
  envltck_d3ps$push(env0, d3ps))
//
|F3ARG1sapp _ => () |F3ARG1mets _ => ()
//
)(*case+*)//end-of-[envltck_farg$push(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_d3ps$push
  (env0, d3ps) =
(
case+ d3ps of
|
list_nil() => ()
|
list_cons(d3p1, d3ps) =>
let
val () = envltck_dpat$push(env0, d3p1)
val () = envltck_d3ps$push(env0, d3ps)
end//let//end-of-[list_cons(d3p1,d3ps)]
//
)(*case+*)//end-of-[envltck_d3ps$push(env0,...)]
//
(* ****** ****** *)
//
#implfun
envltck_f3as$push
  (env0, f3as) =
(
case+ f3as of
|
list_nil() => ()
|
list_cons(f3a1, f3as) =>
let
val () = envltck_farg$push(env0, f3a1)
val () = envltck_f3as$push(env0, f3as)
end//let//end-of-[list_cons(f3a1,f3as)]
//
)(*case+*)//end-of-[envltck_f3as$push(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dvts$updt
  (env0, vts0) =
(
case+ vts0 of
| list_nil() => ()
| list_cons(dvtp, vts1) =>
(
  envltck_dvts$updt(env0, vts1))
where
{
val () =
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
(
dtpstk :=
dtpstk_updt(dvtp.0, dvtp.1, dtpstk)) }
)(*case+*)//end-of-[envltck_dvts$updt(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_dvslam0
( kxs:
! dtpstk): d2varlst =
let
//
#vwtpdef
d2varlst = list_vt(d2var)
//
fnx
loop
( kxs:
! dtpstk
, res
: d2varlst): d2varlst =
(
case- kxs of
//
|dtpstk_nil
(  (*nil*)  ) => res
//
|dtpstk_lam0
(    kxs    ) => res
//
|dtpstk_cons
(k1, x1, kxs) =>
loop(kxs, list_vt_cons(k1, res))
//
|dtpstk_updt // HX: skipped
(k1, x1, kxs) => (loop(kxs, res))
//
)(*case-*)//end-of-[loop(kxs,res)]
//
in//let
//
list_vt2t
(
d2varlst_vt_duprmv0(res)
) where
{
val res =
loop(kxs, list_vt_nil((*0*)))
val res = d2varlst_vt_sort0(res) }
//
end(*let*)//end-of-[dtpstk_dvslam0(...)]
//
(* ****** ****** *)
//
#implfun
envltck_dvslam0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  d2vs ) where
{
val d2vs = dtpstk_dvslam0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_dvslam0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_dvslet0
( kxs:
! dtpstk): d2varlst =
let
//
#vwtpdef
d2varlst = list_vt(d2var)
//
fnx
loop
( kxs:
! dtpstk
, res
: d2varlst): d2varlst =
(
case- kxs of
//
|dtpstk_nil
(  (*nil*)  ) => res
//
|dtpstk_let0
(    kxs    ) => res
//
|dtpstk_cons
(k1, x1, kxs) =>
loop(kxs, list_vt_cons(k1, res))
//
|dtpstk_updt // HX: skipped
(k1, x1, kxs) => (loop(kxs, res))
//
)(*case-*)//end-of-[loop(kxs,res)]
//
in//let
//
list_vt2t
(
d2varlst_vt_duprmv0(res)
) where
{
val res =
loop(kxs, list_vt_nil((*0*)))
val res = d2varlst_vt_sort0(res) }
//
end(*let*)//end-of-[dtpstk_dvslet0(...)]
//
(* ****** ****** *)
//
#implfun
envltck_dvslet0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  d2vs ) where
{
val d2vs = dtpstk_dvslet0(dtpstk) }
//
)(*case+*)//end-of-[envltck_dvslet0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_dvsift0
( kxs:
! dtpstk): d2varlst =
let
//
#vwtpdef
d2varlst = list_vt(d2var)
//
fnx
loop
( kxs:
! dtpstk
, res
: d2varlst): d2varlst =
(
case- kxs of
//
|dtpstk_nil
(  (*nil*)  ) => res
//
|dtpstk_ift0
(    kxs    ) => res
//
|dtpstk_cons
(k1, x1, kxs) =>
loop(kxs, list_vt_cons(k1, res))
//
|dtpstk_updt // HX: skipped
(k1, x1, kxs) => (loop(kxs, res))
//
)(*case-*)//end-of-[loop(kxs,res)]
//
in//let
//
list_vt2t
(
d2varlst_vt_duprmv0(res)
) where
{
val res =
loop(kxs, list_vt_nil((*0*)))
val res = d2varlst_vt_sort0(res) }
//
end(*let*)//end-of-[dtpstk_dvsift0(...)]
//
(* ****** ****** *)
//
#implfun
envltck_dvsift0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  d2vs ) where
{
val d2vs = dtpstk_dvsift0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_dvsift0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_dvscas0
( kxs:
! dtpstk): d2varlst =
let
//
#vwtpdef
d2varlst = list_vt(d2var)
//
fnx
loop
( kxs:
! dtpstk
, res
: d2varlst): d2varlst =
(
case- kxs of
//
|dtpstk_nil
(  (*nil*)  ) => res
//
|dtpstk_cas0
(    kxs    ) => res
//
|dtpstk_cons
(k1, x1, kxs) =>
loop(kxs, list_vt_cons(k1, res))
//
|dtpstk_updt // HX: skipped
(k1, x1, kxs) => (loop(kxs, res))
//
)(*case-*)//end-of-[loop(kxs,res)]
//
in//let
//
list_vt2t
(
d2varlst_vt_duprmv0(res)
) where
{
val res =
loop(kxs, list_vt_nil((*0*)))
val res = d2varlst_vt_sort0(res) }
//
end(*let*)//end-of-[dtpstk_dvscas0(...)]
//
(* ****** ****** *)
//
#implfun
envltck_dvscas0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  d2vs ) where
{
val d2vs = dtpstk_dvscas0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_dvscas0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_vtslam0
( stk0: 
! dtpstk): dvdtp1lst =
(
list_vt2t{dvdtp1}(vtps)
) where
{
//
val vtps =
list_vt_nil()
val vtps =
loop(stk0, vtps)
val vtps =
dvdtp1lst_vt_sort0(vtps)
val vtps =
dvdtp1lst_vt_duprmv0(vtps)
//
} where // where
{
#vwtpdef
res_vt = dvdtp1lst_vt
//
fun
loop
( stk0:
! dtpstk
, vtps
: dvdtp1lst_vt): res_vt =
(
case+ stk0 of
|dtpstk_nil
( (*void*) ) => ( vtps )
//
|dtpstk_cons
(d2v1,t3q1,stk1) =>
(
  loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|dtpstk_updt
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|
dtpstk_lam0(stk1) => (    vtps    )
//
|
_(*rest-of-dtpstk*) => (    vtps    )
)
//
}(*where*)//end-of-[dtpstk_vtslam0(env0)]
//
(* ****** ****** *)
//
#implfun
envltck_vtslam0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  vtps ) where
{
val vtps = dtpstk_vtslam0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_vtslam0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_vtslet0
( stk0: 
! dtpstk): dvdtp1lst =
(
list_vt2t{dvdtp1}(vtps)
) where
{
//
val vtps =
list_vt_nil()
val vtps =
loop(stk0, vtps)
val vtps =
dvdtp1lst_vt_sort0(vtps)
val vtps =
dvdtp1lst_vt_duprmv0(vtps)
//
} where // where
{
#vwtpdef
res_vt = dvdtp1lst_vt
//
fun
loop
( stk0:
! dtpstk
, vtps
: dvdtp1lst_vt): res_vt =
(
case+ stk0 of
//
|dtpstk_nil
( (*void*) ) => ( vtps )
//
|dtpstk_cons
(d2v1,t3q1,stk1) =>
(
  loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|dtpstk_updt
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|
dtpstk_lam0(stk1) => (    vtps    )
//
|
_(*rest-of-dtpstk*) => (    vtps   )
)
//
}(*where*)//end-of-[dtpstk_vtslet0(env0)]
//
(* ****** ****** *)
//
#implfun
envltck_vtslet0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  vtps ) where
{
val vtps = dtpstk_vtslet0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_vtslet0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_vtsift0
( stk0: 
! dtpstk): dvdtp1lst =
(
list_vt2t{dvdtp1}(vtps)
) where
{
//
val vtps =
list_vt_nil()
val vtps =
loop(stk0, vtps)
val vtps =
dvdtp1lst_vt_sort0(vtps)
val vtps =
dvdtp1lst_vt_duprmv0(vtps)
//
} where // where
{
#vwtpdef
res_vt = dvdtp1lst_vt
//
fun
loop
( stk0:
! dtpstk
, vtps
: dvdtp1lst_vt): res_vt =
(
case+ stk0 of
//
|dtpstk_nil
( (*void*) ) => ( vtps )
//
|dtpstk_cons
(d2v1,t3q1,stk1) =>
(
  loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|dtpstk_updt
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|
dtpstk_ift0(stk1) => (    vtps    )
//
|
_(*rest-of-dtpstk*) => (    vtps   )
)
//
}(*where*)//end-of-[dtpstk_vtsift0(env0)]
//
(* ****** ****** *)
//
#implfun
envltck_vtsift0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  vtps ) where
{
val vtps = dtpstk_vtsift0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_vtsift0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dtpstk_vtscas0
( stk0: 
! dtpstk): dvdtp1lst =
(
list_vt2t{dvdtp1}(vtps)
) where
{
//
val vtps =
list_vt_nil()
val vtps =
loop(stk0, vtps)
val vtps =
dvdtp1lst_vt_sort0(vtps)
val vtps =
dvdtp1lst_vt_duprmv0(vtps)
//
} where // where
{
#vwtpdef
res_vt = dvdtp1lst_vt
//
fun
loop
( stk0:
! dtpstk
, vtps
: dvdtp1lst_vt): res_vt =
(
case+ stk0 of
//
|dtpstk_nil
( (*void*) ) => ( vtps )
//
|dtpstk_cons
(d2v1,t3q1,stk1) =>
(
  loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|dtpstk_updt
(d2v1,t3q1,stk1) =>
(
loop(stk1, vtps)) where
{
val vtps =
list_vt_cons((d2v1, t3q1), vtps)}
//
|
dtpstk_cas0(stk1) => (    vtps    )
//
|
_(*rest-of-dtpstk*) => (    vtps   )
)
//
}(*where*)//end-of-[dtpstk_vtscas0(env0)]
//
(* ****** ****** *)
//
#implfun
envltck_vtscas0
  (  env0  ) =
(
//
case+ env0 of
|ENVLTCK
(dtpstk, stkmap) =>
(
  vtps ) where
{
val vtps = dtpstk_vtscas0(dtpstk)
}
//
)(*case+*)//end-of-[envltck_vtscas0(env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dlft$updt
(env0, dlft, t3q0) =
(
case+
dlft.node() of
//
|D3E1var
(  dvar  ) =>
(
envltck_dvar$updt
(env0, dvar, t3q0))
//
|D3E1flat
(  d3e1  ) =>
(
envltck_dlft$updt
(env0, d3e1, t3q0))
where{
val t3q0 =
d3typ1_dlft$make(t3q0)}
//
|D3E1proj
(tknd
,lab1, d3e1) =>
(
envltck_dlft$updt
(env0, d3e1, t3q1))
where{
val t3q1 = d3e1.dtyp((*0*))
val t3q1 =
d3typ1_lab$fset(t3q1, lab1, t3q0)}
//
|
_(*otherwise*) => (   (*deadcode*)   )
) where
{
//
val (  ) =
prerrsln("envltck_dlft$updt: dlft = ", dlft)
val (  ) =
prerrsln("envltck_dlft$updt: t3q0 = ", t3q0)
//
}(*where*)//end-of-[envltck_dlft$updt(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-02-09:
This one is for
returning [dgrt] to [dmxp]!
Mon Feb  9 10:07:21 PM EST 2026
*)
#implfun
envltck_dmxp$updt
(env0, dmxp, dgrt) =
let
//
val lftq =
d3exp1_lftq(dmxp)
//
in//let
//
if // if
not(lftq)
then (dgrt) else
(
d3typ1_none0((*0*))) where
{
val () =
envltck_dlft$updt(env0, dmxp, dgrt)
}(*where*)//else//end-of-(if(not(lftq)))
//
end(*let*)//end-of-[envltck_dmxp$updt(env0,...)]
//
(* ****** ****** *)
//
#implfun
envltck_dmxq$updt
(env0, dmxq, dgrt) =
(
case+
dmxq.node() of
//
|
D3E1tup0
(npf1, d3es) =>
(
case+
dgrt.node() of
|T3P1trcd
(trcd, npf1, ltqs) =>
let
//
val sgrt = dgrt.styp()
val ltqs =
f0_list(env0, d3es, ltqs)
//
in//let
//
d3typ1(sgrt,
  T3P1trcd(trcd, npf1, ltqs))
//
end//let//end-of-[T3P1trcd(...)]
|
_(*non-T3P1trcd*) =>
envltck_dmxp$updt(env0,dmxq,dgrt)
)(*case+*)//end-of-[D3E1tup0(...)]
|
_(*non-D3E1tup0*) =>
(
envltck_dmxp$updt(env0,dmxq,dgrt))
//
) where
{
//
fun
f0_list
( env0:
! envltck
, d3es
: d3exp1lst
, ltqs
: l3t3p1lst): l3t3p1lst =
(
case+ d3es of
|list_nil
( (*void*) ) => list_nil()
|
list_cons
(d3e1, d3es) =>
(
case+ ltqs of
|list_nil
( (*void*) ) => list_nil()
|list_cons
(ltq1, ltqs) =>
let
val+
D3LAB(
lab1, t3q1) = ltq1
val t3q1 =
(
envltck_dmxq$updt
(env0, d3e1, t3q1))//t3q1
val ltq1 = D3LAB(lab1, t3q1)
in//let
list_cons
(ltq1, f0_list(env0, d3es, ltqs))
end//let
)(*case+*)//end-of-[list_cons(d3e1,d3es)]
)(*case+*)//end-of-[f0_list(env0,d3es,ltqs)]
//
}(*where*)//end-of-[envltck_dmxq$updt(env0,...)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dlet$dtnm
( env0 , dcls ) =
let
//
val dcls =
list_reverse_vt(dcls)
//
in//let
(
  f0_list(env0, dcls)) where
{
//
fun
f0_list
( env0:
! envltck
, dcls: list_vt(d3ecl1)): void =
(
case+ dcls of
| ~
list_vt_nil() => ( (*void*) )
| ~
list_vt_cons
(dcl1, dcls) =>
(
f0_list(env0, dcls)) where
{
val () = envltck_dval$dtnm(env0, dcl1)
}
)(*case+*)//end-of-[f0_list(env0, dcls)]
//
}(*where*)
end where
{
//
(*
val () =
prerrsln("envltck_dlet$dtnm: dcls = ", dcls)
*)
//
}(*where*)//end-of-[envltck_dlet$dtnm(env0,dexp)]
//
(* ****** ****** *)
//
#implfun
envltck_dval$dtnm
( env0 , d3cl ) =
(
case+
d3cl.node() of
|D3C1valdclst
(tknd, d3vs) =>
(
f0_d3vs(env0, d3vs))
|_(*otherwise*) => ( (*void*) )
) where
{
//
fun
f0_dexp
( env0:
! envltck
, dexp: d3exp1): void =
let
//
val
lftq =
d3exp1_lftq(dexp)
//
in//let
//
(
if//if
(lftq)then//then
let
val t3q1 =
d3typ1_styp$make
(     t2q0     )
in//let
(
envltck_dlft$updt
(env0, dexp, t3q1))end//let
where
{
//
val t3q0 =
(
 envltck_dlft$find(env0, dexp))
val t2q0 =
(
 envltck_dtyp$eval(env0, t3q0))
//
}
) where // endof(if(lftq)then...)
{
//
val (  ) =
prerrsln
("envltck_dval$dtnm: dexp = ", dexp)
val (  ) =
prerrsln
("envltck_dval$dtnm: lftq = ", lftq)
//
}(*where*)//end-of-[f0_dexp(env0,dexp)]
//
end(*let*)//end-of-[f0_dexp(env0,dexp)]
//
(* ****** ****** *)
//
fun
f0_dval
( env0: !envltck
, dval: d3valdcl1): void =
let
//
val
tdxp =
dval.tdxp() in//let
(
case+ tdxp of
|TEQD3EXP1none
(  (*void*)  ) => ((*void*))
|TEQD3EXP1some
( tkeq, dexp ) => f0_dexp(env0, dexp))
end(*let*)//end-of-[f0_dval(env0,dval)]
//
fun
f0_d3vs
( env0: !envltck
, d3vs: d3valdcl1lst): void =
(
case+ d3vs of
|list_nil() => ()
|list_cons(d3v1, d3vs) =>
(
f0_dval(env0, d3v1); f0_d3vs(env0, d3vs)))
//
(* ****** ****** *)
//
val () =
prerrsln("envltck_dval$dtnm: d3cl = ", d3cl)
//
}(*where*)//end-of-[envltck_dval$dtnm(env0,d3cl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_myenv0.dats] *)
(***********************************************************************)
