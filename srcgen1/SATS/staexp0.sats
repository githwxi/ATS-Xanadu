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
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
//
  typedef label = $LAB.label
  typedef loc_t = $LOC.location
//
#staload SYM = "./xsymbol.sats"
#staload LEX = "./lexing0.sats"
//
  typedef token = $LEX.token
  typedef tokenlst = $LEX.tokenlst
  typedef tokenopt = $LEX.tokenopt
//
  typedef symbol = $SYM.symbol
  typedef symbolist = $SYM.symbolist
  typedef symbolopt = $SYM.symbolopt
//
(* ****** ****** *)
(*
//
typedef tkint = token // int
typedef tkchr = token // char
typedef tkflt = token // float
typedef tkstr = token // string
//
typedef tkintopt = Option(tkint)
typedef tkchropt = Option(tkchr)
typedef tkfltopt = Option(tkflt)
typedef tkstropt = Option(tkstr)
//
*)
(* ****** ****** *)
//
abstbox t0int_tbox = ptr
abstbox t0chr_tbox = ptr
abstbox t0flt_tbox = ptr
abstbox t0str_tbox = ptr
//
abstbox i0dnt_tbox = ptr
//
(* ****** ****** *)
//
abstbox l0abl_tbox = ptr
//
(* ****** ****** *)
//
typedef t0int = t0int_tbox
typedef t0chr = t0chr_tbox
typedef t0flt = t0flt_tbox
typedef t0str = t0str_tbox
//
typedef i0dnt = i0dnt_tbox
//
(* ****** ****** *)
//
typedef g0nid = i0dnt_tbox
//
typedef g0eid = i0dnt_tbox
//
(* ****** ****** *)
//
typedef s0tid = i0dnt_tbox
typedef s0eid = i0dnt_tbox
//
typedef d0pid = i0dnt_tbox
typedef d0eid = i0dnt_tbox
//
typedef l0abl = l0abl_tbox
//
(* ****** ****** *)
//
datatype
t0int_node =
  | T0INTnone of token
  | T0INTsome of token
datatype
t0chr_node =
  | T0CHRnone of token
  | T0CHRsome of token
datatype
t0flt_node =
  | T0FLTnone of token
  | T0FLTsome of token
datatype
t0str_node =
  | T0STRnone of token
  | T0STRsome of token
//
(* ****** ****** *)
//
datatype
i0dnt_node =
  | I0DNTnone of token
  | I0DNTsome of token
