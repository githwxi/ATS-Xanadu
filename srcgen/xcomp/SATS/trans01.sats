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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
#staload
MAP = "./xsymmap.sats"
#staload
FIX = "./xfixity.sats"
#staload
LEX = "./lexing0.sats"
//
typedef sym_t = $SYM.sym_t
typedef fixty = $FIX.fixty
typedef token = $LEX.token
//
vtypedef
fixtyopt_vt = Option_vt(fixty)
//
(* ****** ****** *)

#staload
FIL = "./filpath.sats"
typedef fpath = $FIL.filpath
typedef filpath = $FIL.filpath

(* ****** ****** *)
//
#staload S0E = "./staexp0.sats"
#staload D0E = "./dynexp0.sats"
#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
//
(* ****** ****** *)

(*
symintr trans01
*)

(* ****** ****** *)
fun
token2sint: token -> int
fun
token2dint: token -> int
(* ****** ****** *)
fun
token2sbtf: token -> bool
fun
token2dbtf: token -> bool
(* ****** ****** *)
fun
token2schr: token -> char
fun
token2dchr: token -> char
(* ****** ****** *)
fun
token2sflt: token -> double
fun
token2dflt: token -> double
(* ****** ****** *)
fun
token2sstr: token -> string
fun
token2dstr: token -> string
(* ****** ****** *)
//
fun
gexpid_sym : token -> sym_t
//
(* ****** ****** *)
//
fun
sortid_sym : token -> sym_t
fun
sargid_sym : token -> sym_t
fun
sexpid_sym : token -> sym_t
fun
dexpid_sym : token -> sym_t
//
(* ****** ****** *)

fun
strnormize(cs: string): string
fun
strevalize(cs: string): string

(* ****** ****** *)

fun
token2string : token -> string

(* ****** ****** *)
//
fun
the_fxtyenv_search
(key: sym_t): fixtyopt_vt
fun
the_fxtyenv_insert
(key: sym_t, itm: fixty): void
//
(* ****** ****** *)
//
absview
fxtyenv_view
viewdef
fxtyenv_v = fxtyenv_view
//
fun
the_fxtyenv_pop
( fxtyenv_v 
| (*none*)): $MAP.symmap(fixty)
fun
the_fxtyenv_popfree
( fxtyenv_v  | (*none*) ): void
//
fun
the_fxtyenv_pushnil
  ((*void*)): (fxtyenv_v | void)
//
(* ****** ****** *)
//
fun
the_fxtyenv_locjoin
(
  pf1: fxtyenv_v
, pf2: fxtyenv_v | (*none*)
) : void // end of [the_fxtyenv_locjoin]
//
(* ****** ****** *)
//
fun // p: pervasive
the_fxtyenv_pjoinwth0
( map: $MAP.symmap(fixty) ): void
//
(* ****** ****** *)
//
fun
the_fxtyenv_println(): void
fun
the_fxtyenv_fprint(FILEref): void
//
(* ****** ****** *)
//
typedef
g1exp = $S1E.g1exp
//
fun
the_xnamenv_search
( key
: sym_t ) : Option_vt(g1exp)
fun
the_xnamenv_insert
( key: sym_t, itm: g1exp ) : void
//
(* ****** ****** *)
//
absview
xnamenv_view
viewdef
xnamenv_v = xnamenv_view
//
fun
the_xnamenv_pop
( xnamenv_v 
| (*none*)): $MAP.symmap(g1exp)
fun
the_xnamenv_popfree
( xnamenv_v  | (*none*) ): void
//
fun
the_xnamenv_pushnil
  ((*void*)): (xnamenv_v | void)
//
(* ****** ****** *)
//
fun
the_xnamenv_locjoin
(
  pf1: xnamenv_v
, pf2: xnamenv_v | (*none*)
) : void // end of [the_xnamenv_locjoin]
//
(* ****** ****** *)
//
fun // p: pervasive
the_xnamenv_pjoinwth0
( map: $MAP.symmap(fixty) ): void
//
(* ****** ****** *)
//
fun
the_xnamenv_println(): void
fun
the_xnamenv_fprint(FILEref): void
//
(* ****** ****** *)
//
(*
HX:
Environment-handling for trans01
*)
//
(* ****** ****** *)
absview trans01_view
viewdef trans01_v = trans01_view
(* ****** ****** *)
//
fun
the_trans01_popfree
  (trans01_v | (*none*)): (void)
fun
the_trans01_pushnil
  ((*void*)): (trans01_v | void)
