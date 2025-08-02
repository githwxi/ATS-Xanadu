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
"./../SATS/trxltck.sats"
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
local
//
#typedef
s2cs = s2cstlst
//
datavwtp
envltck =
ENVLTCK of
(dtpstk, stkmap(s2cs))
//
and dtpstk =
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
(d2var, d3typ1lst, dtpstk)
//
(* ****** ****** *)
#absimpl envltck_vtbx = envltck
(* ****** ****** *)
//
in//local
//
(* ****** ****** *)
//
fun
dtpstk_free_nil
(stk0: ~dtpstk): void =
(
case-
stk0 of ~dtpstk_nil() => ())
//
(* ****** ****** *)
//
#implfun
envltck_make_nil
  ( (*void*) ) =
(
ENVLTCK(dtpstk, stkmap))
where{
//
val dtpstk = dtpstk_nil()
val stkmap = stkmap_make_nil()
}(*where*)//end-of-[envltck_make_nil()]
//
(* ****** ****** *)
//
#implfun
envltck_free_nil
  (  env0  ) =
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
dtpstk_free_nil(dtpstk)
val (  ) =
stkmap_free_nil(stkmap) in () end//let
)(*case+*)//end-of-(envltck_free_nil(env0))
//
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
//
#implfun
envltck_dvar$take
  (env0, dvar) =
let
//
val t2q0 =
envltck_dvar$find(env0, dvar)
//
in//let
//
if
not(
linq(t2q0))
then t2q0 else
let
//
val t2q1 = s2typ1_delin(t2q0)
//
in//let
//
t2q0 where
{
val () =
envltck_dvar$updt(env0, dvar, t2q1)
}
end//let
//
end//let//end-of-(envltck_dvar$take(env0,...))
//
(* ****** ****** *)
//
end//local
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_myenv0.dats] *)
(***********************************************************************)
