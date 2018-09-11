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
abstype d1ecl_tbox = ptr
typedef d1ecl = d1ecl_tbox
typedef d1eclist = List0(d1ecl)
typedef d1eclopt = Option(d1ecl)
//
vtypedef d1eclist_vt = List0_vt(d1ecl)
//
(* ****** ****** *)

abstype d1exp_tbox = ptr
typedef d1exp = d1exp_tbox
typedef d1explst = List0(d1exp)
typedef d1expopt = Option(d1exp)

(* ****** ****** *)
//
abstbox q1arg_tbox = ptr
//
typedef q1arg = q1arg_tbox
typedef q1arglst = List0(q1arg)
//
datatype
q1arg_node =
(*
| Q1ARGnone of token
*)
| Q1ARGsome of
  (tokenlst(*ids*), sort1)
//
fun
q1arg_get_loc(q1arg): loc_t
fun
q1arg_get_node(q1arg): q1arg_node
//
overload .loc with q1arg_get_loc
overload .node with q1arg_get_node
//
fun print_q1arg : print_type(q1arg)
fun prerr_q1arg : prerr_type(q1arg)
fun fprint_q1arg : fprint_type(q1arg)
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
  | A1TYPsome of (s0exp, tokenopt)
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
| D1ARGsome_sta of
  (token, s1qualst, token)
| D1ARGsome_dyn of
  (token, a1typlst, a1typlstopt, token)
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
datatype
d1exp_node =
//
| D1Eid of d1eid
//
where d1eid = d0eid
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
d1exp_make_node
(loc: loc_t, node: d1exp_node): d1exp
//
(* ****** ****** *)
//
datatype
d1cstdec =
D1CSTDEC of @{
  loc= loc_t
, nam= token
, arg= d1arglst
, res= effs1expopt
, def= teqd1expopt
}
and
effs1expopt =
| EFFS1EXPnone of
  ((*void*))
| EFFS1EXPsome of
  (s1eff, s1exp)
and
teqd1expopt =
| TEQD1EXPnone of
  ((*void*))
| TEQD1EXPsome of
  (token(*EQ*), d1exp)
//
typedef
d1cstdeclst = List0(d1cstdec)
//
fun
d1cstdec_get_loc(d1cstdec): loc_t
overload .loc with d1cstdec_get_loc
//
(* ****** ****** *)
//
datatype
d1ecl_node =
//
| D1Cnone of (d0ecl)
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
//
| D1Cdatasort of
    (token(*datasort*), d1tsortlst)
  // D1Cdatasort
//
// dataprop/dataview
// datatype/datavtype
//
| D1Cdatatype of
  ( token(*datatype*), d1atypelst, wd1eclseq)
//
| D1Cdynconst of
  ( token(* dctkind *), tq1arglst, d1cstdeclst)
//
| D1Clocal of
    (d1eclist(*head*), d1eclist(*body*))
  // end of [D1Clocal]
//
(*
| D1Cfixity of (d0ecl) // updating fixity env
| D1Cnonfix of (d0ecl) // updating fixity env
*)
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
