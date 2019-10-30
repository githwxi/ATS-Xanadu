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

#staload "./basics.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"

(* ****** ****** *)
//
abstbox d3pat_tbox = ptr
typedef d3pat = d3pat_tbox
typedef d3patlst = List0(d3pat)
typedef d3patopt = Option(d3pat)
//
(* ****** ****** *)
//
abstbox f3arg_tbox = ptr
typedef f3arg = f3arg_tbox
typedef f3arglst = List0(f3arg)
typedef f3arglstopt = Option(f3arglst)
//
(* ****** ****** *)
//
abstbox d3exp_tbox = ptr
//
typedef d3exp = d3exp_tbox
typedef d3explst = List0(d3exp)
typedef d3expopt = Option(d3exp)
//
(* ****** ****** *)
//
abstbox d3gua_tbox = ptr
typedef d3gua = d3gua_tbox
typedef d3gualst = List0(d3gua)
//
abstbox dg3pat_tbox = ptr
typedef dg3pat = dg3pat_tbox
//
abstbox d3clau_tbox = ptr
typedef d3clau = d3clau_tbox
typedef d3claulst = List0(d3clau)
//
(* ****** ****** *)
//
abstbox d3ecl_tbox = ptr
//
typedef d3ecl = d3ecl_tbox
typedef d3eclist = List0(d3ecl)
typedef d3eclopt = Option(d3ecl)
//
(* ****** ****** *)

datatype
d3pat_node =
//
| D3Pany of ()
//
| D3Pvar of (d2var)
//
| D3Pint of (token)
| D3Pbtf of (token)
| D3Pchr of (token)
| D3Pflt of (token)
| D3Pstr of (token)
//
| D3Pcon1 of (d2con)
| D3Pcon2 of (d2conlst)
//
| D3Psym0 of
  (d1pat(*sym*), d2pitmlst)
//
| D3Psapp of (d3pat, s2varlst)
| D3Pdapp of (d3pat, int(*npf*), d3patlst)
//
| D3Ptuple of
  (int(*knd*), int(*npf*), d3patlst)
//
| D3Panno of (d3pat, s2exp) // no s2xtv in anno
//
| D3Pcast of (d3pat, t2ype) // HX: error indication?
//
| D3Pnone0 of ()
| D3Pnone1 of (d2pat) | D3Pnone2 of (d3pat)
//
(* ****** ****** *)
//
fun
d3pat_get_loc
(d3p0: d3pat): loc_t
fun
d3pat_get_node
(d3p0: d3pat): d3pat_node
//
overload .loc with d3pat_get_loc
overload .node with d3pat_get_node
//
(* ****** ****** *)
//
fun
d3pat_get_type
(d3p0: d3pat): t2ype
fun
d3patlst_get_type
(d3ps: d3patlst): t2ypelst
//
overload .type with d3pat_get_type
//
(* ****** ****** *)
//
fun
print_d3pat: print_type(d3pat)
fun
prerr_d3pat: prerr_type(d3pat)
fun
fprint_d3pat: fprint_type(d3pat)
//
overload print with print_d3pat
overload prerr with prerr_d3pat
overload fprint with fprint_d3pat
//
(* ****** ****** *)
//
fun
d3pat_any
(loc0: loc_t, t2p0: t2ype): d3pat
fun
d3pat_var
(loc0: loc_t, d2v0: d2var): d3pat
//
(* ****** ****** *)

fun
d3pat_int
(loc0: loc_t, tok0: token): d3pat
fun
d3pat_btf
(loc0: loc_t, tok0: token): d3pat
fun
d3pat_chr
(loc0: loc_t, tok0: token): d3pat

(* ****** ****** *)

fun
d3pat_con
(loc0: loc_t, d2c0: d2con): d3pat

(* ****** ****** *)

fun
d3pat_anno
(d3p0: d3pat, s2e0: s2exp): d3pat

(* ****** ****** *)
//
fun
d3pat_cast
(d3p0: d3pat, t2p0: t2ype): d3pat
//
(* ****** ****** *)
//
fun
d3pat_make_node
( loc0: loc_t
, t2p0: t2ype, node: d3pat_node): d3pat
//
(* ****** ****** *)

datatype
ti3arg =
| TI3ARGnone of ()
| TI3ARGsome of t2ypelst

