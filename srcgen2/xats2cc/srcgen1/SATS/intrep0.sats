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
Sat Mar  7 09:24:25 AM EST 2026
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
//
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xsymbol.sats"
#staload
"./../../../SATS/xlabel0.sats"
//
(* ****** ****** *)
#staload // S2E =
"./../../../SATS/staexp2.sats"
#staload // T2P =
"./../../../SATS/statyp2.sats"
#staload // D2E =
"./../../../SATS/dynexp2.sats"
#staload // D3E =
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
(* ****** ****** *)
#abstbox i0typ_tbox // p0tr
#typedef i0typ = i0typ_tbox
(* ****** ****** *)
#abstbox i0pat_tbox // p0tr
#typedef i0pat = i0pat_tbox
(* ****** ****** *)
#abstbox i0exp_tbox // p0tr
#typedef i0exp = i0exp_tbox
(* ****** ****** *)
#abstbox i0dcl_tbox // p0tr
#typedef i0dcl = i0dcl_tbox
(* ****** ****** *)
#typedef l0i0t = i0lab(i0typ)
#typedef l0i0p = i0lab(i0pat)
#typedef l0i0e = i0lab(i0exp)
(* ****** ****** *)
#abstbox fiarg_tbox // p0tr
#typedef fiarg = fiarg_tbox
(* ****** ****** *)
#typedef i0typlst = list(i0typ)
#typedef l0i0tlst = list(l0i0t)
(* ****** ****** *)
#typedef i0patlst = list(i0pat)
#typedef l0i0plst = list(l0i0p)
(* ****** ****** *)
#typedef i0expopt = optn(i0exp)
#typedef i0explst = list(i0exp)
#typedef l0i0elst = list(l0i0e)
(* ****** ****** *)
#typedef i0dclopt = optn(i0dcl)
#typedef i0dclist = list(i0dcl)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:type>
i0lab_fprint
(lab:i0lab(x0), out:FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0typ_node =
//
(*
|I0Tbas of sym_t // type
*)
//
|I0Tcst of s2cst // constant
|I0Tvar of s2var // variable
//
|I0Tlft of (i0typ) // left-value
//
(* ****** ****** *)
//
|I0Ttop0 of (i0typ) // uninitized
|I0Ttop1 of (i0typ) // delineared
//
(* ****** ****** *)
//
|I0Texi0 of // exists quantifier
(s2varlst(*vars*), i0typ(*body*))
|I0Tuni0 of // forall quantifier
(s2varlst(*vars*), i0typ(*body*))
//
(* ****** ****** *)
//
|I0Ttcon of (d2con, i0typlst)
|I0Ttrcd of
(trcdknd(*knd*), sint(*npf*), l0i0tlst)
//
(* ****** ****** *)
//
|I0Terrck of (int(*lvl*), i0typ)//HX:tread-error
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0typ_sort$get
(ityp: i0typ): sort2
fun
i0typ_node$get
(ityp: i0typ): i0typ_node
//
#symload sort with i0typ_sort$get
#symload node with i0typ_node$get
(* ****** ****** *)
//
fun
i0typ_fprint
(ityp: i0typ, out0: FILR): void
#symload fprint with i0typ_fprint
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0pat_node =
(* ****** ****** *)
//
|I0Pany of ()
|I0Pvar of d2var
//
(* ****** ****** *)
|I0Pint of token
|I0Pbtf of sym_t
|I0Pchr of token
|I0Pflt of token
|I0Pstr of token
(* ****** ****** *)
//
|I0Pcon of (d2con)
//
(* ****** ****** *)
//
|I0Pbang of (i0pat)
|I0Pflat of (i0pat)
|I0Pfree of (i0pat)
//
(* ****** ****** *)
//
|I0Pdap1 of (i0pat)
|I0Pdapp of
( i0pat(*con*)
, i0patlst(*arglst*))
//
(* ****** ****** *)
//
|I0Prfpt of
( i0pat, i0pat(*rfdpt*))
//
(* ****** ****** *)
//
|I0Ptup0 of (i0patlst)
|I0Ptup1 of (token, i0patlst)
|I0Prcd2 of (token, l0i0plst)
//
(* ****** ****** *)
//
|I0Pnone0 of ((*0*)) | I0Pnone1 of (d3pat)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0pat_lctn$get
(ipat: i0pat): loc_t
fun
i0pat_node$get
(ipat: i0pat): i0pat_node
//
#symload lctn with i0pat_lctn$get
#symload node with i0pat_node$get
//
(* ****** ****** *)
//
fun
i0pat_fprint
(ipat:i0pat, out0:FILR): void
#symload fprint with i0pat_fprint
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0exp_node =
//
(* ****** ****** *)
//
|I0Eint of token
|I0Ebtf of sym_t
|I0Echr of token
|I0Eflt of token
|I0Estr of token
//
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
i0exp_lctn$get
(iexp: i0exp): loc_t
fun
i0exp_node$get
(iexp: i0exp): i0exp_node
//
#symload lctn with i0exp_lctn$get
#symload node with i0exp_node$get
//
(* ****** ****** *)
//
fun
i0exp_fprint
(iexp:i0exp, out0:FILR): void
#symload fprint with i0exp_fprint
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0dcl_node =
//
|I0Dd3ecl of (d3ecl)
//
(* ****** ****** *)
//
fun
i0dcl_lctn$get
(idcl: i0dcl): loc_t
fun
i0dcl_node$get
(idcl: i0dcl): i0dcl_node
//
#symload lctn with i0dcl_lctn$get
#symload node with i0dcl_node$get
//
(* ****** ****** *)
//
fun
i0dcl_fprint
(idcl:i0dcl, out0:FILR): void
#symload fprint with i0dcl_fprint
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_SATS_intrep0.sats] *)
(***********************************************************************)
