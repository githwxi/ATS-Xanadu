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
Sat 16 Mar 2024 12:43:42 PM EDT
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
//
datatype
i1lab(x0:type) =
|
I1LAB of (label, x0(*elt*))
//
(* ****** ****** *)
//
fun
<x0:type>
i1lab_fprint
( out: FILR
, lab: i1lab( x0 )): (void)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstype i1val_tbox
#typedef i1val = i1val_tbox
//
#typedef l1i1v = i1lab(i1val)
//
(* ****** ****** *)
//
#typedef i1valist = list(i1val)
#typedef l1i1vlst = list(l1i1v)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i1val_node =
//
|I1Vnil of ()
//
|I1Vint of (sint)
|I1Vbtf of (bool)
|I1Vchr of (char)
|I1Vflt of (dflt)
|I1Vstr of (strn)
//
(* ****** ****** *)
//
(*
|I1Vcst of (d2cst)
|I1Vcon of (d2con)
*)
//
(* ****** ****** *)
//
|I1Vtup0 of (i1valist)
|I1Vtup1 of (i1valist)
|I1Vrcd2 of (l1i1vlst)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_fprint
(out:FILR, ival:i1val): void
//
(* ****** ****** *)
//
fun
i1val_get_lctn(i1val):( loc_t )
fun
i1val_get_node(i1val):i1val_node
//
(* ****** ****** *)
#symload lctn with i1val_get_lctn
#symload node with i1val_get_node
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_intrep1.sats] *)
(***********************************************************************)
