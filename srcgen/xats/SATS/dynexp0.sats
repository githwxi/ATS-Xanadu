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

abstype d0pat_tbox = ptr
typedef d0pat = d0pat_tbox
typedef d0patlst = List0(d0pat)
typedef d0patopt = Option(d0pat)

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
| Q0ARGsome of
  (i0dntlst, token(*':'*), sort0)
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
fun
tq0arg_get_loc(tq0arg): loc_t
fun
tq0arg_get_node(tq0arg): tq0arg_node
//
overload .loc with tq0arg_get_loc
overload .node with tq0arg_get_node
//
fun print_tq0arg : print_type(tq0arg)
fun prerr_tq0arg : prerr_type(tq0arg)
fun fprint_tq0arg : fprint_type(tq0arg)
//
overload print with print_tq0arg
overload prerr with prerr_tq0arg
overload fprint with fprint_tq0arg
//
fun
tq0arg_make_node
(loc: loc_t, node: tq0arg_node): tq0arg
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
| D0ARGsome_dyn1 of s0eid
| D0ARGsome_dyn2 of
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
d0pat_node =
//
D0Pid of d0pid
//
// end of [d0pat_node]

(* ****** ****** *)
//
fun
d0pat_get_loc(d0pat): loc_t
fun
d0pat_get_node(d0pat): d0pat_node
//
overload .loc with d0pat_get_loc
overload .node with d0pat_get_node
//
fun print_d0pat : (d0pat) -> void
fun prerr_d0pat : (d0pat) -> void
fun fprint_d0pat : fprint_type(d0pat)
//
overload print with print_d0pat
overload prerr with prerr_d0pat
overload fprint with fprint_d0pat
//
fun
d0pat_make_node
(loc: loc_t, node: d0pat_node): d0pat
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
| D0Eparen of
    (token, d0explst, d0exp_RPAREN)
  // end of [D0Eparen]
//
| D0Etuple of
    (token, tokenopt, d0explst, s0exp_RPAREN)
| D0Erecord of
    (token, tokenopt, labd0explst, labd0exp_RBRACE)
//
| D0Elet of
  (token, d0eclist, token, d0explst, token)
| D0Ewhere of
  (d0exp, token, tokenopt, d0eclist, token)
//
| D0Enone of (token) // HX-2018-07-08: indicating error 
// end of [d0exp_node]

and
d0exp_RPAREN =
| d0exp_RPAREN_cons0 of token
| d0exp_RPAREN_cons1 of (token, d0explst, token)
//
and
labd0exp_RBRACE =
| labd0exp_RBRACE_cons0 of token
| labd0exp_RBRACE_cons1 of (token, labd0explst, token)
//
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
fun
d0exp_RPAREN_loc(d0exp_RPAREN): loc_t
//
fun
print_d0exp_RPAREN: print_type(d0exp_RPAREN)
fun
prerr_d0exp_RPAREN: print_type(d0exp_RPAREN)
fun
fprint_d0exp_RPAREN: fprint_type(d0exp_RPAREN)
//
overload print with print_d0exp_RPAREN
overload prerr with prerr_d0exp_RPAREN
overload fprint with fprint_d0exp_RPAREN
//
(* ****** ****** *)
//
fun
labd0exp_RBRACE_loc(labd0exp_RBRACE): loc_t
//
fun
print_labd0exp_RBRACE: print_type(labd0exp_RBRACE)
fun
prerr_labd0exp_RBRACE: prerr_type(labd0exp_RBRACE)
fun
fprint_labd0exp_RBRACE: fprint_type(labd0exp_RBRACE)
//
overload print with print_labd0exp_RBRACE
overload prerr with prerr_labd0exp_RBRACE
overload fprint with fprint_labd0exp_RBRACE
//
(* ****** ****** *)

datatype
d0cstdec =
D0CSTDEC of @{
  loc= loc_t
, nam= d0pid
, arg= d0arglst
, res= effs0expopt
, def= teqd0expopt
}
and
effs0expopt =
| EFFS0EXPnone of
  ((*void*))
| EFFS0EXPsome of
  (s0eff, s0exp)
and
teqd0expopt =
| TEQD0EXPnone of
  ((*void*))
| TEQD0EXPsome of
  (token(*EQ*), d0exp)
//
typedef
d0cstdeclst = List0(d0cstdec)
//
fun
d0cstdec_get_loc(d0cstdec): loc_t
overload .loc with d0cstdec_get_loc
//
fun
print_d0cstdec: print_type(d0cstdec)
fun
prerr_d0cstdec: prerr_type(d0cstdec)
fun
fprint_d0cstdec: fprint_type(d0cstdec)
//
overload print with print_d0cstdec
overload prerr with prerr_d0cstdec
overload fprint with fprint_d0cstdec
//
fun
print_effs0expopt: print_type(effs0expopt)
fun
prerr_effs0expopt: prerr_type(effs0expopt)
fun
fprint_effs0expopt: fprint_type(effs0expopt)
//
overload print with print_effs0expopt
overload prerr with prerr_effs0expopt
overload fprint with fprint_effs0expopt
//
fun
print_teqd0expopt: print_type(teqd0expopt)
fun
prerr_teqd0expopt: prerr_type(teqd0expopt)
fun
fprint_teqd0expopt: fprint_type(teqd0expopt)
//
overload print with print_teqd0expopt
overload prerr with prerr_teqd0expopt
overload fprint with fprint_teqd0expopt
//
(* ****** ****** *)

datatype
d0ecl_node =
//
| D0Cnone of token
//
| D0Ctkerr of token // HX: error
//
| D0Cnonfix of
  (token, i0dntlst)
  // HX: absolving fixity status
//
| D0Cfixity of
  (token, precopt, i0dntlst)
  // HX: attaching fixity status
//
| D0Cinclude of
    (token(*INCLUDE*), d0exp)
  // HX: for file inclusion
//
| D0Cstaload of
    (token(*STALOAD*), d0exp)
  // HX: for static loading
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
    (token(*dyncstkind*), tq0arglst, d0cstdeclst)
//
| D0Clocal of
    ( token(*LOCAL*)
    , d0eclist, token(*IN*), d0eclist, token(*END*))
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
