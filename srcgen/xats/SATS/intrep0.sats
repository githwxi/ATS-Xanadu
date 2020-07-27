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
#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
(* ****** ****** *)

typedef dataptr = ptr

(* ****** ****** *)

abstype htcst_tbox = ptr
abstype htvar_tbox = ptr
typedef htcst = htcst_tbox
typedef htvar = htvar_tbox

(* ****** ****** *)
//
fun
htcst_stamp_new(): stamp
fun
htvar_stamp_new(): stamp
//
(* ****** ****** *)
//
abstype h0typ_tbox = ptr
//
typedef h0typ = h0typ_tbox
typedef h0typlst = List0(h0typ)
typedef h0typopt = Option(h0typ)
//
(* ****** ****** *)
//
abstype hdcon_tbox = ptr
abstype hdcst_tbox = ptr
typedef hdcon = hdcon_tbox
typedef hdcst = hdcst_tbox
//
abstype hdvar_tbox = ptr
typedef hdvar = hdvar_tbox
typedef hdvarlst = List0(hdvar)
typedef hdvaropt = Option(hdvar)
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
abstype h0pat_tbox = ptr
typedef h0pat = h0pat_tbox
typedef h0patlst = List0(h0pat)
typedef h0patopt = Option(h0pat)
//
(* ****** ****** *)
//
abstype h0exp_tbox = ptr
typedef h0exp = h0exp_tbox
typedef h0explst = List0(h0exp)
typedef h0expopt = Option(h0exp)
//
(* ****** ****** *)
//
abstype h0dcl_tbox = ptr
typedef h0dcl = h0dcl_tbox
typedef h0dclist = List0(h0dcl)
typedef h0dclopt = Option(h0dcl)
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
| HSTnone1 of (dataptr) // HX: for errors
//
where h0srtlst = List0(h0srt)

(* ****** ****** *)

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
datatype
h0typ_node =
// externally named
| H0Tbas of sym_t // type
//
| H0Tcst of htcst // constant
| H0Tvar of htvar // variable
//
| H0Tnone1 of (dataptr) // HX: for errors
//
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
, sym: symbol, htp: h0typ): hdcon
fun
hdcst_make_idtp
( loc: loc_t
, sym: symbol, htp: h0typ): hdcst
//
(* ****** ****** *)
//
fun
hdvar_make_idtp
( loc: loc_t
, sym: symbol, htp: h0typ): hdvar
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
| H0Pfcon of hdcon // cnstrctr
//
| H0Pdapp of
  (h0pat, int(*npf*), h0patlst)
//
| H0Pnone1 of (dataptr) // HX: for errors
//
(* ****** ****** *)
//
fun
h0pat_get_loc
( h0e: h0pat ) : loc_t
fun
h0pat_get_type
( h0e: h0pat ) : h0typ
fun
h0pat_get_node
( h0e: h0pat ) : h0pat_node
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
h0exp_node =
// externally named
| H0Evar of hdvar // variable
//
| H0Efcon of hdcon // cnstrctr
| H0Efcst of hdcst // constant
//
| H0Edapp of
  (h0exp, int(*npf*), h0explst)
//
| H0Elet of
  (h0dclist, h0exp(*sequence*))
//
| H0Eif0 of (h0exp, h0exp, h0expopt)
//
| H0Enone1 of (dataptr) // HX: for errors
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
// externally named
| H0Cinclude
//
| H0Clocal of
  (h0dclist(*head*), h0dclist(*body*))
//
|
H0Cvaldecl of
(token(*knd*), decmodopt, hvaldeclist)
|
H0Cvardecl of
(token(*knd*), decmodopt, hvardeclist)
(*
|
H0Cfundecl of
(token(*knd*), decmodopt, hfundeclist)
*)
//
| H0Cnone1 of (dataptr) // HX: for errors
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
(loc0: loc_t, hdcl: h0dcl_node): h0dcl
//
(* ****** ****** *)

(* end of [xats_intrep0.sats] *)