//
(* ****** ****** *)
(*
typedef t0int = $rec
{
  t0int_loc= loc_t, t0int_node= symbol
} (* end of [t0int] *)
typedef t0chr = $rec
{
  t0chr_loc= loc_t, t0chr_node= symbol
} (* end of [t0chr] *)
typedef t0flt = $rec
{
  t0flt_loc= loc_t, t0flt_node= symbol
} (* end of [t0flt] *)
typedef t0str = $rec
{
  t0str_loc= loc_t, t0str_node= symbol
} (* end of [t0str] *)
//
typedef i0dnt = $rec
{
  i0dnt_loc= loc_t, i0dnt_node= symbol
} (* end of [i0dnt] *)
*)
(* ****** ****** *)
//
fun
t0int_get_loc: (t0int) -> loc_t
fun
t0int_get_node: (t0int) -> t0int_node
//
overload .loc with t0int_get_loc
overload .node with t0int_get_node
//
fun t0int_none : token -> t0int
fun t0int_some : token -> t0int
//
fun print_t0int : print_type(t0int)
fun prerr_t0int : prerr_type(t0int)
fun fprint_t0int : fprint_type(t0int)
//
overload print with print_t0int
overload prerr with prerr_t0int
overload fprint with fprint_t0int
//
(* ****** ****** *)
//
fun
t0chr_get_loc: (t0chr) -> loc_t
fun
t0chr_get_node: (t0chr) -> t0chr_node
//
overload .loc with t0chr_get_loc
overload .node with t0chr_get_node
//
fun t0chr_none : token -> t0chr
fun t0chr_some : token -> t0chr
//
fun print_t0chr : print_type(t0chr)
fun prerr_t0chr : prerr_type(t0chr)
fun fprint_t0chr : fprint_type(t0chr)
//
overload print with print_t0chr
overload prerr with prerr_t0chr
overload fprint with fprint_t0chr
//
(* ****** ****** *)
//
fun
t0flt_get_loc: (t0flt) -> loc_t
fun
t0flt_get_node: (t0flt) -> t0flt_node
//
overload .loc with t0flt_get_loc
overload .node with t0flt_get_node
//
fun t0flt_none : token -> t0flt
fun t0flt_some : token -> t0flt
//
fun print_t0flt : print_type(t0flt)
fun prerr_t0flt : prerr_type(t0flt)
fun fprint_t0flt : fprint_type(t0flt)
//
overload print with print_t0flt
overload prerr with prerr_t0flt
overload fprint with fprint_t0flt
//
(* ****** ****** *)
//
fun
t0str_get_loc: (t0str) -> loc_t
fun
t0str_get_node: (t0str) -> t0str_node
//
overload .loc with t0str_get_loc
overload .node with t0str_get_node
//
fun t0str_none : token -> t0str
fun t0str_some : token -> t0str
//
fun print_t0str : print_type(t0str)
fun prerr_t0str : prerr_type(t0str)
fun fprint_t0str : fprint_type(t0str)
//
overload print with print_t0str
overload prerr with prerr_t0str
overload fprint with fprint_t0str
//
(* ****** ****** *)
//
typedef i0dnt = i0dnt_tbox
typedef i0dntlst = List0(i0dnt)
typedef i0dntopt = Option(i0dnt)
//
fun
i0dnt_get_loc
  : (i0dnt) -> loc_t
fun
i0dnt_get_node
  : (i0dnt) -> i0dnt_node
//
overload .loc with i0dnt_get_loc
overload .node with i0dnt_get_node
//
fun i0dnt_none : token -> i0dnt
fun i0dnt_some : token -> i0dnt
//
(* ****** ****** *)
//
fun print_i0dnt : print_type(i0dnt)
fun prerr_i0dnt : prerr_type(i0dnt)
fun fprint_i0dnt : fprint_type(i0dnt)
//
overload print with print_i0dnt
overload prerr with prerr_i0dnt
overload fprint with fprint_i0dnt
//
(* ****** ****** *)
//
datatype
l0abl_node =
  | L0ABLsome of label // valid
  | L0ABLnone of (token) // invalid
//
fun
l0abl_get_loc(l0abl): loc_t
fun
l0abl_get_node(l0abl): l0abl_node
//
overload .loc with l0abl_get_loc
overload .node with l0abl_get_node
//
fun print_l0abl : print_type(l0abl)
fun prerr_l0abl : prerr_type(l0abl)
fun fprint_l0abl : fprint_type(l0abl)
//
overload print with print_l0abl
overload prerr with prerr_l0abl
overload fprint with fprint_l0abl
//
fun
l0abl_make_int1(tok: token): l0abl
fun
l0abl_make_name(tok: token): l0abl
fun
l0abl_make_none(tok: token): l0abl
//
fun
l0abl_make_node
(loc: loc_t, node: l0abl_node): l0abl
//
(* ****** ****** *)
//
(*
s0ymb ::=
| i0dnt
| DOT l0ab | LBRACK RBRACK
*)
//
abstype
s0ymb_tbox = ptr
typedef
s0ymb = s0ymb_tbox
//
datatype
s0ymb_node =
| S0YMBi0dnt of (i0dnt)
(*
| S0YMBdtlab of (token, l0abl)
*)
| S0YMBbrack of (token, token)
//
fun
s0ymb_get_loc: (s0ymb) -> loc_t
fun
s0ymb_get_node: (s0ymb) -> s0ymb_node
//
overload .loc with s0ymb_get_loc
overload .node with s0ymb_get_node
//
fun print_s0ymb : print_type(s0ymb)
fun prerr_s0ymb : prerr_type(s0ymb)
fun fprint_s0ymb : fprint_type(s0ymb)
//
overload print with print_s0ymb
overload prerr with prerr_s0ymb
overload fprint with fprint_s0ymb
//
fun
s0ymb_make_node
(loc: loc_t, node: s0ymb_node): s0ymb
//
(* ****** ****** *)
//
datatype
sl0abled
  (a:type) =
  SL0ABLED of (l0abl, token, a)
