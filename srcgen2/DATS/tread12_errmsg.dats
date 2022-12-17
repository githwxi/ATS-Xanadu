(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Sat 17 Dec 2022 04:34:14 PM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#define FPEMSG_ERRVL 2
(* ****** ****** *)
#symload fpemsg with sort2_fpemsg
#symload fpemsg with s2exp_fpemsg
#symload fpemsg with l2s2e_fpemsg
(* ****** ****** *)
#symload fpemsg with d2pat_fpemsg
#symload fpemsg with l2d2p_fpemsg
#symload fpemsg with d2exp_fpemsg
#symload fpemsg with l2d2e_fpemsg
(* ****** ****** *)
#symload fpemsg with d2ecl_fpemsg
(* ****** ****** *)

local

fun
auxmain
( out: FILR
, s2t: sort2): void =
let
#impltmp
g_print$out<>() = out
in//let
case s2t of
//
|S2Tid0 _ => ()
|S2Tint _ => ()
|S2Tbas _ => ()
//
|
S2Ttup(s2ts) =>
(
sort2lst_fpemsg(out, s2ts))
//
|S2Tfun0 _ => ()
|
S2Tfun1
(s2ts, sres) =>
(
sort2_fpemsg
( out, sres )) where
{
val () =
sort2lst_fpemsg(out, s2ts) }
//
|
S2Tapps
(s2f0, s2ts) =>
(
sort2_fpemsg
( out, s2f0 )) where
{
val () =
sort2lst_fpemsg(out, s2ts) }
//
|S2Tnone0() => ((*void*))
|S2Tnone1(s0t1) => ((*void*))
//
|
S2Terrck _ => sort2_fpemsg(out, s2t)
end(*let*)//end-of-(auxmain(out,s2t))
//
in//local
//
#implfun
sort2_fpemsg
( out, s2t0 ) =
let
#impltmp
g_print$out<>() = out
in//let
//
case+ s2t0 of
|
S2Terrck(lvl, s2t1) =>
(
auxmain( out, s2t1 ); 
if
(lvl
>FPEMSG_ERRVL) then () else
println("TREAD12-ERROR:",s2t0))
| _(* otherwise *) => (  (* skipped *)  )
//
end(*let*)//end-of(sort2_fpemsg(out,s2t0))
//
endloc(*local*)//end-of(local(sort2_fpemsg))

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12_errmsg.dats] *)
