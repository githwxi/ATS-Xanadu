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
//
datatype
s2lab(x0:type) =
|
S2LAB of
(label, x0(*elt*))
//
fun
<x0:t0>
s2lab_get_itm
(slab: s2lab(x0)): x0
#symload
itm with s2lab_get_itm
//
(* ****** ****** *)
#abstbox t2abs_tbox // ptr
#abstbox t2dat_tbox // ptr
#typedef t2abs = t2abs_tbox
#typedef t2dat = t2dat_tbox
(* ****** ****** *)
(*
#abstbox sort2_tbox // ptr
#typedef sort2 = sort2_tbox
*)
(* ****** ****** *)
#abstbox s2cst_tbox // ptr
#abstbox s2var_tbox // ptr
#typedef s2cst = s2cst_tbox
#typedef s2var = s2var_tbox
(* ****** ****** *)
#abstbox s2arg_tbox // ptr
#typedef s2arg = s2arg_tbox
(* ****** ****** *)
#abstbox s2exp_tbox // ptr
#abstbox s2hnf_tbox // ptr
#abstbox s2typ_tbox // ptr
#typedef s2exp = s2exp_tbox
#typedef s2hnf = s2hnf_tbox
#typedef s2typ = s2typ_tbox
(* ****** ****** *)
#typedef l2s2e = s2lab(s2exp)
#typedef l2t2p = s2lab(s2typ)
(* ****** ****** *)
(*
#abstbox s2itm_tbox // ptr
#typedef s2itm = s2itm_tbox
*)
(* ****** ****** *)
#staload S0E = "./staexp0.sats"
#staload S1E = "./staexp1.sats"
(* ****** ****** *)
#typedef
s1lab(x0:t0)=$S1E.s1lab(x0)
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
#typedef s2arglst = list(s2arg)
(* ****** ****** *)
#typedef s2explst = list(s2exp)
#typedef s2expopt = optn(s2exp)
(* ****** ****** *)
#typedef l2s2elst = list(l2s2e)
#typedef l2t2plst = list(l2t2p)
(* ****** ****** *)
#typedef s2typlst = list(s2typ)
#typedef s2typopt = optn(s2typ)
(* ****** ****** *)
#typedef s2varlstlst = list(s2varlst)
#typedef s2explstlst = list(s2explst)
(* ****** ****** *)
#vwtpdef s2cstlst_vt = list_vt(s2cst)
#vwtpdef s2cstopt_vt = optn_vt(s2cst)
(* ****** ****** *)
#vwtpdef s2varlst_vt = list_vt(s2var)
#vwtpdef s2varopt_vt = optn_vt(s2var)
(* ****** ****** *)
#vwtpdef s2explst_vt = list_vt(s2exp)
#vwtpdef s2expopt_vt = optn_vt(s2exp)
(* ****** ****** *)
#vwtpdef s2typlst_vt = list_vt(s2typ)
#vwtpdef s2typopt_vt = optn_vt(s2typ)
(* ****** ****** *)
#vwtpdef l2s2elst_vt = list_vt(l2s2e)
(* ****** ****** *)
//
fun
<x0:type>
s2lab_fprint
(out: FILR, lab: s2lab(x0)): void
//
(* ****** ****** *)
//
datatype t2bas =
|
T2Bpred of (sym_t)
// pred: int, ...
|
T2Btabs of (t2abs)
// for abstract sorts
|
T2Btdat of (t2dat)
// for user-defined datasorts
|
T2Bimpr of
(int(*knd*), sym_t) // impred. sorts
// end of [ datatype(t2bas) ]
//
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
S2Tfun0 of ((*void*))
|
S2Tfun1 of
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
|
S2Terrck of (int(*lvl*), sort2)//HX:tread-error
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
fun
t2abs_make_name(sym_t): t2abs
fun
t2dat_make_name(sym_t): t2dat
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
t2abs_get_name(t2a:t2abs):sym_t
fun
t2abs_get_stmp(t2a:t2abs):stamp
(* ****** ****** *)
#symload name with t2abs_get_name
#symload stmp with t2abs_get_stmp
(* ****** ****** *)
fun
t2dat_get_name(t2d:t2dat):sym_t
fun
t2dat_get_stmp(t2d:t2dat):stamp
(* ****** ****** *)
#symload name with t2dat_get_name
#symload stmp with t2dat_get_stmp
(* ****** ****** *)
//
fun
t2dat_get_s2cs
(t2d0: t2dat): s2cstlst
fun
t2dat_set_s2cs
(t2d0:t2dat, s2cs:s2cstlst):void
//
#symload s2cs with t2dat_get_s2cs
#symload s2cs with t2dat_set_s2cs
//
(* ****** ****** *)
//
val
the_sort2_int : sort2
val
the_sort2_addr : sort2
val
the_sort2_bool : sort2
val
the_sort2_char : sort2
//
(*
val
the_sort2_real : sort2
*)
//
val
the_sort2_strn : sort2
//
(* ****** ****** *)
//
val the_sort2_prop: sort2
val the_sort2_view: sort2
//
val the_sort2_type: sort2
val the_sort2_tbox: sort2
val the_sort2_tflt: sort2
//
val the_sort2_vwtp: sort2
val the_sort2_vtbx: sort2
val the_sort2_vtft: sort2
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
//
fun
s2cst_get_lctn(s2c:s2cst):loc_t
fun
s2cst_get_name(s2c:s2cst):sym_t
fun
s2cst_get_sort(s2c:s2cst):sort2
fun
s2cst_get_stmp(s2c:s2cst):stamp
//
#symload name with s2cst_get_lctn
#symload name with s2cst_get_name
#symload sort with s2cst_get_sort
#symload stmp with s2cst_get_stmp
//
(* ****** ****** *)
fun
s2cst_get_sexp
( s2c0:s2cst ): s2expopt_vt
fun
s2cst_get_styp
( s2c0:s2cst ): s2typopt_vt
fun
s2cst_set_sexp
(s2c0: s2cst, sdef: s2exp): void
fun
s2cst_set_styp
(s2c0: s2cst, sdef: s2typ): void
#symload sexp with s2cst_get_sexp
#symload styp with s2cst_get_styp
#symload sexp with s2cst_set_sexp
#symload styp with s2cst_set_styp
(* ****** ****** *)
(*
HX-2023-07-21:
For absimpl history
fun
s2abs_get_t2ps
(s2cst): optn_vt(d2eclist)
*)
(* ****** ****** *)
fun
s2abs_get_sexp
( s2c0:s2cst ): s2expopt_vt
fun
s2abs_get_styp
( s2c0:s2cst ): s2typopt_vt
fun
s2abs_set_sexp
(s2c0: s2cst, sdef: s2exp): void
fun
s2abs_set_styp
(s2c0: s2cst, sdef: s2typ): void
(* ****** ****** *)
//
fun
s2var_get_name(s2v:s2var):sym_t
fun
s2var_get_sort(s2v:s2var):sort2
fun
s2var_get_stmp(s2v:s2var):stamp
//
#symload name with s2var_get_name
#symload sort with s2var_get_sort
#symload stmp with s2var_get_stmp
//
fun
s2var_set_sort(s2var,sort2): void
#symload sort with s2var_set_sort
//
(* ****** ****** *)
//
fun
s2cst_make_idst
(
loc0: loc_t,
sid1: sym_t, s2t2: sort2): s2cst
//
(* ****** ****** *)
//
fun
s2var_make_name
(   name: sym_t    ): (s2var)
fun
s2var_make_sort
(   s2t0: sort2    ): (s2var)
fun
s2var_make_idst
(sid1: sym_t, s2t2: sort2): s2var
//
(* ****** ****** *)
//
#symload
s2cst with s2cst_make_idst//#symld
#symload
s2var with s2var_make_idst//#symld
//
(* ****** ****** *)
//
fun
the_s2cst_p1tr0:((*void*)) -> s2cst
fun
the_s2cst_p2tr0:((*void*)) -> s2cst
//
(* ****** ****** *)
//
fun
the_s2cst_l0azy0:((*void*)) -> s2cst
fun
the_s2cst_l1azy0:((*void*)) -> s2cst
//
(* ****** ****** *)
//
fun
the_s2cst_excptn:((*void*)) -> s2cst
//
(* ****** ****** *)
//
(*
//
HX-2022-12-23:
Both are in [dynexp2.sats]
//
fun
s2cst_get_atdf
(s2c0: s2cst): optn_vt(a2tdf)
fun
s2cst_set_atdf
(s2c0: s2cst, atdf: a2tdf):void
#symload atdf with s2cst_get_atdf
#symload atdf with s2cst_set_atdf
*)
//
(* ****** ****** *)
//
(*
//
HX-2022-11-30:
Both are in [dynexp2.sats]
//
fun
s2cst_get_d2cs
( s2c0
: s2cst ): optn_vt(d2conlst)
//
fun
s2cst_set_d2cs
(s2c0:s2cst,d2cs:d2conlst):void
//
#symload atdf with s2cst_get_d2cs
#symload atdf with s2cst_set_d2cs
//
*)
//
(* ****** ****** *)
(*
fun
the_s2cstmap_insert_any(s2cst): void
fun
the_s2cstmap_search_opt(sym_t): s2cstopt_vt
*)
(* ****** ****** *)
(*
fun
the_s2varmap_insert_any(s2var): void
fun
the_s2varmap_search_opt(sym_t): s2varopt_vt
*)
(* ****** ****** *)
//
datatype
s2arg_node =
|S2Avar of s2var
|S2Atck of (s2var, sort2)
//
(* ****** ****** *)
fun
s2arg_fprint:(FILR,s2arg)->void
(* ****** ****** *)
(*
fun
s2arg_get_lctn:(s2arg)->loc_t
#symload lctn with s2arg_get_lctn
*)
(* ****** ****** *)
fun
s2arg_get_sort:(s2arg)->sort2
fun
s2arg_get_node(s2arg):s2arg_node
(* ****** ****** *)
#symload sort with s2arg_get_sort
#symload node with s2arg_get_node
(* ****** ****** *)
fun
s2arg_make_node
(s2t0:sort2,node:s2arg_node): s2arg
#symload s2arg with s2arg_make_node
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
s2tex_fprint
( out: FILR, stex: s2tex ): void
(* ****** ****** *)
//
datatype
s2exp_node =
//
|S2Eint of (sint) // sint
|S2Ebtf of (bool) // bool
|S2Echr of (char) // char
|S2Estr of (strn) // string
//
|S2Ecst of (s2cst) // constant
//
|S2Evar of (s2var) // variable
//
|S2Eany of int(*knd*) (* '_' *)
//
(*
|
S2Extv of (x2s2e) // ext-variable
*)
//
|S2Etop0 of (s2exp) // uninitized
|S2Etopz of (s2exp) // delineared
//
| // HX: unresolved list of
 S2Ecsts of (s2cstlst)//constants
