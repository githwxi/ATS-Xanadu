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
Mon Apr  6 12:36:11 AM EDT 2026
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
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/tryd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#vwtpdef
dfnstk = (*$MAP*)stkmap(i0varlst)
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
datavwtp
enwd3i0 =
ENWD3I0 of (dfnstk)
//
#absimpl enwd3i0_vtbx = enwd3i0
//
in//local
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
enwd3i0_make_nil
  ((*void*)) =
(
ENWD3I0(dfnstk)) where
{
  val dfnstk = stkmap_make_nil()
}(*where*)//end-of-[enwd3i0_make_nil()]
//
(* ****** ****** *)
//
#implfun
enwd3i0_free_nil
  (  env0  ) =
(
case+ env0 of
| ~
ENWD3I0(dfnstk) =>
let
//
var
dfnstk = dfnstk
val nerr =
stkmap_poptop0(dfnstk)
//
val (  ) =
stkmap_free_nil(dfnstk) in () end//let
)(*case+*)//end-of-(enwd3i0_free_nil(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
enwd3i0_poplet0
(     enw0     ) = let
//
val+
@ENWD3I0(!stkmap) = enw0
//
in//let
//
let
val nerr =
stkmap_poplet0(stkmap) in $fold(enw0)
end(*let*)
//
end(*let*)//end-of-(enwd3i0_poplet0(enw0))
//
(* ****** ****** *)
//
#implfun
enwd3i0_pshlet0
(     enw0     ) = let
//
val+
@ENWD3I0(!stkmap) = enw0
//
in//let
//
(stkmap_pshlet0(stkmap); $fold(enw0))
//
end(*let*)//end-of-(enwd3i0_pshlet0(enw0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
enwd3i0_dfix$search
  (enw0, dfix) = let
//
val k0 = dfix.name()
//
val+
@ENWD3I0(!stkmap) = enw0
//
val opt0 =
stkmap_search$opt(stkmap, k0)
//
(*
val () =
prerrsln
("enwd3i0_dfix$search: k0 = ", k0)
*)
//
in//let
//
(
case+ opt0 of
| ~optn_vt_nil((*0*)) => list_nil()
| ~optn_vt_cons(i0vs) => (   i0vs   ))
//
end(*let*)//end-of-(enwd3i0_dfix$search(...))
//
(* ****** ****** *)
//
#implfun
enwd3i0_dfix$insert
(enw0, dfix, i0vs) = let
//
val k0 = dfix.name()
//
val+
@ENWD3I0(!stkmap) = enw0
//
in//let
(
  stkmap_insert$any(stkmap, k0, i0vs))
end(*let*)//end-of-(enwd3i0_dfix$insert(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
endloc (*local*) // end-of-[ local(enwd3i0_vtbx) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_tryd3i0_myenv0.dats] *)
(***********************************************************************)
