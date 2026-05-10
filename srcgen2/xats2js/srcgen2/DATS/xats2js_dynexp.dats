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
Sat May  9 11:05:43 AM EDT 2026
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
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
//
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/trxi0i1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(out0: FILR): void =
(
 strn_fprint("\n",out0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1bndfpr
( out0: FILR
, ibnd: i1bnd): void =
(
i1bnd_fprint(ibnd, out0))//endfun
//
fun
i1gptfpr
(out0: FILR
,igpt: i1gpt): void =
(
i1gpt_fprint(igpt, out0))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valfpr
( filr: FILR
, ival: i1val): void =
(
i1val_fprint(ival, filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_xats2js
(ilet, env0) =
let
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1letfpr(env0, ilet); fprintln(filr)
end where//endof(let)
{
//
fun
i1letfpr
( env0:
! envx2js
, ilet: i1let): void =
let
//
#impltmp
g_print$out<>() =
envx2js_filr$get(env0)
//
in//let
//
case+ ilet of
|I1LETnew0(iins) =>
(
prints
("I1LETnew0(", "...", ")\n");
envx2js_incnind(env0,2(*inc*));
i1ins_xats2js(  iins , env0  );
envx2js_decnind(env0,2(*dec*)))
//
|I1LETnew1(itnm, iins) =>
(
envx2js_incnind(env0,2(*inc*));
i1ins_xats2js(  iins , env0  );
envx2js_decnind(env0,2(*dec*)))
where
{
val () =
prints("\
I1LETnew1(", itnm, ";", "...", ")\n")
}(*where*)
//
end//let//end-of-[ i1letfpr(env0,ilet) ]
//
}(*where*)//end-of-[i1let_xats2js(ilet,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_xats2js_dynexp.dats] *)
(***********************************************************************)
