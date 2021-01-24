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
// Start Time: April, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./xbasics.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
#staload "./dynexp3.sats"

(* ****** ****** *)
//
abstbox d4pat_tbox = ptr
typedef d4pat = d4pat_tbox
typedef d4patlst = List0(d4pat)
typedef d4patopt = Option(d4pat)
//
(* ****** ****** *)
//
abstbox f4arg_tbox = ptr
//
typedef f4arg = f4arg_tbox
typedef f4arglst = List0(f4arg)
typedef f4arglstopt = Option(f4arglst)
//
(* ****** ****** *)
//
abstbox d4exp_tbox = ptr
abstbox t3imp_tbox = ptr
//
typedef d4exp = d4exp_tbox
typedef d4explst = List0(d4exp)
typedef d4expopt = Option(d4exp)
typedef d4explstopt = Option(d4explst)
//
(* ****** ****** *)
//
abstbox d4gua_tbox = ptr
typedef d4gua = d4gua_tbox
typedef d4gualst = List0(d4gua)
//
abstbox d4gpat_tbox = ptr
typedef d4gpat = d4gpat_tbox
//
abstbox d4clau_tbox = ptr
typedef d4clau = d4clau_tbox
typedef d4claulst = List0(d4clau)
//
(* ****** ****** *)
//
abstbox d4ecl_tbox = ptr
//
typedef d4ecl = d4ecl_tbox
typedef d4eclist = List0(d4ecl)
typedef d4eclopt = Option(d4ecl)
//
typedef d4eclistopt = Option(d4eclist)
//
(* ****** ****** *)

datatype
d4pat_node =
//
| D4Pnil of ()
//
| D4Pany of ()
| D4Pvar of (d2var)
//
| D4Pint of (token)
| D4Pbtf of (token)
| D4Pchr of (token)
| D4Pflt of (token)
| D4Pstr of (token)
//
| D4Pcon1 of (d2con)
| D4Pcon2 of (d2conlst)
//
| D4Pbang of (d4pat) // !
| D4Pflat of (d4pat) // @
| D4Pfree of (d4pat) // ~
//
| D4Psym0 of
  (d1pat(*sym*), d2pitmlst)
//
| D4Psap0 of (d4pat, s2explst)
| D4Psap1 of (d4pat, s2explst)
//
| D4Pdap1 of (d4pat)
| D4Pdapp of
  (d4pat, int(*npf*), d4patlst)
//
| D4Ptuple of
  (int(*knd*), int(*npf*), d4patlst)
//
| D4Panno of (d4pat, s2exp) // no s2xtv in anno
//
| D4Ptcast of (d4pat, t2ype) // HX: error indication?
//
| D4Pnone0 of ()
| D4Pnone1 of (d3pat) | D4Pnone2 of (d4pat)
//
(* ****** ****** *)
//
fun
d4pat_get_loc
(d4p0: d4pat): loc_t
fun
d4pat_get_node
(d4p0: d4pat): d4pat_node
//
overload .loc with d4pat_get_loc
overload .node with d4pat_get_node
//
(* ****** ****** *)
//
fun
d4pat_get_type
(d4p0: d4pat): t2ype
fun
d4patlst_get_type
(d4ps: d4patlst): t2ypelst
//
overload .type with d4pat_get_type
//
(* ****** ****** *)
//
fun
d4pat_get_sexp
(d4p0: d4pat): s2exp
fun
d4patlst_get_sexp
(d4ps: d4patlst): s2explst
//
overload .sexp with d4pat_get_sexp
//
(* ****** ****** *)
//
fun
d4pat_make_node
( loc0: loc_t
, s2e0: s2exp
, t2p0: t2ype, node: d4pat_node): d4pat
//
(* ****** ****** *)
//
fun
print_d4pat: print_type(d4pat)
fun
prerr_d4pat: prerr_type(d4pat)
fun
fprint_d4pat: fprint_type(d4pat)
//
overload print with print_d4pat
overload prerr with prerr_d4pat
overload fprint with fprint_d4pat
//
(* ****** ****** *)
//
datatype
f4arg_node =
//
(*
| F4ARGnone of (token)
*)
//
| F4ARGnone2 of f2arg
| F4ARGnone3 of f3arg
//
| F4ARGsome_dyn of
  (int(*npf*), d4patlst)
//
| F4ARGsome_sta of
  (s2varlst(*s2vs*), s2explst(*s2ps*))
