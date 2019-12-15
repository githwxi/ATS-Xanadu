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
// Start Time: April, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
SYM = "./symbol.sats"
#staload
LOC = "./locinfo.sats"
//
typedef sym_t = $SYM.sym_t
typedef loc_t = $LOC.loc_t
//
#staload
FP0 = "./filpath.sats"
typedef
filpathopt = $FP0.filpathopt
//
#staload
LEX = "./lexing.sats"
typedef token = $LEX.token
//
(* ****** ****** *)
//
#staload
S0E = "./staexp0.sats"
#staload
D0E = "./dynexp0.sats"
//
typedef sq0eid = $S0E.sq0eid
typedef dq0eid = $S0E.dq0eid
//
  typedef d0exp = $D0E.d0exp
//
(* ****** ****** *)
//
#staload
S1E = "./staexp1.sats"
//
  typedef s1exp = $S1E.s1exp
//
(* ****** ****** *)
//
#staload
D1E = "./dynexp1.sats"
//
  typedef d1pat = $D1E.d1pat
  typedef d1exp = $D1E.d1exp
  typedef d1ecl = $D1E.d1ecl
//
  typedef d1eclist = $D1E.d1eclist
//
  typedef f1unarrow = $D1E.f1unarrow
  typedef decmodopt = $D1E.decmodopt
