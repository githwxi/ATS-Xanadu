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
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload"./xbasics.sats"
//
(* ****** ****** *)
//
#staload
  STM = "./xstamp0.sats"
//
typedef stamp = $STM.stamp
//
(* ****** ****** *)
//
#staload
  SYM = "./xsymbol.sats"
#staload
  LOC = "./locinfo.sats"
#staload
  FP0 = "./filpath.sats"
//
typedef sym_t = $SYM.sym_t
typedef loc_t = $LOC.loc_t
typedef fpath = $FP0.filpath
//
(* ****** ****** *)

#staload
  LAB = "./xlabel0.sats"
typedef label = $LAB.label

#staload
  LEX = "./lexing0.sats"
typedef token = $LEX.token

(* ****** ****** *)
//
#staload
  EFF = "./effect0.sats"
//
#staload
  S1E = "./staexp1.sats"
//
typedef g1nam = $S1E.g1nam
typedef g1mac = $S1E.g1mac
typedef sort1 = $S1E.sort1
typedef s1exp = $S1E.s1exp
//
(* ****** ****** *)
//
datatype x2knd =
| X2KNDnone of ()
| X2KNDsome of ( int )
datatype x2nam =
| X2NAMnone of ()
| X2NAMsome of (g1nam)
//
(* ****** ****** *)
//
// HX: datasort
//
fun
t2abs_stamp_new(): stamp
fun
t2dat_stamp_new(): stamp
//
fun
s2cst_stamp_new(): stamp
//
fun
s2var_stamp_new(): stamp
//
fun
s2xtv_stamp_new(): stamp
//
(* ****** ****** *)

abstbox t2abs_tbox = (ptr)
typedef t2abs = t2abs_tbox

abstbox t2dat_tbox = (ptr)
typedef t2dat = t2dat_tbox

(* ****** ****** *)

(*
abstbox t2xtv_tbox = (ptr)
typedef t2xtv = t2xtv_tbox
*)

(* ****** ****** *)

datatype
sort2 =
//
| S2Tid0 of sym_t (* base sort *)
| S2Tint of (int) (* base sort *)
//
| S2Tbas of (t2bas) (* base sort *)
//
(*
| S2Txtv of (t2xtv) // for unification
*)
//
| S2Ttup of ((*void*))
| S2Ttup of (sort2lst) (* tuple sort *)
//
| S2Tfun of ((*void*))
| S2Tfun of
  (sort2lst(*arg*), sort2(*res*)) // function
//
| S2Tapp of (sort2(*fun*), sort2lst(*arg*))
//
| S2Tnone0 // of (*void*) // HX: error or special
| S2Tnone1 of sort1(*src*) // HX: error indication
// end of [sort2]

and t2bas =
| T2BASpre of (sym_t) // predicative: int, ...
| T2BASabs of (t2abs) // for abstract sorts
| T2BASdat of (t2dat) // for user-defined datasorts
| T2BASimp of (int(*knd*), sym_t) // impredicative sorts
// end of [t2bas]

where sort2lst = List0(sort2)

(* ****** ****** *)

typedef
sort2opt = Option(sort2)
typedef
sort2lstlst = List0(sort2lst)
typedef
sort2lstopt = Option(sort2lst)

(* ****** ****** *)
//
val
the_sort2_int : sort2
//
val
the_sort2_addr : sort2
//
val
the_sort2_bool : sort2
//
val
the_sort2_char : sort2
val
the_sort2_cstr : sort2
//
val
the_sort2_real : sort2
//
(*
val
the_sort2_xflt : sort2
val
the_sort2_xstr : sort2
*)
//
(* ****** ****** *)
//
val
the_sort2_prop : sort2
val
the_sort2_view : sort2
//
val
the_sort2_tbox : sort2
(*
val
the_sort2_tflt : sort2
*)
val
the_sort2_type : sort2
//
val
the_sort2_vtbx : sort2
val
the_sort2_vwtp : sort2
(*
val
the_sort2_vtbox : sort2
val
the_sort2_vtflt : sort2
*)
//
(* ****** ****** *)

val
the_sort2_none : sort2

