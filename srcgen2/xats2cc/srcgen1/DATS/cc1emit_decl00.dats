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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Sun Aug 16 10:36:26 AM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
//
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // BAS =
"./../../../SATS/xbasics.sats"
//
#staload // STM =
"./../../../SATS/xstamp0.sats"
#staload // SYM =
"./../../../SATS/xsymbol.sats"
#staload // LOC =
"./../../../SATS/locinfo.sats"
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2cc.sats"
//
#staload "./../SATS/cc1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
endlfpr
(filr: FILR): void =
(
strn_fprint("\n", filr))//endfun
//
(* ****** ****** *)
//
fun
lctnfpr
(filr: FILR
,loc0: loc_t): void =
(
loctn_fprint(loc0,filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_cc1emit
(dcl0, env0) =
let
(*
//
val () =
prerrsln
("i1dcl_cc1emit: dcl0 = ", dcl0)
//
*)
in//let
//
case+
dcl0.node() of
//
|_(*otherwise*) => f0_otherwise(dcl0,env0)
(* ****** ****** *)
(* ****** ****** *)
//
end where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_otherwise
(
dcl0: i1dcl,
env0: !envxcc1): void =
let
//
val loc0 =
dcl0.lctn((*void*))
//
val filr =
envxcc1_filr$get(env0)
val nind =
envxcc1_nind$get(env0)
//
in//let
//
nindfpr(filr, nind);
strnfpr(filr, "// ");lctnfpr(filr, loc0);endlfpr(filr);
nindfpr(filr, nind);
strnfpr(filr, "// ");i1dcl_fprint(dcl0, filr);endlfpr(filr)
//
end(*let*)//end-of-[f0_otherwise(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i1dcl_cc1emit(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2cc/srcgen1/DATS/cc1emit_decl00.dats] *)
(***********************************************************************)
(***********************************************************************)