//
(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"

(* ****** ****** *)
//
abstype
sq2arg_tbox = ptr
//
typedef
sq2arg = sq2arg_tbox
typedef
sq2arglst = List0(sq2arg)
//
abstype
tq2arg_tbox = ptr
//
typedef
tq2arg = tq2arg_tbox
typedef
tq2arglst = List0(tq2arg)
//
(* ****** ****** *)
//
typedef sq2as = sq2arglst
typedef tq2as = tq2arglst
//
(* ****** ****** *)
//
fun
sq2arg_get_loc(sq2arg): loc_t
fun
sq2arg_get_s2vs(sq2arg): s2varlst
//
overload .loc with sq2arg_get_loc
overload .s2vs with sq2arg_get_s2vs
//
fun
print_sq2arg: print_type(sq2arg)
fun
prerr_sq2arg: prerr_type(sq2arg)
fun
fprint_sq2arg: fprint_type(sq2arg)
//
overload print with print_sq2arg
overload prerr with prerr_sq2arg
overload fprint with fprint_sq2arg
//
fun
sq2arg_make
(loc: loc_t, s2vs: s2varlst): sq2arg
//
(* ****** ****** *)
//
fun
tq2arg_get_loc(tq2arg): loc_t
fun
tq2arg_get_s2vs(tq2arg): s2varlst
//
overload .loc with tq2arg_get_loc
overload .s2vs with tq2arg_get_s2vs
//
fun
print_tq2arg: print_type(tq2arg)
fun
prerr_tq2arg: prerr_type(tq2arg)
fun
fprint_tq2arg: fprint_type(tq2arg)
//
overload print with print_tq2arg
overload prerr with prerr_tq2arg
overload fprint with fprint_tq2arg
//
fun
tq2arg_make
(loc: loc_t, s2vs: s2varlst): tq2arg
//
(* ****** ****** *)
//
fun
sq2arglst_get_s2vs
  (sqas: sq2arglst): s2varlst
fun
tq2arglst_get_s2vs
  (tqas: tq2arglst): s2varlst
//
overload .s2vs with sq2arglst_get_s2vs
overload .s2vs with tq2arglst_get_s2vs
//
(* ****** ****** *)
//
abstype d2con_tbox = ptr
typedef d2con = d2con_tbox
//
typedef d2conlst = List0(d2con)
typedef d2conopt = Option(d2con)
//
vtypedef d2conlst_vt = List0_vt(d2con)
vtypedef d2conopt_vt = Option_vt(d2con)
//
(* ****** ****** *)
//
abstype d2cst_tbox = ptr
typedef d2cst = d2cst_tbox
//
typedef d2cstlst = List0(d2cst)
typedef d2cstopt = Option(d2cst)
//
vtypedef d2cstlst_vt = List0_vt(d2cst)
vtypedef d2cstopt_vt = Option_vt(d2cst)
//
(* ****** ****** *)
//
abstype d2var_tbox = ptr
typedef d2var = d2var_tbox
//
typedef d2varlst = List0(d2var)
typedef d2varopt = Option(d2var)
//
vtypedef d2varlst_vt = List0_vt(d2var)
vtypedef d2varopt_vt = Option_vt(d2var)
//
(* ****** ****** *)
//
fun
d2con_stamp_new(): stamp
fun
d2cst_stamp_new(): stamp
fun
d2var_stamp_new(): stamp
//
(* ****** ****** *)
//
fun
d2con_get_loc: d2con -> loc_t
fun
d2cst_get_loc: d2cst -> loc_t
fun
d2var_get_loc: d2var -> loc_t
//
overload .loc with d2con_get_loc
overload .loc with d2cst_get_loc
overload .loc with d2var_get_loc
//
(* ****** ****** *)
//
fun
d2con_get_sym: d2con -> sym_t
fun
d2cst_get_sym: d2cst -> sym_t
fun
d2var_get_sym: d2var -> sym_t
//
overload .sym with d2con_get_sym
overload .sym with d2cst_get_sym
overload .sym with d2var_get_sym
//
(* ****** ****** *)
//
fun
d2con_get_sexp(d2con): s2exp
fun
d2con_get_type(d2con): t2ype
//
fun
d2cst_get_sexp(d2cst): s2exp
fun
d2cst_get_type(d2cst): t2ype
fun
d2cst_get_tqas(d2cst): tq2as
fun
d2cst_get_s2vs(d2cst): s2varlst
//
fun
d2cst_set_sexp(d2cst, s2exp): void
fun
d2cst_set_type(d2cst, t2ype): void
//
fun
d2var_get_sexp(d2var): s2exp
fun
d2var_get_type(d2var): t2ype
fun
d2var_get_tqas(d2var): tq2as
//
fun
d2var_set_sexp(d2var, s2exp): void
fun
d2var_set_type(d2var, t2ype): void
fun
d2var_set_tqas(d2var, tq2as): void
//
(* ****** ****** *)
//
overload .sexp with d2con_get_sexp
overload .type with d2con_get_type
//
overload .sexp with d2cst_get_sexp
overload .type with d2cst_get_type
overload .tqas with d2cst_get_tqas
//
overload .sexp with d2cst_set_sexp
overload .type with d2cst_set_type
//
overload .sexp with d2var_get_sexp
overload .type with d2var_get_type
overload .tqas with d2var_get_tqas
//
overload .type with d2var_set_type
overload .tqas with d2var_set_tqas
//
(* ****** ****** *)
//
fun
d2con_get_stamp(d2con): stamp
fun
d2cst_get_stamp(d2cst): stamp
fun
d2var_get_stamp(d2var): stamp
//
overload .stamp with d2con_get_stamp
overload .stamp with d2cst_get_stamp
overload .stamp with d2var_get_stamp
//
(* ****** ****** *)
//
fun
eq_d2con_d2con
(x1: d2con, x2: d2con): bool
fun
eq_d2cst_d2cst
(x1: d2cst, x2: d2cst): bool
fun
eq_d2var_d2var
(x1: d2var, x2: d2var): bool
//
overload = with eq_d2con_d2con
overload = with eq_d2cst_d2cst
overload = with eq_d2var_d2var
//
(* ****** ****** *)
//
fun
d2con_make_idtp
(id: token, s2e: s2exp): d2con
//
fun
d2cst_make_idtp
( id: token
, tqas: tq2as, s2e0: s2exp): d2cst
//
fun
d2cst_make_dvar(d2v: d2var): d2cst
//
(* ****** ****** *)
//
fun
d2var_new1(tok: token): d2var
fun
d2var_new2(loc_t, sym_t): d2var
//
(* ****** ****** *)
//
fun
print_d2con: print_type(d2con)
fun
prerr_d2con: prerr_type(d2con)
fun
fprint_d2con: fprint_type(d2con)
//
overload print with print_d2con
overload prerr with prerr_d2con
overload fprint with fprint_d2con
//
(* ****** ****** *)
//
fun
print_d2cst: print_type(d2cst)
fun
prerr_d2cst: prerr_type(d2cst)
fun
fprint_d2cst: fprint_type(d2cst)
//
overload print with print_d2cst
overload prerr with prerr_d2cst
overload fprint with fprint_d2cst
//
(* ****** ****** *)
//
fun
print_d2var: print_type(d2var)
fun
prerr_d2var: prerr_type(d2var)
fun
fprint_d2var: fprint_type(d2var)
//
overload print with print_d2var
overload prerr with prerr_d2var
overload fprint with fprint_d2var
//
(* ****** ****** *)
//
abstbox d2pat_tbox = ptr
typedef d2pat = d2pat_tbox
typedef d2patlst = List0(d2pat)
typedef d2patopt = Option(d2pat)
//
(* ****** ****** *)
//
abstbox f2arg_tbox = ptr
typedef f2arg = f2arg_tbox
typedef f2arglst = List0(f2arg)
//
(* ****** ****** *)
//
abstbox d2exp_tbox = ptr
typedef d2exp = d2exp_tbox
//
typedef d2explst = List0(d2exp)
typedef d2expopt = Option(d2exp)
//
typedef d2explstopt = Option(d2explst)
//
(* ****** ****** *)
//
abstbox d2gua_tbox = ptr
typedef d2gua = d2gua_tbox
typedef d2gualst = List0(d2gua)
//
abstbox d2gpat_tbox = ptr
typedef d2gpat = d2gpat_tbox
//
abstbox d2clau_tbox = ptr
typedef d2clau = d2clau_tbox
typedef d2claulst = List0(d2clau)
//
(* ****** ****** *)
//
abstbox d2ecl_tbox = ptr
typedef d2ecl = d2ecl_tbox
typedef d2eclist = List0(d2ecl)
typedef d2eclopt = Option(d2ecl)
//
typedef d2eclistopt = Option(d2eclist)
//
(* ****** ****** *)
//
datatype d2itm =
//
| D2ITMvar of (d2var)
| D2ITMcon of (d2conlst)
| D2ITMcst of (d2cstlst)
//
| D2ITMsym of (sym_t, d2pitmlst)
//
and
d2pitm =
| D2PITMnone of (dq0eid)
| D2PITMsome of (int(*pval*), d2itm)
//
where
d2itmlst = List0(d2itm)
and
d2pitmlst = List0(d2pitm)
//
(* ****** ****** *)
//
typedef
d2itmopt = Option(d2itm)
vtypedef
d2itmopt_vt = Option_vt(d2itm)
//
(* ****** ****** *)
//
fun
print_d2itm: print_type(d2itm)
fun
prerr_d2itm: prerr_type(d2itm)
fun
fprint_d2itm: fprint_type(d2itm)
//
overload print with print_d2itm
overload prerr with prerr_d2itm
overload fprint with fprint_d2itm
//
fun
fprint_d2pitm: fprint_type(d2pitm)
overload fprint with fprint_d2pitm
//
(* ****** ****** *)
//
datatype
d2pat_node =
//
| D2Pnil of ()
| D2Pany of ()
//
| D2Pint of (token)
| D2Pbtf of (token)
| D2Pchr of (token)
| D2Pflt of (token)
| D2Pstr of (token)
//
| D2Pvar of (d2var)
//
| D2Pcon1 of (d2con)
| D2Pcon2 of (d2conlst)
//
| D2Psym0 of
  (d1pat(*sym*), d2pitmlst)
//
| D2Psapp of (d2pat, s2varlst)
| D2Pdapp of (d2pat, int(*npf*), d2patlst)
//
| D2Ptuple of
  (int(*knd*), int(*npf*), d2patlst)
//
| D2Panno of (d2pat, s2exp) // no s2xtv in anno
//
| D2Pnone0 of () | D2Pnone1 of (d1pat)
//
(* ****** ****** *)
//
fun
d2pat_get_loc(d2pat): loc_t
fun
d2pat_get_node(d2pat): d2pat_node
//
overload .loc with d2pat_get_loc
overload .node with d2pat_get_node
//
fun
print_d2pat: print_type(d2pat)
fun
prerr_d2pat: prerr_type(d2pat)
fun
fprint_d2pat: fprint_type(d2pat)
//
overload print with print_d2pat
overload prerr with prerr_d2pat
overload fprint with fprint_d2pat
//
(* ****** ****** *)
//
fun
d2pat_none0(loc_t): d2pat
fun
d2pat_none1(d1pat): d2pat
//
(* ****** ****** *)
//
fun d2pat_nil(loc_t): d2pat
fun d2pat_any(loc_t): d2pat
//
fun d2pat_var(loc_t, d2var): d2pat
//
fun d2pat_con1(loc_t, d2con): d2pat
fun d2pat_con2(loc_t, d2conlst): d2pat
//
fun
d2pat_sym0
( loc0: loc_t
, d1p0: d1pat, dpis: d2pitmlst): d2pat
//
(* ****** ****** *)
//
fun
d2pat_sapp
( loc0: loc_t
, d2f0: d2pat(*fun*)
, s2vs: s2varlst(*arg*)): d2pat
fun
d2pat_dapp
( loc0: loc_t
, d2f0: d2pat(*fun*)
, npf0: int, d2ps: d2patlst(*arg*)): d2pat
//
(* ****** ****** *)
//
fun
d2pat_tuple
( loc0: loc_t
, knd1: int
, npf2: int, d2ps: d2patlst): d2pat
//
(* ****** ****** *)
//
fun
d2pat_make_node
(loc0: loc_t, node: d2pat_node): d2pat
//
(* ****** ****** *)
//
datatype
f2arg_node =
(*
| F2ARGnone of (token)
*)
//
| F2ARGsome_dyn of
  (int(*npf*), d2patlst)
//
| F2ARGsome_sta of
  (s2varlst(*s2vs*), s2explst(*s2ps*))
//
| F2ARGsome_met of (s2explst)
//
(* ****** ****** *)
//
fun
f2arg_get_loc(f2arg): loc_t
fun
f2arg_get_node(f2arg): f2arg_node
//
overload .loc with f2arg_get_loc
overload .node with f2arg_get_node
//
fun
print_f2arg : print_type(f2arg)
fun
prerr_f2arg : prerr_type(f2arg)
fun
fprint_f2arg : fprint_type(f2arg)
//
overload print with print_f2arg
overload prerr with prerr_f2arg
overload fprint with fprint_f2arg
//
fun
f2arg_make_node
(loc: loc_t, node: f2arg_node): f2arg
//
(* ****** ****** *)
//
abstype
ti2arg_tbox = ptr
//
typedef
ti2arg = ti2arg_tbox
typedef
ti2arglst = List0(ti2arg)
//
fun
ti2arg_get_loc(ti2arg): loc_t
fun
ti2arg_get_s2es(ti2arg): s2explst
//
overload .loc with ti2arg_get_loc
overload .s2es with ti2arg_get_s2es
//
fun
print_ti2arg: print_type(ti2arg)
fun
prerr_ti2arg: prerr_type(ti2arg)
fun
fprint_ti2arg: fprint_type(ti2arg)
//
overload print with print_ti2arg
overload prerr with prerr_ti2arg
overload fprint with fprint_ti2arg
//
fun
ti2arg_make
(loc: loc_t, s2es: s2explst): ti2arg
//
(* ****** ****** *)

datatype
d2exp_node =
//
| D2Eint of (token) // int
| D2Ebtf of (token) // bool
| D2Echr of (token) // char
| D2Eflt of (token) // float
| D2Estr of (token) // string
//
| D2Etop of (token)
//
| D2Evar of (d2var)
//
| D2Econ1 of (d2con)
| D2Ecst1 of (d2cst)
| D2Econ2 of (d2conlst)
| D2Ecst2 of (d2cstlst)
//
| D2Esym0 of
  (d1exp(*sym*), d2pitmlst)
//
| D2Esapp of (d2exp, s2explst)
| D2Etapp of (d2exp, s2explst)
| D2Edapp of (d2exp, int(*npf*), d2explst)
//
| D2Elet of (d2eclist, d2exp)
| D2Ewhere of (d2exp, d2eclist)
//
| D2Eseqn of
  (d2explst(*semi*), d2exp(*last*))
//
| D2Etuple of
  (int(*knd*), int(*npf*), d2explst)
//
| D2Eassgn of
  ( d2exp(*l-val*), d2exp(*r-val*) )
(*
| D2Ebrack of
  (d2pitmlst(*sym*), d2explst(*arg*))
*)
| D2Edtsel of
  ( label
  , d2pitmlst
  , int(*npf*), d2explstopt(*arg*))
//
| D2Eif0 of
  ( d2exp(*cond*)
  , d2exp(*then*), d2expopt(*else*))
  // D2Eif0
| D2Ecase of
  (int(*knd*), d2exp(*val*), d2claulst)
  // D2Ecase
//
| D2Elam of
  ( token(*knd*)
  , f2arglst(*arg*)
  , effs2expopt, f1unarrow, d2exp(*body*))
| D2Efix of
  ( token(*knd*)
  , d2var(*fid*)
  , f2arglst(*arg*)
  , effs2expopt, f1unarrow, d2exp(*body*))
//
//
(*
| D2Eflat of d2exp(*l-value*)
*)
//
| D2Eaddr of d2exp(*l-value*)
| D2Eeval of d2exp(*ptr/lazy*)
| D2Efold of d2exp(*open-con*)
//
// HX: for lazy-evaluation
| D2Elazy of
  (d2exp(*eval*)) // nonlin
| D2Ellazy of
  (d2exp(*eval*), d2expopt(*free*)) // linear
//
| D2Eanno of (d2exp(*applst*), s2exp(*type*))
//
| D2Enone0 of ((*void*)) | D2Enone1 of (d1exp)
//
(* ****** ****** *)
//
datatype
d2gua_node =
| D2GUAexp of (d2exp)
| D2GUAmat of (d2exp, d2pat)
//
fun
d2gua_get_loc(d2gua): loc_t
fun
d2gua_get_node(d2gua): d2gua_node
//
overload .loc with d2gua_get_loc
overload .node with d2gua_get_node
//
fun print_d2gua : (d2gua) -> void
fun prerr_d2gua : (d2gua) -> void
fun fprint_d2gua : fprint_type(d2gua)
//
overload print with print_d2gua
overload prerr with prerr_d2gua
overload fprint with fprint_d2gua
//
fun
d2gua_make_node
(loc: loc_t, node: d2gua_node): d2gua
//
(* ****** ****** *)
//
datatype
d2clau_node =
| D2CLAUpat of d2gpat
| D2CLAUexp of (d2gpat, d2exp)
and
d2gpat_node =
| D2GPATpat of (d2pat)
| D2GPATgua of (d2pat, d2gualst)
//
fun
d2clau_get_loc(d2clau): loc_t
fun
d2clau_get_node(d2clau): d2clau_node
//
overload .loc with d2clau_get_loc
overload .node with d2clau_get_node
//
fun
d2gpat_get_loc(d2gpat): loc_t
fun
d2gpat_get_node(d2gpat): d2gpat_node
//
overload .loc with d2gpat_get_loc
overload .node with d2gpat_get_node
//
fun
print_d2clau : (d2clau) -> void
fun
prerr_d2clau : (d2clau) -> void
fun
fprint_d2clau : fprint_type(d2clau)
//
overload print with print_d2clau
overload prerr with prerr_d2clau
overload fprint with fprint_d2clau
//
fun
print_d2gpat : (d2gpat) -> void
fun
prerr_d2gpat : (d2gpat) -> void
fun
fprint_d2gpat : fprint_type(d2gpat)
//
overload print with print_d2gpat
overload prerr with prerr_d2gpat
overload fprint with fprint_d2gpat
//
fun
d2clau_make_node
(loc: loc_t, node: d2clau_node): d2clau
fun
d2gpat_make_node
(loc: loc_t, node: d2gpat_node): d2gpat
//
(* ****** ****** *)
//
fun
d2exp_get_loc(d2exp): loc_t
fun
d2exp_get_node(d2exp): d2exp_node
//
overload .loc with d2exp_get_loc
overload .node with d2exp_get_node
//
(* ****** ****** *)
//
fun
print_d2exp: print_type(d2exp)
fun
prerr_d2exp: prerr_type(d2exp)
fun
fprint_d2exp: fprint_type(d2exp)
//
overload print with print_d2exp
overload prerr with prerr_d2exp
overload fprint with fprint_d2exp
//
(* ****** ****** *)
//
fun d2exp_none0(loc_t): d2exp
fun d2exp_none1(d1exp): d2exp
//
fun d2exp_int(loc_t, token): d2exp
fun d2exp_btf(loc_t, token): d2exp
fun d2exp_chr(loc_t, token): d2exp
fun d2exp_flt(loc_t, token): d2exp
fun d2exp_str(loc_t, token): d2exp
//
fun d2exp_top(loc_t, token): d2exp
//
fun d2exp_var(loc_t, d2var): d2exp
//
fun d2exp_con1(loc_t, d2con): d2exp
fun d2exp_cst1(loc_t, d2cst): d2exp
fun d2exp_con2(loc_t, d2conlst): d2exp
fun d2exp_cst2(loc_t, d2cstlst): d2exp
//
fun
d2exp_sym0
( loc0: loc_t
, d1e0: d1exp, dpis: d2pitmlst): d2exp
//
(* ****** ****** *)
//
fun
d2exp_sapp
( loc0: loc_t
, d2f0: d2exp(*fun*)
, s2as: s2explst(*arg*)): d2exp
fun
d2exp_tapp
( loc0: loc_t
, d2f0: d2exp(*fun*)
, s2as: s2explst(*arg*)): d2exp
//
(* ****** ****** *)
//
fun
d2exp_app2
( loc0: loc_t
, d2f0: d2exp(*fun*)
, d2a1: d2exp, d2a2: d2exp): d2exp
//
fun
d2exp_dapp
( loc0: loc_t
, d2f0: d2exp(*fun*)
, npf0: int, d2as: d2explst): d2exp
//
(* ****** ****** *)
//
fun
d2exp_let
( loc0: loc_t
, d2cs: d2eclist, d2e2: d2exp): d2exp
//
fun
d2exp_where
( loc0: loc_t
, d2e1: d2exp, d2cs: d2eclist): d2exp
//
(* ****** ****** *)
//
fun
d2exp_tuple
( loc0: loc_t
, knd: int, npf: int, d2es: d2explst): d2exp
//
(* ****** ****** *)
//
fun
d2exp_make_node
(loc0: loc_t, node: d2exp_node): d2exp
//
(* ****** ****** *)
//
datatype
v2aldecl =
V2ALDECL of @{
  loc= loc_t
, pat= d2pat
, def= d2expopt
, wtp= s2expopt
}
//
typedef
v2aldeclist = List0(v2aldecl)
//
(* ****** ****** *)
//
fun
v2aldecl_get_loc(v2aldecl): loc_t
fun
v2aldecl_get_pat(v2aldecl): d2pat
//
overload .loc with v2aldecl_get_loc
overload .pat with v2aldecl_get_pat
//
(* ****** ****** *)
//
fun
print_v2aldecl: print_type(v2aldecl)
fun
prerr_v2aldecl: prerr_type(v2aldecl)
fun
fprint_v2aldecl: fprint_type(v2aldecl)
//
overload print with print_v2aldecl
overload prerr with prerr_v2aldecl
overload fprint with fprint_v2aldecl
//
(* ****** ****** *)
//
datatype
v2ardecl =
V2ARDECL of @{
  loc= loc_t
, d2v= d2var
, wth= d2varopt
, res= s2expopt
, ini= d2expopt
}
//
typedef
v2ardeclist = List0(v2ardecl)
//
(* ****** ****** *)
//
fun
print_v2ardecl: print_type(v2ardecl)
fun
prerr_v2ardecl: prerr_type(v2ardecl)
fun
fprint_v2ardecl: fprint_type(v2ardecl)
//
overload print with print_v2ardecl
overload prerr with prerr_v2ardecl
overload fprint with fprint_v2ardecl
//
(* ****** ****** *)
//
datatype
f2undecl =
F2UNDECL of @{
  loc= loc_t
, nam= d2var
, d2c= d2cst
, arg= f2arglst
, res= effs2expopt
, def= d2expopt, wtp= s2expopt
}
//
typedef
f2undeclist = List0(f2undecl)
//
(* ****** ****** *)
//
fun
f2undecl_get_loc(f2undecl): loc_t
//
overload .loc with f2undecl_get_loc
//
(* ****** ****** *)
//
fun
print_f2undecl: print_type(f2undecl)
fun
prerr_f2undecl: prerr_type(f2undecl)
fun
fprint_f2undecl: fprint_type(f2undecl)
//
overload print with print_f2undecl
overload prerr with prerr_f2undecl
overload fprint with fprint_f2undecl
//
(* ****** ****** *)
//
datatype
d2ecl_node =
//
| D2Cnone0 of ()
| D2Cnone1 of (d1ecl)
//
(*
| D2Clist of (d2eclist)
*)
//
| D2Cstatic of
  (token(*STATIC*), d2ecl)
| D2Cextern of
  (token(*EXTERN*), d2ecl)
//
| D2Cinclude of
  ( token
  , d1exp // src
  , int(*knd*) // sta/dyn: 0/1
  , filpathopt
  , d2eclistopt) // file inclusion
//
| D2Cstaload of
  ( token
  , d1exp // src
  , int(*knd*) // sta/dyn: 0/1
  , filpathopt
  , int(*shared*), fmodenvopt)
//
| D2Clocal of
  (d2eclist(*head*), d2eclist(*body*))
//
| D2Cabssort of (sym_t)
//
| D2Cstacst0 of (s2cst, sort2)
//
| D2Csortdef of (sym_t, s2txt)
//
(*
| D2Csexpdef of (d1ecl)
*)
| D2Csexpdef of (s2cst, s2exp)
//
(*
| D2Cabstype of (d1ecl)
*)
| D2Cabstype of (s2cst, abstdf2)
//
(*
| D2Cabsimpl of (d1ecl)
*)
| D2Cabsimpl of
  ( token(*kind*), impls2cst, s2exp(*def*))
//
| D2Csymload of
  ( token(*symload*)
  , sym_t(*loaded*), d2pitm(*loading*))
//
| D2Cvaldecl of
  (token(*knd*), decmodopt, v2aldeclist)
//
| D2Cvardecl of
  (token(*knd*), decmodopt, v2ardeclist)
//
| D2Cfundecl of
  ( token(*funkind*)
  , decmodopt, tq2arglst(*tmpargs*), f2undeclist)
//
| D2Cimpdecl1 of
  ( token(*impkind*)
  , decmodopt
  , sq2arglst, tq2arglst
  , impld2cst, ti2arglst, f2arglst, effs2expopt, d2exp)
| D2Cimpdecl2 of
  ( token(*impkind*)
  , decmodopt
  , sq2arglst, tq2arglst
  , impld2cst, ti2arglst, f2arglst, effs2expopt, d2exp)
//
| D2Cdatasort of (d1ecl)
| D2Cdatatype of (d1ecl)
//
| D2Cdynconst of
  (token(*kind*), tq2arglst, d2cstlst)
//
// end of [d2ecl_node]
//
(*
and
abstdf2 =
  | ABSTDF2nil of () // unspecified
  | ABSTDF2lteq of s2exp // erasure
  | ABSTDF2eqeq of s2exp // definition
*)
//
and
impls2cst =
  | IMPLS2CST1 of (sq0eid, s2cstlst)
  | IMPLS2CST2 of (sq0eid, s2cstlst, s2cstopt)
//
and
impld2cst =
  | IMPLD2CST1 of (dq0eid, d2cstlst)
  | IMPLD2CST2 of (dq0eid, d2cstlst, d2cstopt)
//
(* ****** ****** *)
//
fun
impls2cst_ns2c
(is2c: impls2cst): int
fun
impld2cst_nd2c
(id2c: impld2cst): int
//
(* ****** ****** *)
//
fun
d2ecl_get_loc(d2ecl): loc_t
fun
d2ecl_get_node(d2ecl): d2ecl_node
//
overload .loc with d2ecl_get_loc
overload .node with d2ecl_get_node
//
fun
print_d2ecl: print_type(d2ecl)
fun
prerr_d2ecl: prerr_type(d2ecl)
fun
fprint_d2ecl: fprint_type(d2ecl)
//
overload print with print_d2ecl
overload prerr with prerr_d2ecl
overload fprint with fprint_d2ecl
//
(* ****** ****** *)
//
fun
d2ecl_none0(loc: loc_t): d2ecl
fun
d2ecl_none1(d1c: d1ecl): d2ecl
//
fun
d2ecl_make_node
(loc: loc_t, node: d2ecl_node): d2ecl
//
(* ****** ****** *)
//
fun
print_impls2cst(impls2cst): void
fun
prerr_impls2cst(impls2cst): void
fun
fprint_impls2cst: fprint_type(impls2cst)
//
overload print with print_impls2cst
overload prerr with prerr_impls2cst
overload fprint with fprint_impls2cst
//
(* ****** ****** *)
//
fun
print_impld2cst(impld2cst): void
fun
prerr_impld2cst(impld2cst): void
fun
fprint_impld2cst: fprint_type(impld2cst)
//
overload print with print_impld2cst
overload prerr with prerr_impld2cst
overload fprint with fprint_impld2cst
//
(* ****** ****** *)
//
fun
d2pat_get_sexp(d2pat): s2exp
fun
d2patlst_get_sexps(d2patlst): s2explst
//
(* ****** ****** *)
//
fun
f2undecl_get_sexp(f2d0: f2undecl): s2exp
//
(* ****** ****** *)

(* end of [xats_dynexp2.sats] *)
