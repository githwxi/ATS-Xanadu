(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./basics.sats"

(* ****** ****** *)

#staload "./staexp0.sats"
#staload "./dynexp0.sats"

(* ****** ****** *)

#staload "./staexp1.sats"

(* ****** ****** *)
//
abstype d1pat_tbox = ptr
typedef d1pat = d1pat_tbox
typedef d1patlst = List0(d1pat)
typedef d1patopt = Option(d1pat)
typedef labd1pat = dl0abeled(d1pat)
typedef labd1patlst = List0(labd1pat)
//
(* ****** ****** *)

abstype d1exp_tbox = ptr
typedef d1exp = d1exp_tbox
typedef d1explst = List0(d1exp)
typedef d1expopt = Option(d1exp)

(* ****** ****** *)
//
abstbox d1gua_tbox = ptr
typedef d1gua = d1gua_tbox
typedef d1gualst = List0(d1gua)
//
abstbox dg1pat_tbox = ptr
typedef dg1pat = dg1pat_tbox
//
abstbox d1clau_tbox = ptr
typedef d1clau = d1clau_tbox
typedef d1claulst = List0(d1clau)
//
(* ****** ****** *)
//
abstype d1ecl_tbox = ptr
typedef d1ecl = d1ecl_tbox
typedef d1eclist = List0(d1ecl)
typedef d1eclopt = Option(d1ecl)
//
vtypedef d1eclist_vt = List0_vt(d1ecl)
//
(* ****** ****** *)
//
abstype q1arg_tbox = ptr
typedef q1arg = q1arg_tbox
typedef q1arglst = List0(q1arg)
//
datatype
q1arg_node =
| Q1ARGnone of token
| Q1ARGsome of
  (tokenlst(*ids*), sort1opt)
//
fun
q1arg_get_loc(q1arg): loc_t
fun
q1arg_get_node(q1arg): q1arg_node
//
overload .loc with q1arg_get_loc
overload .node with q1arg_get_node
//
fun
print_q1arg : print_type(q1arg)
fun
prerr_q1arg : prerr_type(q1arg)
fun
fprint_q1arg : fprint_type(q1arg)
//
overload print with print_q1arg
overload prerr with prerr_q1arg
overload fprint with fprint_q1arg
//
fun
q1arg_make_node
(loc: loc_t, node: q1arg_node): q1arg
//
(* ****** ****** *)
//
abstbox sq1arg_tbox = ptr
//
typedef sq1arg = sq1arg_tbox
typedef sq1arglst = List0(sq1arg)
//
datatype
sq1arg_node =
  | SQ1ARGnone of token
  | SQ1ARGsome of (s1qualst)
//
fun
sq1arg_get_loc(sq1arg): loc_t
fun
sq1arg_get_node(sq1arg): sq1arg_node
//
overload .loc with sq1arg_get_loc
overload .node with sq1arg_get_node
//
fun print_sq1arg : print_type(sq1arg)
fun prerr_sq1arg : prerr_type(sq1arg)
fun fprint_sq1arg : fprint_type(sq1arg)
//
overload print with print_sq1arg
overload prerr with prerr_sq1arg
overload fprint with fprint_sq1arg
//
fun
sq1arg_make_node
(loc: loc_t, node: sq1arg_node): sq1arg
//
(* ****** ****** *)
//
abstbox tq1arg_tbox = ptr
//
typedef tq1arg = tq1arg_tbox
typedef tq1arglst = List0(tq1arg)
//
datatype
tq1arg_node =
  | TQ1ARGnone of token
  | TQ1ARGsome of (q1arglst)
//
fun
tq1arg_get_loc(tq1arg): loc_t
fun
tq1arg_get_node(tq1arg): tq1arg_node
//
overload .loc with tq1arg_get_loc
overload .node with tq1arg_get_node
//
fun print_tq1arg : print_type(tq1arg)
fun prerr_tq1arg : prerr_type(tq1arg)
fun fprint_tq1arg : fprint_type(tq1arg)
//
overload print with print_tq1arg
overload prerr with prerr_tq1arg
overload fprint with fprint_tq1arg
//
fun
tq1arg_make_node
(loc: loc_t, node: tq1arg_node): tq1arg
//
(* ****** ****** *)
//
abstbox ti1arg_tbox = ptr
//
typedef ti1arg = ti1arg_tbox
typedef ti1arglst = List0(ti1arg)
//
datatype
ti1arg_node =
  | TI1ARGnone of token
  | TI1ARGsome of (s1explst)
//
fun
ti1arg_get_loc(ti1arg): loc_t
fun
ti1arg_get_node(ti1arg): ti1arg_node
//
overload .loc with ti1arg_get_loc
overload .node with ti1arg_get_node
//
fun print_ti1arg : print_type(ti1arg)
fun prerr_ti1arg : prerr_type(ti1arg)
fun fprint_ti1arg : fprint_type(ti1arg)
//
overload print with print_ti1arg
overload prerr with prerr_ti1arg
overload fprint with fprint_ti1arg
//
fun
ti1arg_make_node
(loc: loc_t, node: ti1arg_node): ti1arg
//
(* ****** ****** *)
//
abstbox a1typ_tbox = ptr
typedef a1typ = a1typ_tbox
typedef a1typlst = List0(a1typ)
typedef a1typopt = Option(a1typ)
typedef a1typlstopt = Option(a1typlst)
//
datatype
a1typ_node =
(*
  | A1TYPnone of token
*)
  | A1TYPsome of (s1exp, tokenopt)
//
fun
a1typ_get_loc(a1typ): loc_t
fun
a1typ_get_node(a1typ): a1typ_node
//
overload .loc with a1typ_get_loc
overload .node with a1typ_get_node
//
fun print_a1typ : print_type(a1typ)
fun prerr_a1typ : prerr_type(a1typ)
fun fprint_a1typ : fprint_type(a1typ)
//
overload print with print_a1typ
overload prerr with prerr_a1typ
overload fprint with fprint_a1typ
//
fun
a1typ_make_node
(loc: loc_t, node: a1typ_node): a1typ
//
(* ****** ****** *)
//
abstbox d1arg_tbox = ptr
typedef d1arg = d1arg_tbox
typedef d1arglst = List0(d1arg)
//
datatype
d1arg_node =
(*
| D1ARGnone of token
*)
//
| D1ARGsome_sta of (s1qualst)
  // D1ARGsome_sta
//
| D1ARGsome_dyn1 of token // s0eid
| D1ARGsome_dyn2 of
  (a1typlst(*arg0*), a1typlstopt(*opt1*))
//
fun
d1arg_get_loc(d1arg): loc_t
fun
d1arg_get_node(d1arg): d1arg_node
//
overload .loc with d1arg_get_loc
overload .node with d1arg_get_node
//
fun print_d1arg : print_type(d1arg)
fun prerr_d1arg : prerr_type(d1arg)
fun fprint_d1arg : fprint_type(d1arg)
//
overload print with print_d1arg
overload prerr with prerr_d1arg
overload fprint with fprint_d1arg
//
fun
d1arg_make_node
(loc: loc_t, node: d1arg_node): d1arg
//
(* ****** ****** *)
//
abstbox f1arg_tbox = ptr
typedef f1arg = f1arg_tbox
typedef f1arglst = List0(f1arg)
//
datatype
f1arg_node =
(*
| F1ARGnone of (token)
*)
| F1ARGsome_dyn of (d1pat)
| F1ARGsome_sta of (s1qualst)
| F1ARGsome_met of (s1explst)
//
fun
f1arg_get_loc(f1arg): loc_t
fun
f1arg_get_node(f1arg): f1arg_node
//
overload .loc with f1arg_get_loc
overload .node with f1arg_get_node
//
fun print_f1arg : print_type(f1arg)
fun prerr_f1arg : prerr_type(f1arg)
fun fprint_f1arg : fprint_type(f1arg)
//
overload print with print_f1arg
overload prerr with prerr_f1arg
overload fprint with fprint_f1arg
//
fun
f1arg_make_node
(loc: loc_t, node: f1arg_node): f1arg
//
(* ****** ****** *)
//
datatype
d1pat_node =
//
| D1Pid of token
//
| D1Pint of token
| D1Pchr of token
| D1Pflt of token
| D1Pstr of token
//
| D1Papp of () // apply
//
| D1Pbs0 of () // backslash
| D1Pbs1 of d1pat // backslash
//
| D1Papps of (d1pat, d1patlst)
//
| D1Plist of d1patlst // temp.
| D1Plist of
  (d1patlst, d1patlst) // temp.
//
| D1Panno of (d1pat, s1exp)
//
| D1Pnone of ((*error-indication*))
// end of [d1pat_node]
//
(* ****** ****** *)
//
fun
d1pat_get_loc(d1pat): loc_t
fun
d1pat_get_node(d1pat): d1pat_node
//
overload .loc with d1pat_get_loc
overload .node with d1pat_get_node
//
fun print_d1pat : (d1pat) -> void
fun prerr_d1pat : (d1pat) -> void
fun fprint_d1pat : fprint_type(d1pat)
//
overload print with print_d1pat
overload prerr with prerr_d1pat
overload fprint with fprint_d1pat
//
fun
d1pat_none(loc: loc_t): d1pat
fun
d1pat_make_node
(loc: loc_t, node: d1pat_node): d1pat
//
(* ****** ****** *)
//
datatype
d1exp_node =
//
| D1Eid of token
//
| D1Eint of token
| D1Echr of token
| D1Eflt of token
| D1Estr of token
//
| D1Eapp of () // apply
//
| D1Ebs0 of () // backslash
| D1Ebs1 of d1exp // backslash
//
| D1Eapps of
    (d1exp, d1explst)
  // D1Eapps
//
| D1Esexp of s1explst
//
| D1Elist of d1explst // temp.
| D1Elist of
  (d1explst, d1explst) // temp.
//
| D1Etuple of
  (token, d1explst)
| D1Etuple of
  (token, d1explst, d1explst)
//
| D1Eif0 of
  ( d1exp(*cond*)
  , d1exp(*then*), d1expopt(*else*))
//
| D1Ecase of
    (token, d1exp, d1claulst)
  // D1Ecase
//
| D1Elet of
    (d1eclist, d1explst)
  // D1Elet
| D1Ewhere of (d1exp, d1eclist)
//
//
| D1Elam of
  (f1arglst, effs1expopt, f1unarrow, d1exp)
//
| D1Enone of () // HX-2018-09-25: indicating error 
// end of [d1exp_node]
//
and
f1unarrow =
(*
| F1UNARROWnone of
  (token(*error*))
*)
| F1UNARROWdflt of ()
| F1UNARROWlist of (s1explst)
//
(* ****** ****** *)
//
datatype
d1gua_node =
| D1GUAexp of (d1exp)
| D1GUAmat of (d1exp, d1pat)
//
fun
d1gua_get_loc(d1gua): loc_t
fun
d1gua_get_node(d1gua): d1gua_node
//
overload .loc with d1gua_get_loc
overload .node with d1gua_get_node
//
fun print_d1gua : (d1gua) -> void
fun prerr_d1gua : (d1gua) -> void
fun fprint_d1gua : fprint_type(d1gua)
//
overload print with print_d1gua
overload prerr with prerr_d1gua
overload fprint with fprint_d1gua
//
fun
d1gua_make_node
(loc: loc_t, node: d1gua_node): d1gua
//
(* ****** ****** *)
//
datatype
d1clau_node =
| D1CLAUgpat of (dg1pat)
| D1CLAUclau of (dg1pat, d1exp)
and
dg1pat_node =
| DG1PATpat of (d1pat)
| DG1PATgua of (d1pat, d1gualst)
//
fun
d1clau_get_loc(d1clau): loc_t
fun
d1clau_get_node(d1clau): d1clau_node
//
overload .loc with d1clau_get_loc
overload .node with d1clau_get_node
//
fun
dg1pat_get_loc(dg1pat): loc_t
fun
dg1pat_get_node(dg1pat): dg1pat_node
//
overload .loc with dg1pat_get_loc
overload .node with dg1pat_get_node
//
fun
d1clau_make_node
(loc: loc_t, node: d1clau_node): d1clau
fun
dg1pat_make_node
(loc: loc_t, node: dg1pat_node): dg1pat
//
(* ****** ****** *)
//
fun
d1exp_get_loc(d1exp): loc_t
fun
d1exp_get_node(d1exp): d1exp_node
//
overload .loc with d1exp_get_loc
overload .node with d1exp_get_node
//
fun print_d1exp : (d1exp) -> void
fun prerr_d1exp : (d1exp) -> void
fun fprint_d1exp : fprint_type(d1exp)
//
overload print with print_d1exp
overload prerr with prerr_d1exp
overload fprint with fprint_d1exp
//
fun
d1exp_none(loc: loc_t): d1exp
fun
d1exp_make_node
(loc: loc_t, node: d1exp_node): d1exp
//
(* ****** ****** *)
//
fun
print_f1unarrow:
  print_type(f1unarrow)
fun
prerr_f1unarrow:
  prerr_type(f1unarrow)
fun
fprint_f1unarrow: fprint_type(f1unarrow)
//
overload print with print_f1unarrow
overload prerr with prerr_f1unarrow
overload fprint with fprint_f1unarrow
//
(* ****** ****** *)
//
datatype
teqd1expopt =
| TEQD1EXPnone of ((*void*))
| TEQD1EXPsome of (token(*EQ*), d1exp)
datatype
wths1expopt =
| WTHS1EXPnone of ((*void*))
| WTHS1EXPsome of (token(*WITHTYPE*), s1exp)
//
(* ****** ****** *)
//
fun
print_teqd1expopt:
print_type(teqd1expopt)
fun
prerr_teqd1expopt:
prerr_type(teqd1expopt)
fun
fprint_teqd1expopt: fprint_type(teqd1expopt)
//
overload print with print_teqd1expopt
overload prerr with prerr_teqd1expopt
overload fprint with fprint_teqd1expopt
//
fun
print_wths1expopt:
print_type(wths1expopt)
fun
prerr_wths1expopt:
prerr_type(wths1expopt)
fun
fprint_wths1expopt: fprint_type(wths1expopt)
//
overload print with print_wths1expopt
overload prerr with prerr_wths1expopt
overload fprint with fprint_wths1expopt
//
(* ****** ****** *)
//
datatype
v1aldecl =
V1ALDECL of @{
  loc= loc_t
, pat= d1pat
, teq= token
, def= d1exp
, wtp= wths1expopt
}
//
typedef
v1aldeclist = List0(v1aldecl)
//
fun
v1aldecl_get_loc(v1aldecl): loc_t
overload .loc with v1aldecl_get_loc
//
fun
print_v1aldecl: print_type(v1aldecl)
fun
prerr_v1aldecl: prerr_type(v1aldecl)
fun
fprint_v1aldecl: fprint_type(v1aldecl)
//
overload print with print_v1aldecl
overload prerr with prerr_v1aldecl
overload fprint with fprint_v1aldecl
//
(* ****** ****** *)
//
datatype
f1undecl =
F1UNDECL of @{
  loc= loc_t
, nam= token
, arg= f1arglst
, res= effs1expopt
, teq= token
, def= d1exp
, wtp= wths1expopt
}
//
typedef
f1undeclist = List0(f1undecl)
//
fun
f1undecl_get_loc(f1undecl): loc_t
overload .loc with f1undecl_get_loc
//
fun
print_f1undecl: print_type(f1undecl)
fun
prerr_f1undecl: prerr_type(f1undecl)
fun
fprint_f1undecl: fprint_type(f1undecl)
//
overload print with print_f1undecl
overload prerr with prerr_f1undecl
overload fprint with fprint_f1undecl
//
(* ****** ****** *)
//
datatype
d1cstdecl =
D1CSTDECL of @{
  loc= loc_t
, nam= token
, arg= d1arglst
, res= effs1expopt
, def= teqd1expopt
}
//
typedef
d1cstdeclist = List0(d1cstdecl)
//
fun
d1cstdecl_get_loc(d1cstdecl): loc_t
overload .loc with d1cstdecl_get_loc
//
(* ****** ****** *)
//
fun
print_d1cstdecl: print_type(d1cstdecl)
fun
prerr_d1cstdecl: prerr_type(d1cstdecl)
fun
fprint_d1cstdecl: fprint_type(d1cstdecl)
//
overload print with print_d1cstdecl
overload prerr with prerr_d1cstdecl
overload fprint with fprint_d1cstdecl
//
(* ****** ****** *)
//
datatype
d1ecl_node =
//
| D1Cnone of (d0ecl)
//
(*
| D1Cfixity of (d0ecl)
  // updating fixity env
| D1Cnonfix of (d0ecl)
  // updating fixity env
*)
//
| D1Cstatic of
  (token, d1ecl) // locally
| D1Cextern of
  (token, d1ecl) // globally
//
| D1Cinclude of
  (token, d1exp) // file inclusion
| D1Cstaload of
  (token, d1exp) // file staloading
//
| D1Cstacst0 of
  ( token
  , token(*s0eid*), sort1)
//
| D1Csortdef of
  ( token(*kind*)
  , token(*s0tid*), s1rtdef)
//
| D1Csexpdef of
  ( token // kind
  , token // s0eid
  , s1marglst, sort1opt, s1exp)
//
| D1Cabstype of
  ( token(*kind*)
  , token(*s0eid*), t1marglst, abstdf1)
  // D1Cabstype
| D1Cabsimpl of
  ( token(*kind*)
  , s1exp(*f1app*), token(*EQ*), s1exp)
  // D1Cabsimpl
//
| D1Cvaldecl of
  ( token(*valkind*)
  , declmodopt(*rec/prf/...*), v1aldeclist)
//
| D1Cfundecl of
  ( token(*funkind*)
  , declmodopt, tq1arglst(*tmpargs*), f1undeclist)
//
| D1Cimpdecl of
  ( token(*impkind*)
  , declmodopt, sq1arglst, tq1arglst
  , dq0eid, ti1arglst, f1arglst, effs1expopt, token, d1exp)
//
| D1Cdatasort of
    (token(*datasort*), d1tsortlst)
  // D1Cdatasort
//
// dataprop/dataview // proofs
// datatype/datavtype // programs
//
| D1Cdatatype of
  (token(*datatype*), d1atypelst, wd1eclseq)
//
| D1Cdynconst of
  (token(*dyncstkind*), tq1arglst, d1cstdeclist)
//
| D1Clocal of (d1eclist(*head*), d1eclist(*body*))
//
and
abstdf1 =
  | ABSTDF1nil of () // unspecified
  | ABSTDF1lteq of s1exp // erasure
  | ABSTDF1eqeq of s1exp // definition
//
and
wd1eclseq =
  | WD1CSnone of () | WD1CSsome of (d1eclist)
//
(* ****** ****** *)
//
fun
d1ecl_get_loc(d1ecl): loc_t
fun
d1ecl_get_node(d1ecl): d1ecl_node
//
overload .loc with d1ecl_get_loc
overload .node with d1ecl_get_node
//
fun print_d1ecl : (d1ecl) -> void
fun prerr_d1ecl : (d1ecl) -> void
fun fprint_d1ecl : fprint_type(d1ecl)
//
overload print with print_d1ecl
overload prerr with prerr_d1ecl
overload fprint with fprint_d1ecl
//
fun
d1ecl_none(d0c: d0ecl): d1ecl
fun
d1ecl_make_node
(loc: loc_t, node: d1ecl_node): d1ecl
//
(* ****** ****** *)
//
fun
print_abstdf1 : (abstdf1) -> void
fun
prerr_abstdf1 : (abstdf1) -> void
fun
fprint_abstdf1 : fprint_type(abstdf1)
//
overload print with print_abstdf1
overload prerr with prerr_abstdf1
overload fprint with fprint_abstdf1
//
(* ****** ****** *)
//
fun
print_wd1eclseq : (wd1eclseq) -> void
fun
prerr_wd1eclseq : (wd1eclseq) -> void
fun
fprint_wd1eclseq : fprint_type(wd1eclseq)
//
overload print with print_wd1eclseq
overload prerr with prerr_wd1eclseq
overload fprint with fprint_wd1eclseq
//
(* ****** ****** *)

(* end of [xats_dynexp1.sats] *)