(* ****** ****** *)
//
fun
sort2_is_int(sort2): bool
//
fun
sort2_is_addr(sort2): bool
//
fun
sort2_is_bool(sort2): bool
//
fun
sort2_is_char(sort2): bool
fun
sort2_is_cstr(sort2): bool
//
fun
sort2_is_real(sort2): bool
//
(*
fun
sort2_is_xflt(sort2): bool
fun
sort2_is_xstr(sort2): bool
*)
//
(* ****** ****** *)

fun
sort2_is_fun(sort2): bool

(* ****** ****** *)

fun
sort2_is_proof(sort2): bool
fun
sort2_is_tcode(sort2): bool
fun
sort2_is_impred(sort2): bool

(* ****** ****** *)

fun
sort2_polpos(s2t: sort2): sort2
fun
sort2_polneg(s2t: sort2): sort2

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
(*
fun
sort2_apps
(f0: sort2, xs: sort2lst): sort2
*)
//
(* ****** ****** *)
//
fun
lte_t2bas_t2bas
  (x1: t2bas, x2: t2bas): bool
//
overload <= with lte_t2bas_t2bas
//
(* ****** ****** *)
//
fun
lte_sort2_sort2
  (x1: sort2, x2: sort2): bool
fun
lte_sort2lst_sort2lst
  (xs1: sort2lst, xs2: sort2lst): bool
//
overload <= with lte_sort2_sort2
overload <= with lte_sort2lst_sort2lst
//
(* ****** ****** *)
//
fun
sort2lst_get_at
  {n:nat}
  (s2ts: sort2lst, n: int(n)): sort2
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
print_t2abs: print_type(t2abs)
fun
prerr_t2abs: prerr_type(t2abs)
fun
fprint_t2abs: fprint_type(t2abs)
//
overload print with print_t2abs
overload prerr with prerr_t2abs
overload fprint with fprint_t2abs
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
abstbox s2cst_tbox = ptr
typedef s2cst = s2cst_tbox
typedef s2cstlst = List0(s2cst)
typedef s2cstopt = Option(s2cst)
//
typedef s2cstlstlst = List0(s2cstlst)
//
vtypedef s2cstlst_vt = List0_vt(s2cst)
vtypedef s2cstopt_vt = Option_vt(s2cst)
//
(* ****** ****** *)
//
abstbox s2cstset_tbox
typedef s2cstset_t = s2cstset_tbox
//
absvtype s2cstset_vtbox
vtypedef s2cstset_vt = s2cstset_vtbox
//
(* ****** ****** *)
//
fun
eq_s2cst_s2cst
(x1: s2cst, x2: s2cst): bool
//
overload = with eq_s2cst_s2cst
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
stamp_s2cst(s2cst): void
//
fun
s2cst_make_idst
  (sid: token, s2t: sort2): s2cst
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
abstbox s2var_tbox = ptr
typedef s2var = s2var_tbox
//
typedef s2varlst = List0(s2var)
typedef s2varopt = Option(s2var)
//
typedef s2varlstlst = List0(s2varlst)
//
vtypedef s2varlst_vt = List0_vt(s2var)
vtypedef s2varopt_vt = Option_vt(s2var)
//
(* ****** ****** *)
//
abstbox s2varset_tbox
typedef s2varset_t = s2varset_tbox
//
absvtype s2varset_vtbox
vtypedef s2varset_vt = s2varset_vtbox
//
(* ****** ****** *)
//
fun
s2var_is_nil(s2var): bool
//
(* ****** ****** *)
//
fun
eq_s2var_s2var
(x1: s2var, x2: s2var): bool
//
overload = with eq_s2var_s2var
//
(* ****** ****** *)
//
fun
s2var_get_sym(s2var): sym_t
fun
s2var_get_sort(s2var): sort2
fun
s2var_set_sort(s2var, sort2): void
fun
s2var_get_stamp(s2var): stamp
//
overload .sym with s2var_get_sym
overload .sort with s2var_get_sort
overload .sort with s2var_set_sort
overload .stamp with s2var_get_stamp
//
fun
s2var_copy
  (s2v0: s2var): s2var
fun
s2varlst_copy
  (s2vs: s2varlst): s2varlst