//
|S2Earg1 of // HX: knd: 0/1/-1: 
(sint(*knd*), s2exp) // cbv0/v1/rf
//
|S2Eatx2 of // HX: bef: 0/1/-1:
(s2exp(*bef*), s2exp(*aft*))//trans
//
|S2Eapps of
( s2exp(*fun*), s2explst(*arg*) )
//
|S2Elam1 of
( s2varlst(*arg*), s2exp(*body*) )
//
|S2Efun1 of
( // function type
  f2clknd
, sint(*npf*)
, s2explst(*args*), s2exp(*res*) )
//
|S2Emet0 of // HX: for term-check
 (s2explst(*mets*), s2exp(*body*))
//
// HX: for [...]
|S2Eexi0 of // exists quantifier
 ( s2varlst(*vars*)
 , s2explst(*prop*), s2exp(*body*))
// HX: for {...}
|S2Euni0 of // forall quantifier
 ( s2varlst(*vars*)
 , s2explst(*prop*), s2exp(*body*))
//
| // HX: for terms of tuple sorts
 S2Elist of s2explst // temporary use
//
// HX-2021-01: for lifting from
|S2Etype of (s2typ) // [s2typ-to-s2exp]
//
|S2Etext of
 ( string(*name*)
 , s2explst(*arglst*)) (* external *)
