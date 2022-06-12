(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: June 17, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload "./xbasics.sats"
//
(* ****** ****** *)
#staload "./xstamp0.sats"
#staload "./xsymbol.sats"
#staload "./locinfo.sats"
(* ****** ****** *)
#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
(* ****** ****** *)
//
typedef dataptr = ptr
//
(* ****** ****** *)
//
(*
abstbox htcon_tbox = ptr
*)
abstbox htcst_tbox = ptr
abstbox htvar_tbox = ptr
typedef htcst = htcst_tbox
typedef htvar = htvar_tbox
//
(* ****** ****** *)
(*
typedef htconlst = List0(htcst)
*)
typedef htcstlst = List0(htcst)
typedef htvarlst = List0(htvar)
(* ****** ****** *)
//
abstbox h0typ_tbox = ptr
//
typedef h0typ = h0typ_tbox
typedef h0typlst = List0(h0typ)
typedef h0typopt = Option(h0typ)
//
(* ****** ****** *)
//
fun
htcst_stamp_new(): stamp
fun
htvar_stamp_new(): stamp
//
(* ****** ****** *)
//
fun
htcst_get_sym(htcst): sym_t
fun
htvar_get_sym(htvar): sym_t
//
overload .sym with htcst_get_sym
overload .sym with htvar_get_sym
//
(* ****** ****** *)
//
fun
htcst_get_stamp(htcst): stamp
fun
htvar_get_stamp(htvar): stamp
//
overload .stamp with htcst_get_stamp
overload .stamp with htvar_get_stamp
//
(* ****** ****** *)
//
fun
eq_htcst_htcst
(x1: htcst, x2: htcst): bool
fun
eq_htvar_htvar
(x1: htvar, x2: htvar): bool
//
#symload = with eq_htcst_htcst
#symload = with eq_htvar_htvar
//
(* ****** ****** *)
//
abstbox h0con_tbox = ptr
abstbox h0cst_tbox = ptr
typedef h0con = h0con_tbox
typedef h0cst = h0cst_tbox
//
typedef h0conlst = List0(h0con)
typedef h0cstlst = List0(h0cst)
//
(* ****** ****** *)
//
abstbox h0var_tbox = ptr
typedef h0var = h0var_tbox
typedef h0varlst = List0(h0var)
typedef h0varopt = Option(h0var)
//
(* ****** ****** *)
//
abstbox h0pat_tbox = ptr
typedef h0pat = h0pat_tbox
typedef h0patlst = List0(h0pat)
typedef h0patopt = Option(h0pat)
//
(* ****** ****** *)
//
abstbox h0fag_tbox = ptr
typedef h0fag = h0fag_tbox
typedef h0faglst = List0(h0fag)
typedef h0fagopt = Option(h0fag)
//
(* ****** ****** *)
//
abstbox h0exp_tbox = ptr
typedef h0exp = h0exp_tbox
typedef h0explst = List0(h0exp)
typedef h0expopt = Option(h0exp)
//
(* ****** ****** *)
//
abstbox h0dcl_tbox = ptr
typedef h0dcl = h0dcl_tbox
typedef h0dclist = List0(h0dcl)
typedef h0dclopt = Option(h0dcl)
//
(* ****** ****** *)
//
abstbox htqarg_tbox = ptr
typedef htqarg = htqarg_tbox
typedef htqarglst = List0(htqarg)
typedef htqargopt = Option(htqarg)
//
(* ****** ****** *)
//
abstbox h0gua_tbox = ptr
abstbox h0gpat_tbox = ptr
abstbox h0clau_tbox = ptr
//
typedef h0gua = h0gua_tbox
typedef h0gpat = h0gpat_tbox
typedef h0clau = h0clau_tbox
//
typedef h0gualst = List0(h0gua)
typedef h0claulst = List0(h0clau)
//
(* ****** ****** *)
//
datatype
h0srt =
//
| HSTid0 of (sym_t)
| HSTint of ( int )
//
(*
| HSTtup of
  (h0srtlst) // HX: not in use
*)
|
HSTfun of
(h0srtlst, h0srt(*res*)) // fun
//
(*
|
HSTapp of
( h0srt(*fun*)
, h0srtlst(*arg*)) // HX: not in use
*)
//
|
HSTnone0 of ((*nil*)) // HX: placeholder
|
HSTnone1 of (dataptr) // HX: for ignores
//
where h0srtlst = List0(h0srt)

(* ****** ****** *)
//
fun
print_h0srt: h0srt -> void
fun
prerr_h0srt: h0srt -> void
fun
fprint_h0srt: fprint_type(h0srt)
//
overload print with print_h0srt
overload prerr with prerr_h0srt
overload fprint with fprint_h0srt
//
(* ****** ****** *)
//
fun
htcst_get_sort(htcst): h0srt
fun
htvar_get_sort(htvar): h0srt
//
overload .sort with htcst_get_sort
overload .sort with htvar_get_sort
//
(* ****** ****** *)
//
fun
print_htcst: htcst -> void
fun
prerr_htcst: htcst -> void
fun
fprint_htcst: fprint_type(htcst)
//
overload print with print_htcst
overload prerr with prerr_htcst
overload fprint with fprint_htcst
//
(* ****** ****** *)
fun
htcst_make_idst
( loc: loc_t
, sym: sym_t, hst: h0srt): htcst
(* ****** ****** *)
//
fun
print_htvar: htvar -> void
fun
prerr_htvar: htvar -> void
fun
fprint_htvar: fprint_type(htvar)
//
overload print with print_htvar
overload prerr with prerr_htvar
overload fprint with fprint_htvar
//
(* ****** ****** *)
//
fun
htvar_make_idst
(sym: sym_t, hst: h0srt): htvar
//
(* ****** ****** *)
typedef
labh0typ = slabeled(h0typ)
typedef
labh0typlst = List0(labh0typ)
(* ****** ****** *)
datatype
h0typ_node =
// externally named
| H0Tbas of sym_t // type
//
| H0Tcst of htcst // constant
| H0Tvar of htvar // variable
//
| H0Tlft of h0typ // left-value
//
|
H0Tfun of
( int(*npf*)
, h0typlst(*arg*),h0typ(*res*)
) (* end of H0Tfun *)
//
| H0Tapp of
  (h0typ, h0typlst) // instance
| H0Tlam of
  (htvarlst, h0typ) // abstract
//
| H0Ttyext of
  (string, h0typlst) // external
//
| H0Ttyrec of
  (tyrec(*knd*), int(*npf*), labh0typlst)
//
| H0Tnone0 of ((*nil*)) // HX: placeholder
| H0Tnone1 of (dataptr) // HX: for ignores
//
(* ****** ****** *)
//
fun
print_h0typ: h0typ -> void
fun
prerr_h0typ: h0typ -> void
fun
fprint_h0typ: fprint_type(h0typ)
//
overload print with print_h0typ
overload prerr with prerr_h0typ
overload fprint with fprint_h0typ
//
(* ****** ****** *)
//
fun
print_labh0typ: labh0typ -> void
fun
prerr_labh0typ: labh0typ -> void
fun
fprint_labh0typ: fprint_type(labh0typ)
//
overload print with print_labh0typ
overload prerr with prerr_labh0typ
overload fprint with fprint_labh0typ
//
(* ****** ****** *)
//
fun
h0typ_get_sort(h0typ): h0srt
fun
h0typ_get_node(h0typ): h0typ_node
//
overload .sort with h0typ_get_sort
overload .node with h0typ_get_node
//
(* ****** ****** *)
//
fun
h0typ_none0
((*void*)): h0typ // HX:placeholder
fun
h0typ_make_node
(hst: h0srt, htn: h0typ_node): h0typ
//
(* ****** ****** *)
//
fun{}
h0typ_subst
  (h0t0: h0typ): h0typ
fun{}
h0typ_subst$var
  (h0typ, flag: &int >> _): h0typ
//
(* ****** ****** *)
//
fun
h0typ_subst_tvar
( h0t0: h0typ
, htv0: htvar, tsub: h0typ): h0typ
fun
h0typ_subst_tvarlst
( h0t0: h0typ
, htvs: htvarlst, tsub: h0typlst): h0typ
//
fun
h0typlst_subst_tvarlst
( t2ps: h0typlst
, htvs: htvarlst, tsub: h0typlst): h0typlst
//
(* ****** ****** *)
//
fun
h0con_stamp_new(): stamp
fun
h0cst_stamp_new(): stamp
fun
h0var_stamp_new(): stamp
//
(* ****** ****** *)
//
fun
h0con_get_loc(h0con): loc_t
fun
h0cst_get_loc(h0cst): loc_t
fun
h0var_get_loc(h0var): loc_t
//
overload .loc with h0con_get_loc
overload .loc with h0cst_get_loc
overload .loc with h0var_get_loc
//
(* ****** ****** *)
//
fun
h0con_get_sym(h0con): sym_t
fun
h0cst_get_sym(h0cst): sym_t
fun
h0var_get_sym(h0var): sym_t
//
overload .sym with h0con_get_sym
overload .sym with h0cst_get_sym
overload .sym with h0var_get_sym
//
(* ****** ****** *)
//
fun
h0con_get_ctag(h0con): tag_t
fun
h0con_set_ctag
  (hdc: h0con, tag: tag_t): void
//
overload .ctag with h0con_get_ctag
overload .ctag with h0con_set_ctag
//
(* ****** ****** *)
//
fun
h0con_get_tqas
( hdc0: h0con ): htqarglst
//
overload .tqas with h0con_get_tqas
//
(* ****** ****** *)
//
fun
h0con_get_type(h0con): h0typ
fun
h0cst_get_type(h0cst): h0typ
fun
h0var_get_type(h0var): h0typ
//
overload .type with h0con_get_type
overload .type with h0cst_get_type
overload .type with h0var_get_type
//
(* ****** ****** *)
//
fun
htcst_get_abstdf2
(htc0: htcst): h0typopt
fun
htcst_set_abstdf2
(htc0: htcst, h0t1: h0typ): void
//
overload
.abstdf2 with htcst_get_abstdf2
overload
.abstdf2 with htcst_set_abstdf2
//
(* ****** ****** *)
//
fun
htcst_isdat(htc0: htcst): bool
//
overload .isdat with htcst_isdat
//
fun
htcst_get_hconlst
(htc0: htcst): Option(h0conlst)
fun
htcst_set_hconlst
(htc0: htcst, hdcs: h0conlst): void
//
overload
.hconlst with htcst_get_hconlst
overload
.hconlst with htcst_set_hconlst
//
(* ****** ****** *)
//
fun
h0cst_fcastq(h0cst): bool
//
fun
h0con_get_dvar(h0con): h0var
//
fun
h0cst_get_kind(h0cst): tnode
//
fun
h0var_get_kind(h0var): tnode
//
(* ****** ****** *)
//
fun
h0cst_get_xknd(h0cst): x2knd
fun
h0cst_get_xnam(h0cst): x2nam
//
overload .xknd with h0cst_get_xknd
overload .xnam with h0cst_get_xnam
//
(* ****** ****** *)
//
fun
h0con_get_stamp(h0con): stamp
fun
h0cst_get_stamp(h0cst): stamp
fun
h0var_get_stamp(h0var): stamp
//
overload .stamp with h0con_get_stamp
overload .stamp with h0cst_get_stamp
overload .stamp with h0var_get_stamp
//
(* ****** ****** *)
//
fun
eq_h0con_h0con
(x1: h0con, x2: h0con): bool
fun
eq_h0cst_h0cst
(x1: h0cst, x2: h0cst): bool
fun
eq_h0var_h0var
(x1: h0var, x2: h0var): bool
//
overload = with eq_h0con_h0con
overload = with eq_h0cst_h0cst
overload = with eq_h0var_h0var
//
(* ****** ****** *)
//
fun
htqarg_get_loc(htqarg): loc_t
fun
htqarg_get_htvs(htqarg): htvarlst
//
overload .loc with htqarg_get_loc
overload .htvs with htqarg_get_htvs
//
(* ****** ****** *)
//
fun
print_htqarg: print_type(htqarg)
fun
prerr_htqarg: prerr_type(htqarg)
fun
fprint_htqarg: fprint_type(htqarg)
//
overload print with print_htqarg
overload prerr with prerr_htqarg
overload fprint with fprint_htqarg
//
(* ****** ****** *)
fun
htqarg_make_htvarlst
(loc0: loc_t, htvs: htvarlst): htqarg
(* ****** ****** *)
//
fun
print_h0var: h0var -> void
fun
prerr_h0var: h0var -> void
fun
fprint_h0var: fprint_type(h0var)
//
overload print with print_h0var
overload prerr with prerr_h0var
overload fprint with fprint_h0var
//
(* ****** ****** *)
//
fun
h0con_make_idtp
( loc: loc_t
, sym: sym_t
, tqas
: htqarglst, htp0: h0typ): h0con
fun
h0cst_make_idtp
( loc: loc_t
, sym: sym_t
, knd: tnode
, tqas
: htqarglst, htp0: h0typ
, xkd1: x2knd, xnm2: x2nam): h0cst
//
(* ****** ****** *)
//
fun
h0var_make_idtp
( loc: loc_t
, sym: sym_t
, knd: tnode, htp: h0typ): h0var
//
(* ****** ****** *)
//
fun
print_h0con: h0con -> void
fun
prerr_h0con: h0con -> void
fun
fprint_h0con: fprint_type(h0con)
//
overload print with print_h0con
overload prerr with prerr_h0con
overload fprint with fprint_h0con
//
(* ****** ****** *)
//
fun
print_h0cst: h0cst -> void
fun
prerr_h0cst: h0cst -> void
fun
fprint_h0cst: fprint_type(h0cst)
//
overload print with print_h0cst
overload prerr with prerr_h0cst
overload fprint with fprint_h0cst
//
(* ****** ****** *)
//
datatype
h0pat_node =
//
| H0Pnil of ()
//
| H0Pany of () // wildcard
| H0Pvar of h0var // variable
//
| H0Pi00 of (int)
| H0Pb00 of (bool)
| H0Pc00 of (char)
| H0Ps00 of string
//
| H0Pint of token
| H0Pbtf of token
| H0Pchr of token
| H0Pstr of token
//
| H0Pcon of h0con // cnstrctr
//
| H0Pbang of (h0pat)
| H0Pflat of (h0pat)
| H0Pfree of (h0pat)
//
| H0Pdap1 of (h0pat)
| H0Pdapp of
  ( h0pat
  , int(*npf*), h0patlst)
//
| H0Ptrcd1 of
  ( int(*knd*)
  , int(*npf*), h0patlst)
//
| H0Pnone1 of ( dataptr ) // HX: for ignores
//
(* ****** ****** *)
//
fun
h0pat_get_loc
( h0p: h0pat ) : loc_t
fun
h0pat_get_type
( h0p: h0pat ) : h0typ
fun
h0pat_get_node
( h0p: h0pat ) : h0pat_node
//
overload .loc with h0pat_get_loc
overload .type with h0pat_get_type
overload .node with h0pat_get_node
//
(* ****** ****** *)
//
fun
print_h0pat: h0pat -> void
fun
prerr_h0pat: h0pat -> void
fun
fprint_h0pat: fprint_type(h0pat)
//
overload print with print_h0pat
overload prerr with prerr_h0pat
overload fprint with fprint_h0pat
//
(* ****** ****** *)
//
fun
h0pat_make_node
(loc_t, h0typ, h0pat_node): h0pat
//
(* ****** ****** *)
//
datatype
h0fag_node =
//
| H0FAGnpats of
  (int(*npf*), h0patlst)
//
| H0FAGnone0 of ((*nil*))
//
| H0FAGnone1 of (dataptr) // for ignores
//
(* ****** ****** *)
fun
h0fag_get_loc
( hfa: h0fag ) : loc_t
fun
h0fag_get_node
( hfa: h0fag ) : h0fag_node
//
overload .loc with h0fag_get_loc
overload .node with h0fag_get_node
(* ****** ****** *)
//
fun
print_h0fag: h0fag -> void
fun
prerr_h0fag: h0fag -> void
fun
fprint_h0fag: fprint_type(h0fag)
//
overload print with print_h0fag
overload prerr with prerr_h0fag
overload fprint with fprint_h0fag
//
(* ****** ****** *)
fun
h0fag_make_node
(loc0: loc_t, node: h0fag_node): h0fag
(* ****** ****** *)
//
datatype
htiarg =
| HTIARGnone of ()
| HTIARGsome of h0typlst
//
(* ****** ****** *)
//
fun
print_htiarg: print_type(htiarg)
fun
prerr_htiarg: prerr_type(htiarg)
fun
fprint_htiarg: fprint_type(htiarg)
//
overload print with print_htiarg
overload prerr with prerr_htiarg
overload fprint with fprint_htiarg
//
(* ****** ****** *)
//
(*
VARG 0 // arg. vars
VLOC 0 // local vars
VENV 1 // environ. vars
VFIX 2 // fixed binding
VTOP %(~1) // top-level vars
*)
datatype
h0exp_node =
//
| H0Ei00 of (int)
| H0Eb00 of (bool)
| H0Ec00 of (char)
| H0Es00 of string
//
| H0Eint of (token)
| H0Ebtf of (token)
| H0Echr of (token)
| H0Eflt of (token)
| H0Estr of (token)
//
| H0Etop of (token)
//
| H0Evar of (h0var)
| H0Ekvar of
  (int(*knd*), h0var)
//
| H0Efcon of (h0con)//cnstr
| H0Etcon of (h0con, htiarg)
//
| H0Efcst of (h0cst)//const
| H0Etcst of (h0cst, htiarg)
//
(*
| H0Etimp of
  ( stamp, h0exp )
*)
|
H0Etimp of
( stamp
, h0exp(*tcst*), h0typlst(*targ*)
, h0dcl(*impl*), h0typlst(*tsub*)
) (* end of [H0Etimp] *)
//
| H0Edapp of
  ( h0exp//fun
  , int(*npf*), h0explst(*arg*) )
//
| H0Epcon of
  ( h0exp(*con*), label(*proj*) )
| H0Epbox of
  ( h0exp(*rcd*),
    label(*proj*), int(*index*) )
//
| H0Eproj of
  ( h0exp(*rcd*),
    label(*proj*), int(*index*) )
| H0Eplft of
  ( h0exp(*rcd*),
    label(*proj*), int(*index*) )
| H0Epptr of
  ( h0exp(*rcd*),
    label(*proj*), int(*index*) )
//
| H0Elet of
  ( h0dclist, h0exp(*sequence*) )
//
|
H0Eseqn of
(h0explst(*semi*), h0exp(*last*))
//
|
H0Etrcd1 of
(int(*knd*), int(*npf*), h0explst)
//
| H0Eassgn of
  (h0exp(*l-val*), h0exp(*r-val*))
//
|
H0Eift1 of
( h0exp // single if-then-else
, h0exp(*then*), h0expopt(*else*))
(*
//
// HX-2021-03-27:
H0Eifts of // multiple if-then-else
(h0gexplst(*then*), h0expopt(*else*))
*)
|
H0Ecase of
( int(*knd*)
, h0exp(*val*), h0claulst(*claues*))
//
| H0Elam of
  ( token(*knd*)
  , h0faglst(*arg*), h0exp(*body*) )
| H0Efix of
  ( token(*knd*)
  , h0var(*fid*)
  , h0faglst(*arg*), h0exp(*body*) )
//
|
H0Etry0 of
( token(*knd*)
, h0exp(*val*), h0claulst(*claues*))
//
| H0Eaddr of h0exp(*l-value*)
| H0Eflat of h0exp(*l-value*)
| H0Etalf of h0exp(*H0Eflat*)
//
| H0Efold of h0exp(*open-con*)
//
(*
// HX-2019-12-18:
// knd=0: general
// knd=1: ptr-dref
// knd=2: lazy-eval
// knd=3: llazy-eval
*)
| H0Eeval of
  (int(*knd*), h0exp(*src*))
//
(*
// HX-2020-09-26:
// knd=0: general
// knd=1: ptr-free
// knd=2: con-free
// knd=3: llazy-free
*)
| H0Efree of
  (int(*knd*), h0exp(*src*))
//
| H0Eraise of h0exp(*lin-exn*)
//
| H0Elazy of
  (h0exp(*eval*)) // nonlin
| H0Ellazy of
  ( h0exp(*eval*)
  , h0explst(*frees*)) // linear
//
| H0Enone0 of () // HX: nil/none/null
| H0Enone1 of (dataptr) // HX: for ignores
//
where
h0dclistopt = Option(h0dclist)
//
(* ****** ****** *)
//
fun
h0exp_get_loc
( h0e: h0exp ) : loc_t
fun
h0exp_get_type
( h0e: h0exp ) : h0typ
fun
h0exp_get_node
( h0e: h0exp ) : h0exp_node
//
overload .loc with h0exp_get_loc
overload .type with h0exp_get_type
overload .node with h0exp_get_node
//
(* ****** ****** *)
//
fun
print_h0exp: h0exp -> void
fun
prerr_h0exp: h0exp -> void
fun
fprint_h0exp: fprint_type(h0exp)
//
overload print with print_h0exp
overload prerr with prerr_h0exp
overload fprint with fprint_h0exp
//
(* ****** ****** *)
//
fun
h0exp_make_node
(loc_t, h0typ, h0exp_node): h0exp
//
(* ****** ****** *)
//
datatype
h0gua_node =
| H0GUAexp of (h0exp)
| H0GUAmat of (h0exp, h0pat)
//
fun
h0gua_get_loc(h0gua): loc_t
fun
h0gua_get_node(h0gua): h0gua_node
//
overload .loc with h0gua_get_loc
overload .node with h0gua_get_node
//
fun print_h0gua : (h0gua) -> void
fun prerr_h0gua : (h0gua) -> void
fun fprint_h0gua : fprint_type(h0gua)
//
overload print with print_h0gua
overload prerr with prerr_h0gua
overload fprint with fprint_h0gua
//
fun
h0gua_make_node
(loc: loc_t, node: h0gua_node): h0gua
//
(* ****** ****** *)
//
datatype
h0clau_node =
| H0CLAUpat of h0gpat
| H0CLAUexp of (h0gpat, h0exp)
and
h0gpat_node =
| H0GPATpat of (h0pat)
| H0GPATgua of (h0pat, h0gualst)
//
fun
h0clau_get_loc(h0clau): loc_t
fun
h0clau_get_node(h0clau): h0clau_node
//
overload .loc with h0clau_get_loc
overload .node with h0clau_get_node
//
fun
h0gpat_get_loc(h0gpat): loc_t
fun
h0gpat_get_node(h0gpat): h0gpat_node
//
overload .loc with h0gpat_get_loc
overload .node with h0gpat_get_node
//
fun
print_h0clau : (h0clau) -> void
fun
prerr_h0clau : (h0clau) -> void
fun
fprint_h0clau : fprint_type(h0clau)
//
overload print with print_h0clau
overload prerr with prerr_h0clau
overload fprint with fprint_h0clau
//
fun
print_h0gpat : (h0gpat) -> void
fun
prerr_h0gpat : (h0gpat) -> void
fun
fprint_h0gpat : fprint_type(h0gpat)
//
overload print with print_h0gpat
overload prerr with prerr_h0gpat
overload fprint with fprint_h0gpat
//
fun
h0clau_make_node
(loc: loc_t, node: h0clau_node): h0clau
fun
h0gpat_make_node
(loc: loc_t, node: h0gpat_node): h0gpat
//
(* ****** ****** *)
//
datatype
h0fundecl =
H0FUNDECL of @{
  loc= loc_t
, nam= h0var
, hdc= h0cst
, hfg=
  h0faglstopt
, def= h0expopt, rtp= h0typ
} where
  h0faglstopt = Option(h0faglst)
//
typedef h0fundeclist = List0(h0fundecl)
//
(* ****** ****** *)
//
fun
print_h0fundecl: print_type(h0fundecl)
fun
prerr_h0fundecl: prerr_type(h0fundecl)
fun
fprint_h0fundecl: fprint_type(h0fundecl)
//
overload print with print_h0fundecl
overload prerr with prerr_h0fundecl
overload fprint with fprint_h0fundecl
//
(* ****** ****** *)
//
datatype
h0valdecl =
H0VALDECL of @{
  loc= loc_t
, pat= h0pat
, def= h0expopt
(*
, ctp= t2pcast
*)
}
//
typedef
h0valdeclist = List0(h0valdecl)
//
(* ****** ****** *)
//
(*
fun
h0valdecl_get_loc(h0valdecl): loc_t
overload .loc with h0valdecl_get_loc
*)
//
(* ****** ****** *)
//
fun
print_h0valdecl: print_type(h0valdecl)
fun
prerr_h0valdecl: prerr_type(h0valdecl)
fun
fprint_h0valdecl: fprint_type(h0valdecl)
//
overload print with print_h0valdecl
overload prerr with prerr_h0valdecl
overload fprint with fprint_h0valdecl
//
(* ****** ****** *)
//
datatype
h0vardecl =
H0VARDECL of @{
  loc= loc_t
, hdv= h0var
, wth= h0varopt
, ini= h0expopt
}
//
typedef
h0vardeclist = List0(h0vardecl)
//
(* ****** ****** *)
//
(*
fun
h0vardecl_get_loc(h0vardecl): loc_t
overload .loc with h0vardecl_get_loc
*)
//
(* ****** ****** *)
//
fun
print_h0vardecl: print_type(h0vardecl)
fun
prerr_h0vardecl: prerr_type(h0vardecl)
fun
fprint_h0vardecl: fprint_type(h0vardecl)
//
overload print with print_h0vardecl
overload prerr with prerr_h0vardecl
overload fprint with fprint_h0vardecl
//
(* ****** ****** *)
//
datatype
h0comped =
H0COMPED of @{
  stadyn= int
, source= filpath
, comped=
  Option(h0dclist)
} where
  filpath= $FP0.filpath
//
(* ****** ****** *)
//
datatype
h0dcl_node =
//
|
H0Cstatic of
(token(*STATIC*), h0dcl)
|
H0Cextern of
(token(*EXTERN*), h0dcl)
//
|
H0Clocal of
( h0dclist(*head*)
, h0dclist(*body*))
//
|
H0Cinclude of
( token
, g1exp // src
, int(*knd*) // sta/dyn: 0/1
, filpathopt
, h0dclistopt) // file inclusion
//
|
H0Cabstype of
(htcst, h0typopt(*def*))
//
|
H0Cexcptcon of (h0conlst)
//
|
H0Cdatatype of (htcstlst)
//
|
H0Cfundclst of
( token(*knd*)
, decmodopt
, htqarglst, h0fundeclist)
//
|
H0Cvaldclst of
( token(*knd*)
, decmodopt, h0valdeclist)
|
H0Cvardclst of
( token(*knd*)
, decmodopt, h0vardeclist)
//
|
H0Cimplmnt3 of
( token(*impkind*)
, stamp(*unicity*)
, decmodopt
, htqargopt
, h0cst, htiarg, h0faglst, h0exp)
//
|
H0Cnone1 of (dataptr) // HX: for ignores
//
(* ****** ****** *)
//
fun
h0dcl_get_loc
( hdcl: h0dcl ) : loc_t
fun
h0dcl_get_node
( hdcl: h0dcl ) : h0dcl_node
//
overload .loc with h0dcl_get_loc
overload .node with h0dcl_get_node
//
(* ****** ****** *)
//
fun
print_h0dcl: h0dcl -> void
fun
prerr_h0dcl: h0dcl -> void
fun
fprint_h0dcl: fprint_type(h0dcl)
//
overload print with print_h0dcl
overload prerr with prerr_h0dcl
overload fprint with fprint_h0dcl
//
(* ****** ****** *)
//
fun
h0dcl_make_node
(loc0: loc_t, node: h0dcl_node): h0dcl
//
(* ****** ****** *)

(* end of [xats_intrep0.sats] *)
