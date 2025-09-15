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
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ1_linq
(t2q0: s2typ1): bool =
(
  sort2_linq(t2q0.sort()))
#symload linq with s2typ1_linq
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
| ~
dtpstk_nil() => ((*0*))
| ~
dtpstk_cons
(d2v1
,d3ts,stk1) => dtpstk_free_top(stk1)
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
)(*case+*)//end-of-(envltck_free_top(env0))
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
)(*case+*)//end-of-(envltck_pshlam0( env0 ))  
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
)(*case+*)//end-of-(envltck_pshlet0( env0 ))  
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
)(*case+*)//end-of-(envltck_pshift0( env0 ))  
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
(k1, ts, kxs) => loop(kxs, err)
//
|dtpstk_nil( ) => (err := 1; kxs)
|dtpstk_let0 _ => (err := 1; kxs)
|dtpstk_ift0 _ => (err := 1; kxs)
|dtpstk_cas0 _ => (err := 1; kxs)
//
)
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
(k1, ts, kxs) => loop(kxs, err)
//
|dtpstk_nil( ) => (err := 1; kxs)
|dtpstk_lam0 _ => (err := 1; kxs)
|dtpstk_ift0 _ => (err := 1; kxs)
|dtpstk_cas0 _ => (err := 1; kxs)
//
)
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
(k1, ts, kxs) => loop(kxs, err)
//
|dtpstk_nil( ) => (err := 1; kxs)
|dtpstk_lam0 _ => (err := 1; kxs)
|dtpstk_let0 _ => (err := 1; kxs)
|dtpstk_cas0 _ => (err := 1; kxs)
//
)
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
dtpstk_dvsift0
( kxs:
& dtpstk >> _)
: list_vt(d2var) =
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
|dtpstk_nil
(  (*nil*)  ) => res
|dtpstk_ift0
(    kxs    ) => res
|dtpstk_cons
(k1, x1, kxs) =>
loop(kxs, list_vt_cons(k1, res))
)
//
in//let
//
d2varlst_duprmv0
(
list_vt_mergesort0(
  loop(kxs, list_vt_nil(*void*))))
//
end(*let*)//end-of-[dtpstk_dvsift0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dvar$take
  (env0, dvar) =
let
//
val t3q0 =
envltck_dvar$find(env0, dvar)
//
in//let
//
if
not(
linq(t3q0))
then t3q0 else
let
//
val t3q1 = d3typ1_delin(t3q0)
//
in//let
//
t3q0 where
{
val () =
envltck_dvar$updt(env0, dvar, t3q1)
}
end//let
//
end//let//end-of-(envltck_dvar$take(env0,...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envltck_dvar$updt
(env0, d2v0, t3q1) =
(
case+ env0 of
| ENVLTCK
(
!dtpstk, stkmap) =>
(
dtpstk := dtpstk_cons(d2v0, t3q1, dtpstk))
)(*case+*)//end-of-(envltck_dvar$updt(env0,...))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_myenv0.dats] *)
(***********************************************************************)
