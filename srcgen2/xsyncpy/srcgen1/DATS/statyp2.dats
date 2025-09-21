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
//
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
  val s2t0 = sort2_none0()
}(*where*)//end-of-[s2typ1_none0]
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
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_statyp2.dats] *)
(***********************************************************************)