//
fun
{a:type}
fprint_sl0abled
  (out: FILEref, x0: sl0abled(a)): void
//
(* ****** ****** *)
//
datatype
sq0eid =
| SQ0EIDnone of (s0eid)
| SQ0EIDsome of (token, s0eid)
datatype
dq0eid =
| DQ0EIDnone of (d0eid)
| DQ0EIDsome of (token, d0eid)
//
fun sq0eid_get_loc(sq0eid): loc_t
fun dq0eid_get_loc(dq0eid): loc_t
//
overload .loc with sq0eid_get_loc
overload .loc with dq0eid_get_loc
//
(* ****** ****** *)
//
fun
print_sq0eid: print_type(sq0eid)
fun
prerr_sq0eid: prerr_type(sq0eid)
fun
print_dq0eid: print_type(dq0eid)
fun
prerr_dq0eid: prerr_type(dq0eid)
//
overload print with print_sq0eid
overload prerr with prerr_sq0eid
overload print with print_dq0eid
overload prerr with prerr_dq0eid
//
fun
fprint_sq0eid: fprint_type(sq0eid)
fun
fprint_dq0eid: fprint_type(dq0eid)
//
overload fprint with fprint_sq0eid
overload fprint with fprint_dq0eid
//
(* ****** ****** *)
//
abstbox g0nam_tbox = ptr
//
(* ****** ****** *)
//
abstbox g0exp_tbox = ptr
//
abstbox g0marg_tbox = ptr
//
(* ****** ****** *)
//
abstbox sort0_tbox = ptr
abstbox s0exp_tbox = ptr
//
abstbox s0arg_tbox = ptr
abstbox s0marg_tbox = ptr
//
abstbox t0arg_tbox = ptr
abstbox t0marg_tbox = ptr
//
(* ****** ****** *)

typedef g0nam = g0nam_tbox
typedef g0namlst = List0(g0nam)

(* ****** ****** *)
//
typedef g0exp = g0exp_tbox
typedef g0explst = List0(g0exp)
//
typedef g0marg = g0marg_tbox
typedef g0marglst = List0(g0marg)
//
(* ****** ****** *)
//
typedef sort0 = sort0_tbox
typedef sort0lst = List0(sort0)
typedef sort0opt = Option(sort0)
//
typedef s0exp = s0exp_tbox
typedef s0explst = List0(s0exp)
typedef s0expopt = Option(s0exp)
//
typedef s0arg = s0arg_tbox
typedef s0marg = s0marg_tbox
typedef s0arglst = List0(s0arg)
typedef s0marglst = List0(s0marg)
//
typedef t0arg = t0arg_tbox
typedef t0marg = t0marg_tbox
typedef t0arglst = List0(t0arg)
typedef t0marglst = List0(t0marg)
//
(* ****** ****** *)
//
datatype
g0nam_node =
//
| G0Nid0 of (g0nid)
//
| G0Nint of (t0int)
| G0Nchr of (t0chr)
| G0Nflt of (t0flt)
| G0Nstr of (t0str)
//
| G0Nlist of
  (token, g0namlst, token)