(* ****** ****** *)
//
fun
print_ti3arg: print_type(ti3arg)
fun
prerr_ti3arg: prerr_type(ti3arg)
fun
fprint_ti3arg: fprint_type(ti3arg)
//
overload print with print_ti3arg
overload prerr with prerr_ti3arg
overload fprint with fprint_ti3arg
//
(* ****** ****** *)
//
datatype
f3arg_node =
(*
| F3ARGnone of (token)
*)
//
| F3ARGnone2 of f2arg
| F3ARGnone3 of f3arg
//
| F3ARGsome_dyn of
  (int(*npf*), d3patlst)
//
| F3ARGsome_sta of
  (s2varlst(*s2vs*), s2explst(*s2ps*))
//
| F3ARGsome_met of (s2explst)
//
(* ****** ****** *)
//
fun
f3arg_get_loc(f3arg): loc_t
fun
f3arg_get_node(f3arg): f3arg_node
//
overload .loc with f3arg_get_loc
overload .node with f3arg_get_node
//
fun
print_f3arg : print_type(f3arg)
fun
prerr_f3arg : prerr_type(f3arg)
fun
fprint_f3arg : fprint_type(f3arg)
//
overload print with print_f3arg
overload prerr with prerr_f3arg
overload fprint with fprint_f3arg
//
fun
f3arg_make_node
(loc: loc_t, node: f3arg_node): f3arg
//
(* ****** ****** *)

datatype
d3exp_node =
//
| D3Eint of (token)
| D3Ebtf of (token)
| D3Echr of (token)
| D3Eflt of (token)
| D3Estr of (token)
//
| D3Etop of (token)
//
| D3Evar of (d2var)
//
| D3Econ1 of (d2con)
| D3Ecst1 of (d2cst)
| D3Econ2 of (d2conlst)
| D3Ecst2 of (d2cstlst)
//
| D3Esym0 of
  (d1exp(*sym*), d2pitmlst)
//
| D3Efcst of (d2cst)
//
| D3Etcst of
  ( d2cst
  , ti3arg, ti2arglst(*sess*))
| D3Etimp of
  ( d3exp(*tcst*), t2ypelst(*targ*)
  , d3ecl(*impl*), t2ypelst(*tsub*)
  ) (* end of [D3Etimp] *)
//
| D3Esap0 of (d3exp, s2explst)
| D3Esap1 of (d3exp, s2explst)
//
| D3Etapp of (d2exp, s2explst)
//
| D3Edapp of
  (d3exp, int(*npf*), d3explst)
//
| D3Elet of
  (d3eclist, d3exp(*sequence*))
| D3Ewhere of (d3exp, d3eclist)
//
| D3Eseqn of
  (d3explst(*semi*), d3exp(*last*))
//
| D3Etuple of
  (int(*knd*), int(*npf*), d3explst)
//
| D3Eassgn of
  (d3exp(*lval*), d3exp(*rval*))
| D3Edtsel of
  (label, d2pitmlst, d3expopt(*arg*))
//
| D3Eif0 of
  ( d3exp(*cond*)
  , d3exp(*then*), d3expopt(*else*))
//
| D3Ecase of
  (int(*knd*), d3exp(*val*), d3claulst)
  // D3Ecase
//
| D3Elam of
  ( f3arglst
  , effs2expopt, f1unarrow, d3exp(*body*))
