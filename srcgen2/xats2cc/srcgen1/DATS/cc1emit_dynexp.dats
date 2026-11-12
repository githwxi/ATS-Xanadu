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
(* ****** ****** *)
//
fun
i1inscc1
( filr: FILR
, iins: i1ins): void =
let
//
(*
val () =
prerrsln
("i1inscc1: iins = ", iins)
*)
//
in//let
//
case+ iins of
//
(* ****** ****** *)
|
_(*otherwise*) => i1ins_fprint(iins, filr)
(* ****** ****** *)
//
end(*let*)//end-of-[i1inscc1(filr,iins)]
//
(* ****** ****** *)
//
fun
i1cmpcc1
( filr: FILR
, icmp: i1cmp): void =
let
//
(*
val () =
prerrsln
("i1cmpcc1: icmp = ", icmp)
*)
//
in//let
//
case+ icmp of
//
(* ****** ****** *)
|
_(*otherwise*) => i1cmp_fprint(icmp, filr)
(* ****** ****** *)
//
end(*let*)//end-of-[i1cmpcc1(filr,icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_cc1emit
(ilet, env0) =
let
//
val () =
prerrsln
("i1let_cc1emit: ilet = ", ilet)
//
in//let
//
case+ ilet of
//
|I1LETnew0
(   iins   ) =>
(
case+ iins of
|
_(*otherwise*) =>
(
nindfpr(filr, nind);i1inscc1(filr, iins);endlfpr(filr))
)
//
|I1LETnew1
(itnm, iins) =>
(
case+ iins of
|
_(*otherwise*) =>
(
nindfpr(filr, nind);i1tnmcc1(filr, itnm);
strnfpr(filr, " = ");i1inscc1(filr, iins);endlfpr(filr))
)
end where
{
//
(* ****** ****** *)
(* ****** ****** *)
val filr = env0.filr()
val nind = env0.nind()
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i1let_cc1emit(ilet,env0)]
//
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_cc1emit_dynexp.dats] *)
(***********************************************************************)
(***********************************************************************)
