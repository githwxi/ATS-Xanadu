(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./basics.sats"

(* ****** ****** *)
//
#staload
STM = "./stamp0.sats"
//
typedef stamp = $STM.stamp
//
(* ****** ****** *)
//
#staload
SYM = "./symbol.sats"
#staload
LOC = "./location.sats"
#staload
FP0 = "./filepath.sats"
//
typedef sym_t = $SYM.sym_t
typedef loc_t = $LOC.loc_t
typedef fpath = $FP0.filepath
//
(* ****** ****** *)
//
#staload
EFF = "./effect.sats"
//
typedef effect = $EFF.effect
typedef effset = $EFF.effset
//
(* ****** ****** *)
//
#staload
S1E = "./staexp1.sats"
//
typedef sort1 = $S1E.sort1
typedef s1exp = $S1E.s1exp
//
(* ****** ****** *)

abstbox t2dat_tbox = ptr
typedef t2dat = t2dat_tbox

(* ****** ****** *)

abstbox t2xtv_tbox = ptr
typedef t2xtv = t2xtv_tbox

(* ****** ****** *)

datatype
sort2 =
//
  | S2Tid of sym_t (* base sort *)
  | S2Tint of (int) (* base sort *)
//
  | S2Tbas of (t2bas) (* base sort *)
  | S2Txtv of (t2xtv) // for unification
  | S2Ttup of (sort2lst) (* tuple sort *)
  | S2Tfun of
    (sort2lst(*arg*), sort2(*res*)) // function
//
  | S2Tapp of (sort2(*fun*), sort2lst(*arg*))
//
  | S2Tnone of (sort1) // HX: error indication
  | S2Tnone // of (*void*) // HX: error indication
// end of [sort2]

and t2bas =
  | T2BASpre of (sym_t) // predicative: int, bool, ...
  | T2BASdat of (t2dat) // user-defined datasorts
  | T2BASimp of (int(*knd*), sym_t) // impredicative sorts
// end of [t2bas]

where sort2lst = List0(sort2)

(* ****** ****** *)

typedef
sort2opt = Option(sort2)
typedef
sort2lstst = List0(sort2lst)
typedef
sort2lstopt = Option(sort2lst)

(* ****** ****** *)

val
the_sort2_int : sort2
val
the_sort2_addr : sort2
val
the_sort2_bool : sort2
val
the_sort2_char : sort2

val
the_sort2_real : sort2
val
the_sort2_float : sort2
val
the_sort2_string : sort2

(* ****** ****** *)
//
fun
sort2_is_int(sort2): bool
fun
sort2_is_addr(sort2): bool
fun
sort2_is_bool(sort2): bool
fun
sort2_is_char(sort2): bool
//
fun
sort2_is_real(sort2): bool
fun
sort2_is_float(sort2): bool
fun
sort2_is_string(sort2): bool
//
(* ****** ****** *)
//
fun
print_sort2: print_type(sort2)
fun
prerr_sort2: prerr_type(sort2)
fun
fprint_sort2: fprint_type(sort2)
//
overload print with print_sort2
overload prerr with prerr_sort2
overload fprint with fprint_sort2
//
(* ****** ****** *)
//
fun
sort2_apps
(f0: sort2, xs: sort2lst): sort2
//
(* ****** ****** *)
//
fun
print_t2bas: print_type(t2bas)
fun
prerr_t2bas: prerr_type(t2bas)
fun
fprint_t2bas: fprint_type(t2bas)
//
overload print with print_t2bas
overload prerr with prerr_t2bas
overload fprint with fprint_t2bas
//
(* ****** ****** *)
//
fun
print_t2dat: print_type(t2dat)
fun
prerr_t2dat: prerr_type(t2dat)
fun
fprint_t2dat: fprint_type(t2dat)
//
overload print with print_t2dat
overload prerr with prerr_t2dat
overload fprint with fprint_t2dat
//
(* ****** ****** *)
//
fun
print_t2xtv: print_type(t2xtv)
fun
prerr_t2xtv: prerr_type(t2xtv)
fun
fprint_t2xtv: fprint_type(t2xtv)
//
overload print with print_t2xtv
overload prerr with prerr_t2xtv
overload fprint with fprint_t2xtv
//
(* ****** ****** *)
//
abstype s2cst_tbox = ptr
typedef s2cst = s2cst_tbox
typedef s2cstlst = List0(s2cst)
typedef s2cstopt = Option(s2cst)
//
typedef s2cstlstlst = List0(s2cstlst)
//
(* ****** ****** *)
//
abstype s2cstset_tbox
typedef s2cstset_t = s2cstset_tbox
//
absvtype s2cstset_vtbox
vtypedef s2cstset_vt = s2cstset_vtbox
//
(* ****** ****** *)
//
fun
s2cst_get_sym(s2cst): sym_t
fun
s2cst_get_loc(s2cst): loc_t
fun
s2cst_get_sort(s2cst): sort2
fun
s2cst_get_stamp(s2cst): stamp
//
overload .sym with s2cst_get_sym
overload .loc with s2cst_get_loc
overload .sort with s2cst_get_sort
overload .stamp with s2cst_get_stamp
//
(* ****** ****** *)
//
fun
print_s2cst: print_type(s2cst)
fun
prerr_s2cst: prerr_type(s2cst)
fun
fprint_s2cst: fprint_type(s2cst)
//
overload print with print_s2cst
overload prerr with prerr_s2cst
overload fprint with fprint_s2cst
//
(* ****** ****** *)
//
abstype s2var_tbox = ptr
typedef s2var = s2var_tbox
typedef s2varlst = List0(s2var)
typedef s2varopt = Option(s2var)
vtypedef s2varlst_vt = List0_vt(s2var)
vtypedef s2varopt_vt = Option_vt(s2var)
//
(* ****** ****** *)
//
abstype s2varset_tbox
typedef s2varset_t = s2varset_tbox
//
absvtype s2varset_vtbox
vtypedef s2varset_vt = s2varset_vtbox
//
(* ****** ****** *)
//
fun
s2var_get_sym(s2var): sym_t
fun
s2var_get_sort(s2var): sort2
fun
s2var_get_stamp(s2var): stamp
//
overload .sym with s2var_get_sym
overload .sort with s2var_get_sort
overload .stamp with s2var_get_stamp
//
(* ****** ****** *)
//
fun
print_s2var: print_type(s2var)
fun
prerr_s2var: prerr_type(s2var)
fun
fprint_s2var: fprint_type(s2var)
//
overload print with print_s2var
overload prerr with prerr_s2var
overload fprint with fprint_s2var
//
(* ****** ****** *)
//
fun
s2var_make_idst
  (id: sym_t, s2t: sort2): s2var
//
(* ****** ****** *)
//
// HX: datasort
//
fun t2dat_stamp_new(): stamp
//
fun s2var_stamp_new(): stamp
fun s2xtv_stamp_new(): stamp
//
(* ****** ****** *)
//
fun
t2dat_new(sym: sym_t): t2dat
//
fun
t2dat_get_sym(s2td: t2dat): sym_t
fun
t2dat_get_stamp(s2td: t2dat): stamp
//
overload .sym with t2dat_get_sym
overload .stamp with t2dat_get_stamp
//
fun
t2dat_get_sconlst(s2td: t2dat): s2cstlst
//
overload .sconlst with t2dat_get_sconlst
//
(* ****** ****** *)
//
fun
t2xtv_new0((*void*)): t2xtv
fun
t2xtv_new1(loc: loc_t): t2xtv
//
fun
t2xtv_get_stamp(s2tx: t2xtv): stamp
//
overload .stamp with t2xtv_get_stamp
//
fun
t2xtv_get_sort(t2xtv): sort2
fun
t2xtv_set_sort
(s2tx: t2xtv, s2t0: sort2): void
//
fun
t2xtv_get_sortopt(t2xtv): sort2opt
//
overload .sort with t2xtv_get_sort
overload .sort with t2xtv_set_sort
//
overload .sortopt with t2xtv_get_sortopt
//
(* ****** ****** *)
//
abstbox s2exp_tbox = ptr
abstype s2hnf_tbox = ptr
//
(* ****** ****** *)
//
typedef s2exp = s2exp_tbox
typedef s2explst = List0(s2exp)
typedef s2expopt = Option(s2exp)
//
(* ****** ****** *)
//
typedef s2hnf = s2hnf_tbox
typedef s2hnflst = List0(s2hnf)
typedef s2hnfopt = Option(s2hnf)
//
(* ****** ****** *)
//
datatype
s2eff =
| S2EFFexp of s2exp
| S2EFFset of effset
| S2EFFjoin of List0(s2eff)
//
(* ****** ****** *)
//
datatype
s2txt =
(* extended sort *)
| S2TXTsrt of sort2
| S2TXTsub of
  (s2var, s2explst(*prop*))
| S2TXTerr of () // error indication
//
typedef
s2txtopt = Option(s2txt)
vtypedef
s2txtopt_vt = Option_vt(s2txt)
//
(* ****** ****** *)
//
datatype
s2exp_node =
//
| S2Eint of int // integer
| S2Echr of char // character
//
| S2Ecst of s2cst // constant
| S2Evar of s2var // variable
//
| S2Eapp of
  (s2exp, s2explst) // application
| S2Elam of
  (s2varlst, s2exp) // abstraction
//
| S2Efun of
  ( // function type
    funclo2
  , int(*lin*), s2eff
  , int(*npf*), s2explst(*arg*), s2exp(*res*)
  ) (* end of S2Efun *)
//
| S2Etop of // HX: knd: 0/1: 
  (int(*knd*), s2exp) // topization/typization
  // end of [S2Etop]
//
| S2Eexi of // existent. quantifier
  (s2varlst(*vars*), s2explst(*props*), s2exp(*body*))
| S2Euni of // universal quantifier
  (s2varlst(*vars*), s2explst(*props*), s2exp(*body*))
//
| S2Enone of (s1exp) // HX: error indication
| S2Enone // of (*void*) // HX: error indication
//
// end of [s2exp_node]
//
(* ****** ****** *)
//
fun
s2exp_int(i0: int): s2exp
fun
s2exp_chr(c0: char): s2exp
//
fun
s2exp_none0((*void*)): s2exp
fun
s2exp_none1(s1e: s1exp): s2exp
//
(* ****** ****** *)
//
fun
s2exp_get_sort(s2exp): sort2
//
overload .sort with s2exp_get_sort
//
fun
s2exp_get_node(s2exp): s2exp_node
//
overload .node with s2exp_get_node
//
(* ****** ****** *)
//
fun
s2exp_make_node
(s2t0: sort2, node: s2exp_node): s2exp
//
(* ****** ****** *)
//
fun
print_s2eff: print_type(s2eff)
fun
prerr_s2eff: prerr_type(s2eff)
fun
fprint_s2eff: fprint_type(s2eff)
//
overload print with print_s2eff
overload prerr with prerr_s2eff
overload fprint with fprint_s2eff
//
(* ****** ****** *)
//
fun
print_s2txt: print_type(s2txt)
fun
prerr_s2txt: prerr_type(s2txt)
fun
fprint_s2txt: fprint_type(s2txt)
//
overload print with print_s2txt
overload prerr with prerr_s2txt
overload fprint with fprint_s2txt
//
(* ****** ****** *)
//
fun
print_s2exp: print_type(s2exp)
fun
prerr_s2exp: prerr_type(s2exp)
fun
fprint_s2exp: fprint_type(s2exp)
//
overload print with print_s2exp
overload prerr with prerr_s2exp
overload fprint with fprint_s2exp
//
(* ****** ****** *)
//
fun
print_s2hnf: print_type(s2hnf)
fun
prerr_s2hnf: prerr_type(s2hnf)
fun
fprint_s2hnf: fprint_type(s2hnf)
//
overload print with print_s2hnf
overload prerr with prerr_s2hnf
overload fprint with fprint_s2hnf
//
(* ****** ****** *)

datatype s2tex =
// extended sort
| S2TEXsrt of sort2
| S2TEXsub of (s2var, sort2, s2explst)
// end of [s2tex]

(* ****** ****** *)
//
fun
print_s2tex: print_type(s2tex)
fun
prerr_s2tex: prerr_type(s2tex)
fun
fprint_s2tex: fprint_type(s2tex)
//
overload print with print_s2tex
overload prerr with prerr_s2tex
overload fprint with fprint_s2tex
//
(* ****** ****** *)
//
abstbox
fmodenv_tbox = ptr
typedef
fmodenv = fmodenv_tbox
//
fun
fmodenv_get_path(fmodenv): fpath
//
overload .path with fmodenv_get_path
//
(* ****** ****** *)

datatype s2itm =
//
| S2ITMvar of (s2var)
//
| S2ITMcst of
    (s2cstlstlst) // supporting overload
  // end of [S2ITMcst]
//
(*
| S2ITMexp of (g1exp) // for generic stuff
*)
//
| S2ITMfmodenv of fmodenv
//
(* ****** ****** *)
//
fun
print_s2itm: print_type(s2itm)
fun
prerr_s2itm: prerr_type(s2itm)
fun
fprint_s2itm: fprint_type(s2itm)
//
overload print with print_s2itm
overload prerr with prerr_s2itm
overload fprint with fprint_s2itm
//
(* ****** ****** *)

(* end of [xats_staexp2.sats] *)