//
| D3Eaddr of (d3exp)
| D3Efold of (d3exp)
//
| D3Eanno of (d3exp, s2exp)
//
| D3Ecast of (d3exp, t2ype)
//
| D3Enone0 of ()
| D3Enone1 of (d2exp) | D3Enone2 of (d3exp)
//
(* ****** ****** *)
//
datatype
d3gua_node =
| D3GUAexp of (d3exp)
| D3GUAmat of (d3exp, d3pat)
//
fun
d3gua_get_loc(d3gua): loc_t
fun
d3gua_get_node(d3gua): d3gua_node
//
overload .loc with d3gua_get_loc
overload .node with d3gua_get_node
//
fun print_d3gua : (d3gua) -> void
fun prerr_d3gua : (d3gua) -> void
fun fprint_d3gua : fprint_type(d3gua)
//
overload print with print_d3gua
overload prerr with prerr_d3gua
overload fprint with fprint_d3gua
//
fun
d3gua_make_node
(loc: loc_t, node: d3gua_node): d3gua
//
(* ****** ****** *)
//
datatype
d3clau_node =
| D3CLAUgpat of (dg3pat)
| D3CLAUclau of (dg3pat, d3exp)
and
dg3pat_node =
| DG3PATpat of (d3pat)
| DG3PATgua of (d3pat, d3gualst)
//
fun
d3clau_get_loc(d3clau): loc_t
fun
d3clau_get_node(d3clau): d3clau_node
//
overload .loc with d3clau_get_loc
overload .node with d3clau_get_node
//
fun
dg3pat_get_loc(dg3pat): loc_t
fun
dg3pat_get_node(dg3pat): dg3pat_node
//
overload .loc with dg3pat_get_loc
overload .node with dg3pat_get_node
//
fun
print_d3clau : (d3clau) -> void
fun
prerr_d3clau : (d3clau) -> void
fun
fprint_d3clau : fprint_type(d3clau)
//
overload print with print_d3clau
overload prerr with prerr_d3clau
overload fprint with fprint_d3clau
//
fun
print_dg3pat : (dg3pat) -> void
fun
prerr_dg3pat : (dg3pat) -> void
fun
fprint_dg3pat : fprint_type(dg3pat)
//
overload print with print_dg3pat
overload prerr with prerr_dg3pat
overload fprint with fprint_dg3pat
//
fun
d3clau_make_node
(loc: loc_t, node: d3clau_node): d3clau
fun
dg3pat_make_node
(loc: loc_t, node: dg3pat_node): dg3pat
//
(* ****** ****** *)
//
fun
d3exp_get_loc(d3exp): loc_t
fun
d3exp_get_node(d3exp): d3exp_node
//
overload .loc with d3exp_get_loc
overload .node with d3exp_get_node
//
(* ****** ****** *)
//
fun
d3exp_get_type
(d3e0: d3exp): t2ype
fun
d3explst_get_type
(d3es: d3explst): t2ypelst
fun
d3expopt_get_type
(opt0: d3expopt): t2ypeopt
//
overload .type with d3exp_get_type
//
(*
fun
d3exp_set_type0
(d3e: d3exp, t2p: t2ype): void
fun
d3exp_set_type1
(d3e: d3exp, t2p: t2ype): d3exp
overload .type0 with d3exp_set_type0
overload .type1 with d3exp_set_type1
*)
//
(* ****** ****** *)
//
fun
d3exp_none0_0
(loc0: loc_t): d3exp
fun
d3exp_none0_1
(loc0: loc_t, t2p0: t2ype): d3exp
//
fun
d3exp_none1_0
(d2e0: d2exp): d3exp
fun
d3exp_none1_1
(d2e0: d2exp, t2p0: t2ype): d3exp
//
fun
d3exp_none2_0(d3e0: d3exp): d3exp
//
(* ****** ****** *)
//
fun
d3exp_make_node
( loc0: loc_t
, t2p0: t2ype, node: d3exp_node): d3exp
//
(* ****** ****** *)
//
fun
print_d3exp: print_type(d3exp)
fun
prerr_d3exp: prerr_type(d3exp)
fun
fprint_d3exp: fprint_type(d3exp)
//
overload print with print_d3exp
overload prerr with prerr_d3exp
overload fprint with fprint_d3exp
//
(* ****** ****** *)

fun
d3exp_cast
(d3e0: d3exp, t2p0: t2ype): d3exp

(* ****** ****** *)

datatype
t2pcast =
| T2PCASTnone of ()
| T2PCASTsome of (t2ype, t2ype)