//
| F4ARGsome_met of (s2explst)
//
(* ****** ****** *)
//
fun
f4arg_get_loc(f4arg): loc_t
fun
f4arg_get_node(f4arg): f4arg_node
//
overload .loc with f4arg_get_loc
overload .node with f4arg_get_node
//
fun
print_f4arg : print_type(f4arg)
fun
prerr_f4arg : prerr_type(f4arg)
fun
fprint_f4arg : fprint_type(f4arg)
//
overload print with print_f4arg
overload prerr with prerr_f4arg
overload fprint with fprint_f4arg
//
(* ****** ****** *)
//
fun
f4arg_make_node
(loc: loc_t, node: f4arg_node): f4arg
//
(* ****** ****** *)

datatype
d4exp_node =
//
| D4Ei00 of (int)
| D4Eb00 of (bool)
| D4Ec00 of (char)
| D4Es00 of string
//
| D4Eint of (token)
| D4Ebtf of (token)
| D4Echr of (token)
| D4Eflt of (token)
| D4Estr of (token)
//
| D4Etop of (token)
//
| D4Evar of (d2var)
//
(*
| D4Eexist1 of
  (s2explst, d4exp)
| D4Eopenas of
  (s2varlst, s2explst, d4exp)
*)
//
| D4Enone0 of () | D4Enone1 of (d3exp)
//
(* ****** ****** *)
//
fun
d4exp_get_loc
(d4p0: d4exp): loc_t
fun
d4exp_get_node
(d4p0: d4exp): d4exp_node
//
overload .loc with d4exp_get_loc
overload .node with d4exp_get_node
//
(* ****** ****** *)
//
fun
d4exp_get_type
(d4p0: d4exp): t2ype
fun
d4explst_get_type
(d4ps: d4explst): t2ypelst
//
overload .type with d4exp_get_type
//
(* ****** ****** *)
//
fun
d4exp_get_sexp
(d4e0: d4exp): s2exp
fun
d4explst_get_sexp
(d4es: d4explst): s2explst
//
overload .sexp with d4exp_get_sexp
//
(* ****** ****** *)
//
fun
d4exp_none1(d3e0: d3exp): d4exp
//
(* ****** ****** *)
//
fun
d4exp_make_node
( loc0: loc_t
, s2e0: s2exp
, t2p0: t2ype, node: d4exp_node): d4exp
//
(* ****** ****** *)
//
fun
print_d4exp: print_type(d4exp)
fun
prerr_d4exp: prerr_type(d4exp)
fun
fprint_d4exp: fprint_type(d4exp)
//
overload print with print_d4exp
overload prerr with prerr_d4exp
overload fprint with fprint_d4exp
//
(* ****** ****** *)
//
datatype
f4undecl =
F4UNDECL of @{
  loc= loc_t
, nam= d2var
, d2c= d2cst
, a2g= f2arglst
//
, a4g=
    f4arglstopt
, res=
    effs2expopt
//
, def= d4expopt, rtp= t2ype
, wtp= s2expopt, ctp= t2pcast
}
//
typedef
f4undeclist = List0(f4undecl)
//
(* ****** ****** *)
//
datatype
d4ecl_node =
//
| D4Cnone0 of ()
| D4Cnone1 of (d3ecl)
//
| D4Cfundecl of
  ( token(*funknd*)
  , decmodopt
  , tq2arglst(*tmpargs*), f4undeclist)
//
(* ****** ****** *)
//
fun
d4ecl_get_loc
(d4cl: d4ecl): loc_t
fun
d4ecl_get_node
(d4cl: d4ecl): d4ecl_node
//
overload .loc with d4ecl_get_loc
overload .node with d4ecl_get_node
//
(* ****** ****** *)
//
fun
print_d4ecl: print_type(d4ecl)
fun
prerr_d4ecl: prerr_type(d4ecl)
fun
fprint_d4ecl: fprint_type(d4ecl)
//
overload print with print_d4ecl
overload prerr with prerr_d4ecl
overload fprint with fprint_d4ecl
//
(* ****** ****** *)
//
fun d4ecl_none0(loc_t): d4ecl
fun d4ecl_none1(d3ecl): d4ecl
//
fun
d4ecl_make_node
(loc: loc_t, node: d4ecl_node): d4ecl
//
(* ****** ****** *)

(* end of [xats_dynexp4.sats] *)
