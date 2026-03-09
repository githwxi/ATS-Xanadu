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
(*
Sun Mar  8 08:19:34 PM EDT 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
#staload "./../SATS/f2perr0.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload sort with s2exp_get_sort
#symload node with s2exp_get_node
(* ****** ****** *)
//
local
(* ****** ****** *)
#define ERRLVL 3
(* ****** ****** *)
fun
auxmain
( out: FILR
, s2e0: s2exp
, loc0: loc_t): void =
let
//
#impltmp
g_print$out<>() = out
//
(*
val () =
(
prerrs
("f2perr0_s2exp:");
prerrsln
("auxmain: s2e0 = ", s2e0))
*)
//
in//let
//
case+
s2e0.node() of
//
(* ****** ****** *)
//
|S2Eint _ => ((*void*))
|S2Ebtf _ => ((*void*))
|S2Echr _ => ((*void*))
|S2Estr _ => ((*void*))
//
(* ****** ****** *)
//
|S2Ecst(s2c) => ((*void*))
|S2Evar(s2v) => ((*void*))
|S2Eany(knd) => ((*void*))
//
(* ****** ****** *)
//
|S2Etop0
(   s2e1   ) =>
let
val () =
(
f2perr0_s2exp(out, s2e1, loc0))
endlet//end-of-[S2Etop0( s2e1 )]
//
|S2Etop1
(   s2e1   ) =>
let
val () =
(
f2perr0_s2exp(out, s2e1, loc0))
endlet//end-of-[S2Etop1( s2e1 )]
//
(* ****** ****** *)
//
|S2Earg1
(tknd, s2e1) =>
let
val () =
(
  f2perr0_s2exp(out, s2e1, loc0))
endlet//end-of-[S2Earg1(tknd, ...)]
//
|S2Eatx2
(sbef, saft) =>
let
val () =
(
  f2perr0_s2exp(out, sbef, loc0))
val () =
(
  f2perr0_s2exp(out, saft, loc0))
endlet//end-of-[S2Eatx2(tknd, ...)]
//
(* ****** ****** *)
//
|S2Eapps
(s2f0, s2es) =>
let
val () =
f2perr0_s2exp(out, s2f0, loc0)
val () =
f2perr0_s2explst(out, s2es, loc0)
endlet//end-of-[S2Eapps(s2f0,s2es)]
//
|S2Elam1
(s2vs, s2e1) =>
let
val () =
(
  f2perr0_s2exp(out, s2e1, loc0))
endlet//end-of-[S2Elam(s2vs,s2e1)]
//
(* ****** ****** *)
//
|S2Efun1
(f2cl
,npf1
,s2es, s2e1) =>
let
val () =
(
f2perr0_s2explst(out,s2es,loc0))
val () =
(
  f2perr0_s2exp(out, s2e1, loc0))
endlet//end-of-[S2Efun1(f2cs, ...)]
//
(* ****** ****** *)
//
|S2Eexi0
(s2vs
,s2es, s2e1) =>
let
val () =
(
f2perr0_s2explst(out,s2es,loc0))
val () =
(
  f2perr0_s2exp(out, s2e1, loc0))
endlet//end-of-[S2Eexi0(s2vs, ...)]
//
|S2Euni0
(s2vs
,s2es, s2e1) =>
let
val () =
(
f2perr0_s2explst(out,s2es,loc0))
val () =
(
  f2perr0_s2exp(out, s2e1, loc0))
endlet//end-of-[S2Euni0(s2vs, ...)]
//
(* ****** ****** *)
//
|S2Emet0
(s2es, s2e1) =>
let
val () =
(
f2perr0_s2explst(out,s2es,loc0))
val () =
(
  f2perr0_s2exp(out, s2e1, loc0))
endlet//end-of-[S2Emet0(s2es,s2e1)]
//
(* ****** ****** *)
//
|S2Etext
(name, s2es) =>
let
val () =
f2perr0_s2explst(out, s2es, loc0)
endlet//end-of-[S2Etext(name,s2es)]
//
(* ****** ****** *)
//
|S2Eerrck
( _(*lvl0*)
, _(*s2e1*)) =>
let
val () =
(
  f2perr0_s2exp(out, s2e0, loc0))
endlet//end-of-[S2Eerrck(lvl1,s2e1)]
//
|
_(*otherwise*) =>
let
val () =
(
prerrsln(
"f2perr0_s2exp:auxmain: loc0 = ", loc0))
val () =
(
prerrsln(
"f2perr0_s2exp:auxmain: s2e0 = ", s2e0))
endlet
//
end(*let*)//end-of-[auxmain(out,s2e0,loc0)]
//
in//local
//
#implfun
f2perr0_s2exp
( out
, s2e0, loc0) =
let
//
#impltmp
g_print$out<>() = out
//
in//let
//
case+
s2e0.node() of
|
S2Eerrck(lvl, s2e1) =>
(
auxmain
(out, s2e1, loc0); 
if // if
(lvl>=ERRLVL)
then ((*void*)) else
(
printsln();
printsln("\
F2PERR0-ERROR:", loc0, ":", s2e0))
)
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//endof(f2perr0_s2exp(out,s2e0,loc0))
//
endloc(*local*)//endof(local(f2perr0_s2exp(...)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
f2perr0_s2explst
(out, s2es, loc0) =
(
//
case+ s2es of
|
list_nil() => ()
|
list_cons(s2e1, s2es) =>
let
val () =
f2perr0_s2exp(out, s2e1, loc0)
in//let
f2perr0_s2explst(out, s2es, loc0)
end//let//end-of-[list_cons(s2e1,s2es)]
//
)(*case+*)//endof[f2perr0_s2explst(out,s2es,loc0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_f2perr0_staexp.dats] *)
(***********************************************************************)