//
(*
| G0Nnone0 of ()
*)
| G0Nnone1 of (token(*error*))
//
(* ****** ****** *)
//
fun
g0nam_get_loc(g0nam): loc_t
fun
g0nam_get_node(g0nam): g0nam_node
//
overload .loc with g0nam_get_loc
overload .node with g0nam_get_node
//
fun
print_g0nam : print_type(g0nam)
fun
prerr_g0nam : prerr_type(g0nam)
overload print with print_g0nam
overload prerr with prerr_g0nam
//
fun
fprint_g0nam : fprint_type(g0nam)
overload fprint with fprint_g0nam
//
fun
g0nam_make_node
(loc: loc_t, node: g0nam_node): g0nam
//
(* ****** ****** *)
//
datatype
g0exp_node =
//
| G0Eid0 of (g0eid)
//
| G0Eint of (t0int)
| G0Echr of (t0chr)
| G0Eflt of (t0flt)
| G0Estr of (t0str)
//
| G0Eapps of g0explst
| G0Elist of // temp
  (token, g0explst, token)
//
| G0Eif0 of
  ( token
  , g0exp
  , g0exp_THEN
  , g0exp_ELSE, tokenopt)
//
| G0Enone1 of (token(*error*))
//
(* ****** ****** *)
and
g0exp_THEN =
| g0exp_THEN of (token, g0exp)
and
g0exp_ELSE =
| g0exp_ELSE of (token, g0exp)
(* ****** ****** *)
//
fun
g0exp_get_loc(g0exp): loc_t
fun
g0exp_get_node(g0exp): g0exp_node
//
overload .loc with g0exp_get_loc
overload .node with g0exp_get_node
//
fun
print_g0exp : print_type(g0exp)
fun
prerr_g0exp : prerr_type(g0exp)
overload print with print_g0exp
overload prerr with prerr_g0exp
//
fun
fprint_g0exp : fprint_type(g0exp)
overload fprint with fprint_g0exp
//
fun
g0exp_make_node
(loc: loc_t, node: g0exp_node): g0exp
//
(* ****** ****** *)
//
fun
print_g0exp_THEN:
print_type(g0exp_THEN)
fun
prerr_g0exp_THEN:
prerr_type(g0exp_THEN)
overload print with print_g0exp_THEN
overload prerr with prerr_g0exp_THEN
//
fun
fprint_g0exp_THEN:
fprint_type(g0exp_THEN)
overload fprint with fprint_g0exp_THEN
//
fun
print_g0exp_ELSE:
print_type(g0exp_ELSE)
fun
prerr_g0exp_ELSE:
prerr_type(g0exp_ELSE)
overload print with print_g0exp_ELSE
overload prerr with prerr_g0exp_ELSE
//
fun
fprint_g0exp_ELSE:
fprint_type(g0exp_ELSE)
overload fprint with fprint_g0exp_ELSE
//
(* ****** ****** *)
//
typedef g0arg = g0eid
typedef g0arglst = List0(g0arg)
//
datatype
g0marg_node =
|
G0MARGnone of (token)
|
G0MARGsarg of
(token(*'{'*), g0arglst, token(*'}'*))
|
G0MARGdarg of
(token(*'('*), g0arglst, token(*')'*))
//
(* ****** ****** *)
//
fun
g0marg_get_loc(g0marg): loc_t
fun
g0marg_get_node(g0marg): g0marg_node
//
overload .loc with g0marg_get_loc
overload .node with g0marg_get_node
//
fun print_g0marg : print_type(g0marg)
fun prerr_g0marg : prerr_type(g0marg)
fun fprint_g0marg : fprint_type(g0marg)
//
overload print with print_g0marg
overload prerr with prerr_g0marg
overload fprint with fprint_g0marg
//
fun
g0marg_make_node
(loc: loc_t, node: g0marg_node): g0marg
//
(* ****** ****** *)
//
datatype
sort0_node =
//
| S0Tid0 of (s0tid)
//
| S0Tint of (t0int)
//
| S0Tapps of
  (sort0lst) // HX: unsupported
