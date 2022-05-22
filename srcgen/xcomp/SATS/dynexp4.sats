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
#define
ATS_PACKNAME
"ATS3.XANADU.libxatsopt"
(* ****** ****** *)
//
#staload "./xbasics.sats"
//
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
abstbox f4arg_tbox = ptr
//
typedef d4pat = d4pat_tbox
typedef d4patlst = List0(d4pat)
typedef d4patopt = Option(d4pat)
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
| D4Ptrcd1 of
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
//
abstype dlocs_type = ptr
abstype stmap_type = ptr
typedef dlocs = dlocs_type
typedef stmap = stmap_type
//
(* ****** ****** *)
//
abstype stmrg_type = ptr
typedef stmrg = stmrg_type
//
(* ****** ****** *)
//
fun
dlocs_nil(): dlocs
fun
dlocs_ismem
( dvrs
: dlocs, d2v0: d2var ): bool
//
fun
dlocs_insert
( dvrs
: dlocs, d2v0: d2var ): dlocs
//
fun
dlocs_listize
(dvrs: dlocs): List0_vt(d2var)
//
(* ****** ****** *)
//
fun
print_dlocs(d2vs: dlocs): void
fun
prerr_dlocs(d2vs: dlocs): void
fun
fprint_dlocs
(out: FILEref, d2vs: dlocs): void
//
overload print with print_dlocs
overload prerr with prerr_dlocs
overload fprint with fprint_dlocs
//
(* ****** ****** *)
//
fun
stmap_nil(): stmap
//
fun
stmap_ismem
( stmp
: stmap, d2v0: d2var ): bool
//
fun
stmap_insert
( stmp:
& stmap >> _
, d2v0
: d2var, s2e0: s2exp ): bool
//
fun
stmap_remove
( stmp:
& stmap >> _, d2v0: d2var): bool
//
fun
stmap_listize
( stmp
: stmap )
: List0_vt( @(d2var, s2exp) )
//
(* ****** ****** *)
fun
{env:vt0p}
stmap_foreach$fwork
( k0: d2var
, x0: s2exp, env: &(env) >> _): void
fun
{env:vt0p}
stmap_foreach_env
(map: stmap, env: &(env) >> _): void
(* ****** ****** *)
//
fun
print_stmap(map0: stmap): void
fun
prerr_stmap(map0: stmap): void
fun
fprint_stmap
(out: FILEref, map0: stmap): void
//
overload print with print_stmap
overload prerr with prerr_stmap
overload fprint with fprint_stmap
//
(* ****** ****** *)
//
datatype
dvcast = DVCAST of
(d2var, s2exp, s2exp)
//
(* ****** ****** *)
fun
stmrg_make
(xs: List0(dvcast)): stmrg
(* ****** ****** *)
//
fun
stmrg_listize
( mrg0
: stmrg )
: List0_vt
  ( @(d2var, s2exp, s2exp) )
//
(* ****** ****** *)
//
fun
print_stmrg(mrg: stmrg): void
fun
prerr_stmrg(mrg: stmrg): void
fun
fprint_stmrg
( out: FILEref, mrg: stmrg): void
//
overload print with print_stmrg
overload prerr with prerr_stmrg
overload fprint with fprint_stmrg
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
| D4Evmut of (d2var)
*)
//
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
| D4Edarg of
  (d4exp, int(*knd*), s2exp(*aft*))
//
| D4Eproj of
  (d4exp(*flt*),
   label(*proj*), int(*index*))
| D4Eplft of
  (d4exp(*flt*),
   label(*proj*), int(*index*))
| D4Epptr of
  (d4exp(*ptr*),
   label(*proj*), int(*index*))
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
| D4Etrcd1 of // HX: tuple
  (int(*knd*), int(*npf*), d4explst)
(*
| D4Etrcd2 of // HX: record
  (int(*knd*), int(*npf*), d4explst)
*)
//
| D4Eassgn of
  ( d4exp(*l-val*)
  , d4exp(*r-val*), d4err(*error*))
| D4Eupdtd of
  ( d4exp(*l-val*)
  , s2exp(*r-val*), d4err(*error*))
//
| D4Eif0 of
  ( d4exp
  , d4exp(*then*), d4expopt(*else*))
//
| D4Ecas0 of
  (int(*knd*), d4exp(*val*), d4claulst)
//
(*
| D4Elval of
  (d4lft(*proof*), d4exp)
*)
//
| D4Eaddr of d4exp(*l-value*)
//
| D4Eflat of
  (d4exp(*l-value*), Option(s2xtv))
