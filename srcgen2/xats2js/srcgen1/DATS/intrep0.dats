(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 02 Mar 2024 06:04:06 PM EST
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
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pat_none0
(  loc0  ) =
i0pat_make_node
(loc0,I0Pnone0((*void*)))
#implfun
i0pat_none1
(  d3p0  ) =
i0pat_make_node
(
d3p0.lctn(),I0Pnone1(d3p0))
//
(* ****** ****** *)
//
#implfun
i0exp_none0
(  loc0  ) =
i0exp_make_node
(loc0,I0Enone0((*void*)))
#implfun
i0exp_none1
(  d3e0  ) =
i0exp_make_node
(
d3e0.lctn(),I0Enone1(d3e0))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0pat =
I0PAT of
(loctn, i0pat_node)
datavwtp
i0pat_vt =
I0PAT_vt of
(loctn, i0pat_node)
//
#absimpl i0pat_tbox = i0pat
//
in (* in-of-local *)
//
#implfun
i0pat_make_node
(   loc,nod   ) =
(
  I0PAT(loc, nod) )
//
#implfun
i0pat_get_lctn(i0p) =
let
val+
I0PAT(loc,nod) = i0p in loc end
#implfun
i0pat_get_node(i0p) =
let
val+
I0PAT(loc,nod) = i0p in nod end
//
endloc (*local*) // end of [local(i0pat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0exp =
I0EXP of
(loctn, i0exp_node)
datavwtp
i0exp_vt =
I0EXP_vt of
(loctn, i0exp_node)
//
#absimpl i0exp_tbox = i0exp
//
in (* in-of-local *)
//
#implfun
i0exp_make_node
(   loc,nod   ) =
(
  I0EXP(loc, nod) )
//
#implfun
i0exp_get_lctn(i0e) =
let
val+
I0EXP(loc,nod) = i0e in loc end
#implfun
i0exp_get_node(i0e) =
let
val+
I0EXP(loc,nod) = i0e in nod end
//
endloc (*local*) // end of [local(i0exp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i0dcl =
I0DCL of
(loctn, i0dcl_node)
datavwtp
i0dcl_vt =
I0DCL_vt of
(loctn, i0dcl_node)
//
#absimpl i0dcl_tbox = i0dcl
//
in (* in-of-local *)
//
#implfun
i0dcl_make_node
(   loc,nod   ) =
(
  I0DCL(loc, nod) )
//
#implfun
i0dcl_get_lctn(dcl) =
let
val+
I0DCL(loc,nod) = dcl in loc end
#implfun
i0dcl_get_node(dcl) =
let
val+
I0DCL(loc,nod) = dcl in nod end
//
endloc (*local*) // end of [local(i0dcl)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep0.dats] *)
(***********************************************************************)