//
| S0Tlpar of
  (token, sort0lst, token) (*temporary*)
//
| S0Tqual of (token, sort0) // HX: qualified
(*
| S0Ttype of int(*kind*)
  (* prop/view/type/t0ype/viewtype/viewt0ype *)
*)
| S0Tnone of (token) // HX: (usually) indication of error
// end of [sort0_node]

(* ****** ****** *)
//
fun
sort0_get_loc(sort0): loc_t
fun
sort0_get_node(sort0): sort0_node
//
overload .loc with sort0_get_loc
overload .node with sort0_get_node
//
fun print_sort0 : print_type(sort0)
fun prerr_sort0 : prerr_type(sort0)
fun fprint_sort0 : fprint_type(sort0)
//
overload print with print_sort0
overload prerr with prerr_sort0
overload fprint with fprint_sort0
//
fun
sort0_make_node
(loc: loc_t, node: sort0_node): sort0
//
(* ****** ****** *)
//
abstbox
s0rtcon_tbox = ptr
typedef
s0rtcon = s0rtcon_tbox
typedef
s0rtconlst = List0(s0rtcon)
//
datatype
s0rtcon_node =
| S0RTCON of (s0eid, sort0opt) 
//
fun
s0rtcon_get_loc(s0rtcon): loc_t
fun
s0rtcon_get_node(s0rtcon): s0rtcon_node
//
overload .loc with s0rtcon_get_loc
overload .node with s0rtcon_get_node
//
fun print_s0rtcon : print_type(s0rtcon)
fun prerr_s0rtcon : prerr_type(s0rtcon)
fun fprint_s0rtcon : fprint_type(s0rtcon)
//
overload print with print_s0rtcon
overload prerr with prerr_s0rtcon
overload fprint with fprint_s0rtcon
//
fun
s0rtcon_make_node
(loc: loc_t, node: s0rtcon_node): s0rtcon
//
(* ****** ****** *)
//
abstbox
d0tsort_tbox = ptr
typedef
d0tsort = d0tsort_tbox
typedef
d0tsortlst = List0(d0tsort)
//
datatype
d0tsort_node =
| D0TSORT of
  (s0tid, token(*EQ*), s0rtconlst)
  // D0TSORT
//
fun
d0tsort_get_loc
  (x0: d0tsort): loc_t
fun
d0tsort_get_node
  (x0: d0tsort): d0tsort_node
//
overload .loc with d0tsort_get_loc
overload .node with d0tsort_get_node
//
fun
print_d0tsort: print_type(d0tsort)
fun
prerr_d0tsort: prerr_type(d0tsort)
fun
fprint_d0tsort: fprint_type(d0tsort)
//
overload print with print_d0tsort
overload prerr with prerr_d0tsort
overload fprint with fprint_d0tsort
//
fun
d0tsort_make_node
(loc: loc_t, node: d0tsort_node): d0tsort
//
(* ****** ****** *)
//
abstbox
s0rtdef_tbox = ptr
typedef
s0rtdef = s0rtdef_tbox
//
datatype
s0rtdef_node =
| S0RTDEFsort of sort0
| S0RTDEFsbst of
  (token, s0arg, token, s0explst, token)
//
fun
s0rtdef_get_loc(s0rtdef): loc_t
fun
s0rtdef_get_node(s0rtdef): s0rtdef_node
//
overload .loc with s0rtdef_get_loc
overload .node with s0rtdef_get_node
//
fun print_s0rtdef : print_type(s0rtdef)
fun prerr_s0rtdef : prerr_type(s0rtdef)
fun fprint_s0rtdef : fprint_type(s0rtdef)
//
overload print with print_s0rtdef
overload prerr with prerr_s0rtdef
overload fprint with fprint_s0rtdef
//
fun
s0rtdef_make_node
(loc: loc_t, node: s0rtdef_node): s0rtdef
//
(* ****** ****** *)
//
datatype
s0arg_node =
| S0ARGnone of token
| S0ARGsome of (s0eid, sort0opt)
//
datatype
s0marg_node =
| S0MARGnone of token
| S0MARGsing of (s0eid)
| S0MARGlist of
  (token(*LP*), s0arglst, token(*RP*))