//
fun
s2var_new(s2t: sort2): s2var
//
fun
s2var_make_idst
  (sid: sym_t, s2t: sort2): s2var
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
(*
//
datatype
s2arg =
| S2ARGvar of s2var
| S2ARGsub of (s2var, sort2)
//
where s2arglst = List0(s2arg)
//
fun
s2arg_get_sort(s2arg): sort2
fun
s2arg_get_svar(s2arg): s2var
//
overload .sort with s2arg_get_sort
overload .svar with s2arg_get_svar
//
fun
print_s2arg: print_type(s2arg)
fun
prerr_s2arg: prerr_type(s2arg)
fun
fprint_s2arg: fprint_type(s2arg)
//
overload print with print_s2arg
overload prerr with prerr_s2arg
overload fprint with fprint_s2arg
//
*)
(* ****** ****** *)
//
abstbox s2xtv_tbox = ptr
typedef s2xtv = s2xtv_tbox
//
(* ****** ****** *)
//
abstbox s2exp_tbox = ptr
abstbox s2hnf_tbox = ptr
abstbox t2ype_tbox = ptr
//
typedef s2exp = s2exp_tbox
typedef s2hnf = s2hnf_tbox
typedef t2ype = t2ype_tbox
//
(* ****** ****** *)
//
datatype k2xtv =
//
| K2XTVnon of () // default
//
| K2XTVtmp of () // for temp args
//
| K2XTVuni of () // for poly args
//
| K2XTVjoin of () // for if/case-exps
//
| K2XTVopen of (s2exp) // handling opnx
//
(* ****** ****** *)
//
fun
print_k2xtv: print_type(k2xtv)
fun
prerr_k2xtv: print_type(k2xtv)
fun
fprint_k2xtv: fprint_type(k2xtv)
//
overload print with print_k2xtv
overload prerr with prerr_k2xtv
overload fprint with fprint_k2xtv
//
(* ****** ****** *)
//
(*
fun
s2xtv_get_loc(s2xtv): loc_t
*)
fun
s2xtv_get_loc(s2xtv): loc_t
fun
s2xtv_get_sort(s2xtv): sort2
//
fun
s2xtv_get_kind(s2xtv): k2xtv
fun
s2xtv_set_kind(s2xtv, k2xtv): void
//
fun
s2xtv_get_sexp(s2xtv): s2exp
fun
s2xtv_set_sexp(s2xtv, s2exp): void
//
fun
s2xtv_get_stamp(s2xtv): stamp
//
overload .loc with s2xtv_get_loc
overload .sort with s2xtv_get_sort
//
overload .kind with s2xtv_get_kind
overload .kind with s2xtv_set_kind
//
overload .sexp with s2xtv_get_sexp
overload .sexp with s2xtv_set_sexp
//
overload .stamp with s2xtv_get_stamp
//
(* ****** ****** *)
//
fun
s2xtv_new_srt
(loc: loc_t, s2t: sort2): s2xtv
//
(* ****** ****** *)
//
fun
print_s2xtv: print_type(s2xtv)
fun
prerr_s2xtv: prerr_type(s2xtv)
fun
fprint_s2xtv: fprint_type(s2xtv)
//
overload print with print_s2xtv
overload prerr with prerr_s2xtv
overload fprint with fprint_s2xtv
//
(* ****** ****** *)
//
fun
eq_t2abs_t2abs: eq_type(t2abs)
overload = with eq_t2abs_t2abs
fun
eq_t2dat_t2dat: eq_type(t2dat)
overload = with eq_t2dat_t2dat
//
fun
eq_t2bas_t2bas: eq_type(t2bas)
overload = with eq_t2bas_t2bas
//
(* ****** ****** *)
//
fun
t2abs_new(name: sym_t): t2abs
//
fun
t2abs_get_sym(s2td: t2abs): sym_t
fun
t2abs_get_stamp(s2td: t2abs): stamp
//
overload .sym with t2abs_get_sym
overload .stamp with t2abs_get_stamp
//
(* ****** ****** *)
//
fun
t2dat_new(name: sym_t): t2dat
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
typedef s2explst = List0(s2exp)
typedef s2expopt = Option(s2exp)
//
typedef s2explstlst = List0(s2explst)
typedef s2explstopt = Option(s2explst)
//
vtypedef s2explst_vt = List0_vt(s2exp)
vtypedef s2expopt_vt = Option_vt(s2exp)
//
(* ****** ****** *)
//
typedef s2hnflst = List0(s2hnf)
typedef s2hnfopt = Option(s2hnf)
//
(* ****** ****** *)

