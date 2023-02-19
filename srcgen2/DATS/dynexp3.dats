(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu 16 Feb 2023 06:35:54 AM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2exp_get_node
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload lctn with d2exp_get_lctn
#symload lctn with d2ecl_get_lctn
(* ****** ****** *)

local
//
datatype
d3pat =
D3PAT of
( loctn
, s2typ, d3pat_node)
datavwtp
d3pat_vt =
D3PAT_vt of
( loctn
, s2typ, d3pat_node)
//
#absimpl d3pat_tbox = d3pat
//
in (* in-of-local *)
//
#implfun
d3pat_make_node
(   loc,nod   ) =
let
val t2p =
s2typ_none0() in
D3PAT(loc, t2p, nod) end
//
#implfun
d3pat_get_lctn(d3p) =
let
val+
D3PAT(loc,t2p,nod) = d3p in loc
end
#implfun
d3pat_get_node(d3p) =
let
val+
D3PAT(loc,t2p,nod) = d3p in nod
end
#implfun
d3pat_get_styp(d3p) =
let
val+
D3PAT(loc,t2p,nod) = d3p in t2p
end
//
#implfun
d3pat_set_styp
( d3p0, t2p0 ) =
let
//
val
d3p0 =
$UN.castlin10{d3pat_vt}(d3p0)
val+
@D3PAT_vt
(loc0,
!styp,node) = d3p0 in styp := t2p0
end (*let*) // end of [d3pat_set_styp]
//
endloc (*local*) // end of [local(d3pat)]

(* ****** ****** *)

local
//
datatype
d3ecl =
D3ECL of
(loctn, d3ecl_node)
//
#absimpl d3ecl_tbox = d3ecl
//
in (* in-of-local *)
//
#implfun
d3ecl_make_node
(   loc,nod   ) = D3ECL(loc,nod)
//
#implfun
d3ecl_get_lctn(dcl) =
let
  val+D3ECL(loc,nod) = dcl in loc
end
#implfun
d3ecl_get_node(dcl) =
let
  val+D3ECL(loc,nod) = dcl in nod
end
//
endloc (*local*) // end of [local(d3ecl)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp3.dats] *)
