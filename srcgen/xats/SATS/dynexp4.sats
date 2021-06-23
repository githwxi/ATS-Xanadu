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
#staload C0S = "./cstrnt0.sats"
(* ****** ****** *)

typedef c0str = $C0S.c0str

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
| D4Pi00 of (int)
| D4Pb00 of (bool)
| D4Pc00 of (char)
| D4Ps00 of string
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
| D4Psapx of
  ( d4pat
  , s2explst, s2explst(*prop*))
//
(*
| D4Popnx of
  ( d4pat, s2xtv(*deexi*) )
*)
| D4Popny of
  ( d4pat
  , s2varlst, s2explst(*prop*))
//
(*
// HX-2021-03-21:
// There is no [D4Pdap0] as
// it is merged into [D4Pdapp]!
*)
| D4Pdap1 of (d4pat) // argness
| D4Pdapp of
  (d4pat, int(*npf*), d4patlst)
//
| D4Ptuple of
  (int(*knd*), int(*npf*), d4patlst)
//
| D4Panno of
  ( d4pat
  , s1exp, s2exp) // no s2xtv in anno
//
| D4Ptasmp of
  ( d4pat, c0str) // cstrnt generation
(*
| D4Ptcast of
  ( d4pat, c0str) // cstrnt generation
*)
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
d4pat_none1(d3p0: d3pat): d4pat
//
(* ****** ****** *)
fun
d4pat_tasmp
(d4p1: d4pat, s2e2: s2exp): d4pat
fun
d4pat_tcast
(d4p1: d4pat, s2e2: s2exp): d4pat
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
//
datatype
ti4arg =
| TI4ARGnone of ()
| TI4ARGsome of s2explst
//
(* ****** ****** *)
//
fun
print_ti4arg: print_type(ti4arg)
fun
prerr_ti4arg: prerr_type(ti4arg)
fun
fprint_ti4arg: fprint_type(ti4arg)
//
overload print with print_ti4arg
overload prerr with prerr_ti4arg
overload fprint with fprint_ti4arg
//
(* ****** ****** *)

abstype
stmap_type = ptr
typedef
stmap = stmap_type

(* ****** ****** *)
//
fun
stmap_nil(): stmap
//
fun
stmap_ismem
( dtm0
: stmap, d2v0: d2var ): bool
//
fun
stmap_insert
( dtm0:
& stmap >> _
, d2v0
: d2var, s2e0: s2exp ): bool
//
fun
stmap_listize
( dtm0
: stmap )
: List0_vt( @(d2var, s2exp) )
//
(* ****** ****** *)
//
fun
print_stmap(dtm0: stmap): void
fun
prerr_stmap(dtm0: stmap): void
fun
fprint_stmap
( out: FILEref, dtm0: stmap): void
//
overload print with print_stmap
overload prerr with prerr_stmap
overload fprint with fprint_stmap
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
(*
HX-2021-03:
For trans3x:
Please see trans3x_envmap
for the meaning of knd
*)
| D4Ekvar of
  (int(*kind*), d2var)
//
| D4Efcon of (d2con)
| D4Efcst of (d2cst)
//
| D4Etcon of
  ( d2con
  , ti4arg(*s2es*)
  , ti3arg(*t2ps*)
  , ti2arglst(*sess*))
| D4Etcst of
  ( d2cst
  , ti4arg(*s2es*)
  , ti3arg(*t2ps*)
  , ti2arglst(*sess*))
//
| D4Etimp of
  ( stamp
  , d4exp(*tcst*), t2ypelst(*targ*)
  , d4ecl(*impl*), t2ypelst(*tsub*)
  ) (* end of [D4timp] *)
//
| D4Esap0 of (d4exp, s2explst)
| D4Esap1 of (d4exp, s2explst)
//
| D4Esapx of
  ( d4exp
  , s2explst, s2explst(*prop*))
(*
| D4Esmet of (d4exp, s2explst)
*)
//
(*
| D4Eopnx of
  ( d4exp, s2xtv(*deexi*) )
*)
| D4Eopny of
  ( d4exp
  , s2varlst, s2explst(*prop*))
//
| D4Edapp of
  (d4exp, int(*npf*), d4explst)
| D4Edapq of
  (d4exp, int(*npf*), d4explst)
//
| D4Elet of
  (d4eclist, d4exp(*sequence*))
| D4Ewhere of (d4exp, d4eclist)
//
| D4Eseqn of
  (
  d4explst(*semi*), d4exp(*last*)
  )
//
| D4Eassgn of
  ( d4exp(*lval*), d4exp(*rval*) )
//
| D4Eif0 of
  ( d4exp
  , d4exp(*then*), d4expopt(*else*))
//
| D4Ecas0 of
  (int(*knd*), d4exp(*val*), d4claulst)
