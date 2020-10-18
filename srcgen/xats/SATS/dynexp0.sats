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

#staload "./staexp0.sats"

(* ****** ****** *)
//
typedef
t0intopt = Option(t0int)
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
typedef labd0pat = dl0abeled(d0pat)
typedef labd0patlst = List0(labd0pat)

(* ****** ****** *)

abstype d0exp_tbox = ptr
typedef d0exp = d0exp_tbox
typedef d0explst = List0(d0exp)
typedef d0expopt = Option(d0exp)
typedef labd0exp = dl0abeled(d0exp)
typedef labd0explst = List0(labd0exp)

(* ****** ****** *)
//
abstbox d0gua_tbox = ptr
typedef d0gua = d0gua_tbox
typedef d0gualst = List0(d0gua)
//
abstbox d0gpat_tbox = ptr
typedef d0gpat = d0gpat_tbox
//
abstbox d0clau_tbox = ptr
typedef d0clau = d0clau_tbox
typedef d0claulst = List0(d0clau)
//
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
abstype q0arg_tbox = ptr
typedef q0arg = q0arg_tbox
typedef q0arglst = List0(q0arg)
//
datatype
q0arg_node =
(*
| Q0ARGnone of token
*)
| Q0ARGsome of (i0dnt, sort0opt)
//
fun
q0arg_get_loc(q0arg): loc_t
fun
q0arg_get_node(q0arg): q0arg_node
//
overload .loc with q0arg_get_loc
overload .node with q0arg_get_node
//
fun
print_q0arg : print_type(q0arg)
fun
prerr_q0arg : prerr_type(q0arg)
fun
fprint_q0arg : fprint_type(q0arg)
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
abstbox sq0arg_tbox = ptr
//
typedef sq0arg = sq0arg_tbox
typedef sq0arglst = List0(sq0arg)
//
datatype
sq0arg_node =
| SQ0ARGnone of token
| SQ0ARGsome of
  (token(*'{'*), q0arglst, token(*'}'*))
//
fun
sq0arg_get_loc(sq0arg): loc_t
fun
sq0arg_get_node(sq0arg): sq0arg_node
//
overload .loc with sq0arg_get_loc
overload .node with sq0arg_get_node
//
fun
print_sq0arg : print_type(sq0arg)
fun
prerr_sq0arg : prerr_type(sq0arg)
fun
fprint_sq0arg : fprint_type(sq0arg)
//
overload print with print_sq0arg
overload prerr with prerr_sq0arg
overload fprint with fprint_sq0arg
//
fun
sq0arg_make_node
(loc: loc_t, node: sq0arg_node): sq0arg
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
abstbox ti0arg_tbox = ptr
//
typedef ti0arg = ti0arg_tbox
typedef ti0arglst = List0(ti0arg)
//
datatype
ti0arg_node =
  | TI0ARGnone of token
  | TI0ARGsome of
    (token(*'<'*), s0explst, token(*'>'*))
//
fun
ti0arg_get_loc(ti0arg): loc_t
fun
ti0arg_get_node(ti0arg): ti0arg_node
//
overload .loc with ti0arg_get_loc
overload .node with ti0arg_get_node
//
fun print_ti0arg : print_type(ti0arg)
fun prerr_ti0arg : prerr_type(ti0arg)
fun fprint_ti0arg : fprint_type(ti0arg)
//
overload print with print_ti0arg
overload prerr with prerr_ti0arg
overload fprint with fprint_ti0arg
//
fun
ti0arg_make_node
(loc: loc_t, node: ti0arg_node): ti0arg
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
//
abstbox f0arg_tbox = ptr
typedef f0arg = f0arg_tbox
typedef f0arglst = List0(f0arg)
//
datatype
f0arg_node =
| F0ARGnone of (token)
| F0ARGsome_dyn of (d0pat)
| F0ARGsome_sta of (token, s0qualst, token)
| F0ARGsome_met of (token, s0explst, token)
//
fun
f0arg_get_loc(f0arg): loc_t
fun
f0arg_get_node(f0arg): f0arg_node
//
overload .loc with f0arg_get_loc
overload .node with f0arg_get_node
//
fun print_f0arg : print_type(f0arg)
fun prerr_f0arg : prerr_type(f0arg)
fun fprint_f0arg : fprint_type(f0arg)
//
overload print with print_f0arg
overload prerr with prerr_f0arg
overload fprint with fprint_f0arg
//
fun
f0arg_make_node
(loc: loc_t, node: f0arg_node): f0arg
//
(* ****** ****** *)

