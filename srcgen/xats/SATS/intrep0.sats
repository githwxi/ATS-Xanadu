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

#staload "./basics.sats"

(* ****** ****** *)

#staload "./stamp0.sats"
#staload "./symbol.sats"
#staload "./locinfo.sats"

(* ****** ****** *)
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
(* ****** ****** *)

typedef dataptr = ptr

(* ****** ****** *)

abstbox htcst_tbox = ptr
abstbox htvar_tbox = ptr
typedef htcst = htcst_tbox
typedef htvar = htvar_tbox

(* ****** ****** *)
typedef htcstlst = List0(htcst)
typedef htvarlst = List0(htvar)
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
abstbox h0typ_tbox = ptr
//
typedef h0typ = h0typ_tbox
typedef h0typlst = List0(h0typ)
typedef h0typopt = Option(h0typ)
//
(* ****** ****** *)
//
abstbox hdcon_tbox = ptr
abstbox hdcst_tbox = ptr
typedef hdcon = hdcon_tbox
typedef hdcst = hdcst_tbox
//
typedef hdconlst = List0(hdcon)
//
abstbox hdvar_tbox = ptr
typedef hdvar = hdvar_tbox
typedef hdvarlst = List0(hdvar)
typedef hdvaropt = Option(hdvar)
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
abstbox hfarg_tbox = ptr
//
typedef hfarg = hfarg_tbox
typedef hfarglst = List0(hfarg)
typedef hfargopt = Option(hfarg)
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
abstbox h0gua_tbox = ptr
typedef h0gua = h0gua_tbox
typedef h0gualst = List0(h0gua)
//
abstbox h0gpat_tbox = ptr
typedef h0gpat = h0gpat_tbox
//
abstbox h0clau_tbox = ptr
typedef h0clau = h0clau_tbox
typedef h0claulst = List0(h0clau)
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
fun
hdcon_stamp_new(): stamp
fun
hdcst_stamp_new(): stamp
fun
hdvar_stamp_new(): stamp
//
(* ****** ****** *)
//
fun
hdcon_get_loc(hdcon): loc_t
fun
hdcst_get_loc(hdcst): loc_t
fun
hdvar_get_loc(hdvar): loc_t
//
overload .loc with hdcon_get_loc
overload .loc with hdcst_get_loc
overload .loc with hdvar_get_loc
//
(* ****** ****** *)
//
fun
hdcon_get_sym(hdcon): sym_t
fun
hdcst_get_sym(hdcst): sym_t
fun
hdvar_get_sym(hdvar): sym_t
//
overload .sym with hdcon_get_sym
overload .sym with hdcst_get_sym
overload .sym with hdvar_get_sym
//
(* ****** ****** *)
//
fun
hdcon_get_tag(hdcon): tag_t
fun
hdcon_set_tag
  (hdc: hdcon, tag: tag_t): void
//
overload .tag with hdcon_get_tag
overload .tag with hdcon_set_tag
//
(* ****** ****** *)
//
//
fun
hdcst_fcastq(hdcst): bool
//
fun
hdcon_get_dvar(hdcon): hdvar
//
fun
hdcst_get_kind(hdcst): tnode
//
fun
hdvar_get_kind(hdvar): tnode
//
(* ****** ****** *)
//
fun
hdcon_get_stamp(hdcon): stamp
fun
hdcst_get_stamp(hdcst): stamp
fun
hdvar_get_stamp(hdvar): stamp
//
overload .stamp with hdcon_get_stamp
overload .stamp with hdcst_get_stamp
overload .stamp with hdvar_get_stamp
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
| HSTfun of
  (h0srtlst, h0srt(*res*)) // fun
//
(*
| HSTapp of
  ( h0srt(*fun*)
  , h0srtlst(*arg*)) // HX: not in use
*)
//
| HSTnone1 of (dataptr) // HX: for ignores
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
typedef labh0typ = slabeled(h0typ)
typedef labh0typlst = List0(labh0typ)
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
| H0Tfun of
  ( int(*npf*)
  , h0typlst(*arg*),h0typ(*res*)
  ) (* end of H0Tfun *)
//
| H0Tapp of (h0typ, h0typlst) // inst
| H0Tlam of (htvarlst, h0typ) // poly
//
| H0Ttyrec of
  (tyrec(*knd*), int(*npf*), labh0typlst)
//
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
fun
h0typ_make_node
(hst: h0srt, htn: h0typ_node): h0typ
//
(* ****** ****** *)
//
fun
print_hdvar: hdvar -> void
fun
prerr_hdvar: hdvar -> void
fun
fprint_hdvar: fprint_type(hdvar)
//
overload print with print_hdvar
overload prerr with prerr_hdvar
overload fprint with fprint_hdvar
//
(* ****** ****** *)
//
fun
hdcon_make_idtp
( loc: loc_t
, sym: sym_t, htp: h0typ): hdcon
fun
hdcst_make_idtp
( loc: loc_t
, sym: sym_t
, knd: tnode, htp: h0typ): hdcst
//
(* ****** ****** *)
//
fun
hdvar_make_idtp
( loc: loc_t
, sym: sym_t
, knd: tnode, htp: h0typ): hdvar
//
(* ****** ****** *)
//
fun
print_hdcon: hdcon -> void
fun
prerr_hdcon: hdcon -> void
fun
fprint_hdcon: fprint_type(hdcon)
//
overload print with print_hdcon
overload prerr with prerr_hdcon
overload fprint with fprint_hdcon
//
(* ****** ****** *)
//
fun
print_hdcst: hdcst -> void
fun
prerr_hdcst: hdcst -> void
fun
fprint_hdcst: fprint_type(hdcst)
//
overload print with print_hdcst
overload prerr with prerr_hdcst
overload fprint with fprint_hdcst
//
(* ****** ****** *)
//
datatype
h0pat_node =
//
| H0Pnil of ()
| H0Pany of () // wildcard
| H0Pvar of hdvar // variable
//
| H0Pcon of hdcon // cnstrctr
//
| H0Pbang of (h0pat)
| H0Pflat of (h0pat)
| H0Pfree of (h0pat)
//
| H0Pdapp of
  ( h0pat
  , int(*npf*), h0patlst)