//
| D4Eaddr of d4exp(*l-value*)
//
| D4Eflat of d4exp(*l-value*)
| D4Etalf of d4exp(*D4Eflat*)
//
| D4Eanno of
  (d4exp, s1exp(*anno*), s2exp(*type*))
//
(*
| D4Eexist1 of
  ( s2explst(*wits*), d4exp(*packed*) )
*)
//
| D4Estmap of
  (d4exp, stmap) // linear vtype changes
//
| D4Etcast of
  (d4exp, c0str) // constraint generation
//
| D4Eleakd of (d4exp) // [d4exp] is linear
//
| D4Enone0 of ()
| D4Enone1 of (d3exp) | D4Enone2 of (d4exp)
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
fun
d4exp_none2(d4e0: d4exp): d4exp
//
(* ****** ****** *)
fun
d4exp_tcast
(d4e1: d4exp, s2e2: s2exp): d4exp
(* ****** ****** *)
fun
d4exp_leakify(d4e0: d4exp): d4exp
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
d4gua_node =
| D4GUAexp of (d4exp)
| D4GUAmat of (d4exp, d4pat)
//
fun
d4gua_get_loc(d4gua): loc_t
fun
d4gua_get_node(d4gua): d4gua_node
//
overload .loc with d4gua_get_loc
overload .node with d4gua_get_node
//
fun print_d4gua : (d4gua) -> void
fun prerr_d4gua : (d4gua) -> void
fun fprint_d4gua : fprint_type(d4gua)
//
overload print with print_d4gua
overload prerr with prerr_d4gua
overload fprint with fprint_d4gua
//
fun
d4gua_make_node
(loc: loc_t, node: d4gua_node): d4gua
//
(* ****** ****** *)
//
datatype
d4clau_node =
| D4CLAUpat of d4gpat
| D4CLAUexp of (d4gpat, d4exp)
and
d4gpat_node =
| D4GPATpat of (d4pat)
| D4GPATgua of (d4pat, d4gualst)
//
(* ****** ****** *)
//
fun
d4clau_get_loc(d4clau): loc_t
fun
d4clau_get_node(d4clau): d4clau_node
//
overload .loc with d4clau_get_loc
overload .node with d4clau_get_node
//
fun
d4gpat_get_loc(d4gpat): loc_t
fun
d4gpat_get_node(d4gpat): d4gpat_node
//
overload .loc with d4gpat_get_loc
overload .node with d4gpat_get_node
//
(* ****** ****** *)
//
fun
print_d4gpat : (d4gpat) -> void
fun
prerr_d4gpat : (d4gpat) -> void
fun
fprint_d4gpat : fprint_type(d4gpat)
//
overload print with print_d4gpat
overload prerr with prerr_d4gpat
overload fprint with fprint_d4gpat
//
fun
print_d4clau : (d4clau) -> void
fun
prerr_d4clau : (d4clau) -> void
fun
fprint_d4clau : fprint_type(d4clau)
//
overload print with print_d4clau
overload prerr with prerr_d4clau
overload fprint with fprint_d4clau
//
(* ****** ****** *)
//
fun
d4clau_make_node
(loc: loc_t, node: d4clau_node): d4clau
fun
d4gpat_make_node
(loc: loc_t, node: d4gpat_node): d4gpat
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
fun
print_f4undecl: print_type(f4undecl)
fun
prerr_f4undecl: prerr_type(f4undecl)
fun
fprint_f4undecl: fprint_type(f4undecl)
//
(* ****** ****** *)
//
datatype
v4aldecl =
V4ALDECL of @{
  loc= loc_t
, pat= d4pat
, def= d4expopt
, wtp= s2expopt
(*
, ctp= t2pcast
*)
}
//
typedef
v4aldeclist = List0(v4aldecl)
//
(* ****** ****** *)
//
fun
print_v4aldecl: print_type(v4aldecl)
fun
prerr_v4aldecl: prerr_type(v4aldecl)
fun
fprint_v4aldecl: fprint_type(v4aldecl)
//
(* ****** ****** *)
//
datatype
v4ardecl =
V4ARDECL of @{
  loc= loc_t
, d2v= d2var
, wth= d2varopt
, res= s2expopt
, ini= d4expopt
}
//
typedef
v4ardeclist = List0(v4ardecl)
//
(* ****** ****** *)
//
fun
print_v4ardecl: print_type(v4ardecl)
fun
prerr_v4ardecl: prerr_type(v4ardecl)
fun
fprint_v4ardecl: fprint_type(v4ardecl)
//
(* ****** ****** *)
//
datatype
d4transd =
D4TRANSD of @{
  stadyn= int
, source= filpath
, transd=
  Option(d4eclist)
} where
  filpath= $FP0.filpath
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
| D4Cvaldecl of
  (token(*knd*), decmodopt, v4aldeclist)
| D4Cvardecl of
  (token(*knd*), decmodopt, v4ardeclist)
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