typedef t2ypelst = List0(t2ype)
typedef t2ypeopt = Option(t2ype)

(* ****** ****** *)
//
(*
datatype
s2eff =
| S2EFFnil of ()
| S2EFFall of ()
| S2EFFexp of s2exp
| S2EFFset of $EFF.effset
| S2EFFjoin of List0(s2eff)
*)
//
(* ****** ****** *)
//
datatype
s2txt =
(* extended sort *)
| S2TXTsrt of sort2
| S2TXTsub of
  (s2var, s2explst(*prop*))
(*
| S2TXTerr of (loc_t) // error indication
*)
//
typedef
s2txtopt = Option(s2txt)
vtypedef
s2txtopt_vt = Option_vt(s2txt)
//
(* ****** ****** *)

datatype
slabeled(a:type) =
| SLABELED of (label, a)

(* ****** ****** *)
//
fun
{a:type}
fprint_slabeled
(FILEref, slabeled(a)): void
//
(* ****** ****** *)

datatype tyrec =
//
| TYRECbox0 (* box *) // nonlin
| TYRECbox1 (* box *) // linear
//
| TYRECflt0 (* flat: non/lin *)
(*
| TYRECflt1 of stamp (* flat *)
*)
| TYRECflt2 of string (* flat *)
// end of [tyrec]

typedef
labs2exp = slabeled(s2exp)
typedef
labs2explst = List0(labs2exp)

vtypedef
labs2explst_vt = List0_vt(labs2exp)

(* ****** ****** *)
//
(*
HX: flat/boxed: 0/1
fun
tyrec_boxity(tyrec): int
*)
//
fun
eq_tyrec_tyrec
(k1: tyrec, k2: tyrec): bool
overload = with eq_tyrec_tyrec
//
(* ****** ****** *)
//
fun
print_tyrec: print_type(tyrec)
fun
prerr_tyrec: print_type(tyrec)
fun
fprint_tyrec: fprint_type(tyrec)
//
overload print with print_tyrec
overload prerr with prerr_tyrec
overload fprint with fprint_tyrec
//
(* ****** ****** *)
//
datatype
s2exp_node =
//
| S2Eint of (int) // integer
(*
| S2Eirp of string // intrep
*)
//
| S2Ebtf of (bool) // boolean
| S2Echr of (char) // character
//
| S2Estr of string // string
//
| S2Ecst of (s2cst) // constant
//
| S2Evar of (s2var) // variable
//
| S2Extv of (s2xtv) // ext-variable
//
| S2Eany of int(*knd*)
//
| S2Etop of (s2exp) // uninitized
| S2Etpz of (s2exp) // delineared
//
| S2Eapp of
  (s2exp, s2explst) // application
| S2Elam of
  (s2varlst, s2exp) // abstraction
//
| S2Earg of // HX: knd: -1/0/1: 
  (int(*knd*), s2exp) //cbrf/cbv0/cbv1
| S2Eatx of
  (s2exp(*bef*), s2exp(*aft*)) // trans
//
(*
| S2Efun of
  (int(*npf*), s2explst, s2exp)
*)
| S2Efun of
  ( // function type
    funclo2
  , int(*npf*)
  , s2explst(*arglst*), s2exp(*result*)
  ) (* end of S2Efun *)
//
| S2Ecimp of // HX: for storing
  (loc_t, s2exp) // sort-checking error
| S2Ecprf of // HX: for storing
  (loc_t, s2exp) // sort-checking error
| S2Ectcd of // HX: for storing
  (loc_t, s2exp) // sort-checking error
| S2Ecast of // HX-2108-12-23: for storing
  (loc_t, s2exp, sort2) // sort-checking error
//
| S2Emet of // HX: for term-check
  (s2explst(*met*), s2exp(*body*))
//
// HX: for [...]
| S2Eexi of // exists quantifier
  ( s2varlst(*vars*)
  , s2explst(*prop*), s2exp(*body*))
// HX: for {...}
| S2Euni of // forall quantifier
  ( s2varlst(*vars*)
  , s2explst(*prop*), s2exp(*body*))