//
(* ****** ****** *)
//
fun
s0arg_get_loc(s0arg): loc_t
fun
s0arg_get_node(s0arg): s0arg_node
//
overload .loc with s0arg_get_loc
overload .node with s0arg_get_node
//
fun print_s0arg : print_type(s0arg)
fun prerr_s0arg : prerr_type(s0arg)
fun fprint_s0arg : fprint_type(s0arg)
//
overload print with print_s0arg
overload prerr with prerr_s0arg
overload fprint with fprint_s0arg
//
fun
s0arg_make_node
(loc: loc_t, node: s0arg_node): s0arg
//
(* ****** ****** *)
//
fun
s0marg_get_loc(s0marg): loc_t
fun
s0marg_get_node(s0marg): s0marg_node
//
overload .loc with s0marg_get_loc
overload .node with s0marg_get_node
//
fun print_s0marg : print_type(s0marg)
fun prerr_s0marg : prerr_type(s0marg)
fun fprint_s0marg : fprint_type(s0marg)
//
overload print with print_s0marg
overload prerr with prerr_s0marg
overload fprint with fprint_s0marg
//
fun
s0marg_make_node
(loc: loc_t, node: s0marg_node): s0marg
//
(* ****** ****** *)
//
datatype
t0arg_node =
| T0ARGnone of token
| T0ARGsome of (sort0, tokenopt)
//
datatype
t0marg_node =
| T0MARGnone of token(*error*)
| T0MARGlist of
  (token(*'('*), t0arglst, token(*')'*))
//
(* ****** ****** *)
//
fun
t0arg_get_loc(t0arg): loc_t
fun
t0arg_get_node(t0arg): t0arg_node
//
overload .loc with t0arg_get_loc
overload .node with t0arg_get_node
//
fun print_t0arg : print_type(t0arg)
fun prerr_t0arg : prerr_type(t0arg)
fun fprint_t0arg : fprint_type(t0arg)
//
overload print with print_t0arg
overload prerr with prerr_t0arg
overload fprint with fprint_t0arg
//
fun
t0arg_make_node
(loc: loc_t, node: t0arg_node): t0arg
//
(* ****** ****** *)
//
fun
t0marg_get_loc(t0marg): loc_t
fun
t0marg_get_node(t0marg): t0marg_node
//
overload .loc with t0marg_get_loc
overload .node with t0marg_get_node
//
fun print_t0marg : print_type(t0marg)
fun prerr_t0marg : prerr_type(t0marg)
fun fprint_t0marg : fprint_type(t0marg)
//
overload print with print_t0marg
overload prerr with prerr_t0marg
overload fprint with fprint_t0marg
//
fun
t0marg_make_node
(loc: loc_t, node: t0marg_node): t0marg
//
(* ****** ****** *)
//
abstbox s0qua_tbox = ptr
typedef s0qua = s0qua_tbox
typedef s0qualst = List0(s0qua)
//
datatype
s0qua_node =
| S0QUAprop of (s0exp)
| S0QUAvars of (i0dntlst, sort0opt)
//
fun
s0qua_get_loc(s0qua): loc_t
fun
s0qua_get_node(s0qua): s0qua_node
//
overload .loc with s0qua_get_loc
overload .node with s0qua_get_node
//
fun print_s0qua : print_type(s0qua)
fun prerr_s0qua : prerr_type(s0qua)
fun fprint_s0qua : fprint_type(s0qua)
//
overload print with print_s0qua
overload prerr with prerr_s0qua
overload fprint with fprint_s0qua
//
fun
s0qua_make_node
(loc: loc_t, node: s0qua_node): s0qua
//
(* ****** ****** *)
//
abstbox s0uni_tbox = ptr
typedef s0uni = s0uni_tbox
typedef s0unilst = List0(s0uni)
//
datatype
s0uni_node =
| S0UNInone of (token)
| S0UNIsome of (token, s0qualst, token)
//
fun
s0uni_get_loc(s0uni): loc_t
fun
s0uni_get_node(s0uni): s0uni_node
//
overload .loc with s0uni_get_loc
overload .node with s0uni_get_node
//
fun print_s0uni : print_type(s0uni)
fun prerr_s0uni : prerr_type(s0uni)
fun fprint_s0uni : fprint_type(s0uni)
//
overload print with print_s0uni
overload prerr with prerr_s0uni
overload fprint with fprint_s0uni
//
fun
s0uni_make_node
(loc: loc_t, node: s0uni_node): s0uni
//
(* ****** ****** *)
//
typedef labs0exp = sl0abled(s0exp)
typedef labs0explst = List0(labs0exp)
//
(* ****** ****** *)