(* ****** ****** *)
//
fun
print_t2pcast: print_type(t2pcast)
fun
prerr_t2pcast: prerr_type(t2pcast)
fun
fprint_t2pcast: fprint_type(t2pcast)
//
overload print with print_t2pcast
overload prerr with prerr_t2pcast
overload fprint with fprint_t2pcast
//
(* ****** ****** *)
//
datatype
v3aldecl =
V3ALDECL of @{
  loc= loc_t
, pat= d3pat
, def= d3expopt
, wtp= s2expopt
(*
, ctp= t2pcast
*)
}
//
typedef
v3aldeclist = List0(v3aldecl)
//
(* ****** ****** *)
//
fun
print_v3aldecl: print_type(v3aldecl)
fun
prerr_v3aldecl: prerr_type(v3aldecl)
fun
fprint_v3aldecl: fprint_type(v3aldecl)
//
overload print with print_v3aldecl
overload prerr with prerr_v3aldecl
overload fprint with fprint_v3aldecl
//
(* ****** ****** *)
//
datatype
v3ardecl =
V3ARDECL of @{
  loc= loc_t
, d2v= d2var
, wth= d2varopt
, res= s2expopt
, ini= d3expopt
}
//
typedef
v3ardeclist = List0(v3ardecl)
//
(* ****** ****** *)
//
fun
print_v3ardecl: print_type(v3ardecl)
fun
prerr_v3ardecl: prerr_type(v3ardecl)
fun
fprint_v3ardecl: fprint_type(v3ardecl)
//
overload print with print_v3ardecl
overload prerr with prerr_v3ardecl
overload fprint with fprint_v3ardecl
//
(* ****** ****** *)
//
datatype
f3undecl =
F3UNDECL of @{
  loc= loc_t
, nam= d2var
, a2g= f2arglst
, a3g= f3arglstopt
, res= effs2expopt
, def= d3expopt
, wtp= s2expopt, ctp= t2pcast
}
//
typedef
f3undeclist = List0(f3undecl)
//
(* ****** ****** *)
//
fun
f3undecl_get_loc(f3undecl): loc_t
//
overload .loc with f3undecl_get_loc
//
(* ****** ****** *)
//
fun
print_f3undecl: print_type(f3undecl)
fun
prerr_f3undecl: prerr_type(f3undecl)
fun
fprint_f3undecl: fprint_type(f3undecl)
//
overload print with print_f3undecl
overload prerr with prerr_f3undecl
overload fprint with fprint_f3undecl
//
(* ****** ****** *)
//
datatype
d3ecl_node =
//
| D3Cnone0 of ()
| D3Cnone1 of (d2ecl)
//
| D3Cd2ecl of (d2ecl)
//
| D3Cstatic of
  (token(*STATIC*), d3ecl)
| D3Cextern of
  (token(*EXTERN*), d3ecl)
//
| D3Clocal of
  (d3eclist(*head*), d3eclist(*body*))
//
| D3Cvaldecl of
  (token(*knd*), decmodopt, v3aldeclist)
| D3Cvardecl of (token(*knd*), v3ardeclist)
//
| D3Cfundecl of
  ( token(*funkind*)
  , decmodopt, tq2arglst(*tmpargs*), f3undeclist)
//
| D3Cimpdecl1 of
  ( token(*impkind*)
  , decmodopt
  , sq2arglst
  , tq2arglst
  , impld2cst
  , ti3arg, ti2arglst, f3arglst, effs2expopt, d3exp)
| D3Cimpdecl2 of
  ( token(*impkind*)
  , decmodopt
  , sq2arglst
  , tq2arglst
  , impld2cst
  , ti3arg, ti2arglst, f3arglst, effs2expopt, d3exp)
| D3Cimpdecl3 of
  ( token(*impkind*)
  , decmodopt
  , sq2arglst
  , tq2arglst
  , impld2cst
  , ti3arg, ti2arglst, f3arglst, effs2expopt, d3exp)
//
// end of [d3ecl_node]
//
(* ****** ****** *)
//
fun
d3ecl_get_loc(d3ecl): loc_t
fun
d3ecl_get_node(d3ecl): d3ecl_node
//
overload .loc with d3ecl_get_loc
overload .node with d3ecl_get_node
//
(* ****** ****** *)
//
fun
print_d3ecl: print_type(d3ecl)
fun
prerr_d3ecl: prerr_type(d3ecl)
fun
fprint_d3ecl: fprint_type(d3ecl)
//
overload print with print_d3ecl
overload prerr with prerr_d3ecl
overload fprint with fprint_d3ecl
//
(* ****** ****** *)
//
fun d3ecl_none0(loc_t): d3ecl
fun d3ecl_none1(d2ecl): d3ecl
//
fun
d3ecl_make_node
(loc: loc_t, node: d3ecl_node): d3ecl
//
(* ****** ****** *)

(* end of [xats_dynexp3.sats] *)