(*
// HX: for #[...]
| S2Eexj of // exists quantifier
  (s2varlst(*vars*), s2explst(*props*), s2exp(*body*))
*)
//
(*
| S2Elist of s2explst // HX: temporary use
*)
//
// HX-2021-01: for lifting from
| S2Et2ype of (t2ype) // [t2ype] to [s2exp]
//
| S2Etyext of
  ( string(*name*)
  , s2explst(*arglst*)) (* external *)
//
| S2Etyrec of
  (tyrec(*knd*), int(*npf*), labs2explst)
//
| S2Enone0 // of () // HX: error or special
//
| S2Enone1 of
    (loc_t, s1exp(*src*)) // HX: error indication
  // S2Enone1
| S2Eg1mac of
    (loc_t, g1mac(*src*)) // HX: error indication
  // S2Eg1mac
//
| S2Enone2 of
    (loc_t, s2exp(*src*)) // HX: error indication
  // S2Enone2
//
// end of [s2exp_node]
//
(* ****** ****** *)
//
fun
s2exp_get_sort(s2exp): sort2
fun
s2exp_get_node(s2exp): s2exp_node
//
overload .sort with s2exp_get_sort
overload .node with s2exp_get_node
//
(*
fun
s2exp_set_sort(s2exp, sort2): void
*)
//
(* ****** ****** *)
//
fun
s2exp_int(i0: int): s2exp
fun
s2exp_btf(b0: bool): s2exp
fun
s2exp_chr(c0: char): s2exp
//
(* ****** ****** *)
//
fun
s2exp_irp(rep: string): s2exp
//
fun
s2exp_str(str: string): s2exp
//
(* ****** ****** *)
//
fun
s2exp_cst(s2c: s2cst): s2exp
//
(* ****** ****** *)
//
fun
s2exp_var(s2v: s2var): s2exp
//
(* ****** ****** *)
//
fun
s2exp_xtv(xtv: s2xtv): s2exp
//
(* ****** ****** *)
//
fun
s2exp_cimp
( loc: loc_t
, s2e: s2exp) : s2exp
fun
s2exp_cprf
( loc: loc_t
, s2e: s2exp) : s2exp
fun
s2exp_ctcd
( loc: loc_t
, s2e: s2exp) : s2exp
fun
s2exp_cast
( loc: loc_t
, s2e: s2exp
, s2t: sort2) : s2exp
//
(* ****** ****** *)
//
fun
s2exp_apps
( loc0: loc_t
, s2f0: s2exp(*fun*)
, s2as: s2explst(*arg*)): s2exp
//
fun
s2exp_app1
( loc0: loc_t
, s2f0: s2exp(*fun*)
, s2a1: s2exp(*arg*)): s2exp
fun
s2exp_app2
( loc0: loc_t
, s2f0: s2exp(*fun*)
, s2a1: s2exp, s2a2: s2exp): s2exp
//
(* ****** ****** *)
//
fun
s2exp_any(knd: int): s2exp
//
(* ****** ****** *)
//
fun
s2exp_at0
( s2e(*elt*): s2exp
, s2l(*addr*): s2exp): s2exp
//
(* ****** ****** *)
//
fun
s2exp_top(s2e0: s2exp): s2exp
fun
s2exp_tpz(s2e0: s2exp): s2exp
//
(* ****** ****** *)
//
fun
s2exp_arg
(knd: int, s2e0: s2exp): s2exp
fun
s2exp_atx
(bef: s2exp, aft: s2exp): s2exp
//
(* ****** ****** *)
//
fun
s2exp_fun_nil
( npf: int
, arg: s2explst, res: s2exp): s2exp
fun
s2exp_fun_all
( npf: int
, arg: s2explst, res: s2exp): s2exp
fun
s2exp_fun_full
( fc2
: funclo2
, npf: int
, arg: s2explst, res: s2exp): s2exp
//
fun
s2exp_lam
(s2as: s2varlst, s2e1: s2exp): s2exp
//
fun
s2exp_met
(s2es: s2explst, s2e1: s2exp): s2exp
//
fun
s2exp_exi
( s2vs: s2varlst
, s2ps: s2explst, s2e1: s2exp): s2exp
fun
s2exp_uni
( s2vs: s2varlst
, s2ps: s2explst, s2e1: s2exp): s2exp
//
fun
s2exp_list1
(s2es: s2explst): s2exp
fun
s2exp_list2
(s2explst, s2explst): s2exp
//
fun
s2exp_trcd11
(knd: int
, s2es: s2explst): s2exp
fun
s2exp_trcd12
(knd: int
, s2explst, s2explst): s2exp
//
fun
s2exp_trcd21
( knd: int
, lxs: labs2explst): s2exp
fun
s2exp_trcd22
( knd: int
, labs2explst, labs2explst): s2exp
//
(* ****** ****** *)
//
fun
s2exp_t2ype(t2p0: t2ype): s2exp
//
(* ****** ****** *)
//
fun
s2exp_tyext
( s2t0: sort2
, tnm1: string, s2es: s2explst): s2exp
//
(* ****** ****** *)
//
val
the_s2exp_none0: s2exp
//
fun
s2exp_none0((*void*)): s2exp
fun
s2exp_none1(s1e: s1exp): s2exp
//
fun
s2exp_none2
(loc: loc_t, s2e: s2exp): s2exp
//
fun
s2exp_none0_s2t
  (s2t: sort2): s2exp