//
fun
the_trans01_locjoin
( pf1: trans01_v
, pf2: trans01_v | (*none*)): void
//
(* ****** ****** *)
//
absview
trans01_save_view
viewdef
trans01_save_v = trans01_save_view
//
(* ****** ****** *)
//
fun
the_trans01_savecur
((*none*)):(trans01_save_v | void)
//
fun
the_trans01_restore
(pf0:trans01_save_v|(*none*)): void
//
(* ****** ****** *)
//
typedef g0nam = $S0E.g0nam
typedef g0exp = $S0E.g0exp
typedef g0marg = $S0E.g0marg
//
typedef g0namlst = $S0E.g0namlst
typedef g0explst = $S0E.g0explst
typedef g0marglst = $S0E.g0marglst
//
(* ****** ****** *)
//
typedef sort0 = $S0E.sort0
typedef sort0opt = $S0E.sort0opt
typedef sort0lst = $S0E.sort0lst
//
(* ****** ****** *)
//
typedef s0arg = $S0E.s0arg
typedef t0arg = $S0E.t0arg
typedef s0arglst = $S0E.s0arglst
typedef t0arglst = $S0E.t0arglst
//
typedef s0marg = $S0E.s0marg
typedef t0marg = $S0E.t0marg
typedef s0marglst = $S0E.s0marglst
typedef t0marglst = $S0E.t0marglst
//
(* ****** ****** *)
//
typedef s0qua = $S0E.s0qua
typedef s0uni = $S0E.s0uni
typedef s0qualst = $S0E.s0qualst
typedef s0unilst = $S0E.s0unilst
//
(* ****** ****** *)
//
typedef s0exp = $S0E.s0exp
//
(*
typedef s0eff = $S0E.s0eff
*)
//
typedef s0expopt = $S0E.s0expopt
typedef s0explst = $S0E.s0explst
//
typedef labs0exp = $S0E.labs0exp
typedef labs0explst = $S0E.labs0explst
//
(* ****** ****** *)
//
typedef d0pat = $D0E.d0pat
typedef d0patopt = $D0E.d0patopt
typedef d0patlst = $D0E.d0patlst
//
(* ****** ****** *)
//
typedef d0exp = $D0E.d0exp
typedef d0expopt = $D0E.d0expopt
typedef d0explst = $D0E.d0explst
//
(* ****** ****** *)

typedef d0clau = $D0E.d0clau
typedef d0claulst = $D0E.d0claulst

(* ****** ****** *)
//
typedef d0ecl = $D0E.d0ecl
typedef d0eclopt = $D0E.d0eclopt
typedef d0eclist = $D0E.d0eclist
//
(* ****** ****** *)
//
typedef g1nam = $S1E.g1nam
typedef g1namlst = $S1E.g1namlst
//
(* ****** ****** *)
//
typedef g1exp = $S1E.g1exp
typedef g1explst = $S1E.g1explst
//
typedef g1marg = $S1E.g1marg
typedef g1marglst = $S1E.g1marglst
//
(* ****** ****** *)
//
typedef sort1 = $S1E.sort1
typedef sort1opt = $S1E.sort1opt
typedef sort1lst = $S1E.sort1lst
//
typedef s1arg = $S1E.s1arg
typedef s1marg = $S1E.s1marg
typedef s1arglst = $S1E.s1arglst
typedef s1marglst = $S1E.s1marglst
//
typedef t1arg = $S1E.t1arg
typedef t1marg = $S1E.t1marg
typedef t1arglst = $S1E.t1arglst
typedef t1marglst = $S1E.t1marglst
//
typedef s1qua = $S1E.s1qua
typedef s1qualst = $S1E.s1qualst
//
typedef s1uni = $S1E.s1uni
typedef s1unilst = $S1E.s1unilst
//
(* ****** ****** *)
//
typedef s1exp = $S1E.s1exp
//
(*
typedef s1eff = $S1E.s1eff
*)
//
typedef s1expopt = $S1E.s1expopt
typedef s1explst = $S1E.s1explst
//
typedef labs1exp = $S1E.labs1exp
typedef labs1explst = $S1E.labs1explst
//
(* ****** ****** *)
//
typedef d1pat = $D1E.d1pat
typedef d1patopt = $D1E.d1patopt
typedef d1patlst = $D1E.d1patlst
//
(* ****** ****** *)
//
typedef d1exp = $D1E.d1exp
typedef d1expopt = $D1E.d1expopt
typedef d1explst = $D1E.d1explst
//
(* ****** ****** *)

typedef d1clau = $D1E.d1clau
typedef d1claulst = $D1E.d1claulst

