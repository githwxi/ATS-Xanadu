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
#staload"./stamp0.sats"

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

#staload S2E = "./staexp2.sats"

(* ****** ****** *)
//
(*
datatype t2srt = 
| T2Sbas of sym_t
| T2Sfun of
  (t2srtlst, t2srt)
| T2Snone0 of ()
| T2Snone1 of sort2
//
where t2srtlst = List0(t2srt)
//
*)
//
(* ****** ****** *)
//
(*
abstbox t2ype_tbox = ptr
*)
//
typedef loc_t = $S2E.loc_t
//
typedef sort2 = $S2E.sort2
typedef s2cst = $S2E.s2cst
typedef s2var = $S2E.s2var
typedef s2exp = $S2E.s2exp
typedef t2ype = $S2E.t2ype
//
typedef tyrec = $S2E.tyrec
//
typedef s2cstlst = List0(s2cst)
typedef s2varlst = List0(s2var)
typedef s2explst = List0(s2exp)
typedef t2ypelst = List0(t2ype)
//
typedef labs2exp = $S2E.labs2exp
typedef labs2explst = List0(labs2exp)
//
(* ****** ****** *)

vtypedef s2explst_vt = List0_vt(s2exp)
vtypedef t2ypelst_vt = List0_vt(t2ype)

(* ****** ****** *)
//
abstype fcr_tbox = ptr
typedef fcr = fcr_tbox
//
fun
fcr_new0((*void*)): fcr
fun
fcr_new1(fc2: funclo2): fcr
//
(* ****** ****** *)
//
abstbox t2xtv_tbox = ptr
//
typedef t2xtv = t2xtv_tbox
typedef t2xtvlst = List0(t2xtv)
//
fun
t2xtv_get_loc(t2xtv): loc_t
fun
t2xtv_get_type(t2xtv): t2ype
fun
t2xtv_set_type(t2xtv, t2ype): void
//
fun
t2xtv_get_stamp(t2xtv): stamp
//
fun
eq_t2xtv_t2xtv
(xtv1: t2xtv, xtv2: t2xtv): bool
//
overload = with eq_t2xtv_t2xtv
//
overload .loc with t2xtv_get_loc
//
overload .type with t2xtv_get_type
overload .type with t2xtv_set_type
//
overload .stamp with t2xtv_get_stamp
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
fun
print_labt2ype: print_type(labt2ype)
fun
prerr_labt2ype: prerr_type(labt2ype)
fun
fprint_labt2ype: fprint_type(labt2ype)
//
overload print with print_labt2ype
overload prerr with prerr_labt2ype
overload fprint with fprint_labt2ype
//
(* ****** ****** *)
//
val
the_t2ype_sint: t2ype
val
the_t2ype_uint: t2ype
//
val
the_t2ype_bool: t2ype
val
the_t2ype_char: t2ype
//
val
the_t2ype_void: t2ype
//
val
the_t2ype_sfloat: t2ype
and
the_t2ype_dfloat: t2ype
//
val
the_t2ype_string: t2ype
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
| T2Papp of (t2ype, t2ypelst)
| T2Plam of (s2varlst, t2ype)
//
| T2Pfun of
  ( fcr//ref(funclo2)
  , int(*npf*),t2ypelst(*arg*),t2ype(*res*)
  ) (* end of T2Pfun *)
//
| T2Pexi of // exists quantifier
  (s2varlst(*vars*), t2ype(*body*))
| T2Puni of // forall quantifier
  (s2varlst(*vars*), t2ype(*body*))
//
| T2Ptyext of
  (string(*name*), t2ypelst) // external
//
| T2Ptyrec of
  (tyrec(*knd*), int(*npf*), labt2ypelst)
//
| T2Pnone0 of ((*void*)) | T2Pnone1 of (s2exp)
//
(* ****** ****** *)
//
fun
t2ype_get_sort(t2ype): sort2
fun
t2ype_get_node(t2ype): t2ype_node
//
overload .sort with t2ype_get_sort
overload .node with t2ype_get_node
//
(* ****** ****** *)
//
fun
t2bas_eval(t2p: t2ype): t2ype
fun
t2ype_eval(t2p: t2ype): t2ype
//
(* ****** ****** *)
//
val
the_t2ype_none0: t2ype
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
(s2t0: sort2, name: sym_t): t2ype
//
fun
t2ype_make_node
(s2t0: sort2, node: t2ype_node): t2ype
//
(* ****** ****** *)

fun
t2ype_cst(s2c0: s2cst): t2ype
fun
t2ype_var(s2v0: s2var): t2ype

(* ****** ****** *)
//
fun
t2xtv_stamp_new(): stamp
fun
t2xtv_new(loc0: loc_t): t2xtv
fun
t2ype_new(loc0: loc_t): t2ype
fun
t2ype_xtv(xtv0: t2xtv): t2ype
fun
t2ype_srt_xtv
(s2t0: sort2, xtv0: t2xtv): t2ype
//
(* ****** ****** *)

fun
t2ype_exi
(s2varlst, scope: t2ype): t2ype
fun
t2ype_uni
(s2varlst, scope: t2ype): t2ype

(* ****** ****** *)
//
fun
t2ype_fun0
( npf: int
, arg: t2ypelst, res: t2ype): t2ype
fun
t2ype_fun1
( fc2: funclo2, npf: int
, arg: t2ypelst, res: t2ype): t2ype
//
(* ****** ****** *)
//
fun
t2ype_subst
( t2p0: t2ype
, s2v0: s2var, tsub: t2ype
) : t2ype // end of [t2ype_subst]
fun
t2ype_substs
( t2p0: t2ype
, s2vs: s2varlst, tsub: t2ypelst
) : t2ype // end of [t2ype_substs]
//
(* ****** ****** *)
//
fun
t2ype_hnfize(t2p0: t2ype): t2ype
//
overload hnfize with t2ype_hnfize
//
(* ****** ****** *)
//
fun
s2exp_erase
  (s2e0: s2exp): t2ype
fun
s2explst_erase
  (s2es: s2explst): t2ypelst
fun
labs2explst_erase
  (ls2es: labs2explst): labt2ypelst
//
(* ****** ****** *)

(* end of [xats_statyp2.sats] *)