fun
s2exp_none1_s2t
  (s1e: s1exp, s2t: sort2): s2exp
//
(* ****** ****** *)
//
fun
s2exp_abscast
( loc0: loc_t
, s2e1: s2exp, s2t2: sort2): s2exp
(*
fun
s2exp_sqacast
( loc0: loc_t
, s2e1: s2exp, s2t2: sort2): s2exp
*)
fun
s2exp_tqacast
( loc0: loc_t
, s2e1: s2exp, s2t2: sort2): s2exp
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
labs2explst_make_list1
  (s2es: s2explst): labs2explst
fun
labs2explst_make_list2
  ( s2es1: s2explst
  , s2es2: s2explst): labs2explst
//
(* ****** ****** *)
//
(*
//
fun s2exp_sint0(): s2exp
fun s2exp_uint0(): s2exp
//
fun s2exp_bool0(): s2exp
fun s2exp_char0(): s2exp
//
fun s2exp_list0(s2exp): s2exp
//
*)
//
fun
s2exp_type_void(): s2exp
//
fun
s2exp_type_sint(idx: s2exp): s2exp
fun
s2exp_type_uint(idx: s2exp): s2exp
//
fun
s2exp_type_bool(idx: s2exp): s2exp
//
fun
s2exp_type_char(idx: s2exp): s2exp
//
fun
s2exp_type_strlen(len: s2exp): s2exp
//
(* ****** ****** *)
//
(*
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
*)
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
//
fun
print_labs2exp: print_type(labs2exp)
fun
prerr_labs2exp: prerr_type(labs2exp)
fun
fprint_labs2exp: fprint_type(labs2exp)
//
overload print with print_labs2exp
overload prerr with prerr_labs2exp
overload fprint with fprint_labs2exp
//
(* ****** ****** *)
//
datatype
abstdf2 =
| ABSTDF2none of () // nonabs
| ABSTDF2some of () // unspecified
| ABSTDF2lteq of t2ype // erasure
| ABSTDF2eqeq of (s2exp, t2ype) // definition
//
fun
print_abstdf2: print_type(abstdf2)
fun
prerr_abstdf2: prerr_type(abstdf2)
fun
fprint_abstdf2: fprint_type(abstdf2)
//
overload print with print_abstdf2
overload prerr with prerr_abstdf2
overload fprint with fprint_abstdf2
//
(* ****** ****** *)
//
// HX-2019-02-18:
// There is no longer plan
// to support effect-tracking!!!
//
datatype
effs2expopt =
| EFFS2EXPnone of ()
| EFFS2EXPsome of (s2exp)
(*
| EFFS2EXPsome of (s2eff, s2exp)
*)
//
fun
print_effs2expopt:
print_type(effs2expopt)
fun
prerr_effs2expopt:
prerr_type(effs2expopt)
fun
fprint_effs2expopt:
fprint_type(effs2expopt)
//
overload print with print_effs2expopt
overload prerr with prerr_effs2expopt
overload fprint with fprint_effs2expopt
//
(* ****** ****** *)
//
abstbox
fmodenv_tbox = ptr
typedef
fmodenv = fmodenv_tbox
typedef
fmodenvopt = Option(fmodenv)
vtypedef
fmodenvopt_vt = Option_vt(fmodenv)
//
(* ****** ****** *)
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
    (s2cstlst) // supporting overload
  // end of [S2ITMcst]
