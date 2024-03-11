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
//
(*
Author: Hongwei Xi
//
Sat 02 Mar 2024 05:55:19 PM EST
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xsymbol.sats"
#staload
"./../../../SATS/xlabel0.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/filpath.sats"
#staload
"./../../../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef stamp = stamp
#typedef sym_t = sym_t
#typedef label = label
#typedef loctn = loctn
#typedef loc_t = loctn
(* ****** ****** *)
(* ****** ****** *)
#staload S2E =
"./../../../SATS/staexp2.sats"
#staload T2P =
"./../../../SATS/statyp2.sats"
#staload D2E =
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
#staload D3E =
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0lab(x0:type) =
|
I0LAB of (label, x0(*elt*))
//
(* ****** ****** *)
//
fun
<x0:type>
i0lab_fprint
( out: FILR
, lab: i0lab( x0 )): (void)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
(* ****** ****** *)
#abstbox i0pat_tbox // p0tr
#typedef i0pat = i0pat_tbox
(* ****** ****** *)
#abstbox i0exp_tbox // p0tr
#typedef i0exp = i0exp_tbox
(* ****** ****** *)
#typedef l0i0p = i0lab(i0pat)
#typedef l0i0e = i0lab(i0exp)
(* ****** ****** *)
#typedef i0patlst = list(i0pat)
#typedef l0i0plst = list(l0i0p)
(* ****** ****** *)
#typedef i0expopt = optn(i0exp)
#typedef i0explst = list(i0exp)
#typedef l0i0elst = list(l0i0e)
(* ****** ****** *)
(* ****** ****** *)

datatype
i0pat_node =
//
|I0Pnil of ()
|I0Pany of ()
//
|I0Pint of sint
|I0Pbtf of bool
|I0Pchr of char
//
|I0Pflt of token
|I0Pstr of token
//
|I0Pvar of d2var
//
|I0Pbang of (i0pat)
//
(*
|I0Pflat of (i0pat)
|I0Pfree of (i0pat)
*)
//
|I0Pcapp of
( d2con, i0patlst )
//
|I0Ptup0 of (i0patlst)
|I0Ptup1 of (token, i0patlst)
|I0Prcd2 of (token, l0i0plst)
//
|I0Pnone0 of ((*0*)) | I0Pnone1 of (d3pat)

(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_intrep0.sats] *)
(***********************************************************************)
