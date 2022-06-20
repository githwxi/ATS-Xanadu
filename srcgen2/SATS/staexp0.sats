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
Start Time: May 28th, 2022
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
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
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
//
(*
#abstbox t0int_tbox // ptr
#abstbox t0chr_tbox // ptr
#abstbox t0flt_tbox // ptr
#abstbox t0str_tbox // ptr
*)
//
(* ****** ****** *)
//
#abstbox i0dnt_tbox // ptr
#abstbox l0abl_tbox // ptr
#abstype s0ymb_tbox // ptr
//
(* ****** ****** *)
//
#abstbox g0nam_tbox // ptr
//
(* ****** ****** *)
//
#abstbox g0exp_tbox // ptr
//
#abstbox g0mag_tbox // ptr
//
(* ****** ****** *)
//
#abstbox sort0_tbox // ptr
#abstbox s0tcn_tbox // ptr
#abstbox d0tst_tbox // ptr
#abstbox s0tdf_tbox // ptr
//
#abstbox s0exp_tbox // ptr
//
#abstbox s0arg_tbox // ptr
#abstbox s0mag_tbox // ptr
//
#abstbox t0arg_tbox // ptr
#abstbox t0mag_tbox // ptr
//
#abstbox s0qua_tbox // ptr
//
(* ****** ****** *)
//
(*
#typedef t0int = t0int_tbox
#typedef t0chr = t0chr_tbox
#typedef t0flt = t0flt_tbox
#typedef t0str = t0str_tbox
*)
//
datatype t0int =
| T0INTnone of token
| T0INTsome of token
datatype t0chr =
| T0CHRnone of token
| T0CHRsome of token
datatype t0flt =
| T0FLTnone of token
| T0FLTsome of token
datatype t0str =
| T0STRnone of token
| T0STRsome of token
//
(* ****** ****** *)
fun
t0int_fprint
(out:FILR, int:t0int): void
fun
t0chr_fprint
(out:FILR, chr:t0chr): void
fun
t0flt_fprint
(out:FILR, flt:t0flt): void
fun
t0str_fprint
(out:FILR, str:t0str): void
//
(* ****** ****** *)
//
fun
t0int_get_lctn(t0int): loc_t
fun
t0chr_get_lctn(t0chr): loc_t
fun
t0flt_get_lctn(t0flt): loc_t
fun
t0str_get_lctn(t0str): loc_t
//
#symload lctn with t0int_get_lctn
#symload lctn with t0chr_get_lctn
#symload lctn with t0flt_get_lctn
#symload lctn with t0str_get_lctn
//
(* ****** ****** *)
//
#typedef i0dnt = i0dnt_tbox
#typedef l0abl = l0abl_tbox
#typedef s0ymb = s0ymb_tbox
//
(* ****** ****** *)
//
#typedef g0nid = i0dnt_tbox
#typedef g0eid = i0dnt_tbox
#typedef g0arg = i0dnt_tbox
//
(* ****** ****** *)
//
#typedef s0tid = i0dnt_tbox

