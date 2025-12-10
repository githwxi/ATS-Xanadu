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
Tue May 27 02:22:54 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
//
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
//
#symload +
with sint_add$sint of 1099
#symload -
with sint_sub$sint of 1099
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xlabel0.sats"
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
//
#symload sort with s2typ_get_sort
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_none0
  ((*void*)) =
(
s2typ1_make_sort$node
(s2t0, T2P1none0(*0*)))
where
{
val s2t0 = sort2_none0()}
//
(* ****** ****** *)
//
#implfun
s2typ1_lft

  ( t2q0 ) =
(
s2typ1_make_sort$node
(t2q0.sort(), T2P1lft(t2q0)))
//
(* ****** ****** *)
//
#implfun
s2typ1_make_s2typ
  (  t2p0  ) = 
(
s2typ1_make_sort$node
(s2t0, T2P1s2typ(t2p0)))
where
{
  val s2t0 = t2p0.sort((*0*))
}(*where*)//end-of-[s2typ1_make_s2typ]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
s2typ1 =
S2TYP1 of
(sort2, s2typ1_node)
datavwtp
s2typ1_vt =
S2TYP1_vt of
(sort2, s2typ1_node)
//
#absimpl s2typ1_tbox = s2typ1
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
s2typ1_sort$get
  ( styp ) =
let
val+
S2TYP1
( s2t0
, node) = styp in s2t0
end//end-of-[s2typ1_sort$get]
//
#implfun
s2typ1_node$get
  ( styp ) =
let
val+
S2TYP1
( s2t0
, node) = styp in node
end//end-of-[s2typ1_node$get]
//
(* ****** ****** *)
//
#implfun
s2typ1_make_sort$node
  ( s2t0, node ) =
(
  S2TYP1(s2t0, node) )//implfun
//
(* ****** ****** *)
//
endloc(*local*)//end-of-[local(s2typ1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-10-15:
Wed Oct 15 05:24:57 PM EDT 2025
*)
//
local
//
fun
f0_labelize
( t2qs
: s2typ1lst
, i0: sint): l2t2p1lst =
(
case+ t2qs of
|
list_nil() =>
list_nil((*void*))
|
list_cons(t2q1, t2qs) =>
let
val ltp1 = S2LAB(LABint(i0),t2q1)
in//let
list_cons(ltp1,f0_labelize(t2qs,i0+1))
end (*let*)
) (*case+*) // end-[f0_labelize(...)]
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
s2typ1_tup0
(npf1, t2qs) =
let
//
(*
val s2t0 =
the_sort2_type(*0*)
*)
val linq =
s2typ1lst_linq(t2qs)
val prfq =
s2typ1lst_prfq(t2qs)
//
val s2t0 =
(
if prfq
then
(
if linq
then the_sort2_view
else the_sort2_prop)
else
(
if linq
then the_sort2_vwtp
else the_sort2_type))
//
val trcd = TRCDflt0(*0*)
val ltqs =
f0_labelize(t2qs, 0(*i0*))
//
in//let
s2typ1_make_sort$node
(s2t0,T2P1trcd(trcd,npf1,ltqs))
end where
{
//
val () =
prerrsln("s2typ1_tup0: npf1 = ", npf1)
val () =
prerrsln("s2typ1_tup0: t2qs = ", t2qs)
//
}(*where*)//end-of-[s2typ1_tup0(npf1,t2qs)]
//
(* ****** ****** *)
//
#implfun
s2typ1_tup1
(trcd, npf1, t2qs) =
(
s2typ1_rcd2
(trcd, npf1, ltqs)) where
{
//
val ltqs = f0_labelize(t2qs, 0(*i0*))
//
(*
val () =
prerrsln("s2typ1_tup1: trcd = ", trcd)
val () =
prerrsln("s2typ1_tup1: npf1 = ", npf1)
val () =
prerrsln("s2typ1_tup1: t2qs = ", t2qs)
*)
//
}(*where*)//endof(s2typ1_tup1(trcd,npf1,ltqs))
//
(* ****** ****** *)
//
#implfun
s2typ1_rcd2
(trcd, npf1, ltqs) =
let
//
val s2t0 =
(
case+ trcd of
|TRCDflt0() =>
(
let
(*
val s2t0 =
the_sort2_type(*0*)
*)
val linq =
l2t2p1lst_linq(ltqs)
val prfq =
l2t2p1lst_prfq(ltqs)
//
in//let
if prfq
then
(
if linq
then the_sort2_view
else the_sort2_prop)
else
(
if linq
then the_sort2_vwtp
else the_sort2_type) end)
//let//end-of-[TRCDflt0()]
//
|TRCDbox0 => the_sort2_tbox(*non*)
|TRCDbox1 => the_sort2_vtbx(*lin*)
|TRCDbox2 => the_sort2_tbox(*ref*)
//
)(*case+(trcd)-of*)//end(val(s2t0))
//
in//let
(
s2typ1_make_sort$node(
  s2t0, T2P1trcd(trcd, npf1, ltqs)))
end where
{
//
(*
val () =
prerrsln("s2typ1_rcd2: trcd = ", trcd)
val () =
prerrsln("s2typ1_rcd2: npf1 = ", npf1)
val () =
prerrsln("s2typ1_rcd2: ltqs = ", ltqs)
*)
//
}(*where*)//endof(s2typ1_rcd2(trcd,npf1,ltqs))
//
(* ****** ****** *)
endloc//end-of-(local(s2typ1_tup0/tup1/rcd2(...))]
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_statyp2.dats] *)
(***********************************************************************)
