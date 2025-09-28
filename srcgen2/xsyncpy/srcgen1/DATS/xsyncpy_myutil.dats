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
Mon Sep  8 11:10:02 PM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/xsyncpy.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
(*
//
HX-2025-09-25:
prelude:
#symload =
with sint_eq$sint of 1000
srcgen1/prelude:
#symload = with
gint_eq$sint$sint of 1002
//
*)
#symload =
with sint_eq$sint of 1099
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
d2varlst_duprmv0
  (dvs) =
(
case+ dvs of
| ~
list_vt_nil() => list_vt_nil()
| ~
list_vt_cons(dv1, dvs) =>
auxmain(dv1, dvs, list_vt_nil()))
where
{
//
#vwtpdef
d2varlst = list_vt(d2var)
//
fun
auxmain
( dv0: d2var
, dvs: d2varlst
, res: d2varlst): d2varlst =
(
case+ dvs of
| ~
list_vt_nil() =>
list_vt_reverse0
(
list_vt_cons(dv0, res))
| ~
list_vt_cons(dv1, dvs) =>
(
if g_cmp(dv0, dv1) = 0
then auxmain(dv1, dvs, res)
else
auxmain
(dv1, dvs, list_vt_cons(dv0, res)))
)(*case+*)//end-of-[auxmain(dv0,dvs)]
//
}(*where*)//end-of-[d2varlst_duprmv0(dvs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
dvdtplst_duprmv0
  (vts) =
(
case+ vts of
| ~
list_vt_nil() => list_vt_nil()
| ~
list_vt_cons(vt1, vts) =>
auxmain(vt1, vts, list_vt_nil()))
where
{
//
#vwtpdef
dvdtplst = list_vt(dvdtp)
//
fun
auxmain
( vt0: dvdtp
, vts: dvdtplst
, res: dvdtplst): dvdtplst =
(
case+ vts of
| ~
list_vt_nil() =>
list_vt_reverse0
(
list_vt_cons(vt0, res))
| ~
list_vt_cons(vt1, vts) =>
(
if
g_cmp(vt0.0, vt1.0) = 0
then auxmain(vt1, vts, res)
else
auxmain
(vt1, vts, list_vt_cons(vt0, res)))
)(*case+*)//end-of-[auxmain(vt0,vts)]
//
}(*where*)//end-of-[dvdtplst_duprmv0(vts)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_xsyncpy_myutil.dats] *)
(***********************************************************************)