datatype
d0pat_node =
//
| D0Pid0 of d0pid
//
| D0Pint of t0int
| D0Pchr of t0chr
| D0Pflt of t0flt
| D0Pstr of t0str
//
| D0Papps of d0patlst
//
| D0Psqarg of//sqparg
    (token, s0arglst, token)
  // end of [D0Psqarg]
//
| D0Pparen of
    (token, d0patlst, d0pat_RPAREN)
  // end of [D0Pparen]
//
| D0Ptuple of
    ( token, tokenopt
    , d0patlst, d0pat_RPAREN)
| D0Precord of
    ( token, tokenopt
    , labd0patlst, labd0pat_RBRACE)
//
| D0Panno of (d0pat, s0exp)
//
| D0Pqual of (token, d0pat) // qualified
//
| D0Pnone of (token) // HX-2018-09-15: indicating error 
// end of [d0pat_node]

and
d0pat_RPAREN =
| d0pat_RPAREN_cons0 of token
| d0pat_RPAREN_cons1 of (token, d0patlst, token)
//
and
labd0pat_RBRACE =
| labd0pat_RBRACE_cons0 of token
| labd0pat_RBRACE_cons1 of (token, labd0patlst, token)
//
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
d0pat_anno_opt
(d0p: d0pat, opt: s0expopt): d0pat
fun
d0pat_make_node
(loc: loc_t, node: d0pat_node): d0pat
//
(* ****** ****** *)
//
fun
d0pat_RPAREN_loc(d0pat_RPAREN): loc_t
//
fun
print_d0pat_RPAREN: print_type(d0pat_RPAREN)
fun
prerr_d0pat_RPAREN: print_type(d0pat_RPAREN)
fun
fprint_d0pat_RPAREN: fprint_type(d0pat_RPAREN)
//
overload print with print_d0pat_RPAREN
overload prerr with prerr_d0pat_RPAREN
overload fprint with fprint_d0pat_RPAREN
//
(* ****** ****** *)
//
fun
labd0pat_RBRACE_loc(labd0pat_RBRACE): loc_t
//
fun
print_labd0pat_RBRACE: print_type(labd0pat_RBRACE)
fun
prerr_labd0pat_RBRACE: prerr_type(labd0pat_RBRACE)
fun
fprint_labd0pat_RBRACE: fprint_type(labd0pat_RBRACE)
//
overload print with print_labd0pat_RBRACE
overload prerr with prerr_labd0pat_RBRACE
overload fprint with fprint_labd0pat_RBRACE
//
(* ****** ****** *)

datatype
d0exp_node =
//
| D0Eid0 of d0eid
//
| D0Eint of t0int
| D0Echr of t0chr
| D0Eflt of t0flt
| D0Estr of t0str
//
| D0Eapps of d0explst
//
| D0Esqarg of // sexparg
    (token, s0explst, token)
  // end of [D0Esqarg]
| D0Etqarg of // temparg
    (token, s0explst, token)
  // end of [D0Etqarg]
//
| D0Eparen of
    (token, d0explst, d0exp_RPAREN)
  // end of [D0Eparen]
//
| D0Etuple of
    ( token, tokenopt
    , d0explst, d0exp_RPAREN)
| D0Erecord of
    ( token, tokenopt
    , labd0explst, labd0exp_RBRACE)
//
| D0Eif0 of
  ( token
  , d0exp
  , d0exp_THEN, d0exp_ELSE, tokenopt)
//
| D0Ecase of
  ( token
  , d0exp
  , token(*OF*)
  , tokenopt(*BAR*), d0claulst, tokenopt)
//
| D0Elet of
  ( token
  , d0eclist
  , tokenopt(*IN*), d0explst, token(*END*))
//
| D0Ewhere of (d0exp, d0eclseq_WHERE)
//
| D0Ebrack of (token, d0explst, token)
| D0Edtsel of (token, l0abl, d0expopt)
//
| D0Elam of
  ( token(*lam/lam@*)
  , f0arglst(*arglst*)
  , effs0expopt, f0unarrow, d0exp, tokenopt)
