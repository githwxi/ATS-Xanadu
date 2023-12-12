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
//
Sun Dec 10 12:52:02 EST 2023
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
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/libxinterp.hats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/xinterp.sats"
//
(* ****** ****** *)

local
//
datatype
irenv =
|
irenv_nil of
( (*void*) )
|
irenv_dvar of
(d2var, irval, irenv)
|
irenv_dcst of
(d2cst, irval, irenv)
//
#absimpl irenv_tbox = irenv
//
(* ****** ****** *)
//
datavwtp
irstk =
|
irstk_nil of
(  (*nil*)  )
|
irstk_lam0 of
(   irstk   )
|
irstk_let0 of
(   irstk   )
|
irstk_dvar of
(d2var, irval, irstk)
|
irstk_dcst of
(d2cst, irval, irstk)
//
(* ****** ****** *)
//
#typedef
cmap = $STM.tmpmap(irval)
#typedef
vmap = $STM.tmpmap(irval)
//
datavwtp
xintenv =
XINTENV of
(cmap, vmap, irstk)
//
#absimpl xintenv_vtbx = xintenv
//
(* ****** ****** *)
//
fun
irstk_free_nil(stk) =
(
case- stk of ~irstk_nil() => ()
)
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
xintenv_make_nil
  ((*void*)) =
(
XINTENV
( cmap
, vmap, irstk_nil())) where
{
val cmap =
$STM.tmpmap_make_nil{irval}()
val vmap =
$STM.tmpmap_make_nil{irval}() }
//
(* ****** ****** *)
//
#implfun
xintenv_free_top
  (  env0  ) =
(
case+ env0 of
| ~
XINTENV
(cmap,vmap,stk0) => irstk_free_nil(stk0)
)(*case+*)//end-of-[xintenv_free_top(env0)]
//
(* ****** ****** *)
//
#implfun
xintenv_d2cins_any
(env0, d2c0, irv1) =
(
case+ env0 of
| !
XINTENV
(cmap, vmap, stk0) =>
let
val
tmp0 = d2cst_get_stmp(d2c0)
in//let
$STM.tmpmap_insert_any(cmap, tmp0, irv1)
end//let
)(*case+*)//end-of-[xintenv_d2cins_any(...)]
//
(* ****** ****** *)
//
#implfun
xintenv_d2vins_any
(env0, d2v0, irv1) =
(
case+ env0 of
| !
XINTENV
(cmap, vmap, stk0) =>
let
val
tmp0 = d2var_get_stmp(d2v0)
in//let
$STM.tmpmap_insert_any(vmap, tmp0, irv1)
end//let
)(*case+*)//end-of-[xintenv_d2vins_any(...)]
//
(* ****** ****** *)
(* ****** ****** *)
endloc (*local*) // end of [ local(xintenv) ]
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xinterp_myenv0.dats] *)