#typedef s0aid = i0dnt_tbox
#typedef s0eid = i0dnt_tbox
//
#typedef d0pid = i0dnt_tbox
#typedef d0eid = i0dnt_tbox
//
(* ****** ****** *)
//
#typedef g0nam = g0nam_tbox
#typedef g0exp = g0exp_tbox
#typedef g0mag = g0mag_tbox
#typedef g0namlst = list(g0nam)
#typedef g0explst = list(g0exp)
#typedef g0arglst = list(g0arg)
#typedef g0maglst = list(g0mag)
//
(* ****** ****** *)
//
#typedef sort0 = sort0_tbox
#typedef sort0lst = list(sort0)
#typedef sort0opt = optn(sort0)
//
(*
//HX-2022-06-18: [sortcon]
*)
#typedef s0tcn = s0tcn_tbox
#typedef s0tcnlst = list(s0tcn)
//
(*
//HX-2022-06-18: [datasort]
*)
#typedef d0tst = d0tst_tbox
#typedef d0tstlst = list(d0tst)
//
(*
// HX-2022-06-18: [sortdef]
*)
#typedef s0tdf = s0tdf_tbox
#typedef s0tdflst = list(s0tdf)
//
(* ****** ****** *)
//
#typedef s0exp = s0exp_tbox
#typedef s0explst = list(s0exp)
#typedef s0expopt = optn(s0exp)
//
#typedef s0arg = s0arg_tbox
#typedef s0mag = s0mag_tbox
#typedef s0arglst = list(s0arg)
#typedef s0maglst = list(s0mag)
//
#typedef t0arg = t0arg_tbox
#typedef t0mag = t0mag_tbox
#typedef t0arglst = list(t0arg)
#typedef t0maglst = list(t0mag)
//
#typedef s0qua = s0qua_tbox
#typedef s0qualst = list(s0qua)
//
(* ****** ****** *)
#typedef tokenopt = optn(token)
(* ****** ****** *)
fun
i0dnt_fprint:(FILR,i0dnt)->void
fun
l0abl_fprint:(FILR,l0abl)->void
fun
s0ymb_fprint:(FILR,s0ymb)->void
(* ****** ****** *)
//
datatype
i0dnt_node =
| I0DNTsome of token // valid
| I0DNTnone of token // invalid
//
fun
i0dnt_none: (token) -> i0dnt
fun
i0dnt_some: (token) -> i0dnt
//
fun
i0dnt_get_lctn(i0dnt): loc_t
fun
i0dnt_get_node(i0dnt): i0dnt_node
//
#symload lctn with i0dnt_get_lctn
#symload node with i0dnt_get_node
//
(* ****** ****** *)
//
datatype
l0abl_node =
| L0ABLsome of label // valid
| L0ABLnone of token // invalid
//
fun
l0abl_get_lctn(l0abl): loc_t
fun
l0abl_get_node(l0abl): l0abl_node
//
#symload lctn with l0abl_get_lctn
#symload node with l0abl_get_node
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
(loc:loc_t, lnd:l0abl_node): l0abl
#symload l0abl with l0abl_make_node
//
(* ****** ****** *)
//
(*
s0ymb ::=
| i0dnt // i0dnt(obj, ...)
| DOT l0abl // obj.l0abl(...)
| LBRCKT RBRCKT // obj[idx...]
*)
datatype
s0ymb_node =
| S0YMBi0dnt of (i0dnt)
(*
| S0YMBdtlab of (token, l0abl)
*)
| S0YMBbrckt of (token, token)
//
(* ****** ****** *)
//
fun
s0ymb_get_lctn: (s0ymb)->loc_t
fun
s0ymb_get_node: (s0ymb)->s0ymb_node
//
#symload lctn with s0ymb_get_lctn
#symload node with s0ymb_get_node
//
fun
s0ymb_make_node
(loc:loc_t, lnd:s0ymb_node): s0ymb
#symload s0ymb with s0ymb_make_node
//
(* ****** ****** *)
//
datatype
s0lab(x0:type) =
|
S0LAB of
(l0abl, token, x0(*elt*))
//
(* ****** ****** *)
//
fun
<x0:type>
s0lab_fprint
(out: FILR, lab: s0lab(x0)): void
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
| G0Nnone0 of ()
| G0Nnone1 of (token(*error*))
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
| G0Elist of // temp.
  (token, g0explst, token)
//
| G0Eifexp of
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
datatype
g0mag_node =
|
G0MAGnone of (token)
|
G0MAGsarg of
(token(*'{'*), g0arglst, token(*'}'*))
|
G0MAGdarg of
(token(*'('*), g0arglst, token(*')'*))
//
(* ****** ****** *)
fun
g0nam_fprint:(FILR,g0nam)->void
fun
g0exp_fprint:(FILR,g0exp)->void
fun
g0mag_fprint:(FILR,g0mag)->void
(* ****** ****** *)
//
fun
g0nam_get_lctn(g0nam): loc_t
fun
g0nam_get_node(g0nam): g0nam_node
//
#symload lctn with g0nam_get_lctn
#symload node with g0nam_get_node
//
(* ****** ****** *)
//
fun
g0exp_get_lctn(g0exp): loc_t
fun
g0exp_get_node(g0exp): g0exp_node
//
#symload lctn with g0exp_get_lctn
#symload node with g0exp_get_node
//
(* ****** ****** *)
//
fun
g0mag_get_lctn(g0mag): loc_t
fun
g0mag_get_node(g0mag): g0mag_node
//
#symload lctn with g0mag_get_lctn
#symload node with g0mag_get_node
//
(* ****** ****** *)
//
datatype
s0qid =
| S0QIDnone of (i0dnt)
| S0QIDsome of (token, i0dnt)
datatype
d0qid =
| D0QIDnone of (i0dnt)
| D0QIDsome of (token, i0dnt)
//
fun
s0qid_get_lctn(s0qid): loc_t
fun
d0qid_get_lctn(d0qid): loc_t
//
#symload lctn with s0qid_get_lctn
#symload lctn with d0qid_get_lctn
//
fun s0qid_fprint:(FILR,s0qid)->void
fun d0qid_fprint:(FILR,d0qid)->void
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
// HX: qualified
| S0Tqid of (token, sort0)
//
| S0Tapps of
  (sort0lst) //HX: unsupported
