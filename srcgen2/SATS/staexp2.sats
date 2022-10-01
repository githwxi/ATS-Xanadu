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
Sun Aug 14 15:45:52 EDT 2022
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
#abstbox t2abs_tbox // ptr
#abstbox t2dat_tbox // ptr
#typedef t2abs = t2abs_tbox
#typedef t2dat = t2dat_tbox
(* ****** ****** *)
#abstbox s2cst_tbox // ptr
#abstbox s2var_tbox // ptr
#typedef s2cst = s2cst_tbox
#typedef s2var = s2var_tbox
(* ****** ****** *)
#abstbox s2itm_tbox // ptr
#typedef s2itm = s2itm_tbox
(* ****** ****** *)
#abstbox s2exp_tbox // ptr
#abstbox s2hnf_tbox // ptr
#abstbox s2typ_tbox // ptr
#typedef s2exp = s2exp_tbox
#typedef s2hnf = s2hnf_tbox
#typedef s2typ = s2typ_tbox
(* ****** ****** *)
#staload S0E = "./staexp0.sats"
#staload S1E = "./staexp1.sats"
(* ****** ****** *)
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef sort1lst = list(sort1)
#typedef s1explst = list(s1exp)
(* ****** ****** *)
#typedef s2cstlst = list(s2cst)
#typedef s2cstopt = optn(s2cst)
(* ****** ****** *)
#typedef s2varlst = list(s2var)
#typedef s2varopt = optn(s2var)
(* ****** ****** *)
#typedef s2explst = list(s2exp)
#typedef s2expopt = optn(s2exp)
(* ****** ****** *)
#vwtpdef s2cstopt_vt = optn_vt(s2cst)
#vwtpdef s2varopt_vt = optn_vt(s2var)
#vwtpdef s2expopt_vt = optn_vt(s2exp)
(* ****** ****** *)
//
datatype
s2lab(x0:type) =
|
S2LAB of
(label, x0(*elt*))
//
(* ****** ****** *)
#typedef
s1lab(x0:t0)=$S1E.s1lab(x0)
(* ****** ****** *)
//
fun
<x0:type>
s2lab_fprint
(out: FILR, lab: s2lab(x0)): void
//
(* ****** ****** *)
#typedef l2s2e = s2lab(s2exp)
(* ****** ****** *)
#typedef l2s2elst = list(l2s2e)
(* ****** ****** *)

datatype t2bas =
| T2Bpre of (sym_t)
  // pred: int, ...
| T2Babs of (t2abs)
  // for abstract sorts
| T2Bdat of (t2dat)
  // for user-defined datasorts
| T2Bimp of
  (int(*knd*), sym_t) // impred. sorts
// end of [ datatype(t2bas) ]

(* ****** ****** *)

datatype sort2 =
//
|
S2Tid0 of sym_t (* base sort *)
|
S2Tint of (int) (* base sort *)
//
|
S2Tbas of (t2bas) (* base sort *)
//
(*
|
S2Txtv of (t2xtv) // for unification
*)
//
|
S2Ttup of (sort2lst) (* tuple sort *)
//
|
S2Tf0un of ((*void*))
|
S2Tf1un of
(sort2lst(*arg*),sort2(*res*))//function
//
|
S2Tapps of
(sort2(*fun*),sort2lst(*arg*))//app-list
//
|
S2Tnone0 of () // HX: error or special
|
S2Tnone1 of sort1 // HX: error indication
//
where
{
  #typedef sort2lst = list(sort2)
  #typedef sort2opt = optn(sort2)
  #typedef sort2lstlst = list(sort2lst)
  #typedef sort2lstopt = optn(sort2lst)
} (* where *) // end of [ datatype(sort2)]
//
(* ****** ****** *)
//
fun
t2abs_fprint:(FILR,t2abs)->void
fun
t2bas_fprint:(FILR,t2bas)->void
fun
t2dat_fprint:(FILR,t2dat)->void
fun
sort2_fprint:(FILR,sort2)->void
//
(* ****** ****** *)
fun
sort2_int(i0: sint): sort2
(* ****** ****** *)
fun
sort2_none0((*void*)): sort2
fun
sort2_none1(s1t0: sort1): sort2
(* ****** ****** *)
fun
s2cst_fprint:(FILR,s2cst)->void
fun
s2var_fprint:(FILR,s2var)->void
(* ****** ****** *)
fun
s2cst_get_name(s2c:s2cst):sym_t
fun
s2cst_get_sort(s2c:s2cst):sort2
fun
s2cst_get_stmp(s2c:s2cst):stamp
(* ****** ****** *)
fun
s2var_get_name(s2v:s2var):sym_t
fun
s2var_get_sort(s2v:s2var):sort2
fun
s2var_get_stmp(s2v:s2var):stamp
(* ****** ****** *)
//
fun
s2cst_make_idst
(sid: token, s2t: sort2): s2cst
//
(* ****** ****** *)
//
fun
s2var_make_sort
(   s2t: sort2    ): s2var
fun
s2var_make_idst
(sid: sym_t, s2t: sort2): s2var
//
(* ****** ****** *)
//
#symload name with s2cst_get_name
#symload sort with s2cst_get_sort
#symload stmp with s2cst_get_stmp
//
#symload name with s2var_get_name
#symload sort with s2var_get_sort
#symload stmp with s2var_get_stmp
//
#symload s2cst with s2cst_make_idst
#symload s2var with s2var_make_idst
//
(* ****** ****** *)
fun
the_s2cstmap_insert_any(s2cst): void
fun
the_s2cstmap_search_opt(sym_t): s2cstopt_vt
(* ****** ****** *)
fun
the_s2varmap_insert_any(s2var): void
fun
the_s2varmap_search_opt(sym_t): s2varopt_vt
(* ****** ****** *)
//
(*
HX:
extended sort *)
datatype s2tex =
|
S2TEXsrt of sort2
|
S2TEXsub of
(s2var, s2explst(*prop*))
//
(* ****** ****** *)
fun
s2tex_fprint:(FILR,s2tex)->void
(* ****** ****** *)
//
datatype
s2exp_node =
//
| S2Eint of (sint) // sint
| S2Ebtf of (bool) // bool
| S2Echr of (char) // char
| S2Estr of (strn) // string
//
| S2Ecst of (s2cst) // constant
//
| S2Evar of (s2var) // variable
//
(*
| S2Extv of (s2xtv) // ext-variable
*)
//
| S2Eany of int(*knd*)
//
| S2Etop0 of (s2exp) // uninitized
| S2Etopz of (s2exp) // delineared
//
| S2Eapps of
  (s2exp, s2explst) // application