| D0Efix of
  ( token(*fix/fix@*)
  , d0eid(*fixed-pnt*)
  , f0arglst(*arglst*)
  , effs0expopt, f0unarrow, d0exp, tokenopt)
//
| D0Etry0 of
  ( token
  , d0exp
  , token(*WITH*)
  , tokenopt(*BAR*), d0claulst, token(*END*))
//
(*
| D0Elexn of
  (token(*break/continue*))
| D0Efrlp of
  ( token
  , d0exp(*semi*), d0exp(*body*))
| D0Ewhlp of
  ( token
  , d0exp(*test*), d0exp(*body*))
*)
//
| D0Eanno of (d0exp, s0exp(*anno*))
//
| D0Equal of (token(*qual*), d0exp) // qualified
//
| D0Enone of (token) // HX: for error indication
// end of [d0exp_node]

(* ****** ****** *)

and
d0exp_RPAREN =
// (d0es1)
| d0exp_RPAREN_cons0 of token
// (d0es1 | d0es2)
| d0exp_RPAREN_cons1 of (token, d0explst, token)
// (d0es1 ; d0es2)
| d0exp_RPAREN_cons2 of (token, d0explst, token)
//
and
labd0exp_RBRACE =
| labd0exp_RBRACE_cons0 of token
| labd0exp_RBRACE_cons1 of (token, labd0explst, token)
//
(* ****** ****** *)

and
d0exp_THEN =
| d0exp_THEN of (token, d0exp)
and
d0exp_ELSE =
| d0exp_ELSEnone of ()
| d0exp_ELSEsome of (token, d0exp)

(* ****** ****** *)
//
and
endwhere =
| endwhere_cons1 of token
| endwhere_cons2 of (token, tokenopt)
//
and
d0eclseq_WHERE =
| d0eclseq_WHERE of
  (token, tokenopt, d0eclist, endwhere)
//
(* ****** ****** *)
//
and
f0unarrow =
| F0UNARROWnone of
  (token(*error*))
| F0UNARROWdflt of (token(*=>*))
| F0UNARROWlist of
  (token(*=<*), s0explst, token (*>*))
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
d0exp_anno_opt
(d0e: d0exp, opt: s0expopt): d0exp
fun
d0exp_make_node
(loc: loc_t, node: d0exp_node): d0exp
//
(* ****** ****** *)
//
fun
d0exp_RPAREN_loc
(x0: d0exp_RPAREN): loc_t
//
fun
print_d0exp_RPAREN:
  print_type(d0exp_RPAREN)
fun
prerr_d0exp_RPAREN:
  print_type(d0exp_RPAREN)
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
labd0exp_RBRACE_loc
(x0: labd0exp_RBRACE): loc_t
//
fun
print_labd0exp_RBRACE:
  print_type(labd0exp_RBRACE)
fun
prerr_labd0exp_RBRACE:
  prerr_type(labd0exp_RBRACE)
fun
fprint_labd0exp_RBRACE: fprint_type(labd0exp_RBRACE)
//
overload print with print_labd0exp_RBRACE
overload prerr with prerr_labd0exp_RBRACE
overload fprint with fprint_labd0exp_RBRACE
//
(* ****** ****** *)
//
fun
print_d0exp_THEN:
  print_type(d0exp_THEN)
fun
prerr_d0exp_THEN:
  prerr_type(d0exp_THEN)
fun
fprint_d0exp_THEN: fprint_type(d0exp_THEN)
//
overload print with print_d0exp_THEN
overload prerr with prerr_d0exp_THEN
overload fprint with fprint_d0exp_THEN
//
fun
print_d0exp_ELSE:
  print_type(d0exp_ELSE)
fun
prerr_d0exp_ELSE:
  prerr_type(d0exp_ELSE)
fun
fprint_d0exp_ELSE: fprint_type(d0exp_ELSE)
//
overload print with print_d0exp_ELSE
overload prerr with prerr_d0exp_ELSE
overload fprint with fprint_d0exp_ELSE
//
(* ****** ****** *)
//
fun
endwhere_get_loc(endwhere): loc_t
//
fun
print_endwhere: print_type(endwhere)
fun
prerr_endwhere: prerr_type(endwhere)
fun
fprint_endwhere: fprint_type(endwhere)
//
overload .loc with endwhere_get_loc
//
overload print with print_endwhere
overload prerr with prerr_endwhere
overload fprint with fprint_endwhere
//
(* ****** ****** *)
//
(*
fun
d0eclseq_WHERE_get_loc
  (x0: d0eclseq_WHERE): loc_t
*)
//
fun
print_d0eclseq_WHERE:
  print_type(d0eclseq_WHERE)