datatype
s0exp_node =
//
| S0Eid0 of (s0eid)
//
| S0Eop1 of (token) // op_symid
| S0Eop2 of (token, s0eid, token) // op(...)
//
| S0Eint of (t0int)
| S0Echr of (t0chr)
| S0Eflt of (t0flt)
| S0Estr of (t0str)
//
| S0Eapps of s0explst
//
| S0Eimp of
    (token, s0explst, token)
  // end of [S0Eimp]
//
| S0Elpar of
    (token, s0explst, s0exp_RPAREN)
  // end of [S0Eparen]
//
| S0Etrcd1 of // HX: tuple
  ( token
  , tokenopt, s0explst, s0exp_RPAREN)
| S0Etrcd2 of // HX: record
  ( token
  , tokenopt, labs0explst, labs0exp_RBRACE)
//
| S0Eforall of
  (token, s0qualst, token) // universal
| S0Eexists of
  (token, s0qualst, token) // existential
//
| S0Elam of
  ( token, s0marglst
  , sort0opt, token, s0exp, tokenopt)
//
| S0Eanno of
    (s0exp, sort0) // sort annotation
  // end of [S0Eanno]
//
| S0Equal of
    (token, s0exp) // qualified staexp
  // end of [S0Equal]
//
| S0Enone of (token) // HX-2018-07-08: indicating error 
//
and
s0exp_RPAREN =
| s0exp_RPAREN_cons0 of token
| s0exp_RPAREN_cons1 of (token, s0explst, token)
//
and
labs0exp_RBRACE =
| labs0exp_RBRACE_cons0 of token
| labs0exp_RBRACE_cons1 of (token, labs0explst, token)
//
(* ****** ****** *)
//
fun
s0exp_get_loc(s0exp): loc_t
fun
s0exp_get_node(s0exp): s0exp_node
//
overload .loc with s0exp_get_loc
overload .node with s0exp_get_node
//
fun print_s0exp : print_type(s0exp)
fun prerr_s0exp : prerr_type(s0exp)
fun fprint_s0exp : fprint_type(s0exp)
//
overload print with print_s0exp
overload prerr with prerr_s0exp
overload fprint with fprint_s0exp
//
fun
s0exp_anno_opt
(s0exp, sort0opt): s0exp
fun
s0exp_make_node
(loc: loc_t, node: s0exp_node): s0exp
//
(* ****** ****** *)
//
fun
s0exp_RPAREN_loc(s0exp_RPAREN): loc_t
//
fun
print_s0exp_RPAREN: print_type(s0exp_RPAREN)
fun
prerr_s0exp_RPAREN: print_type(s0exp_RPAREN)
fun
fprint_s0exp_RPAREN: fprint_type(s0exp_RPAREN)
//
overload print with print_s0exp_RPAREN
overload prerr with prerr_s0exp_RPAREN
overload fprint with fprint_s0exp_RPAREN
//
(* ****** ****** *)
//
fun
labs0exp_RBRACE_loc(labs0exp_RBRACE): loc_t
//
fun
print_labs0exp_RBRACE: print_type(labs0exp_RBRACE)
fun
prerr_labs0exp_RBRACE: prerr_type(labs0exp_RBRACE)
fun
fprint_labs0exp_RBRACE: fprint_type(labs0exp_RBRACE)
//
overload print with print_labs0exp_RBRACE
overload prerr with prerr_labs0exp_RBRACE
overload fprint with fprint_labs0exp_RBRACE
//
(* ****** ****** *)
//
//
// HX-2019-02-18:
// There is no longer plan
// to support effect-tracking!!!
//
(*
//
datatype
s0eff =
| S0EFFnone of
  (token(*:*)) // HX: default
| S0EFFsome of
  (token(*:<*), s0explst, token) // HX: annotated
//
fun
print_s0eff: print_type(s0eff)
fun
prerr_s0eff: prerr_type(s0eff)
fun
fprint_s0eff: fprint_type(s0eff)
//
overload print with print_s0eff
overload prerr with prerr_s0eff
overload fprint with fprint_s0eff
//
*)
//
datatype
effs0expopt =
| EFFS0EXPnone of ()
| EFFS0EXPsome of (s0exp)
(*
| EFFS0EXPsome of (s0eff, s0exp)
*)
//
fun
print_effs0expopt:
print_type(effs0expopt)
fun
prerr_effs0expopt:
prerr_type(effs0expopt)
fun
fprint_effs0expopt: fprint_type(effs0expopt)
//
overload print with print_effs0expopt
overload prerr with prerr_effs0expopt
overload fprint with fprint_effs0expopt
//
(* ****** ****** *)
//
abstbox
d0atcon_tbox = ptr
typedef
d0atcon = d0atcon_tbox
typedef
d0atconlst = List0(d0atcon)
//
datatype
d0atcon_node =
| D0ATCON of
  ( s0unilst
  , d0eid(*nm*), s0explst, s0expopt) 