| S2Elam0 of
  (s2varlst, s2exp) // abstraction
//
| S2Efun0 of
  ( // function type
    f2clknd
  , int(*npf*)
  , s2explst(*arglst*), s2exp(*result*)
  ) (* end of S2Efun *)
//
| S2Emet0 of // HX: for term-check
  (s2explst(*met*), s2exp(*body*))
//
// HX: for [...]
| S2Eexi0 of // exists quantifier
  ( s2varlst(*vars*)
  , s2explst(*prop*), s2exp(*body*))
// HX: for {...}
| S2Euni0 of // forall quantifier
  ( s2varlst(*vars*)
  , s2explst(*prop*), s2exp(*body*))
//
(*
| S2Elist of s2explst // HX: temporary use
*)
//
// HX-2021-01: for lifting from
| S2Etype of (s2typ) // [s2typ] to [s2exp]
//
| S2Etext of
  ( strn(*name*)
  , s2explst(*arglst*)) (* external *)
//
| S2Etrcd of
  (trcdknd(*knd*), int(*npf*), l2s2elst)
//
| S2Ecimp of // HX: for storing
  (loc_t, s2exp) // sort-checking error
| S2Ecprf of // HX: for storing
  (loc_t, s2exp) // sort-checking error
| S2Ecast of // HX-2108-12-23: for storing
  (loc_t, s2exp, sort2) // sort-checking error
//
| S2Enone0 // of () // HX: error or special
//
(*
| S2Eg1mac of
  (loc_t, g1mac(*src*)) // HX: error indication
*)
//
| S2Enone1 of
  (loc_t, s1exp(*src*)) // HX: error indication
| S2Enone2 of
  (loc_t, s2exp(*src*)) // HX: error indication
//
// end of [s2exp_node] // end of [ datatype(...) ]
//
(* ****** ****** *)
fun
s2exp_fprint:(FILR,s2exp)->void
fun
s2typ_fprint:(FILR,s2typ)->void
(* ****** ****** *)
fun
s2exp_get_sort(s2exp): sort2
fun
s2exp_get_node(s2exp): s2exp_node
(* ****** ****** *)
#symload sort with s2exp_get_sort
#symload node with s2exp_get_node
(* ****** ****** *)
fun
s2exp_int(i0: sint): s2exp
fun
s2exp_btf(b0: bool): s2exp
fun
s2exp_chr(c0: char): s2exp
fun
s2exp_flt(f0: double): s2exp
fun
s2exp_str(s0: string): s2exp
(* ****** ****** *)
fun
s2exp_none0((*void*)): s2exp
fun
s2exp_none1(s1e0:s1exp): s2exp
(* ****** ****** *)
fun
s2exp_make_node
(srt:sort2,nod:s2exp_node): s2exp
#symload s2exp with s2exp_make_node
(* ****** ****** *)
fun
s2exp_l1st(s2es: s2explst): s2exp
fun
s2exp_l2st
(ses1: s2explst, ses2: s2explst): s2exp
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp2.sats] *)