fun
prerr_d0eclseq_WHERE:
  prerr_type(d0eclseq_WHERE)
fun
fprint_d0eclseq_WHERE:
  fprint_type(d0eclseq_WHERE)
//
overload print with print_d0eclseq_WHERE
overload prerr with prerr_d0eclseq_WHERE
overload fprint with fprint_d0eclseq_WHERE
//
(* ****** ****** *)
//
fun
print_f0unarrow:
  print_type(f0unarrow)
fun
prerr_f0unarrow:
  prerr_type(f0unarrow)
fun
fprint_f0unarrow: fprint_type(f0unarrow)
//
overload print with print_f0unarrow
overload prerr with prerr_f0unarrow
overload fprint with fprint_f0unarrow
//
(* ****** ****** *)
//
datatype
d0gua_node =
| D0GUAexp of (d0exp)
| D0GUAmat of
  (d0exp, token(*AS*), d0pat)
//
fun
d0gua_get_loc(d0gua): loc_t
fun
d0gua_get_node(d0gua): d0gua_node
//
overload .loc with d0gua_get_loc
overload .node with d0gua_get_node
//
fun print_d0gua: print_type(d0gua)
fun prerr_d0gua: prerr_type(d0gua)
fun fprint_d0gua : fprint_type(d0gua)
//
overload print with print_d0gua
overload prerr with prerr_d0gua
overload fprint with fprint_d0gua
//
fun
d0gua_make_node
(loc: loc_t, node: d0gua_node): d0gua
//
(* ****** ****** *)
//
datatype
d0clau_node =
| D0CLAUgpat of d0gpat
| D0CLAUclau of
  (d0gpat, token(*EQGT*), d0exp)
and
d0gpat_node =
| D0GPATpat of (d0pat)
| D0GPATgua of
  (d0pat, token(*WHEN*), d0gualst)
//
fun
d0clau_get_loc(d0clau): loc_t
fun
d0clau_get_node(d0clau): d0clau_node
//
overload .loc with d0clau_get_loc
overload .node with d0clau_get_node
//
fun
d0gpat_get_loc(d0gpat): loc_t
fun
d0gpat_get_node(d0gpat): d0gpat_node
//
overload .loc with d0gpat_get_loc
overload .node with d0gpat_get_node
//
fun
d0clau_make_node
(loc: loc_t, node: d0clau_node): d0clau
fun
d0gpat_make_node
(loc: loc_t, node: d0gpat_node): d0gpat
//
(* ****** ****** *)
//
datatype
decmodopt =
| DECMODnone of
    ((*void*))
  // end of [DECMODnone]
| DECMODsing of
    (token(*COLON*), i0dnt)
  // end of [DECMODsing]
| DECMODlist of
  ( token(*COLON*)
  , token(*'('*), i0dntlst, token(*')'*))
  // end of [DECMODlist]