//
fun
d0atcon_get_loc(d0atcon): loc_t
fun
d0atcon_get_node(d0atcon): d0atcon_node
//
overload .loc with d0atcon_get_loc
overload .node with d0atcon_get_node
//
fun print_d0atcon : print_type(d0atcon)
fun prerr_d0atcon : prerr_type(d0atcon)
fun fprint_d0atcon : fprint_type(d0atcon)
//
overload print with print_d0atcon
overload prerr with prerr_d0atcon
overload fprint with fprint_d0atcon
//
fun
d0atcon_make_node
(loc: loc_t, node: d0atcon_node): d0atcon
//
(* ****** ****** *)
//
abstbox
d0atype_tbox = ptr
typedef
d0atype = d0atype_tbox
typedef
d0atypelst = List0(d0atype)
//
datatype
d0atype_node =
|
D0ATYPE of
( d0eid
, t0marglst
, sort0opt(*res*), token, d0atconlst
) (* D0ATYPE *)
//
fun
d0atype_get_loc
  (x0: d0atype): loc_t
fun
d0atype_get_node
  (x0: d0atype): d0atype_node
//
overload .loc with d0atype_get_loc
overload .node with d0atype_get_node
//
fun print_d0atype : print_type(d0atype)
fun prerr_d0atype : prerr_type(d0atype)
fun fprint_d0atype : fprint_type(d0atype)
//
overload print with print_d0atype
overload prerr with prerr_d0atype
overload fprint with fprint_d0atype
//
fun
d0atype_make_node
(loc: loc_t, node: d0atype_node): d0atype
//
(* ****** ****** *)

(* end of [xats_staexp0.sats] *)