//
(*
| S2ITMexp of (g1exp) // for generic stuff
*)
//
| S2ITMfmodenv of (fmodenv)
//
(* ****** ****** *)
//
typedef
s2itmopt = Option(s2itm)
vtypedef
s2itmopt_vt = Option_vt(s2itm)
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
//
fun
sort2_isimp(x0: sort2): bool
fun
sort2_islin(x0: sort2): bool
//
fun
sort2_topize(x0: sort2): sort2
//
(* ****** ****** *)
//
fun
s2exp_isimp(x0: s2exp): bool
fun
s2exp_islin(x0: s2exp): bool
fun
s2explst_islin(xs: s2explst): bool
fun
labs2explst_islin(lxs: labs2explst): bool
//
(* ****** ****** *)
//
fun
s2varlst_ismem
(s2vs: s2varlst, s2v0: s2var): bool
//
(* ****** ****** *)
//
abstype
s2cstnul_tbox(l:addr) = ptr
typedef
s2cstnul(l:addr) = s2cstnul_tbox(l)
//
typedef s2cstnul = [l:agez] s2cstnul(l)
//
(* ****** ****** *)
//
fun
s2cstnul_none
((*void*)): s2cstnul(null)
fun
s2cstnul_some
(x0:s2cst):<> [l:agz] s2cstnul(l)
castfn
s2cstnul_unsome
{l:agz}(x0: s2cstnul(l)):<> s2cst
//
fun
s2cstnul_iseqz
{l:addr}(s2cstnul(l)): bool(l==null)
fun
s2cstnul_isneqz
{l:addr}(s2cstnul(l)): bool(l > null)
//
overload iseqz with s2cstnul_iseqz
overload isneqz with s2cstnul_isneqz
overload unsome with s2cstnul_unsome
//
(* ****** ****** *)
//
// HX:
// dynarray-based
//
fun
s2cst_get_abst
(s2c: s2cst): abstdf2
fun
stamp_s2cst_abst
(s2c: s2cst, abst: abstdf2): void
//
(* ****** ****** *)
//
// HX:
// dynarray-based
//
fun
s2cst_get_sexp(s2cst): s2exp
fun
stamp_s2cst_sexp
(s2c: s2cst, def: s2exp): void
//
overload .sexp with s2cst_get_sexp
//
(* ****** ****** *)
//
// HX:
// dynarray-based
//
fun
s2cst_get_type(s2cst): t2ype
//
fun
stamp_s2cst_type
(s2c: s2cst, def: t2ype): void
//
overload .type with s2cst_get_type
//
(* ****** ****** *)
//
// HX-2019-12-18:
// hashtable-based
// implemented in dynexp2.dats
//
fun
s2cst_isdat(s2c0: s2cst): bool
//
(* ****** ****** *)

abstype s2cstref_tbox = ptr
typedef s2cstref = s2cstref_tbox

(* ****** ****** *)

fun
s2cstref_make_name(string): s2cstref

(* ****** ****** *)
//
fun
s2cstref_get_scst(s2cstref): s2cst
fun
s2cstref_get_sexp(s2cstref): s2exp
fun
s2cstref_get_type(s2cstref): t2ype
//
overload .scst with s2cstref_get_scst
overload .sexp with s2cstref_get_sexp
overload .type with s2cstref_get_type
//
(* ****** ****** *)
//
fun
s2cstref_equ_s2cst(s2cstref, s2cst): bool
fun
s2cstref_equ_s2exp(s2cstref, s2exp): bool
//
(* ****** ****** *)
//
// HX:
// various static constants
// declare in prelude/basics.sats
//
(* ****** ****** *)
//
val
the_a0ptr_view : s2cstref
fun
s2exp_is_a0ptr(s2exp): bool
//
(* ****** ****** *)
//
val
the_p2tr_tbox : s2cstref
//
(* ****** ****** *)
//
val
the_lazy_t0_x0 : s2cstref // (t0) -> x0
val
the_lazy_vt_vx : s2cstref // (vt) -> vx
//
(* ****** ****** *)

val the_tt_b0 : s2cstref // true
val the_ff_b0 : s2cstref // false

