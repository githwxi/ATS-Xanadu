(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sat Mar 14 01:16:57 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xstamp0.sats"
#staload
"./../../../SATS/xsymbol.sats"
#staload
"./../../../SATS/xsymmap.sats"
#staload
"./../../../SATS/xlabel0.sats"
(* ****** ****** *)
#staload
"./../../../SATS/locinfo.sats"
#staload
"./../../../SATS/lexing0.sats"
(* ****** ****** *)
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#vwtpdef
d2vstk = (*$MAP*)stkmap( i0var )
//
(* ****** ****** *)
//
#symload lctn with d2var_get_lctn
(*
#symload name with d2var_get_name
*)
#symload unam with d2var_get_unam
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
(*
HX-2026-04-04:
This is needed in the
following translation!
datavwtp
funstk =
|funstk_nil of ()
|funstk_lvl0 of
(sint(*lvl0*), funstk)
|funstk_cons of
(d2var, i0varfst, funstk)
Sat Apr  4 10:55:46 AM EDT 2026
*)
//
(* ****** ****** *)
//
datavwtp
trxstk =
//
|trxstk_nil of () 
//
|trxstk_lam0 of
(sint(*lvl0*), trxstk) 
|trxstk_let0 of 
(sint(*lvl0*), trxstk)
//
|trxstk_denv of
(i0var(*denv*), trxstk)
|trxstk_ufld of
(d2var(*lvrt*), i0typ, trxstk)
//
(* ****** ****** *)
#absimpl trxstk_vtbx = (trxstk)
(* ****** ****** *)
//
datavwtp
envd3i0 =
ENVD3I0 of
(d2vstk, trxstk)
#absimpl envd3i0_vtbx = envd3i0
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
trxstk_getlvl0
  ( stk0 ) =
(
  loop(stk0)) where
{
fun
loop
(stk0: !trxstk): sint =
(
case+ stk0 of
//
|trxstk_nil
(   (*void*)   ) => ( 0 )
//
|trxstk_lam0
(
lvl0, _(*stk0*)) => (lvl0)
|trxstk_let0
(
lvl0, _(*stk0*)) => (lvl0)
//
|trxstk_denv
(   ivar, stk0   ) => loop(stk0)
|trxstk_ufld//unfold
(dvar, ityp, stk0) => loop(stk0)
)(*case+*)//end-of-[loop(stk0):sint]
}(*where*)//end-of-[trxstk_getlvl0(stk0)]
//
(* ****** ****** *)
//
#implfun
trxstk_getbvk0
  ( stk0 ) =
(
  loop(stk0)) where
{
fun
loop
(stk0: !trxstk): sint =
(
case+ stk0 of
//
|trxstk_nil
(   (*void*)   ) => I0BVKtop
//
|trxstk_lam0
(
lvl0, _(*stk0*)) => I0BVKlam
|trxstk_let0
(
lvl0, _(*stk0*)) => I0BVKlet
//
|trxstk_denv
(   ivar, stk0   ) => loop(stk0)
|trxstk_ufld//unfold
(dvar, ityp, stk0) => loop(stk0)
)(*case+*)//end-of-[loop(stk0):sint]
}(*where*)//end-of-[trxstk_getbvk0(stk0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxstk_free$top
  ( stk0 ) =
(
   loop(stk0) )
where
{
//
fun
loop(stk0: trxstk): void =
(
case- stk0 of
|trxstk_nil
( (*void*) ) => ()
//
|trxstk_denv
(ivar, stk1) => loop(stk1)
|trxstk_ufld
(dvar, ityp, stk1) => loop(stk1)
//
)(*case+*)//endof(loop(stk0:trxstk))
//
}(*where*)//endof(trxstk_free$top(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxstk_pshlam0
  (stk0) =
(
stk0 :=
(
  trxstk_lam0(lvl0+1, stk0))
) where
{
  val lvl0 = trxstk_getlvl0(stk0)
}(*where*)//end-of-[trxstk_pshlam0(stk0)]
//
#implfun
trxstk_pshlet0
  (stk0) =
(
stk0 :=
(
  trxstk_let0(lvl0+0, stk0))
) where
{
  val lvl0 = trxstk_getlvl0(stk0)
}(*where*)//end-of-[trxstk_pshlet0(stk0)]
//
(* ****** ****** *)
//
#implfun
trxstk_poplam0
  (stk0) =
(
  stk0 := loop(  stk0  )
) where
{
//
fun
loop
(stk0: trxstk): trxstk =
(
case- stk0 of
//
| ~
trxstk_lam0
(lvl0, stk1) => stk1
//
| ~
trxstk_denv
(ivar, stk1) => loop(stk1)
| ~
trxstk_ufld
(dvar, ityp, stk1) => loop(stk1)
//
)(*case+*)//end-of-[loop(stk0:trxstk)]
//
}(*where*)//end-of-[trxstk_poplam0(stk0)]
//
(* ****** ****** *)
//
#implfun
trxstk_poplet0
  (stk0) =
(
  stk0 := loop(  stk0  )
) where
{
//
fun
loop
(stk0: trxstk): trxstk =
(
case- stk0 of
//
| ~
trxstk_let0
(lvl0, stk1) => stk1
//
| ~
trxstk_denv
(ivar, stk1) => loop(stk1)
| ~
trxstk_ufld
(dvar, ityp, stk1) => loop(stk1)
//
)(*case+*)//end-of-[loop(stk0:trxstk)]
//
}(*where*)//end-of-[trxstk_poplet0(stk0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envd3i0_make_nil
  ((*void*)) =
(
ENVD3I0
(d2vstk, trxstk)) where
{
  val trxstk = trxstk_nil()
  val d2vstk = stkmap_make_nil()
}(*where*)//end-of-[envd3i0_make_nil()]
//
(* ****** ****** *)
//
#implfun
envd3i0_free_top
  (  env0  ) =
let
val+
ENVD3I0
(
! d2vstk
, trxstk
) = env0
val nerr =
stkmap_poptop0(d2vstk)
in//let
(
stkmap_free_nil(d2vstk)
;
trxstk_free$top(trxstk)) where
{
val+
~ENVD3I0(d2vstk, trxstk) = env0
}(*where*)
end(*let*)//end-of-(envd3i0_free_top())
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxstk_lamenv$get
  (  stk0  ) =
list_vt2t
(loop(stk0, i0vs))
where
{
//
#vwtpdef
i0vs = list_vt(i0var)
//
val
i0vs = list_vt_nil(*0*)
//
fun
loop
( stk0:
! trxstk, i0vs: i0vs): i0vs =
(
case- stk0 of
//
(*
|trxstk_nil
( (*void*) ) => i0vs
*)
//
|trxstk_lam0
(lvl0, stk1) => i0vs
//
|trxstk_let0
(lvl0, stk1) => loop(stk1, i0vs)
//
|trxstk_denv
(i0v1, stk1) =>
let
val i0vs =
list_vt_cons
(i0v1, i0vs) in loop(stk1, i0vs)
end//let//end-of-[trxstk_denv()]
//
|trxstk_ufld
(d2v1
,ityp, stk1) => loop(stk1, i0vs)
//
)(*case+*)//end(loop(stk0,i0vs):i0vs)
//
}(*where*)//end(trxstk_lamenv$get(stk0))
//
(* ****** ****** *)
//
#implfun
trxstk_letenv$get
  (  stk0  ) =
list_vt2t
(loop(stk0, i0vs))
where
{
//
#vwtpdef
i0vs = list_vt(i0var)
//
val
i0vs = list_vt_nil(*0*)
//
fun
loop
( stk0:
! trxstk, i0vs: i0vs): i0vs =
(
case- stk0 of
//
(*
|trxstk_nil
( (*void*) ) => i0vs
*)
//
|trxstk_let0
(lvl0, stk1) => i0vs
//
|trxstk_lam0
(lvl0, stk1) => loop(stk1, i0vs)
//
|trxstk_denv
(i0v1, stk1) =>
let
val i0vs =
list_vt_cons
(i0v1, i0vs) in loop(stk1, i0vs)
end//let//end-of-[trxstk_denv()]
//
|trxstk_ufld
(d2v1
,ityp, stk1) => loop(stk1, i0vs)
//
)(*case+*)//end(loop(stk0,i0vs):i0vs)
//
}(*where*)//end(trxstk_letenv$get(stk0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxstk_denv$insert
  (stk0, ivar) =
(
stk0 := trxstk_denv(ivar, stk0))
//end-of-[trxstk_denv$insert(stk0,ivar)]
//
(* ****** ****** *)
//
#implfun
trxstk_i0vs$insert
  (stk0, i0vs) =
(
if
(lvl0 >= 1)
then(
loop(stk0, i0vs)))
where
{
//
val lvl0 =
trxstk_getlvl0(stk0)
//
fun
loop
( stk0:
& trxstk >> _
, i0vs: i0varlst): void =
(
case+ i0vs of
|
list_nil() => ()
|
list_cons(i0v1, i0vs) =>
(
trxstk_i0vs$insert(stk0, i0vs))
where
{
//
val lvl1 =
i0var_lvl0$get(i0v1)
//
val (  ) =
(
if // if
(lvl1 <= lvl0)
then(
trxstk_denv$insert(stk0, i0v1))) }
)(*case+*)//end[loop(stk0,i0vs):void]
}(*where*)//end(trxstk_i0vs$insert(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envd3i0_getlvl0
  ( env0 ) =
(
trxstk_getlvl0(trxstk))
where
{
val+
ENVD3I0(d2vstk, trxstk) = (env0) }
(*where*)//end-of-(envd3i0_getlvl0(env0))
//
#implfun
envd3i0_getbvk0
  ( env0 ) =
(
trxstk_getbvk0(trxstk))
where
{
val+
ENVD3I0(d2vstk, trxstk) = (env0) }
(*where*)//end-of-(envd3i0_getbvk0(env0))
//
(* ****** ****** *)
//
#implfun
envd3i0_pshlam0
  ( env0 ) =
let
val nerr =
stkmap_pshlam0(d2vstk)
val (  ) =
trxstk_pshlam0(trxstk)
end where//end-of-(let)
{
val+
ENVD3I0(!d2vstk, !trxstk) = env0 }
(*where*)//end-of-(envd3i0_pshlam0(env0))
//
#implfun
envd3i0_pshlet0
  ( env0 ) =
let
val nerr =
stkmap_pshlet0(d2vstk)
val (  ) =
trxstk_pshlet0(trxstk)
end where//end-of-(let)
{
val+
ENVD3I0(!d2vstk, !trxstk) = env0 }
(*where*)//end-of-(envd3i0_pshlet0(env0))
//
(* ****** ****** *)
//
#implfun
envd3i0_poplam0
  ( env0 ) =
let
val nerr =
stkmap_poplam0(d2vstk)
val (  ) =
trxstk_poplam0(trxstk)
end where//end-of-(let)
{
val+
ENVD3I0(!d2vstk, !trxstk) = env0 }
(*where*)//end-of-(envd3i0_poplam0(env0))
//
#implfun
envd3i0_poplet0
  ( env0 ) =
let
val nerr =
stkmap_poplet0(d2vstk)
val (  ) =
trxstk_poplet0(trxstk)
end where//end-of-(let)
{
val+
ENVD3I0(!d2vstk, !trxstk) = env0 }
(*where*)//end-of-(envd3i0_poplet0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envd3i0_lamenv$get
  ( env0 ) =
(
trxstk_lamenv$get
(    trxstk     ))
where
{
//
val+
ENVD3I0(d2vstk, trxstk) = ( env0 )
//
}(*where*)//end-of-(envd3i0_lamenv$get(...))
//
#implfun
envd3i0_letenv$get
  ( env0 ) =
(
trxstk_letenv$get
(    trxstk     ))
where
{
//
val+
ENVD3I0(d2vstk, trxstk) = ( env0 )
//
}(*where*)//end-of-(envd3i0_letenv$get(...))
//
(* ****** ****** *)
//
#implfun
envd3i0_dvar$search
  (env0, dvar) = let
//
val+
@ENVD3I0
(d2vstk, iltstk) = env0
//
val
sym1 = dvar.unam((*void*))
//
val
opt1 =
stkmap_search$opt(d2vstk, sym1)
//
in//let
(
case+ opt1 of
| ~optn_vt_nil() =>
(
  i0var_none1(dvar) )
| ~optn_vt_cons(ivar) => ( ivar ))
end(*let*)//end-of-[envd3i0_dvar$search(...)]
//
(* ****** ****** *)
//
#implfun
envd3i0_dvar$insert
  (env0, dvar, ivar) =
(
stkmap_insert$any
(d2vstk
,sym1(*k*),ivar(*x*))
) where
{
//
val sym1 = dvar.unam()
//
val+
ENVD3I0(!d2vstk, trxstk) = ( env0 )
}(*where*)//end-of-(envd3i0_dvar$insert(...))
//
(* ****** ****** *)
//
#implfun
envd3i0_denv$insert
  (env0, ivar) =
(
trxstk_denv$insert
(  trxstk, ivar  ))
where
{
//
val+
ENVD3I0(d2vstk, !trxstk) = ( env0 )
//
}(*where*)//end-of-(envd3i0_denv$insert(...))
//
(* ****** ****** *)
//
#implfun
envd3i0_i0vs$insert
  (env0, i0vs) =
(
trxstk_i0vs$insert
(  trxstk, i0vs  ))
where
{
//
val+
ENVD3I0(d2vstk, !trxstk) = ( env0 )
//
}(*where*)//end-of-(envd3i0_denv$insert(...))
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[ local(envd3i0) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_trxd3i0_myenv0.dats] *)
(***********************************************************************)
