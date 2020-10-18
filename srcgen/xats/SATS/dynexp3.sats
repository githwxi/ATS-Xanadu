(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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

#staload "./basics.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"

(* ****** ****** *)
//
abstbox d3pat_tbox = ptr
typedef d3pat = d3pat_tbox
typedef d3patlst = List0(d3pat)
typedef d3patopt = Option(d3pat)
//
(* ****** ****** *)
//
abstbox f3arg_tbox = ptr
//
typedef f3arg = f3arg_tbox
typedef f3arglst = List0(f3arg)
typedef f3arglstopt = Option(f3arglst)
//
(* ****** ****** *)
//
abstbox d3exp_tbox = ptr
abstbox t3imp_tbox = ptr
//
typedef d3exp = d3exp_tbox
typedef d3explst = List0(d3exp)
typedef d3expopt = Option(d3exp)
typedef d3explstopt = Option(d3explst)
//
typedef t3imp = t3imp_tbox
typedef t3implst = List0(t3imp)
//
(* ****** ****** *)
//
abstbox d3gua_tbox = ptr
typedef d3gua = d3gua_tbox
typedef d3gualst = List0(d3gua)
//
abstbox d3gpat_tbox = ptr
typedef d3gpat = d3gpat_tbox
//
abstbox d3clau_tbox = ptr
typedef d3clau = d3clau_tbox
typedef d3claulst = List0(d3clau)
//
(* ****** ****** *)
//
abstbox d3ecl_tbox = ptr
//
typedef d3ecl = d3ecl_tbox
typedef d3eclist = List0(d3ecl)
typedef d3eclopt = Option(d3ecl)
//
typedef d3eclistopt = Option(d3eclist)
//
(* ****** ****** *)

datatype
d3pat_node =
//
| D3Pnil of ()
//
| D3Pany of ()
| D3Pvar of (d2var)
//
| D3Pint of (token)
| D3Pbtf of (token)
| D3Pchr of (token)
| D3Pflt of (token)
| D3Pstr of (token)
//
| D3Pcon1 of (d2con)
| D3Pcon2 of (d2conlst)
//
| D3Pbang of (d3pat) // !
| D3Pflat of (d3pat) // @
| D3Pfree of (d3pat) // ~
//
| D3Psym0 of
  (d1pat(*sym*), d2pitmlst)
//
| D3Psap0 of (d3pat, s2explst)
| D3Psap1 of (d3pat, s2explst)
//
| D3Pdapp of (d3pat, int(*npf*), d3patlst)
//
| D3Ptuple of
  (int(*knd*), int(*npf*), d3patlst)
//
| D3Panno of (d3pat, s2exp) // no s2xtv in anno
//
| D3Ptcast of (d3pat, t2ype) // HX: error indication?
//
| D3Pnone0 of ()
| D3Pnone1 of (d2pat) | D3Pnone2 of (d3pat)
//
(* ****** ****** *)
//
fun
d3pat_get_loc
(d3p0: d3pat): loc_t
fun
d3pat_get_node
(d3p0: d3pat): d3pat_node
//
overload .loc with d3pat_get_loc
overload .node with d3pat_get_node
//
(* ****** ****** *)
//
fun
d3pat_get_type
(d3p0: d3pat): t2ype
fun
d3patlst_get_type
(d3ps: d3patlst): t2ypelst
//
overload .type with d3pat_get_type
//
(* ****** ****** *)
//
fun
print_d3pat: print_type(d3pat)
fun
prerr_d3pat: prerr_type(d3pat)
fun
fprint_d3pat: fprint_type(d3pat)
//
overload print with print_d3pat
overload prerr with prerr_d3pat
overload fprint with fprint_d3pat
//
(* ****** ****** *)
//
fun
d3pat_nil
(loc0: loc_t): d3pat
//
fun
d3pat_any
(loc0: loc_t, t2p0: t2ype): d3pat
fun
d3pat_var
(loc0: loc_t, d2v0: d2var): d3pat
//
(* ****** ****** *)

fun
d3pat_int
(loc0: loc_t, tok0: token): d3pat
fun
d3pat_btf
(loc0: loc_t, tok0: token): d3pat
fun
d3pat_chr
(loc0: loc_t, tok0: token): d3pat

(* ****** ****** *)

fun
d3pat_anno
(d3p0: d3pat, s2e0: s2exp): d3pat

(* ****** ****** *)
//
fun
d3pat_tcast
(d3p0: d3pat, t2p0: t2ype): d3pat
//
(* ****** ****** *)
//
fun
d3pat_memq_dvar
(d3p0: d3pat, d2v0: d2var): bool
fun
d3patlst_memq_dvar
(d3ps: d3patlst, d2v0: d2var): bool
//
(* ****** ****** *)
//
fun
d3pat_make_node
( loc0: loc_t
, t2p0: t2ype, node: d3pat_node): d3pat
//
(* ****** ****** *)
//
datatype
f3arg_node =
//
(*
| F3ARGnone of (token)
*)
//
| F3ARGnone2 of f2arg
| F3ARGnone3 of f3arg
//
| F3ARGsome_dyn of
  (int(*npf*), d3patlst)
//
| F3ARGsome_sta of
  (s2varlst(*s2vs*), s2explst(*s2ps*))
//
| F3ARGsome_met of (s2explst)
//
(* ****** ****** *)
//
fun
f3arg_get_loc(f3arg): loc_t
fun
f3arg_get_node(f3arg): f3arg_node
//
overload .loc with f3arg_get_loc
overload .node with f3arg_get_node
//
fun
print_f3arg : print_type(f3arg)
fun
prerr_f3arg : prerr_type(f3arg)
fun
fprint_f3arg : fprint_type(f3arg)
//
overload print with print_f3arg
overload prerr with prerr_f3arg
overload fprint with fprint_f3arg
//
(* ****** ****** *)
//
fun
f3arg_memq_dvar
(f3a0: f3arg, d2v0: d2var): bool
fun
f3arglst_memq_dvar
(f3as: f3arglst, d2v0: d2var): bool
//
(* ****** ****** *)
//
fun
f3arg_make_node
(loc: loc_t, node: f3arg_node): f3arg
//
(* ****** ****** *)
//
datatype
ti3arg =
| TI3ARGnone of ()
| TI3ARGsome of t2ypelst
//
(* ****** ****** *)
//
fun
print_ti3arg: print_type(ti3arg)
fun
prerr_ti3arg: prerr_type(ti3arg)
fun
fprint_ti3arg: fprint_type(ti3arg)
//
overload print with print_ti3arg
overload prerr with prerr_ti3arg
overload fprint with fprint_ti3arg
//
(* ****** ****** *)

datatype
d3exp_node =
//
| D3Ei00 of (int)
| D3Eb00 of (bool)
| D3Es00 of string
//
| D3Eint of (token)
| D3Ebtf of (token)
| D3Echr of (token)
| D3Eflt of (token)
| D3Estr of (token)
//
| D3Etop of (token)
//
| D3Evar of (d2var)
//
(*
HX-2020-06:
For trans3x:
Please see trans3x_envmap
for the meaning of knd
*)
| D3Evknd of
  (int(*knd*), d2var)
//
| D3Econ1 of (d2con)
| D3Ecst1 of (d2cst)
| D3Econ2 of (d2conlst)
| D3Ecst2 of (d2cstlst)
//
| D3Esym0 of
  (d1exp(*sym*), d2pitmlst)
//
| D3Efcon of (d2con)
| D3Etcon of
  ( d2con
  , ti3arg(*s2es*)
  , ti2arglst(*sess*))
//
| D3Efcst of (d2cst)
| D3Etcst of
  ( d2cst
  , ti3arg(*s2es*)
  , ti2arglst(*sess*))
//
| D3Etnfd of
  ( d3exp(*tcst*)
  , t3implst (*path*) )
| D3Etrec of
  ( d3exp(*tcst*)
  , t3implst (*path*) )
//
| D3Etimp of
  ( stamp
  , d3exp(*tcst*), t2ypelst(*targ*)
  , d3ecl(*impl*), t2ypelst(*tsub*)
  ) (* end of [D3Etimp] *)
//
| D3Esap0 of (d3exp, s2explst)
| D3Esap1 of (d3exp, s2explst)
//
| D3Etapp of (d2exp, s2explst)
//
| D3Edapp of
  (d3exp, int(*npf*), d3explst)
//
| D3Epcon of
  (d3exp(*con*), label(*proj*))
| D3Epbox of
  (d3exp(*box*),
   label(*proj*), int(*index*))
//
| D3Eproj of
  (d3exp(*flt*),
   label(*proj*), int(*index*))
| D3Eplft of
  (d3exp(*flt*),
   label(*proj*), int(*index*))
| D3Epptr of
  (d3exp(*ptr*),
   label(*proj*), int(*index*))
//
| D3Elet of
  (d3eclist, d3exp(*sequence*))
| D3Ewhere of (d3exp, d3eclist)
//
| D3Eseqn of
  (d3explst(*semi*), d3exp(*last*))
//
| D3Etuple of
  (int(*knd*), int(*npf*), d3explst)
//
| D3Eassgn of
  (d3exp(*lval*), d3exp(*rval*))
//
| D3Ebrack of
  (d2pitmlst(*[]*), d3explst)
| D3Edtsel of
  ( label
  , d2pitmlst
  , int(*npf*), d3explstopt(*arg*))
//
| D3Eif0 of
  ( d3exp(*cond*)
  , d3exp(*then*), d3expopt(*else*))
//
| D3Ecase of
  (int(*knd*), d3exp(*val*), d3claulst)
  // D3Ecase
//
| D3Elam of
  ( token(*knd*)
  , f3arglst(*arg*)
  , effs2expopt, f1unarrow, d3exp(*body*))
| D3Efix of
  ( token(*knd*)
  , d2var(*fid*)
  , f3arglst(*arg*)
  , effs2expopt, f1unarrow, d3exp(*body*))
//
| D3Etry0 of
    (token(*TRY*), d3exp(*val*), d3claulst)
  // D3Etry0
//
| D3Eaddr of d3exp(*l-value*)
//
| D3Eflat of d3exp(*l-value*)
| D3Etalf of d3exp(*D3Eflat*)
//
| D3Efold of d3exp(*open-con*)
// HX-2019-12-18:
// kind=0: undecided
// kind=1: derefence
// kind=2: lazy-eval
// kind=3: llazy-eval
| D3Eeval of
  (int(*kind*), d3exp(*src*))
| D3Efree of
  (int(*kind*), d3exp(*src*))
//
| D3Eraise of d3exp(*lin-exn*)
//
// HX: for lazy-evaluation
| D3Elazy of
  (d3exp(*eval*)) // nonlin
| D3Ellazy of
  ( d3exp(*eval*)
  , d3explst(*frees*)) // linear
//
| D3Eanno of (d3exp, s2exp(*anno*))
//
| D3Elcast of (d3exp, label(*given*))
| D3Etcast of (d3exp, t2ype(*given*))
//
| D3Enone0 of ()
| D3Enone1 of (d2exp) | D3Enone2 of (d3exp)
//
(* ****** ****** *)

fun
d3timp_stamp_new(): stamp

(* ****** ****** *)
//
castfn
d3exp2t3imp : d3exp -> t3imp
castfn
t3imp2d3exp : t3imp -> d3exp
overload t3imp with d3exp2t3imp
overload d3exp with t3imp2d3exp
//
(* ****** ****** *)
//
fun
d3exp_get_loc(d3exp): loc_t
fun
d3exp_get_node(d3exp): d3exp_node
//
overload .loc with d3exp_get_loc
overload .node with d3exp_get_node
//
(* ****** ****** *)
//
fun
d3exp_get_type
(d3e0: d3exp): t2ype
fun
d3explst_get_type
(d3es: d3explst): t2ypelst
fun
d3expopt_get_type
(opt0: d3expopt): t2ypeopt
//
overload .type with d3exp_get_type
//
(*
fun
d3exp_set_type0
(d3e: d3exp, t2p: t2ype): void
fun
d3exp_set_type1
(d3e: d3exp, t2p: t2ype): d3exp
overload .type0 with d3exp_set_type0
overload .type1 with d3exp_set_type1
*)
//
(* ****** ****** *)
//
fun
d3exp_none0_0
(loc0: loc_t): d3exp
fun
d3exp_none0_1
(loc0: loc_t, t2p0: t2ype): d3exp
//
fun
d3exp_none1_0
(d2e0: d2exp): d3exp
fun
d3exp_none1_1
(d2e0: d2exp, t2p0: t2ype): d3exp
//
fun
d3exp_none2_0(d3e0: d3exp): d3exp
//
(* ****** ****** *)
//
fun
d3exp_make_node
( loc0: loc_t
, t2p0: t2ype, node: d3exp_node): d3exp
//
(* ****** ****** *)
//
fun
print_d3exp: print_type(d3exp)
fun
prerr_d3exp: prerr_type(d3exp)
fun
fprint_d3exp: fprint_type(d3exp)
//
overload print with print_d3exp
overload prerr with prerr_d3exp
overload fprint with fprint_d3exp
//
(* ****** ****** *)
//
fun
print_t3imp: print_type(t3imp)
fun
prerr_t3imp: prerr_type(t3imp)
fun
fprint_t3imp: fprint_type(t3imp)
//
overload print with print_t3imp
overload prerr with prerr_t3imp
overload fprint with fprint_t3imp
//
(* ****** ****** *)
//
fun
d3exp_talf(d3e0: d3exp): d3exp
//
(* ****** ****** *)
//
fun
d3exp_tcast
(d3e0: d3exp, t2p0: t2ype): d3exp
//
(* ****** ****** *)
//
datatype
d3gua_node =
| D3GUAexp of (d3exp)
| D3GUAmat of (d3exp, d3pat)
//
fun
d3gua_get_loc(d3gua): loc_t
fun
d3gua_get_node(d3gua): d3gua_node
//
overload .loc with d3gua_get_loc
overload .node with d3gua_get_node
//
fun print_d3gua : (d3gua) -> void
fun prerr_d3gua : (d3gua) -> void
fun fprint_d3gua : fprint_type(d3gua)
//
overload print with print_d3gua
overload prerr with prerr_d3gua
overload fprint with fprint_d3gua
//
fun
d3gua_make_node
(loc: loc_t, node: d3gua_node): d3gua
//
(* ****** ****** *)
//
datatype
d3clau_node =
| D3CLAUpat of d3gpat
| D3CLAUexp of (d3gpat, d3exp)
and
d3gpat_node =
| D3GPATpat of (d3pat)
| D3GPATgua of (d3pat, d3gualst)
//
fun
d3clau_get_loc(d3clau): loc_t
fun
d3clau_get_node(d3clau): d3clau_node
//
overload .loc with d3clau_get_loc
overload .node with d3clau_get_node
//
fun
d3gpat_get_loc(d3gpat): loc_t
fun
d3gpat_get_node(d3gpat): d3gpat_node
//
overload .loc with d3gpat_get_loc
overload .node with d3gpat_get_node
//
fun
print_d3clau : (d3clau) -> void
fun
prerr_d3clau : (d3clau) -> void
fun
fprint_d3clau : fprint_type(d3clau)
//
overload print with print_d3clau
overload prerr with prerr_d3clau
overload fprint with fprint_d3clau
//
fun
print_d3gpat : (d3gpat) -> void
fun
prerr_d3gpat : (d3gpat) -> void
fun
fprint_d3gpat : fprint_type(d3gpat)
//
overload print with print_d3gpat
overload prerr with prerr_d3gpat
overload fprint with fprint_d3gpat
//
fun
d3clau_make_node
(loc: loc_t, node: d3clau_node): d3clau
fun
d3gpat_make_node
(loc: loc_t, node: d3gpat_node): d3gpat
//
(* ****** ****** *)

datatype
t2pcast =
| T2PCASTnone of ()
| T2PCASTsome of (t2ype, t2ype)

(* ****** ****** *)
//
fun
print_t2pcast: print_type(t2pcast)
fun
prerr_t2pcast: prerr_type(t2pcast)
fun
fprint_t2pcast: fprint_type(t2pcast)
//
overload print with print_t2pcast
overload prerr with prerr_t2pcast
overload fprint with fprint_t2pcast
//
(* ****** ****** *)
//
datatype
v3aldecl =
V3ALDECL of @{
  loc= loc_t
, pat= d3pat
, def= d3expopt
, wtp= s2expopt
(*
, ctp= t2pcast
*)
}
//
typedef
v3aldeclist = List0(v3aldecl)
//
(* ****** ****** *)
//
fun
v3aldecl_get_loc(v3aldecl): loc_t
//
overload .loc with v3aldecl_get_loc
//
(* ****** ****** *)
//
fun
print_v3aldecl: print_type(v3aldecl)
fun
prerr_v3aldecl: prerr_type(v3aldecl)
fun
fprint_v3aldecl: fprint_type(v3aldecl)
//
overload print with print_v3aldecl
overload prerr with prerr_v3aldecl
overload fprint with fprint_v3aldecl
//
(* ****** ****** *)
//
datatype
v3ardecl =
V3ARDECL of @{
  loc= loc_t
, d2v= d2var
, wth= d2varopt
, res= s2expopt
, ini= d3expopt
}
//
typedef
v3ardeclist = List0(v3ardecl)
//
(* ****** ****** *)
//
fun
v3ardecl_get_loc(v3ardecl): loc_t
//
overload .loc with v3ardecl_get_loc
//
(* ****** ****** *)
//
fun
print_v3ardecl: print_type(v3ardecl)
fun
prerr_v3ardecl: prerr_type(v3ardecl)
fun
fprint_v3ardecl: fprint_type(v3ardecl)
//
overload print with print_v3ardecl
overload prerr with prerr_v3ardecl
overload fprint with fprint_v3ardecl
//
(* ****** ****** *)
//
datatype
f3undecl =
F3UNDECL of @{
  loc= loc_t
, nam= d2var
, d2c= d2cst
, a2g= f2arglst
//
, a3g=
    f3arglstopt
, res=
    effs2expopt
//
, def= d3expopt, rtp= t2ype
, wtp= s2expopt, ctp= t2pcast
}
//
typedef
f3undeclist = List0(f3undecl)
//
(* ****** ****** *)
//
fun
f3undecl_get_loc(f3undecl): loc_t
fun
f3undecl_get_d2c(f3undecl): d2cst
//
overload .loc with f3undecl_get_loc
overload .d2c with f3undecl_get_d2c
//
(* ****** ****** *)
//
fun
print_f3undecl: print_type(f3undecl)
fun
prerr_f3undecl: prerr_type(f3undecl)
fun
fprint_f3undecl: fprint_type(f3undecl)
//
overload print with print_f3undecl
overload prerr with prerr_f3undecl
overload fprint with fprint_f3undecl
//
(* ****** ****** *)
//
datatype
d3ecl_node =
//
| D3Cnone0 of ()
| D3Cnone1 of (d2ecl)
//
| D3Cd2ecl of (d2ecl)
//
| D3Cstatic of
  (token(*STATIC*), d3ecl)
| D3Cextern of
  (token(*EXTERN*), d3ecl)
//
| D3Clocal of
  (d3eclist(*head*), d3eclist(*body*))
//
| D3Cinclude of
  ( token
  , d1exp // src
  , int(*knd*) // sta/dyn: 0/1
  , filpathopt
  , d3eclistopt) // file inclusion
//
| D3Cstaload of
  ( token
  , d1exp // src
  , int(*knd*) // sta/dyn: 0/1
  , filpathopt
  , int(*shared*), fmodenvopt)
//
| D3Cabstype of
  ( d2ecl(*D2Cabstype*) )
| D3Cabsopen of
  ( token(*absopen*), impls2cst )
| D3Cabsimpl of
  ( token(*abskind*)
  , impls2cst, s2exp(*definition*) )
//
| D3Cfundecl of
  ( token(*funknd*)
  , decmodopt
  , tq2arglst(*tmpargs*), f3undeclist)
//
| D3Cvaldecl of
  (token(*knd*), decmodopt, v3aldeclist)
| D3Cvardecl of
  (token(*knd*), decmodopt, v3ardeclist)
//
| D3Cexcptcon of (d1ecl(*src*), d2conlst)
| D3Cdatatype of (d1ecl(*src*), s2cstlst)
//
| D3Cimpdecl1 of
  ( token(*impkind*)
  , stamp(*unicity*)
  , decmodopt
  , sq2arglst, tq2arglst
  , impld2cst, ti3arg, ti2arglst, f3arglst, effs2expopt, d3exp)
| D3Cimpdecl2 of
  ( token(*impkind*)
  , stamp(*unicity*)
  , decmodopt
  , sq2arglst, tq2arglst
  , impld2cst, ti3arg, ti2arglst, f3arglst, effs2expopt, d3exp)
| D3Cimpdecl3 of
  ( token(*impkind*)
  , stamp(*unicity*)
  , decmodopt
  , sq2arglst, tq2arglst
  , impld2cst, ti3arg, ti2arglst, f3arglst, effs2expopt, d3exp)
//
// end of [d3ecl_node]
//
(* ****** ****** *)
//
fun
d3ecl_get_loc(d3ecl): loc_t
fun
d3ecl_get_node(d3ecl): d3ecl_node
//
overload .loc with d3ecl_get_loc
overload .node with d3ecl_get_node
//
(* ****** ****** *)
//
fun
print_d3ecl: print_type(d3ecl)
fun
prerr_d3ecl: prerr_type(d3ecl)
fun
fprint_d3ecl: fprint_type(d3ecl)
//
overload print with print_d3ecl
overload prerr with prerr_d3ecl
overload fprint with fprint_d3ecl
//
(* ****** ****** *)
//
fun d3ecl_none0(loc_t): d3ecl
fun d3ecl_none1(d2ecl): d3ecl
//
fun
d3ecl_make_node
(loc: loc_t, node: d3ecl_node): d3ecl
//
(* ****** ****** *)

(* end of [xats_dynexp3.sats] *)
