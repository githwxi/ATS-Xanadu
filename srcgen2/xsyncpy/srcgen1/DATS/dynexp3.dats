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
Sat May 17 10:53:55 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
//
(* ****** ****** *)
#staload
"./../../../SATS/locinfo.sats"
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3exp1 =
D3EXP1 of
( loctn
, s2typ1, d3exp1_node)
datavwtp
d3exp1_vt =
D3EXP1_vt of
( loctn
, s2typ1, d3exp1_node)
//
#absimpl d3exp1_tbox = d3exp1
//
(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)
//
#implfun
d3exp1_make_node
( loc0, node ) =
let
val
t2p0 = s2typ1_none0()
in//let
  D3EXP1(loc0, t2p0, node) end
//
(* ****** ****** *)
//
endloc (*local*) // end of [local(d3exp1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#staload "\
./../DATS/dynexp3_print0.dats"
//
in//local
//
#implfun
d3pat1_fprint = g_fprint<d3pat1>
#implfun
d3exp1_fprint = g_fprint<d3exp1>
//
end//local
//
(* ****** ****** *)
//
#impltmp
g_print<d3pat1>(d3e0) =
d3pat1_fprint(d3e0, g_print$out<>())
#impltmp
g_print<d3exp1>(d3e0) =
d3exp1_fprint(d3e0, g_print$out<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
d3parsed1 =
D3PARSED1 of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
d3ecl1lstopt)//program
//
#absimpl
d3parsed1_tbox = d3parsed1
//
in//local
//
//
#implfun
d3parsed1_make_args
( stadyn
, nerror, source, parsed) =
(
D3PARSED1
( stadyn
, nerror, source, parsed)) where
{
//
(*
val () =
prerrsln
("d3parsed1_make_args:nerror=",nerror)
*)
//
} (*where*) // end-of-[d3parsed1_make_args]
//
endloc (*local*) // end of [ local(d3parsed1) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp3.dats] *)
(***********************************************************************)