(* ****** ****** *)
//
val the_neg_b0 : s2cstref // b0 -> b0
//
val the_add_b0_b0 : s2cstref // (b0, b0) -> b0
val the_mul_b0_b0 : s2cstref // (b0, b0) -> b0
val the_equ_b0_b0 : s2cstref // (b0, b0) -> b0
val the_neq_b0_b0 : s2cstref // (b0, b0) -> b0
//
(* ****** ****** *)
//
val the_neg_i0 : s2cstref // : (i0) -> i0
//
val the_add_i0_i0 : s2cstref // : (i0, i0) -> i0
val the_sub_i0_i0 : s2cstref // : (i0, i0) -> i0
val the_mul_i0_i0 : s2cstref // : (i0, i0) -> i0
val the_div_i0_i0 : s2cstref // : (i0, i0) -> i0
val the_mod_i0_i0 : s2cstref // : (i0, i0) -> i0
//
val the_ndiv_i0_i0 : s2cstref // : (i0, i0) -> i0
val the_idiv_i0_i0 : s2cstref // : (i0, i0) -> i0
//
(* ****** ****** *)
//
// HX-2019-09-09:
// types for the constants
//
val the_void_ctype : s2cstref
//
val the_p1tr_ctype : s2cstref
val the_p2tr_ctype : s2cstref
//
val the_sint_ctype : s2cstref
val the_uint_ctype : s2cstref
//
val the_bool_ctype : s2cstref
val the_char_ctype : s2cstref
//
val the_sflt_ctype : s2cstref
val the_dflt_ctype : s2cstref
val the_ldflt_ctype : s2cstref
//
val the_slint_ctype : s2cstref
val the_ulint_ctype : s2cstref
val the_sllint_ctype : s2cstref
val the_ullint_ctype : s2cstref
//
val the_string_ctype : s2cstref
//
(* ****** ****** *)
//
val the_sint0_ctype : s2cstref
val the_uint0_ctype : s2cstref
val the_bool0_ctype : s2cstref
val the_char0_ctype : s2cstref
val the_string0_ctype : s2cstref
//
(* ****** ****** *)
//
val the_lazy_ctype : s2cstref//nonlin
val the_llazy_ctype : s2cstref//linear
//
(* ****** ****** *)
//
val the_excptn_ctype : s2cstref//linear
//
(* ****** ****** *)
//
val the_a0p1tr_cview : s2cstref//linear
//
(* ****** ****** *)
//
fun
s2exp_revar
( s2e0: s2exp
, s2v1: s2var, s2v2: s2var): s2exp
//
fun
s2explst_revar
( s2es
: s2explst
, s2v1: s2var, s2v2: s2var): s2explst
//
fun
s2explst_revar_vt
( s2es
: s2explst
, s2v1: s2var, s2v2: s2var): s2explst_vt
//
(* ****** ****** *)
//
fun
s2exp_revars
( s2e0: s2exp
, svs1
: s2varlst, svs2: s2varlst): s2exp
fun
s2explst_revars
( s2e0
: s2explst
, svs1
: s2varlst, svs2: s2varlst): s2explst
fun
s2explst_revars_vt
( s2e0
: s2explst
, svs1
: s2varlst, svs2: s2varlst): s2explst_vt
//
(* ****** ****** *)
(*
HX-2021-02-27:
Various substitution-related functions
*)
(* ****** ****** *)
//
fun{}
s2exp_whnfz
  (s2e0: s2exp): s2exp
fun{}
s2exp_whnfz$cst
  (s2exp, flag: &int >> _): s2exp
//
(* ****** ****** *)
//
fun
s2exp_whnfize(s2e0: s2exp): s2exp
//
overload whnfize with s2exp_whnfize
//
(* ****** ****** *)
//
fun{}
s2exp_subst
  (t2p0: s2exp): s2exp
fun{}
s2exp_subst$var
  (s2exp, flag: &int >> _): s2exp
//
(* ****** ****** *)
//
fun
s2exp_subst_svar
( s2e0: s2exp
, s2v0: s2var, tsub: s2exp): s2exp
fun
s2exp_subst_svarlst
( s2e0: s2exp
, s2vs: s2varlst, tsub: s2explst): s2exp
//
fun
s2explst_subst_svarlst
( s2es: s2explst
, s2vs: s2varlst, tsub: s2explst): s2explst
//
(* ****** ****** *)

(* end of [xats_staexp2.sats] *)
