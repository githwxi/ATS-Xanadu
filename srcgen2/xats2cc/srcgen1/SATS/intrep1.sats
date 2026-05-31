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
Sat Apr  4 08:20:20 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./intrep0.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./\
../../../SATS/xbasics.sats"
#staload "./\
../../../SATS/xstamp0.sats"
#staload "./\
../../../SATS/xsymbol.sats"
#staload "./\
../../../SATS/xlabel0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload S2E = "./\
../../../SATS/staexp2.sats"
#staload T2P = "./\
../../../SATS/statyp2.sats"
#staload D2E = "./\
../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef sort2 = $S2E.sort2
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i1typ_tbox // p0tr
#typedef i1typ = i1typ_tbox
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i1typ_node =
(* ****** ****** *)
//
(*
|I1Tbas of sym_t // type
*)
//
|I1Tcst of s2cst // constant
|I1Tvar of s2var // variable
//
(* ****** ****** *)
|I1Tnone0 of ((*0*)) | I1Tnone1 of (i0typ)
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1typ_sort$get
(ityp: i1typ): sort2
fun
i1typ_node$get
(ityp: i1typ): i1typ_node
//
#symload sort with i1typ_sort$get
#symload node with i1typ_node$get
//
(* ****** ****** *)
//
fun
i1typ_fprint
(ityp: i1typ, out0: FILR): void
#symload fprint with i1typ_fprint
//
(* ****** ****** *)
//
fun
i1typ_none0((*void*)): i1typ
fun
i1typ_none1(i0t0: i0typ): i1typ
//
fun
i1typ_make_node
(s2t0
:sort2, node:i1typ_node): i1typ
#symload i1typ with i1typ_make_node
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_SATS_intrep1.sats] *)
(***********************************************************************)