//
| H0Ptuple of
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
hfarg_node =
//
| HFARGnpats of
  (int(*npf*), h0patlst)
//
| HFARGnone0 of ((*nil*))
//
| HFARGnone1 of (dataptr) // for ignores
//
(* ****** ****** *)
fun
hfarg_get_loc
( hfa: hfarg ) : loc_t
fun
hfarg_get_node
( hfa: hfarg ) : hfarg_node
//
overload .loc with hfarg_get_loc
overload .node with hfarg_get_node
(* ****** ****** *)
//
fun
print_hfarg: hfarg -> void
fun
prerr_hfarg: hfarg -> void
fun
fprint_hfarg: fprint_type(hfarg)
//
overload print with print_hfarg
overload prerr with prerr_hfarg
overload fprint with fprint_hfarg
//
(* ****** ****** *)
fun
hfarg_make_node
(loc0: loc_t, node: hfarg_node): hfarg
(* ****** ****** *)

datatype
htiarg =
| HTIARGnone of ()
| HTIARGsome of h0typlst

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
datatype
h0exp_node =
//
| H0Ei00 of (int)
| H0Eb00 of (bool)
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
| H0Evar of (hdvar)
| H0Evknd of
  (int(*knd*), hdvar)
//
| H0Efcon of (hdcon) // cnstr
| H0Etcon of (hdcon, htiarg)
//
| H0Efcst of (hdcst) // const
| H0Etcst of (hdcst, htiarg)
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
| H0Eseqn of
  (h0explst(*semi*), h0exp(*last*))
//
| H0Etuple of
  (int(*knd*), int(*npf*), h0explst)
//
| H0Eassgn of
  (h0exp(*l-val*), h0exp(*r-val*))
//
|
H0Eif0 of
( h0exp
, h0exp(*then*), h0expopt(*else*))
|
H0Ecase of
( int(*knd*)
, h0exp(*val*), h0claulst(*claues*))
//
| H0Elam of
  ( token(*knd*)
  , hfarglst(*arg*), h0exp(*body*) )
| H0Efix of
  ( token(*knd*)
  , hdvar(*fid*)
  , hfarglst(*arg*), h0exp(*body*) )
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
abstype htqarg_tbox = ptr
//
typedef htqarg = htqarg_tbox
typedef htqarglst = List0(htqarg)
typedef htqargopt = Option(htqarg)
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
htqarg_make
(loc0: loc_t, htvs: htvarlst): htqarg
(* ****** ****** *)
//
datatype
hfundecl =
HFUNDECL of @{
  loc= loc_t
, nam= hdvar
, hdc= hdcst
, hag=
  hfarglstopt
, def= h0expopt, rtp= h0typ
} where
  hfarglstopt = Option(hfarglst)
//
typedef hfundeclist = List0(hfundecl)
//
(* ****** ****** *)
//
fun
print_hfundecl: print_type(hfundecl)
fun
prerr_hfundecl: prerr_type(hfundecl)
fun
fprint_hfundecl: fprint_type(hfundecl)
//
overload print with print_hfundecl
overload prerr with prerr_hfundecl
overload fprint with fprint_hfundecl
//
(* ****** ****** *)
//
datatype
hvaldecl =
HVALDECL of @{
  loc= loc_t
, pat= h0pat
, def= h0expopt
(*
, ctp= t2pcast
*)
}
//
typedef
hvaldeclist = List0(hvaldecl)
//
(* ****** ****** *)
//
fun
hvaldecl_get_loc(hvaldecl): loc_t
//
overload .loc with hvaldecl_get_loc
//
(* ****** ****** *)
//
fun
print_hvaldecl: print_type(hvaldecl)
fun
prerr_hvaldecl: prerr_type(hvaldecl)
fun
fprint_hvaldecl: fprint_type(hvaldecl)
//
overload print with print_hvaldecl
overload prerr with prerr_hvaldecl
overload fprint with fprint_hvaldecl
//
(* ****** ****** *)
//
datatype
hvardecl =
HVARDECL of @{
  loc= loc_t
, hdv= hdvar
, wth= hdvaropt
, ini= h0expopt
}
//
typedef
hvardeclist = List0(hvardecl)
//
(* ****** ****** *)
//
fun
hvardecl_get_loc(hvardecl): loc_t
//
overload .loc with hvardecl_get_loc
//
(* ****** ****** *)
//
fun
print_hvardecl: print_type(hvardecl)
fun
prerr_hvardecl: prerr_type(hvardecl)
fun
fprint_hvardecl: fprint_type(hvardecl)
//
overload print with print_hvardecl
overload prerr with prerr_hvardecl
overload fprint with fprint_hvardecl
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
H0Cfundecl of
( token(*knd*)
, decmodopt
, htqarglst, hfundeclist)
//
|
H0Cvaldecl of
( token(*knd*)
, decmodopt, hvaldeclist)
|
H0Cvardecl of
( token(*knd*)
, decmodopt, hvardeclist)
//
|
H0Cexcptcon of (hdconlst)
(*
|
H0Cdatatype of (htcstlst)
*)
//
|
H0Cimpdecl3 of
( token(*impkind*)
, stamp(*unicity*)
, decmodopt
, htqargopt
, hdcst, htiarg, hfarglst, h0exp)
//
| H0Cnone1 of (dataptr) // HX: for ignores
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