(* ****** ****** *)
//
typedef d1ecl = $D1E.d1ecl
typedef d1eclopt = $D1E.d1eclopt
typedef d1eclist = $D1E.d1eclist
//
(* ****** ****** *)
//
fun
trans01_gnam: g0nam -> g1nam
fun
trans01_gnamlst: g0namlst -> g1namlst
//
(* ****** ****** *)
//
fun
trans01_gexp: g0exp -> g1exp
fun
trans01_gmarg: g0marg -> g1marg
//
fun
trans01_gexplst: g0explst -> g1explst
//
(* ****** ****** *)
//
fun
trans01_sort: sort0 -> sort1 
fun
trans01_sortopt: sort0opt -> sort1opt
fun
trans01_sortlst: sort0lst -> sort1lst
//
(*
overload trans01 with trans01_sort
overload trans01 with trans01_sortopt
overload trans01 with trans01_sortlst
*)
//
(* ****** ****** *)
//
fun
trans01_sarg: s0arg -> s1arg
fun
trans01_smarg: s0marg -> s1marg
fun
trans01_sarglst: s0arglst -> s1arglst
fun
trans01_smarglst: s0marglst -> s1marglst
//
(*
overload trans01 with trans01_sarg
overload trans01 with trans01_smarg
overload trans01 with trans01_sarglst
overload trans01 with trans01_smarglst
*)
//
(* ****** ****** *)
//
fun
trans01_targ: t0arg -> t1arg
fun
trans01_tmarg: t0marg -> t1marg
fun
trans01_targlst: t0arglst -> t1arglst
fun
trans01_tmarglst: t0marglst -> t1marglst
//
(*
overload trans01 with trans01_targ
overload trans01 with trans01_tmarg
overload trans01 with trans01_targlst
overload trans01 with trans01_tmarglst
*)
//
(* ****** ****** *)
//
fun
trans01_squa: s0qua -> s1qua
fun
trans01_squalst: s0qualst -> s1qualst
//
(*
overload trans01 with trans01_squa
overload trans01 with trans01_squalst
*)
//
(* ****** ****** *)
//
fun
trans01_suni: s0uni -> s1uni
fun
trans01_sunilst: s0unilst -> s1unilst
//
(*
overload trans01 with trans01_suni
overload trans01 with trans01_sunilst
*)
//
(* ****** ****** *)
//
fun
trans01_sexp: s0exp -> s1exp
fun
trans01_labsexp: labs0exp -> labs1exp
fun
trans01_sexpopt: s0expopt -> s1expopt
fun
trans01_sexplst: s0explst -> s1explst
fun
trans01_labsexplst: labs0explst -> labs1explst
//
(*
overload trans01 with trans01_sexp
overload trans01 with trans01_labsexp
overload trans01 with trans01_sexpopt
overload trans01 with trans01_sexplst
overload trans01 with trans01_labsexplst
*)
//
(* ****** ****** *)
//
(*
fun
trans01_seff: s0eff -> s1eff
*)
//
(* ****** ****** *)
//
fun
trans01_effsexpopt
( opt
: $S0E.effs0expopt): $S1E.effs1expopt
//
(* ****** ****** *)
//
fun
trans01_dpat: d0pat -> d1pat
fun
trans01_dpatlst: d0patlst -> d1patlst
//
(*
overload trans01 with trans01_dpat
overload trans01 with trans01_dpatlst
*)
//
(* ****** ****** *)
//
fun
trans01_dexp: d0exp -> d1exp
fun
trans01_dexpopt: d0expopt -> d1expopt
fun
trans01_dexplst: d0explst -> d1explst
//
(*
overload trans01 with trans01_dexp
overload trans01 with trans01_dexplst
*)
//
(* ****** ****** *)
fun
trans01_stinv
(tinv: $D0E.st0inv): $D1E.st1inv
(* ****** ****** *)
fun
trans01_dclau(d0cl: d0clau): d1clau
fun
trans01_dclaulst: d0claulst -> d1claulst
(* ****** ****** *)
//
fun
trans01_decl: d0ecl -> d1ecl
fun
trans01_declist: d0eclist -> d1eclist
//
(*
overload trans01 with trans01_decl
overload trans01 with trans01_declist
*)
//
(* ****** ****** *)
//
typedef s0rtcon = $S0E.s0rtcon
typedef s1rtcon = $S1E.s1rtcon
typedef s0rtconlst = $S0E.s0rtconlst
typedef s1rtconlst = $S1E.s1rtconlst
//
fun
trans01_srtcon: s0rtcon -> s1rtcon
fun
trans01_srtconlst: s0rtconlst -> s1rtconlst
//
(* ****** ****** *)
//
typedef d0atcon = $S0E.d0atcon
typedef d1atcon = $S1E.d1atcon
typedef d0atconlst = $S0E.d0atconlst
typedef d1atconlst = $S1E.d1atconlst
//
fun
trans01_datcon: d0atcon -> d1atcon
fun
trans01_datconlst: d0atconlst -> d1atconlst
//
(* ****** ****** *)
//
fun
trans01_staload_add
(fp: filpath, d1cs: d1eclist): void
//
fun
trans01_staload_find
  (fp0: filpath): Option_vt(d1eclist)
//
(* ****** ****** *)
//
fun
trans01_staload_from_filpath
( stadyn: int, inp: filpath
) : (int(*share*), Option_vt(d1eclist))
//
(* ****** ****** *)

(* end of [xats_trans01.sats] *)
