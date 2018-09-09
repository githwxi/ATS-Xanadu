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
// Start Time: April, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./staexp0.sats"

(* ****** ****** *)
//
abstype d0ecl_tbox = ptr
typedef d0ecl = d0ecl_tbox
typedef d0eclist = List0(d0ecl)
typedef d0eclopt = Option(d0ecl)
//
vtypedef d0eclist_vt = List0_vt(d0ecl)
//
(* ****** ****** *)
//
datatype
dl0abeled
  (a:type) =
  DL0ABELED of (l0abl, token, a)
//
fun
{a:type}
fprint_dl0abeled
  (out: FILEref, x0: dl0abeled(a)): void
//
(* ****** ****** *)

abstype d0exp_tbox = ptr
typedef d0exp = d0exp_tbox
typedef d0explst = List0(d0exp)
typedef d0expopt = Option(d0exp)
typedef labd0exp = dl0abeled(d0exp)
typedef labd0explst = List0(labd0exp)

(* ****** ****** *)
//
abstbox q0arg_tbox = ptr
//
typedef q0arg = q0arg_tbox
typedef q0arglst = List0(q0arg)
//
datatype
q0arg_node =
(*
  | Q0ARGnone of token
*)
  | Q0ARGsome of (s0exp, tokenopt)
//
fun
q0arg_get_loc(q0arg): loc_t
fun
q0arg_get_node(q0arg): q0arg_node
//
overload .loc with q0arg_get_loc
overload .node with q0arg_get_node
//
fun print_q0arg : print_type(q0arg)
fun prerr_q0arg : prerr_type(q0arg)
fun fprint_q0arg : fprint_type(q0arg)
//
overload print with print_q0arg
overload prerr with prerr_q0arg
overload fprint with fprint_q0arg
//
fun
q0arg_make_node
(loc: loc_t, node: q0arg_node): q0arg
//
(* ****** ****** *)
//
abstbox tq0arg_tbox = ptr
//
typedef tq0arg = tq0arg_tbox
typedef tq0arglst = List0(tq0arg)
//
datatype
tq0arg_node =
  | TQ0ARGnone of token
  | TQ0ARGsome of
    (token(*'<'*), q0arglst, token(*'>'*))
//
(* ****** ****** *)
//
abstbox a0typ_tbox = ptr
typedef a0typ = a0typ_tbox
typedef a0typlst = List0(a0typ)
typedef a0typopt = Option(a0typ)
typedef a0typlstopt = Option(a0typlst)
//
datatype
a0typ_node =
(*
  | A0TYPnone of token
*)
  | A0TYPsome of (s0exp, tokenopt)
//
fun
a0typ_get_loc(a0typ): loc_t
fun
a0typ_get_node(a0typ): a0typ_node
//
overload .loc with a0typ_get_loc
overload .node with a0typ_get_node
//
fun print_a0typ : print_type(a0typ)
fun prerr_a0typ : prerr_type(a0typ)
fun fprint_a0typ : fprint_type(a0typ)
//
overload print with print_a0typ
overload prerr with prerr_a0typ
overload fprint with fprint_a0typ
//
fun
a0typ_make_node
(loc: loc_t, node: a0typ_node): a0typ
//
(* ****** ****** *)
//
abstbox d0arg_tbox = ptr
typedef d0arg = d0arg_tbox
typedef d0arglst = List0(d0arg)
//
datatype
d0arg_node =
| D0ARGnone of token
| D0ARGsome_sta of
  (token, s0qualst, token)
| D0ARGsome_dyn of
  (token, a0typlst, a0typlstopt, token)
//
fun
d0arg_get_loc(d0arg): loc_t
fun
d0arg_get_node(d0arg): d0arg_node
//
overload .loc with d0arg_get_loc
overload .node with d0arg_get_node
//
fun print_d0arg : print_type(d0arg)
fun prerr_d0arg : prerr_type(d0arg)
fun fprint_d0arg : fprint_type(d0arg)
//
overload print with print_d0arg
overload prerr with prerr_d0arg
overload fprint with fprint_d0arg
//
fun
d0arg_make_node
(loc: loc_t, node: d0arg_node): d0arg
//
(* ****** ****** *)

datatype
d0exp_node =
//
| D0Eid of d0eid
//
| D0Eint of t0int
| D0Echr of t0chr
| D0Eflt of t0flt
| D0Estr of t0str
//
| D0Equal of d0exp // qualified
//
| D0Eapps of d0explst
//
| D0Elet of
  (token, d0eclist, token, d0explst, token)
| D0Ewhere of
  (d0exp, token, tokenopt, d0eclist, token)
