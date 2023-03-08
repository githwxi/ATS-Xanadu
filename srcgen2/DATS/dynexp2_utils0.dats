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
Tue 07 Mar 2023 10:59:05 PM EST
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
//
#implfun
s2vts_make_lctn_tqas
( loc0, t2qs ) =
(
f0_make(loc0, t2qs)) where
{
fun
f0_make
( loc0: loc_t
, t2qs: t2qaglst): s2vts =
(
case+ t2qs of
|
list_nil() =>
list_nil((*void*))
|
list_cons(t2q1, t2qs) =>
f1_make
( t2q1.s2vs()
, f0_make(loc0, t2qs))) where
{
fun
f1_make
( s2vs
: s2varlst, svts: s2vts): s2vts =
(
case+ s2vs of
|
list_nil() => svts
|
list_cons(s2v1, s2vs) =>
(
list_cons
( @(s2v1, xtv1)
, f1_make(s2vs, svts))) where
{ val xtv1 =
  s2typ_xtv(x2t2p_make_lctn(loc0)) }
//(*where*) // end of [list_cons(...)]
)
} (*where*) // end of [f0_make(loc0,t2qs)]
} (*where*) // end of [s2vts_make_lctn_tqas(...)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp2_utils0.dats] *)
