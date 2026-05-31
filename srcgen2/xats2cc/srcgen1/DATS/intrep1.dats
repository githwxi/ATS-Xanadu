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
Sun May 31 03:02:54 PM EDT 2026
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
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1typ_none0
((*void*)) =
i1typ_make_node
(s2t0,I1Tnone0())
where{
val s2t0 = sort2_none0()}
//
#implfun
i1typ_none1
(  i0t0  ) =
i1typ_make_node
(i0t0.sort(),I1Tnone1(i0t0))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i1typ =
I1TYP of
(sort2, i1typ_node)
(*
datavwtp
i1typ_vt =
I1TYP_VT of
(sort2, i1typ_node)
*)
//
#absimpl i1typ_tbox = i1typ
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
i1typ_make_node
( sort, node ) =
(
  I1TYP(sort, node))
//
(* ****** ****** *)
//
#implfun
i1typ_sort$get
(   ityp   ) =
let
val+
I1TYP
(s2t0, node) = ityp in s2t0 end
//
(* ****** ****** *)
//
#implfun
i1typ_node$get
(   ityp   ) =
let
val+
I1TYP
(s2t0, node) = ityp in node end
//
(* ****** ****** *)
//
endloc(*local*)//end-of-[local(i1typ)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_intrep1.dats] *)
(***********************************************************************)
