(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri 04 Nov 2022 04:28:36 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload
TMP = "./xstamp0.sats"
//
#typedef stamp = $TMP.stamp
//
(* ****** ****** *)
//
#staload
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
//
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
#typedef lcsrc = $LOC.lcsrc
//
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef sym_t = $SYM.sym_t
#typedef token = $LEX.token
//
(* ****** ****** *)
#staload "./xbasics.sats"
(* ****** ****** *)
#staload "./staexp2.sats"
(* ****** ****** *)
//
datatype
s2typ_node =
//
| T2Pbas of sym_t // type
//
| T2Pcst of s2cst // constant
| T2Pvar of s2var // variable
//
| T2Plft of (s2typ) // left-value
//
|
T2Papps of
(s2typ(*fun*), s2typlst) // instantiate
|
T2Plam0 of
(s2varlst(*arg*), s2typ) // abstraction
//
|
T2Pf2cl of f2clknd
|
T2Pfun1 of
( s2typ // f2clknd
, sint(*npf*),s2typlst(*arg*),s2typ(*res*)
) (* end of T2Pfun1 *)
//
| T2Pexi0 of // exists quantifier
  (s2varlst(*vars*), s2typ(*body*))
| T2Puni0 of // forall quantifier
  (s2varlst(*vars*), s2typ(*body*))
//
| T2Ptext of
  (string(*name*), s2typlst) // external
//
| T2Ptrcd of
  (trcdknd(*knd*), int(*npf*), l2t2plst)
//
| T2Pnone of ((*0*)) | T2Psexp of (s2exp)
//
// HX-2022-11-04: end of [datatype(s2typ_node)
//
(* ****** ****** *)
//
fun
s2typ_fprint:(FILR,s2typ)->void
//
(* ****** ****** *)
fun
s2typ_get_sort(s2typ): sort2
fun
l2t2p_get_sort(l2t2p): sort2
fun
s2typ_get_node(s2typ): s2typ_node
fun
l2t2p_get_node(l2t2p): s2typ_node
(* ****** ****** *)
#symload sort with s2typ_get_sort
#symload sort with l2t2p_get_sort
#symload node with s2typ_get_node
#symload node with l2t2p_get_node
(* ****** ****** *)
fun
s2typ_f2cl(f2clknd): s2typ
(* ****** ****** *)
//
fun
s2typ_none((*void*)): s2typ
fun
s2typ_sexp(s2e0:s2exp): s2typ
//
(* ****** ****** *)
fun
s2typ_make_node
(srt:sort2,nod:s2typ_node): s2typ
#symload s2typ with s2typ_make_node
(* ****** ****** *)
//
fun
s2exp_stpize(s2e0:s2exp): s2typ
fun
s2explst_stpize(s2explst): s2typlst
fun
l2s2elst_stpize(l2s2elst): l2t2plst
#symload stpize with s2exp_stpize
#symload stpize with s2explst_stpize
#symload stpize with l2s2elst_stpize
//
(* ****** ****** *)
//
fun
s2typ_hnfize(t2p0:s2typ): s2typ
fun
l2t2p_hnfize(lt2p:l2t2p): l2t2p
fun
s2typlst_hnfize(s2typlst): s2typlst
fun
l2t2plst_hnfize(l2t2plst): l2t2plst
#symload hnfize with s2typ_hnfize
#symload hnfize with l2t2p_hnfize
#symload hnfize with s2typlst_hnfize
#symload hnfize with l2t2plst_hnfize
//
(* ****** ****** *)
//
fun
s2typ_hnfize_flag
(t2p0: s2typ, flag: &sint >> _): s2typ
fun
l2t2p_hnfize_flag
(lt2p: l2t2p, flag: &sint >> _): l2t2p
fun
s2typlst_hnfize_flag
(t2ps: s2typlst, flag: &sint >> _): s2typlst
fun
l2t2plst_hnfize_flag
(ltps: l2t2plst, flag: &sint >> _): l2t2plst
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2.sats] *)