//
| S0Tlpar of //HX: This one is a temp.
  (token, sort0lst, token) // construct
//
(*
| S0Ttype of int(*kind*)
//prop/view/type/tbox/tflt/vwtp/vtbx/vtft
*)
| S0Ttkerr of (token) // HX: parsing error
//
| S0Terrck of (int, sort0) // HX: pread error
// end of [datatype sort0_node]

(* ****** ****** *)
fun
sort0_fprint
(out:FILR, s0t:sort0): void
(* ****** ****** *)
//
fun
sort0_get_lctn(sort0): loc_t
fun
sort0_get_node(sort0): sort0_node
//
#symload lctn with sort0_get_lctn
#symload node with sort0_get_node
//
(* ****** ****** *)
//
fun
sort0_make_node
(loc:loc_t, nod:sort0_node): sort0
#symload sort0 with sort0_make_node
//
(* ****** ****** *)
datatype
s0tcn_node =
|
S0TCNnode of (s0eid,sort0opt)
(* ****** ****** *)
fun
s0tcn_fprint
(out: FILR, tcn: s0tcn): void
(* ****** ****** *)
//
fun
s0tcn_get_lctn(s0tcn): loc_t
fun
s0tcn_get_node(s0tcn): s0tcn_node
//
#symload lctn with s0tcn_get_lctn
#symload node with s0tcn_get_node
//
fun
s0tcn_make_node
(loc:loc_t, nod:s0tcn_node): s0tcn
#symload s0tcn with s0tcn_make_node
//
(* ****** ****** *)
//
datatype
d0tst_node =
|
D0TSTnode of
( s0tid
, token(*EQ*), s0tcnlst)
//
(* ****** ****** *)
fun
d0tst_fprint
(out:FILR, dst:d0tst): void
(* ****** ****** *)
//
fun
d0tst_get_lctn(d0tst): loc_t
fun
d0tst_get_node(d0tst): d0tst_node
//
#symload lctn with d0tst_get_lctn
#symload node with d0tst_get_node
//
fun
d0tst_make_node
(loc:loc_t, nod:d0tst_node): d0tst
#symload d0tst with d0tst_make_node
//
(* ****** ****** *)
//
datatype
s0tdf_node =
|
S0TDFsort of sort0
|
S0TDFtsub of
( token // #sortdef
, s0arg, token, s0explst, token)
//
(* ****** ****** *)
fun
s0tdf_fprint
(out:FILR, dst:s0tdf): void
(* ****** ****** *)
//
fun
s0tdf_get_lctn(s0tdf): loc_t
fun
s0tdf_get_node(s0tdf): s0tdf_node
//
#symload lctn with s0tdf_get_lctn
#symload node with s0tdf_get_node
//
fun
s0tdf_make_node
(loc:loc_t, nod:s0tdf_node): s0tdf
#symload s0tdf with s0tdf_make_node
//
(* ****** ****** *)
//
datatype
s0arg_node =
| S0ARGnone of (token)
| S0ARGsome of (s0eid, sort0opt)
//
datatype
s0mag_node =
|
S0MAGnone of (token)
|
S0MAGsing of (s0aid)
|
S0MAGlist of
(token(*LP*), s0arglst, token(*RP*))
//
(* ****** ****** *)
fun
s0arg_fprint
(out:FILR, s0a:s0arg): void
fun
s0mag_fprint
(out:FILR, sma:s0mag): void
(* ****** ****** *)
//
fun
s0arg_get_lctn(s0arg): loc_t
fun
s0arg_get_node(s0arg): s0arg_node
//
#symload lctn with s0arg_get_lctn
#symload node with s0arg_get_node
//
fun
s0arg_make_node
(loc:loc_t, nod:s0arg_node): s0arg
#symload s0arg with s0arg_make_node
//
(* ****** ****** *)
//
fun
s0mag_get_lctn(s0mag): loc_t
fun
s0mag_get_node(s0mag): s0mag_node
//
#symload lctn with s0mag_get_lctn
#symload node with s0mag_get_node
//
fun
s0mag_make_node
(loc:loc_t, nod:s0mag_node): s0mag
#symload s0mag with s0mag_make_node
//
(* ****** ****** *)
//
datatype
t0arg_node =
|
T0ARGnone of token
|
T0ARGsome of (sort0, tokenopt)
//
datatype
t0mag_node =
|
T0MAGnone of token(*error*)
|
T0MAGlist of
(token(*'('*), t0arglst, token(*')'*))
//
(* ****** ****** *)
fun
t0arg_fprint
(out:FILR, tag:t0arg): void
fun
t0mag_fprint
(out:FILR, tmg:t0mag): void
(* ****** ****** *)
//
fun
t0arg_get_lctn(t0arg): loc_t
fun
t0arg_get_node(t0arg): t0arg_node
//
#symload lctn with t0arg_get_lctn
#symload node with t0arg_get_node
//
fun
t0arg_make_node
(loc:loc_t, nod:t0arg_node): t0arg
#symload t0arg with t0arg_make_node
//
(* ****** ****** *)
//
fun
t0mag_get_lctn(t0mag): loc_t
fun
t0mag_get_node(t0mag): t0mag_node
//
#symload lctn with t0mag_get_lctn
#symload node with t0mag_get_node
//
fun
t0mag_make_node
(loc:loc_t, nod:t0mag_node): t0mag
#symload t0mag with t0mag_make_node
//
(* ****** ****** *)
//
#typedef
i0dntlst = list(i0dnt)
//
datatype
s0qua_node =
|
S0QUAprop of (s0exp)
|
S0QUAvars of (i0dntlst, sort0opt)
//
(* ****** ****** *)
fun
s0qua_fprint
(out:FILR, s0q:s0qua): void
(* ****** ****** *)
//
fun
s0qua_get_lctn(s0qua): loc_t
fun
s0qua_get_node(s0qua): s0qua_node
//
#symload lctn with s0qua_get_lctn
#symload node with s0qua_get_node
//
fun
s0qua_make_node
(loc:loc_t, nod:s0qua_node): s0qua
#symload s0qua with s0qua_make_node
//
(* ****** ****** *)
//
(*
//HX:l0s0e:labs0exp
*)
#typedef
l0s0e = s0lab(s0exp)
#typedef
l0s0elst = list(s0lab(s0exp))
//
(* ****** ****** *)
//
datatype
s0exp_node =
//
| S0Eid0 of (s0eid)
//
| S0Eint of (t0int)
| S0Echr of (t0chr)
| S0Eflt of (t0flt)
| S0Estr of (t0str)
//
|
S0Eop1 of (token) // op
|
S0Eop2 of (token) // op_symid
|
S0Eop3 of
(token, s0eid, token) // op(...)
//
| S0Eapps of s0explst
//
|
S0Efimp of
( token, s0explst, token )
//
|
S0Elpar of
( token, s0explst, s0exp_RPAREN )
//
|
S0Etup1 of // HX: tuple
( token
, tokenopt, s0explst, s0exp_RPAREN)
|
S0Ercd2 of // HX: record
( token
, tokenopt, l0s0elst, l0s0e_RBRACE)
//
|
S0Elam0 of
( token
, s0maglst
, sort0opt, token, s0exp, tokenopt)//lam()
|
S0Eanno of (s0exp, sort0) // HX: annotation
|
S0Euni0 of (token, s0qualst, token)//forall
|
S0Eexi0 of (token, s0qualst, token)//exists
|
S0Equal of (token, s0exp) // HX: qual-s0exp
|
// HX-2018-07-08: this one probably
S0Etkerr of (token) // indicates some error!
|
S0Eerrck of (int, s0exp) // HX: pread error!
// HX-2022-06-16: end-of-[datatype(s0exp_node)]
//
and
s0exp_RPAREN =
|
s0exp_RPAREN_cons0 of (token)
|
s0exp_RPAREN_cons1 of (token, s0explst, token)
//
and
l0s0e_RBRACE =
|
l0s0e_RBRACE_cons0 of (token)
|
l0s0e_RBRACE_cons1 of (token, l0s0elst, token)
//
(* ****** ****** *)
//
fun
s0exp_fprint
(out:FILR, dst:s0exp): void
fun
s0exp_RPAREN_fprint
(out:FILR, srp:s0exp_RPAREN): void
fun
l0s0e_RBRACE_fprint
(out:FILR, lrb:l0s0e_RBRACE): void
//
(* ****** ****** *)
//
fun
s0exp_get_lctn(s0exp): loc_t
fun
s0exp_get_node(s0exp): s0exp_node
//
#symload lctn with s0exp_get_lctn
#symload node with s0exp_get_node
//
fun
s0exp_make_node
(loc:loc_t, nod:s0exp_node): s0exp
#symload s0exp with s0exp_make_node
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp0.sats] *)
