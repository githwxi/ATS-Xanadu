(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: April, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload"./basics.sats"

(* ****** ****** *)
//
#staload
  SYM = "./symbol.sats"
#staload
  LAB = "./label0.sats"
//
typedef sym_t = $SYM.sym_t
typedef label = $LAB.label
//
(* ****** ****** *)

#staload "./staexp2.sats"

(* ****** ****** *)
//
(*
abstype t2srt_tbox = ptr
typedef t2srt = t2srt_tbox
*)
datatype t2srt = 
| T2Sbas of sym_t
| T2Sfun of
  (t2srtlst(*arg*), t2srt(*res*))
| T2Snone0 of ()
| T2Snone1 of sort2
//
where t2srtlst = List0(t2srt)
//
(* ****** ****** *)
//
abstbox t2ype_tbox = ptr
typedef t2ype = t2ype_tbox
typedef t2ypelst = List0(t2ype)
//
(* ****** ****** *)
//
fun t2ype_sint(): t2ype
fun t2ype_uint(): t2ype
//
fun t2ype_bool(): t2ype
fun t2ype_char(): t2ype
//
fun t2ype_float(): t2ype
fun t2ype_double(): t2ype
//
fun t2ype_string(): t2ype
//
(* ****** ****** *)
//
fun
print_t2ype: print_type(t2ype)
fun
prerr_t2ype: prerr_type(t2ype)
fun
fprint_t2ype: fprint_type(t2ype)
//
overload print with print_t2ype
overload prerr with prerr_t2ype
overload fprint with fprint_t2ype
//
(* ****** ****** *)
//
abstbox t2xtv_tbox = ptr
typedef t2xtv = t2xtv_tbox
//
abstype fcref_tbox = ptr
typedef fcref = fcref_tbox
//
(* ****** ****** *)
//
fun
t2xtv_stamp_new(): stamp
//
fun t2xtv_new(loc_t): t2xtv
//
(* ****** ****** *)
//
datatype
labt2ype =
| TLABELED of (label, t2ype)
where
labt2ypelst = List0(labt2ype)
//
(* ****** ****** *)
//
datatype
t2ype_node =
// externally named
| T2Pbas of sym_t // type
//
| T2Pcst of s2cst // constant
| T2Pvar of s2var // variable
//
| T2Pxtv of t2xtv // ext-variable
//
| T2Pfun of
  ( fcref//ref(funclo2)
  , int(*npf*),t2ypelst(*arg*),t2ype(*res*)
  ) (* end of T2Pfun *)
//
| T2Pexi of // exists quantifier
  (s2varlst(*vars*), t2ype(*body*))
| T2Puni of // forall quantifier
  (s2varlst(*vars*), t2ype(*body*))
//
| T2Ptyrec of
  (tyrec(*knd*), int(*npf*), labt2ypelst)
//
| T2Pnone0 of () | T2Pnone1 of (s2exp)
//
(* ****** ****** *)
//
fun
t2ype_get_sort(t2ype): t2srt
fun
t2ype_get_node(t2ype): t2ype_node
//
overload .sort with t2ype_get_sort
overload .node with t2ype_get_node
//
(* ****** ****** *)
//
fun
t2ype_none0((*void*)): t2ype
fun
t2ype_none1(s2e: s2exp): t2ype
//
(* ****** ****** *)
//
fun
t2ype_make_name
(t2s0: t2srt, name: sym_t): t2ype
//
fun
t2ype_make_node
(t2s0: t2srt, node: t2ype_node): t2ype
//
(* ****** ****** *)

fun
t2ype_cst(s2c0: s2cst): t2ype
fun
t2ype_var(s2v0: s2var): t2ype

(* ****** ****** *)

fun
t2ype_exi
(s2vs: s2varlst, body: t2ype): t2ype
fun
t2ype_uni
(s2vs: s2varlst, body: t2ype): t2ype

(* ****** ****** *)

fun
sort2_erase(s2t0: sort2): t2srt
fun
s2exp_erase(s2e0: s2exp): t2ype

(* ****** ****** *)

(* end of [xats_statyp2.sats] *)
