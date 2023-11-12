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
(*
HX-2023-11-12:
Sun Nov 12 15:36:27 EST 2023
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: October, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-10-30:
// level-1 intermediate representation
//
(* ****** ****** *)
#define
XATSOPT_targetloc
"./../../.."
(* ****** ****** *)
//
#staload
"{$XATSOPT}/SATS/xbasics.sats"
//
#staload
"{$XATSOPT}/SATS/xlabel0.sats"
#staload
"{$XATSOPT}/SATS/filpath.sats"
#staload
"{$XATSOPT}/SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload
LEX = "{$XATSOPT}/SATS/lexing0.sats"
//
(* ****** ****** *)
//
#staload
S1E = "{$XATSOPT}/SATS/staexp1.sats"
#staload
D1E = "{$XATSOPT}/SATS/dynexp1.sats"
//
#staload
S2E = "{$XATSOPT}/SATS/staexp2.sats"
#staload
S2T = "{$XATSOPT}/SATS/statyp2.sats"
#staload
D2E = "{$XATSOPT}/SATS/dynexp2.sats"
//
#staload
D3E = "{$XATSOPT}/SATS/dynexp3.sats"
//
(* ****** ****** *)

typedef g1exp = $S1E.g1exp
typedef d1exp = $D1E.d1exp

(* ****** ****** *)

typedef s2exp = $S2T.s2exp
typedef t2ype = $S2T.t2ype
typedef t2ypelst = $S2T.t2ypelst

(* ****** ****** *)

typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst
typedef d2var = $D2E.d2var
typedef f2arg = $D2E.f2arg

typedef f2arglst = $D2E.f2arglst

(* ****** ****** *)
//
typedef d3pat = $D3E.d3pat
typedef f3arg = $D3E.f3arg
typedef d3exp = $D3E.d3exp
typedef d3ecl = $D3E.d3ecl
//
typedef d3gua = $D3E.d3gua
typedef d3clau = $D3E.d3clau
typedef d3gpat = $D3E.d3gpat
//
typedef d3patlst = $D3E.d3patlst
typedef f3arglst = $D3E.f3arglst
//
typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst
//
typedef d3eclist = $D3E.d3eclist
//
typedef d3gualst = $D3E.d3gualst
typedef d3claulst = $D3E.d3claulst
//
(* ****** ****** *)

typedef ti2arg = $D2E.ti2arg
typedef ti3arg = $D3E.ti3arg
typedef ti2arglst = $D2E.ti2arglst

(* ****** ****** *)

abstype irpat_tbox = ptr
typedef irpat = irpat_tbox
typedef irpatlst = List0(irpat)

(* ****** ****** *)
//
abstype irdcl_tbox = ptr
typedef irdcl = irdcl_tbox
typedef irdclist = List0(irdcl)
//
typedef irdclistopt = Option(irdclist)
//
(* ****** ****** *)

abstype irexp_tbox = ptr
typedef irexp = irexp_tbox
typedef irexplst = List0(irexp)
typedef irexpopt = Option(irexp)

(* ****** ****** *)

abstype irgua_tbox = ptr
typedef irgua = irgua_tbox
typedef irgualst = List0(irgua)

abstype irclau_tbox = ptr
typedef irclau = irclau_tbox
typedef irclaulst = List0(irclau)

abstype irgpat_tbox = ptr
typedef irgpat = irgpat_tbox
typedef irgpatlst = List0(irgpat)

(* ****** ****** *)
//
typedef token = $LEX.token
//
(* ****** ****** *)

datatype
irpat_node =
//
| IRPnil of ()
| IRPany of ()
//
| IRPint of (int)
| IRPbtf of (bool)
| IRPchr of (char)
| IRPstr of string
//
| IRPvar of (d2var)
//
| IRPbang of (irpat)
| IRPflat of (irpat)
| IRPfree of (irpat)
//
| IRPcapp of (d2con, irpatlst)
//
| IRPtrcd1 of (int(*knd*), irpatlst)
//
| IRPnone0 of () | IRPnone1 of (d3pat)
//
(* ****** ****** *)
//
fun
irpat_get_loc
(x0: irpat): loc_t
fun
irpat_get_node
(x0: irpat): irpat_node
//
overload
.loc with irpat_get_loc
overload
.node with irpat_get_node
//
(* ****** ****** *)
//
fun
irpat_make_node
(loc_t, irpat_node): irpat
//
(* ****** ****** *)
//
fun
print_irpat: print_type(irpat)
fun
prerr_irpat: prerr_type(irpat)
overload print with print_irpat
overload prerr with prerr_irpat
//
fun
fprint_irpat: fprint_type(irpat)
overload fprint with fprint_irpat
//
(* ****** ****** *)
//
datatype
irarg =
| IRARGsome of
  (int(*npf*), irpatlst)
//
typedef
irarglst = List0(irarg)
typedef
irarglstopt = Option(irarglst)
//
(* ****** ****** *)
//
fun
print_irarg: print_type(irarg)
fun
prerr_irarg: prerr_type(irarg)
overload print with print_irarg
overload prerr with prerr_irarg
//
fun
fprint_irarg: fprint_type(irarg)
overload fprint with fprint_irarg
//
(* ****** ****** *)
//
datatype
irexp_node =
//
| IREi00 of (int)
| IREs00 of string
//
| IREint of (token)
| IREbtf of (token)
| IREchr of (token)
| IREflt of (token)
| IREstr of (token)
//
| IREtop of (token)
//
| IREvar of (d2var)
//
| IREcon1 of (d2con)
| IREcst1 of (d2cst)
//
| IREfcon of (d2con)
| IREfcst of (d2cst)
//
| IREtcon of
  ( d2con
  , ti3arg, ti2arglst)
| IREtcst of
  ( d2cst
  , ti3arg, ti2arglst)
//
| IREtimp of
  ( irexp, t2ypelst(*targ*)
  , irdcl, t2ypelst(*tsub*))
//
| IREdapp of
  ( irexp
  , int(*npf*), irexplst)
//
| IREtrcd1 of
  ( int(*knd*)
  , int(*npf*), irexplst)
//
| IREpcon of
  ( irexp, label(*proj*))
| IREpbox of
  ( irexp//trcd
  , label(*proj*), int(*index*))
//
| IREproj of
  ( irexp//trcd
  , label(*proj*), int(*index*))
| IREplft of
  ( irexp//trcd
  , label(*proj*), int(*index*))
| IREpptr of
  ( irexp//trcd
  , label(*proj*), int(*index*))
//
| IRElet of (irdclist, irexp)
| IREwhere of (irexp, irdclist)
//
| IREseqn of
  (irexplst(*semi*), irexp(*ret*))
//
| IREassgn of
  (irexp(*l-val*), irexp(*r-val*))
//
| IREift1 of
  ( irexp(*cond*)
  , irexp(*then*)
  , irexpopt(*else*))
//
| IREcase of
  ( int(*knd*)
  , irexp(*case*)
  , irclaulst(*clauses*))
//
| IRElam of
  (int(*knd*), irarglst, irexp)
| IREfix of
  (int(*knd*), d2var, irarglst, irexp)
//
| IREtry0 of (irexp, irclaulst)
//
| IREaddr of (irexp(*l-value*))
| IREflat of (irexp(*l-value*))
| IREtalf of (irexp(*IREflat*))
//
| IREfold of (irexp(*open-con*))
//
(*
// HX-2019-12-18:
// knd=0: general
// knd=1: ptr-dref
// knd=2: lazy-eval
// knd=3: llazy-eval
*)
| IREeval of
    (int(*knd*), irexp(*source*))
  // IREeval
//
(*
// HX-2020-09-26:
// knd=0: general
// knd=1: ptr-free
// knd=2: con-free
// knd=3: llazy-free
*)
| IREfree of
    (int(*knd*), irexp(*source*))
  // IREfree
//
| IREraise of (irexp(*lin-exn*))
//
| IRElazy of
  (irexp(*eval*))
| IREllazy of
  (irexp(*eval*), irexplst(*frees*))
//
| IREnone0 of () | IREnone1 of d3exp
//
(* ****** ****** *)
//
datatype
irgua_node =
| IRGUAexp of (irexp)
| IRGUAmat of (irexp, irpat)
//
datatype
irclau_node =
| IRCLAUpat of irgpat
| IRCLAUexp of (irgpat, irexp)
and
irgpat_node =
| IRGPATpat of (irpat)
| IRGPATgua of (irpat, irgualst)
//
(* ****** ****** *)
//
fun
irexp_get_loc
(x0: irexp): loc_t
fun
irexp_get_node
(x0: irexp): irexp_node
//
overload .loc with irexp_get_loc
overload .node with irexp_get_node
//
(* ****** ****** *)
//
fun
irexp_make_node
(loc_t, irexp_node): irexp
//
(* ****** ****** *)
//
fun
print_irexp: print_type(irexp)
fun
prerr_irexp: prerr_type(irexp)
overload print with print_irexp
overload prerr with prerr_irexp
//
fun
fprint_irexp: fprint_type(irexp)
overload fprint with fprint_irexp
//
(* ****** ****** *)
//
fun
irgua_get_loc
(x0: irgua): loc_t
fun
irgua_get_node
(x0: irgua): irgua_node
//
overload .loc with irgua_get_loc
overload .node with irgua_get_node
//
(* ****** ****** *)
//
fun
irgua_make_node
(loc_t, irgua_node): irgua
//
(* ****** ****** *)
//
fun
print_irgua: print_type(irgua)
fun
prerr_irgua: prerr_type(irgua)
overload print with print_irgua
overload prerr with prerr_irgua
//
fun
fprint_irgua: fprint_type(irgua)
overload fprint with fprint_irgua
//
(* ****** ****** *)
//
fun
irclau_get_loc
(x0: irclau): loc_t
fun
irclau_get_node
(x0: irclau): irclau_node
//
overload .loc with irclau_get_loc
overload .node with irclau_get_node
//
(* ****** ****** *)
//
fun
irclau_make_node
(loc_t, irclau_node): irclau
//
(* ****** ****** *)
//
fun
irgpat_get_loc
(x0: irgpat): loc_t
fun
irgpat_get_node
(x0: irgpat): irgpat_node
//
overload .loc with irgpat_get_loc
overload .node with irgpat_get_node
//
(* ****** ****** *)
//
fun
irgpat_make_node
(loc_t, irgpat_node): irgpat
//
(* ****** ****** *)
//
fun
print_irclau:print_type(irclau)
fun
prerr_irclau:prerr_type(irclau)
overload print with print_irclau
overload prerr with prerr_irclau
//
fun
print_irgpat:print_type(irgpat)
fun
prerr_irgpat:prerr_type(irgpat)
overload print with print_irgpat
overload prerr with prerr_irgpat
//
fun
fprint_irclau:fprint_type(irclau)
overload fprint with fprint_irclau
fun
fprint_irgpat:fprint_type(irgpat)
overload fprint with fprint_irgpat
//
(* ****** ****** *)
//
datatype
irvaldecl =
IRVALDECL of @{
  loc= loc_t
, pat= irpat
, def= irexpopt
}
//
typedef
irvaldeclist = List0(irvaldecl)
//
fun
print_irvaldecl(irvaldecl): void
fun
prerr_irvaldecl(irvaldecl): void
fun
fprint_irvaldecl: fprint_type(irvaldecl)
//
overload print with print_irvaldecl
overload prerr with prerr_irvaldecl
overload fprint with fprint_irvaldecl
//
(* ****** ****** *)
//
datatype
irvardecl =
IRVARDECL of @{
  loc= loc_t
, d2v= d2var
, ini= irexpopt
}
//
typedef
irvardeclist = List0(irvardecl)
//
fun
print_irvardecl(irvardecl): void
fun
prerr_irvardecl(irvardecl): void
fun
fprint_irvardecl: fprint_type(irvardecl)
//
overload print with print_irvardecl
overload prerr with prerr_irvardecl
overload fprint with fprint_irvardecl
//
(* ****** ****** *)
//
datatype
irfundecl =
IRFUNDECL of @{
  loc= loc_t
//
, nam= d2var
, d2c= d2cst
//
, f2g=
  f2arglst
, f3g=
  irarglstopt
//
, def= irexpopt
}
//
typedef
irfundeclist = List0(irfundecl)
//
fun
print_irfundecl(irfundecl): void
fun
prerr_irfundecl(irfundecl): void
fun
fprint_irfundecl: fprint_type(irfundecl)
//
overload print with print_irfundecl
overload prerr with prerr_irfundecl
overload fprint with fprint_irfundecl
//
(* ****** ****** *)
//
datatype
irdcl_node =
//
| IRCstatic of
  (token(*STATIC*), irdcl)
| IRCextern of
  (token(*EXTERN*), irdcl)
//
| IRCinclude of
  ( token
  , g1exp // src
  , int(*knd*) // sta/dyn: 0/1
  , filpathopt
  , irdclistopt) // file inclusion
//
| IRClocal of
  (irdclist, irdclist)
//
| IRCvaldclst of
  ( token(*knd*)
  , $D1E.decmodopt, irvaldeclist)
//
| IRCvardclst of
  ( token(*knd*)
  , $D1E.decmodopt, irvardeclist)
//
| IRCfundclst of
  ( token(*knd*)
  , $D1E.decmodopt
  , $D2E.tq2arglst, irfundeclist)
//
| IRCimplmnt3 of
  ( token(*impkind*)
  , $D1E.decmodopt
  , $D2E.sq2arglst
  , $D2E.tq2arglst
  , $D2E.impld2cst
  , $D3E.ti3arg
  , $D2E.ti2arglst
  , irarglst, irexp)
//
| IRCnone0 of () | IRCnone1 of (d3ecl)
//
(* ****** ****** *)
//
fun
irdcl_get_loc
(x0: irdcl): loc_t
fun
irdcl_get_node
(x0: irdcl): irdcl_node
//
overload
.loc with irdcl_get_loc
overload
.node with irdcl_get_node
//
(* ****** ****** *)
//
fun
irdcl_make_node
(loc_t, irdcl_node): irdcl
//
(* ****** ****** *)
//
fun
print_irdcl: print_type(irdcl)
fun
prerr_irdcl: prerr_type(irdcl)
overload print with print_irdcl
overload prerr with prerr_irdcl
//
fun
fprint_irdcl: fprint_type(irdcl)
overload fprint with fprint_irdcl
//
(* ****** ****** *)
//
fun
irerase_dpat(d3pat): irpat
fun
irerase_dpatlst(d3patlst): irpatlst
//
(* ****** ****** *)
//
fun
irerase_farglst(f3arglst): irarglst
//
(* ****** ****** *)
//
fun
irerase_dexp(d3exp): irexp
fun
irerase_dexpopt(d3expopt): irexpopt
fun
irerase_dexplst(d3explst): irexplst
//
(* ****** ****** *)

fun
irerase_dgua(d3gua): irgua
fun
irerase_dclau(d3clau): irclau
fun
irerase_dgpat(d3gpat): irgpat
fun
irerase_dgualst(d3gualst): irgualst
fun
irerase_dclaulst(d3claulst): irclaulst

(* ****** ****** *)
//
fun
irerase_decl(d3ecl): irdcl
fun
irerase_declist(d3eclist): irdclist
//
(* ****** ****** *)
//
fun
irerase_dvaldecl
(irvd0: $D3E.d3valdecl): irvaldecl
fun
irerase_dvaldeclist
(irvds: $D3E.d3valdeclist): irvaldeclist
//
(* ****** ****** *)
//
fun
irerase_dvardecl
(irvd0: $D3E.d3vardecl): irvardecl
fun
irerase_dvardeclist
(irvds: $D3E.d3vardeclist): irvardeclist
//
(* ****** ****** *)
//
fun
irerase_dfundecl
(irfd0: $D3E.d3fundecl): irfundecl
fun
irerase_dfundeclist
(irfds: $D3E.d3fundeclist): irfundeclist
//
(* ****** ****** *)

(* end of [intrep0.sats] *)