//
(* ****** ****** *)
//
fun
decmodopt_rec(decmodopt): int
fun
decmodopt_tlrec(decmodopt): int
//
(* ****** ****** *)
//
fun
print_decmodopt:
print_type(decmodopt)
fun
prerr_decmodopt:
prerr_type(decmodopt)
fun
fprint_decmodopt:
fprint_type(decmodopt)
//
overload print with print_decmodopt
overload prerr with prerr_decmodopt
overload fprint with fprint_decmodopt
//
(* ****** ****** *)
//
datatype
teqd0expopt =
| TEQD0EXPnone of ((*void*))
| TEQD0EXPsome of (token(*EQ*), d0exp)
datatype
wths0expopt =
| WTHS0EXPnone of ((*void*))
| WTHS0EXPsome of (token(*WITHTYPE*), s0exp)
//
(* ****** ****** *)
//
fun
print_teqd0expopt:
print_type(teqd0expopt)
fun
prerr_teqd0expopt:
prerr_type(teqd0expopt)
fun
fprint_teqd0expopt: fprint_type(teqd0expopt)
//
overload print with print_teqd0expopt
overload prerr with prerr_teqd0expopt
overload fprint with fprint_teqd0expopt
//
fun
print_wths0expopt:
print_type(wths0expopt)
fun
prerr_wths0expopt:
prerr_type(wths0expopt)
fun
fprint_wths0expopt: fprint_type(wths0expopt)
//
overload print with print_wths0expopt
overload prerr with prerr_wths0expopt
overload fprint with fprint_wths0expopt
//
(* ****** ****** *)
//
datatype
v0aldecl =
V0ALDECL of @{
  loc= loc_t
, pat= d0pat
, teq= tokenopt
, def= d0expopt
, wtp= wths0expopt
}
//
typedef
v0aldeclist = List0(v0aldecl)
//
fun
v0aldecl_get_loc(v0aldecl): loc_t
overload .loc with v0aldecl_get_loc
//
fun
print_v0aldecl: print_type(v0aldecl)
fun
prerr_v0aldecl: prerr_type(v0aldecl)
fun
fprint_v0aldecl: fprint_type(v0aldecl)
//
overload print with print_v0aldecl
overload prerr with prerr_v0aldecl
overload fprint with fprint_v0aldecl
//
(* ****** ****** *)
//
(*
var
foo:
s0exp with pfat = d0exp
*)
datatype
v0ardecl =
V0ARDECL of @{
  loc= loc_t
, nam= d0pid
, wth= d0pidopt
, res= s0expopt
, ini= teqd0expopt
} where
  d0pidopt = Option(d0pid)
//
typedef
v0ardeclist = List0(v0ardecl)
//
fun
v0ardecl_get_loc(v0ardecl): loc_t
overload .loc with v0ardecl_get_loc
//
fun
print_v0ardecl: print_type(v0ardecl)
fun
prerr_v0ardecl: prerr_type(v0ardecl)
fun
fprint_v0ardecl: fprint_type(v0ardecl)
//
overload print with print_v0ardecl
overload prerr with prerr_v0ardecl
overload fprint with fprint_v0ardecl
//
(* ****** ****** *)
//
datatype
f0undecl =
F0UNDECL of @{
  loc= loc_t
, nam= d0pid
, arg= f0arglst
, res= effs0expopt
, teq= tokenopt
, def= d0expopt
, wtp= wths0expopt
} (* f0undecl *)
//
typedef
f0undeclist = List0(f0undecl)
//
fun
f0undecl_get_loc(f0undecl): loc_t
overload .loc with f0undecl_get_loc
//
fun
print_f0undecl: print_type(f0undecl)
fun
prerr_f0undecl: prerr_type(f0undecl)
fun
fprint_f0undecl: fprint_type(f0undecl)
//
overload print with print_f0undecl
overload prerr with prerr_f0undecl
overload fprint with fprint_f0undecl
//
(* ****** ****** *)
//
datatype
d0cstdecl =
D0CSTDECL of @{
  loc= loc_t
, nam= d0pid
, arg= d0arglst
, res= effs0expopt
, def= teqd0expopt
}
//
typedef
d0cstdeclist = List0(d0cstdecl)
//
fun
d0cstdecl_get_loc(d0cstdecl): loc_t
overload .loc with d0cstdecl_get_loc
//
fun
print_d0cstdecl: print_type(d0cstdecl)
fun
prerr_d0cstdecl: prerr_type(d0cstdecl)
fun
fprint_d0cstdecl: fprint_type(d0cstdecl)
//
overload print with print_d0cstdecl
overload prerr with prerr_d0cstdecl
overload fprint with fprint_d0cstdecl
//
(* ****** ****** *)

datatype
d0ecl_node =
(*
indicating error
*)
| D0Cnone of token
//
(*
HX-2019:
for skipping synerr:
*)
| D0Ctokerr of (token)
//
(*
| D0Cthen of (token) // opt
*)
//
// HX: delete fixity
//
| D0Cnonfix of
    (token, i0dntlst)
//
// HX: attach fixity
//
| D0Cfixity of
  (token, i0dntlst, precopt)
//
// HX: locally defined
//
| D0Cstatic of
    (token(*STATIC*), d0ecl)
//
// HX: globally defined
//
| D0Cextern of
    (token(*EXTERN*), d0ecl)
  // end of [D0Cextern]
//
| D0Cdefine of
  ( token
  , g0eid(*fun*)
  , g0marglst(*arg*), g0expdef(*opt*))
| D0Cmacdef of
  ( token
  , g0eid(*fun*)
  , g0marglst(*arg*), d0macdef(*d0exp*))
  // end of [D0Cmacdef]