//
|S2Etrcd of
 (trcdknd(*knd*), int(*npf*), l2s2elst)
//
|S2Eimpr of // HX: for storing
 (loc_t, s2exp) // sort-checking error
|S2Eprgm of // HX: for storing
 (loc_t, s2exp) // sort-checking error
|S2Ecast of // HX-2018-12-23: for storing
 (loc_t,s2exp,sort2) // sort-checking error
//
|S2Enone0 of () // HX: error or special sth
//
(*
| S2Eg1mac of
  (loc_t, g1mac(*src*)) // HX: error indication
*)
//
|S2Enone1 of ( s1exp ) // HX: error indication
|S2Enone2 of ( s2exp ) // HX: error indication
//
|S2Eerrck of (int(*lvl*), s2exp)//HX:tread-error
//
// end of [s2exp_node] // end of [ datatype(...) ]
//
(* ****** ****** *)
fun
s2exp_fprint:(FILR,s2exp)->void
(* ****** ****** *)
fun
s2exp_get_sort(s2exp): sort2
fun
l2s2e_get_sort(l2s2e): sort2
fun
s2exp_get_node(s2exp): s2exp_node
fun
l2s2e_get_node(l2s2e): s2exp_node
(* ****** ****** *)
#symload sort with s2exp_get_sort
#symload sort with l2s2e_get_sort
#symload node with s2exp_get_node
#symload node with l2s2e_get_node
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
s2exp_any1((*void*)): s2exp
fun
s2exp_anys(knd0:sint): s2exp
(* ****** ****** *)
fun
s2exp_none0((*void*)): s2exp
fun
s2exp_none1(s1e0:s1exp): s2exp
fun
s2exp_none2(s2e0:s2exp): s2exp
(* ****** ****** *)
//
fun
s2exp_a2pp
( loc0
: loc_t
, s2f0: s2exp
, s2e1: s2exp, s2e2: s2exp): s2exp
//
fun
s2exp_apps
( loc0
: loc_t
, s2f0:s2exp, s2es:s2explst): s2exp
//
fun
s2exp_apps_pq//for post-processing
( loc0
: loc_t
, s2f0:s2exp, s2es:s2explst): s2exp
//
(* ****** ****** *)
fun
s2exp_lam1
( s2vs
: s2varlst, s2e0: s2exp): s2exp
fun
s2exp_lams
( svss
: s2varlstlst, s2e0: s2exp): s2exp
(* ****** ****** *)
fun
s2exp_fun1_nil
( npf1: sint
, farg
: s2explst, fres: s2exp): s2exp
fun
s2exp_fun1_all
( npf1: sint
, farg
: s2explst, fres: s2exp): s2exp
fun
s2exp_fun1_full
( f2cl
: f2clknd
, npf1: sint
, farg
: s2explst, fres: s2exp): s2exp
(* ****** ****** *)
fun
s2exp_make_node
(s2t0:sort2,node:s2exp_node): s2exp
#symload s2exp with s2exp_make_node
(* ****** ****** *)
//
#abstbox
f2env_tbox <= ptr
#typedef
f2env = f2env_tbox
#typedef
f2envlst = list(f2env)
#typedef
f2envopt = optn(f2env)
(*
#vwtpdef
f2envopt_vt = optn_vt(f2env)
*)
//
(* ****** ****** *)
//
datatype s2itm =
//
|S2ITMvar of s2var
//
// HX-2022-10-23:
// supporting overload
|
S2ITMcst of
( s2cstlst ) // static consts
//
|
S2ITMenv of
( f2envlst ) // for name space
//
(*
// HX: this one is for
|S2ITMexp of g1exp // generics
*)
//
(* ****** ****** *)
fun
s2itm_fprint:(FILR,s2itm)->void
(* ****** ****** *)
(*
// HX-2022-10-01:
// sort2-utility functions
*)
(* ****** ****** *)
fun
sort2_intq(s2t0: sort2): bool
(* ****** ****** *)
fun
sort2_funq(s2t0: sort2): bool
(* ****** ****** *)
fun
sort2_boxq(s2t0: sort2): bool
(* ****** ****** *)
fun
sort2_linq(s2t0: sort2): bool
fun
sort2_prfq(s2t0: sort2): bool
(* ****** ****** *)
fun
sort2_addrq(s2t0: sort2): bool
fun
sort2_boolq(s2t0: sort2): bool
fun
sort2_charq(s2t0: sort2): bool
(* ****** ****** *)
fun
sort2_predq(s2t0: sort2): bool
fun
sort2_imprq(s2t0: sort2): bool
(* ****** ****** *)
fun
sort2_prgmq(s2t0: sort2): bool
(* ****** ****** *)
fun
sort2_polpos(s2t0:sort2): sort2
fun
sort2_polneg(s2t0:sort2): sort2
(* ****** ****** *)
//
fun
t2abs_equal:
( t2abs, t2abs ) -> bool
fun
t2bas_equal:
( t2bas, t2bas ) -> bool
fun
t2dat_equal:
( t2dat, t2dat ) -> bool
//
(*
#symload = with t2abs_equal
#symload = with t2bas_equal
#symload = with t2dat_equal
*)
//
(* ****** ****** *)
//
fun
lte_t2bas_t2bas:
( t2bas, t2bas ) -> bool
fun
lte_sort2_sort2:
( sort2, sort2 ) -> bool
fun
lte_sort2lst_sort2lst:
( sort2lst, sort2lst ) -> bool
//
(*
#symload <= with lte_t2bas_t2bas
#symload <= with lte_sort2_sort2
#symload <= with lte_sort2lst_sort2lst
*)
//
(* ****** ****** *)
//
(*
HX-2022-11-21:
[S2Tnone0] matches all
*)
(*
fun
mat_sort2_sort2:
( sort2, sort2 ) -> bool
fun
mat_sort2lst_sort2lst:
( sort2lst, sort2lst ) -> bool
*)
//
(* ****** ****** *)
(*
// HX-2022-10-25:
// s2cst-utility functions
*)
//
fun
s2cst_linq(s2cst): bool
fun
s2cst_prfq(s2cst): bool
fun
s2cst_imprq(s2cst): bool
fun
s2cst_prgmq(s2cst): bool
//
fun
s2cst_abstq(s2cst): bool
fun
s2cst_dataq(s2cst): bool
//
(* ****** ****** *)
(*
// HX-2022-10-25:
// s2exp-utility functions
*)
(* ****** ****** *)
//
fun
s2exp_linq(s2exp): bool
fun
s2exp_prfq(s2exp): bool
fun
s2exp_imprq(s2exp): bool
fun
s2exp_prgmq(s2exp): bool
//
fun
s2exp_cbrfq(s2exp): bool
fun
s2exp_dataq(s2exp): bool
//
fun
s2explst_linq(s2explst): bool
fun
s2explst_prfq(s2explst): bool
fun
s2explst_imprq(s2explst): bool
fun
s2explst_prgmq(s2explst): bool
//
fun
l2s2elst_linq(l2s2elst): bool
fun
l2s2elst_prfq(l2s2elst): bool
fun
l2s2elst_imprq(l2s2elst): bool
fun
l2s2elst_prgmq(l2s2elst): bool
//
(* ****** ****** *)
fun
s2exp_var( s2v0: s2var ): s2exp
(* ****** ****** *)
fun
s2exp_cst( s2c0: s2cst ): s2exp
(* ****** ****** *)
fun
s2exp_uni0
( s2vs
: s2varlst
, s2ps
: s2explst, body: s2exp): s2exp
fun
s2exp_exi0
( s2vs
: s2varlst
, s2ps
: s2explst, body: s2exp): s2exp
(* ****** ****** *)
// HX-2022-11-21: 
fun // yet-to-be resolved
s2exp_csts(s2cs: s2cstlst): s2exp
(* ****** ****** *)
fun
s2exp_l1st
(loc0: loc_t, s2es: s2explst): s2exp
fun
s2exp_l2st
(loc0: loc_t
,ses1: s2explst, ses2: s2explst): s2exp
(* ****** ****** *)
fun
s2exp_t1up
( loc0: loc_t
, tknd: token, s2es: s2explst): s2exp
fun
s2exp_t2up
( loc0: loc_t
, tknd: token
, ses1: s2explst, ses2: s2explst): s2exp
(* ****** ****** *)
fun
s2exp_r1cd
( loc0: loc_t
, tknd: token, lses: l2s2elst): s2exp
fun
s2exp_r2cd
( loc0: loc_t
, tknd: token
, lss1: l2s2elst, lss2: l2s2elst): s2exp
(* ****** ****** *)
fun
s2exp_impr
(loc0: loc_t, s2e1: s2exp): s2exp
fun
s2exp_prgm
(loc0: loc_t, s2e1: s2exp): s2exp
(* ****** ****** *)
fun
s2exp_cast
( loc0: loc_t
, s2e1: s2exp, s2t2: sort2): s2exp
(* ****** ****** *)
fun
s2exp_stck
( loc0: loc_t
, s2e1: s2exp, s2t2: sort2): s2exp
fun
l2s2e_stck
( loc0: loc_t
, ls2e: l2s2e, s2t2: sort2): l2s2e
(* ****** ****** *)
fun
s2explst_stck
( loc0: loc_t
, s2es: s2explst, s2t0: sort2): s2explst
fun
l2s2elst_stck
( loc0: loc_t
, lses: l2s2elst, s2t0: sort2): l2s2elst
(* ****** ****** *)
//
fun
l2s2elst_make_l1st
(s2es: s2explst): l2s2elst
fun
l2s2elst_make_l2st
(ses1: s2explst, ses2: s2explst): l2s2elst
//
(* ****** ****** *)
//
fun
s2exp_revar0
( s2e0: s2exp
, s2v0: s2var, s2v1: s2var): s2exp
fun
l2s2e_revar0
( ls2e: l2s2e
, s2v0: s2var, s2v1: s2var): l2s2e
//
fun
s2explst_revar0
( s2es: s2explst
, s2v0: s2var, s2v1: s2var): s2explst
fun
l2s2elst_revar0
( lses: l2s2elst
, s2v0: s2var, s2v1: s2var): l2s2elst
//
(* ****** ****** *)
//
fun
s2exp_revarx
( s2e0 : s2exp
, s2var, s2var, flag: &sint >> _): s2exp
fun
l2s2e_revarx
( ls2e: l2s2e
, s2var, s2var, flag: &sint >> _): l2s2e
//
fun
s2explst_revarx
( s2es : s2explst
, s2var, s2var, flag: &sint >> _): s2explst
fun
l2s2elst_revarx
( lses : l2s2elst
, s2var, s2var, flag: &sint >> _): l2s2elst
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp2.sats] *)