//
| D0Enone of (token) // HX-2018-07-08: indicating error 
// end of [d0exp_node]

(* ****** ****** *)
//
fun
d0exp_get_loc(d0exp): loc_t
fun
d0exp_get_node(d0exp): d0exp_node
//
overload .loc with d0exp_get_loc
overload .node with d0exp_get_node
//
fun print_d0exp : (d0exp) -> void
fun prerr_d0exp : (d0exp) -> void
fun fprint_d0exp : fprint_type(d0exp)
//
overload print with print_d0exp
overload prerr with prerr_d0exp
overload fprint with fprint_d0exp
//
fun
d0exp_make_node
(loc: loc_t, node: d0exp_node): d0exp
//
(* ****** ****** *)
//
datatype
d0cstdec =
D0CSTDEC of @{
  loc= loc_t
, nam= token
, arg= d0arglst
, res= s0expopt
, def= d0cstdf0
}
and
d0cstdf0 =
| D0CSTDF0none
| D0CSTDF0some of
  (token(*EQ*), d0exp)
//
typedef
d0cstdeclst = List0(d0cstdec)
//
(* ****** ****** *)

datatype
d0ecl_node =
//
| D0Cnone of token
//
| D0Ctkerr of token // HX: error
//
| D0Csortdef of
  (token, s0tid, token, s0rtdef)
//
| D0Csexpdef of
  ( token
  , s0eid
  , s0marglst, sort0opt, token, s0exp)
//
| D0Cabstype of
    (token, s0eid, t0marglst, abstdf0)
  // D0Cabstype
//
| D0Cdatasort of
    (token(*datasort*), d0tsortlst)
  // D0Cdatasort
//
| D0Cdatatype of
    (token(*datatype*), d0atypelst, wd0eclseq)
  // D0Cdatatype
//
| D0Cdynconst of
    (token(* dctkind *), q0arglst, d0cstdeclst)
//
| D0Clocal of
  ( token
  , d0eclist, token, d0eclist, token)
//
| D0Cnonfix of (token, i0dntlst) // HX: absolving fixity status
//
| D0Cfixity of (token, precopt, i0dntlst) // HX: attaching fixity status
//
// end of [d0ecl_node]

(* ****** ****** *)

and
precopt =
| PRECOPTnil of ()
| PRECOPTsing of (token) // token is int
| PRECOPTlist of
  (token(*'('*), tokenlst, token(*')'*))

(* ****** ****** *)

and
abstdf0 =
| ABSTDF0nil of () // unspecified
| ABSTDF0lteq of (token(*"<="*), s0exp)
| ABSTDF0eqeq of (token(*"=="*), s0exp)

(* ****** ****** *)

and
wd0eclseq =
| WD0CSnone of ()
| WD0CSsome of
  (token(*where*), tokenopt, d0eclist, token)

(* ****** ****** *)
//
fun
d0ecl_get_loc(d0ecl): loc_t
fun
d0ecl_get_node(d0ecl): d0ecl_node
//
overload .loc with d0ecl_get_loc
overload .node with d0ecl_get_node
//
fun print_d0ecl : (d0ecl) -> void
fun prerr_d0ecl : (d0ecl) -> void
fun fprint_d0ecl : fprint_type(d0ecl)
//
overload print with print_d0ecl
overload prerr with prerr_d0ecl
overload fprint with fprint_d0ecl
//
fun
d0ecl_make_node
(loc: loc_t, node: d0ecl_node): d0ecl
//
(* ****** ****** *)
//
fun
print_precopt : (precopt) -> void
fun
prerr_precopt : (precopt) -> void
fun
fprint_precopt : fprint_type(precopt)
//
overload print with print_precopt
overload prerr with prerr_precopt
overload fprint with fprint_precopt
//
(* ****** ****** *)
//
fun
print_abstdf0 : (abstdf0) -> void
fun
prerr_abstdf0 : (abstdf0) -> void
fun
fprint_abstdf0 : fprint_type(abstdf0)
//
overload print with print_abstdf0
overload prerr with prerr_abstdf0
overload fprint with fprint_abstdf0
//
(* ****** ****** *)
//
fun
print_wd0eclseq : (wd0eclseq) -> void
fun
prerr_wd0eclseq : (wd0eclseq) -> void
fun
fprint_wd0eclseq : fprint_type(wd0eclseq)
//
overload print with print_wd0eclseq
overload prerr with prerr_wd0eclseq
overload fprint with fprint_wd0eclseq
//
(* ****** ****** *)

(* end of [xats_dynexp0.sats] *)