//
| D0Clocal of
  ( token(*LOCAL*)
  , d0eclist(*head*)
  , tokenopt(*IN*)
  , d0eclist(*body*), token(*END*))
//
| D0Cinclude of
    (token(*INCLUDE*), d0exp)
  // HX: for file inclusion
//
// HX: for static loading
//
| D0Cstaload of
    (token(*#STALOAD*), d0exp)
  // end of [D0Cstaload]
(*
| D0Cdynload of
    (token(*#DYNLOAD*), d0exp)
  // end of [D0Cdynload]
*)
//
| D0Cabssort of (token, s0tid)
//
| D0Cstacst0 of
  (token, s0eid, t0marglst, token, sort0)
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
  ( token
  , s0eid, t0marglst, sort0opt, abstdf0)
//
| D0Cabsopen of
  ( token(*ABSOPEN*), sq0eid(*qualid*) )
//
| D0Cabsimpl of
  ( token
  , sq0eid
  , s0marglst, sort0opt, token(*EQ*), s0exp)
  // D0Cabsimpl
//
| D0Cfundecl of
  ( token(*kind*)
  , decmodopt, tq0arglst, f0undeclist)
//
| D0Cvaldecl of
  ( token(*kind*), decmodopt, v0aldeclist)
| D0Cvardecl of
  ( token(*kind*), decmodopt, v0ardeclist)
//
| D0Cimpdecl of
  ( token(*impkind*)
  , decmodopt//modifier
  , sq0arglst, tq0arglst
  , dq0eid, ti0arglst, f0arglst
  , effs0expopt, token(*EQ*), d0exp(*body*))
//
| D0Csymload of
  ( token(*symload*)
  , s0ymb(*overloaded*)
  , token(*WITH*), dq0eid, t0intopt(*precedence*))
//
| D0Cdatasort of
  (token(*DATASORT*), d0tsortlst)
//
| D0Cexcptcon of
  (token(*EXCPTCON*), d0atconlst)
//
| D0Cdatatype of
  (token(*DATATYPE*), d0atypelst, wd0eclseq)
  // D0Cdatatype
//
| D0Cdynconst of
  (token(*dyncstkind*), tq0arglst, d0cstdeclist)
//
| D0Celse of (token) // opt
| D0Cendif of (token) // req
| D0Cifdec of (token, g0exp, tokenopt) // # if(gexp) ...
| D0Celsif of (token, g0exp, tokenopt) // # elsif(gexp) ...
//
// end of [d0ecl_node]
//
(* ****** ****** *)

and
precopt =
| PRECOPTnil of ()
| PRECOPTint of (token)
| PRECOPTopr of (i0dnt, precmod)

and
precmod =
| PRECMODnone of ()
| PRECMODsome of (token, signint, token)

and
signint =
| SIGNINTint of (token(*int*))
| SIGNINTopr of (token(*opr*), token(*int*))

(* ****** ****** *)

and
abstdf0 =
| ABSTDF0some of () // unspecified
| ABSTDF0lteq of (token(*"<="*), s0exp)
| ABSTDF0eqeq of (token(*"=="*), s0exp)

(* ****** ****** *)

and
g0expdef =
| G0EDEFnone of ()
| G0EDEFsome of (tokenopt, g0exp(*def*))

and
d0macdef =
| D0MDEFnone of ()
| D0MDEFsome of (tokenopt, d0exp(*def*))

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
fun
fprint_precmod : fprint_type(precmod)
fun
fprint_signint : fprint_type(signint)
//
overload print with print_precopt
overload prerr with prerr_precopt
//
overload fprint with fprint_precopt
overload fprint with fprint_precmod
overload fprint with fprint_signint
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
print_g0expdef : (g0expdef) -> void
fun
prerr_g0expdef : (g0expdef) -> void
fun
fprint_g0expdef : fprint_type(g0expdef)
//
overload print with print_g0expdef
overload prerr with prerr_g0expdef
overload fprint with fprint_g0expdef
//
(* ****** ****** *)
//
fun
print_d0macdef : (d0macdef) -> void
fun
prerr_d0macdef : (d0macdef) -> void
fun
fprint_d0macdef : fprint_type(d0macdef)
//
overload print with print_d0macdef
overload prerr with prerr_d0macdef
overload fprint with fprint_d0macdef
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