| D4Etalf of
  (d4exp(*D4Eflat*), Option(s2xtv))
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
| D4Estmrg of
  (d4exp, stmrg) // linear vtype merging
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
(*
and
d4lft =
//
| D4ELFTnone of ()
//
| D4ELFTroot of (d4exp)
//
| D4ELFTproj of
  (d4lft, label(*proj*), int(*index*))
*)
//
(* ****** ****** *)
//
and
d4err =
//
| D4ERRnone of ()
//
| D4ERRupdtd0 of ()
| D4ERRupdtd1 of
  (d2var(*d2w1*), s2exp) // update failure
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
d4exp_dapq
( dapp: d4exp
, npf1: int(*pfarity*)
// HX:
// Some of [args] are l-values
, d4es: d4explst(*args*)): d4exp
fun
d4exp_darg
( darg: d4exp
, knd0: int, saft: s2exp): d4exp
(* ****** ****** *)
fun
d4exp_stmap
(d4e1: d4exp, map2: stmap): d4exp
fun
d4exp_stmrg
(d4e1: d4exp, mrg2: stmrg): d4exp
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
(*
fun
print_d4lft: print_type(d4lft)
fun
prerr_d4lft: prerr_type(d4lft)
fun
fprint_d4lft: fprint_type(d4lft)
//
overload print with print_d4lft
overload prerr with prerr_d4lft
overload fprint with fprint_d4lft
*)
//
(* ****** ****** *)
//
fun
print_d4err: print_type(d4err)
fun
prerr_d4err: prerr_type(d4err)
fun
fprint_d4err: fprint_type(d4err)
//
overload print with print_d4err
overload prerr with prerr_d4err
overload fprint with fprint_d4err
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
| D4CLAUexp of
  (d4gpat, d4exp, stmap)
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
fun
d4gpat_get_dlocs(d4gpat): dlocs
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
d4fundecl =
D4FUNDECL of @{
  loc= loc_t
, nam= d2var
, d2c= d2cst
, f2g= f2arglst
//
, f4g=
  (f4arglstopt)
, res=
  (effs2expopt)
//
, def= d4expopt, rtp= t2ype
, wtp= s2expopt, ctp= t2pcast
}
//
typedef
d4fundeclist = List0(d4fundecl)
//
(* ****** ****** *)
//
fun
print_d4fundecl: print_type(d4fundecl)
fun
prerr_d4fundecl: prerr_type(d4fundecl)
fun
fprint_d4fundecl: fprint_type(d4fundecl)
//
(* ****** ****** *)
//
datatype
d4valdecl =
D4VALDECL of @{
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
d4valdeclist = List0(d4valdecl)
//
(* ****** ****** *)
//
fun
print_d4valdecl: print_type(d4valdecl)
fun
prerr_d4valdecl: prerr_type(d4valdecl)
fun
fprint_d4valdecl: fprint_type(d4valdecl)
//
(* ****** ****** *)
//
datatype
d4vardecl =
D4VARDECL of @{
  loc= loc_t
, d2v= d2var
, d2w= d2var
, s2e= s2exp
, wth= d2varopt
, res= s2expopt
, ini= d4expopt
}
//
typedef
d4vardeclist = List0(d4vardecl)
//
(* ****** ****** *)
//
fun
print_d4vardecl: print_type(d4vardecl)
fun
prerr_d4vardecl: prerr_type(d4vardecl)
fun
fprint_d4vardecl: fprint_type(d4vardecl)
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
|
D4Cfundclst of
( token(*funknd*)
, decmodopt
, tq2arglst(*tmpargs*), d4fundeclist)
//
|
D4Cvaldclst of
(token(*knd*), decmodopt, d4valdeclist)
|
D4Cvardclst of
(token(*knd*), decmodopt, d4vardeclist)
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
//
datatype
d2vmrg2 = D2VMRG2 of
( d2var
, s2expopt(*then*)
, s2expopt(*else*))
datatype
d2vmrgs = D2VMRGS of
( d2var, List0(s2expopt))
//
(* ****** ****** *)
fun
print_d2vmrg2(d2vmrg2): void
fun
prerr_d2vmrg2(d2vmrg2): void
fun
fprint_d2vmrg2: fprint_type(d2vmrg2)
(* ****** ****** *)
fun
print_d2vmrgs(d2vmrgs): void
fun
prerr_d2vmrgs(d2vmrgs): void
fun
fprint_d2vmrgs: fprint_type(d2vmrgs)
(* ****** ****** *)
//
fun
stmap2_d2vmrg
( map1: stmap
, map2: stmap): List0(d2vmrg2)
//
(*
fun
stmap1l_d2vmrg
( map1: stmap): List0(d2vmrg2)
fun
stmap1r_d2vmrg
( map1: stmap): List0(d2vmrg2)
*)
//
(* ****** ****** *)
//
(*
fun
stmaplst_d2vmrg
(maps: List0(stmap)): List0(d2vmrgs)
*)
fun
d4claulst_d2vmrg
(dcls: List0(d4clau)): List0(d2vmrgs)
//
(* ****** ****** *)

(* end of [xats_dynexp4.sats] *)
