(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./xlabel0.sats"
#staload "./locinfo.sats"

(* ****** ****** *)
//
#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
//
#staload D3E = "./dynexp3.sats"
//
#staload D4E = "./dynexp4.sats"
//
(* ****** ****** *)

typedef s2var = $S2E.s2var
typedef s2exp = $S2E.s2exp
typedef t2xtv = $S2T.t2xtv
typedef t2ype = $S2T.t2ype

(* ****** ****** *)

typedef s2varopt = $S2E.s2varopt
typedef s2varlst = $S2E.s2varlst
typedef s2expopt = $S2E.s2expopt
typedef s2explst = $S2E.s2explst

(* ****** ****** *)

typedef t2xtvlst = $S2T.t2xtvlst
typedef t2ypelst = $S2T.t2ypelst

(* ****** ****** *)
//
typedef d2con = $D2E.d2con
typedef d2var = $D2E.d2var
//
typedef d2cst = $D2E.d2cst
//
typedef d3pat = $D3E.d3pat
typedef f3arg = $D3E.f3arg
//
typedef d3exp = $D3E.d3exp
typedef d3ecl = $D3E.d3ecl
//
typedef d3gua = $D3E.d3gua
typedef d3gpat = $D3E.d3gpat
typedef d3clau = $D3E.d3clau
//
typedef d3patlst = $D3E.d3patlst
typedef f3arglst = $D3E.f3arglst
//
typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst
typedef d3eclopt = $D3E.d3eclopt
typedef d3eclist = $D3E.d3eclist
//
typedef d3gualst = $D3E.d3gualst
typedef d3claulst = $D3E.d3claulst
//
(* ****** ****** *)
//
typedef d4pat = $D4E.d4pat
//
typedef d4exp = $D4E.d4exp
typedef d4ecl = $D4E.d4ecl
//
(* ****** ****** *)
typedef d4expopt = $D4E.d4expopt
typedef d4explst = $D4E.d4explst
(* ****** ****** *)
typedef d4eclopt = $D4E.d4eclopt
typedef d4eclist = $D4E.d4eclist
(* ****** ****** *)
//
absvtype
tr34env_vtype = ptr
vtypedef
tr34env = tr34env_vtype
//
(* ****** ****** *)
//
fun
tr34env_make_nil
  ((*void*)): tr34env
//
fun
tr34env_free_nil
  (env0: tr34env): void
//
(* ****** ****** *)
//
fun
tr34env_add_let1
  ( env0: !tr34env ) : void
//
fun
tr34env_add_loc1
  ( env0 : !tr34env ) : void
fun
tr34env_add_loc2
  ( env0 : !tr34env ) : void
//
fun
tr34env_pop_let1
  ( env0 : !tr34env ) : void
fun
tr34env_pop_loc12
  ( env0 : !tr34env ) : void
//
(* ****** ****** *)
//
fun
tr34env_add_fix1
( env0:
! tr34env, d2f1: d2var): void
fun
tr34env_add_lams
( env0
: !tr34env, f3as: f3arglst): void
//
fun
tr34env_pop_fix1
  ( env0 : !tr34env ) : void
fun
tr34env_pop_lams
  ( env0 : !tr34env ) : void
//
(* ****** ****** *)
//
fun
trans34_envless
  (d3cls: d3eclist): d4eclist
//
(* ****** ****** *)
//
fun
trans34_dpat
( env0:
! tr34env, d3p0: d3pat): d4pat
//
(* ****** ****** *)
//
fun
trans34_dexp
( env0:
! tr34env, d3e0: d3exp): d4exp
//
(* ****** ****** *)
fun
trans34_dexplst
( env0:
! tr34env, d3es: d3explst): d4explst
fun
trans34_dexpopt
( env0:
! tr34env, opt0: d3expopt): d4expopt
(* ****** ****** *)
//
fun
trans34_decl
( env0:
! tr34env, d3c0: d3ecl): d4ecl
//
(* ****** ****** *)
fun
trans34_declist
( env0:
! tr34env, d3cs: d3eclist): d4eclist
fun
trans34_declopt
( env0:
! tr34env, opt0: d3eclopt): d4eclopt
(* ****** ****** *)

typedef
f3undecl = $D3E.f3undecl
typedef
f3undeclist = $D3E.f3undeclist

(* ****** ****** *)

typedef
v3aldecl = $D3E.v3aldecl
typedef
v3aldeclist = $D3E.v3aldeclist

(* ****** ****** *)

typedef
f4undecl = $D4E.f4undecl
typedef
f4undeclist = $D4E.f4undeclist

(* ****** ****** *)

typedef
v4aldecl = $D4E.v4aldecl
typedef
v4aldeclist = $D4E.v4aldeclist

(* ****** ****** *)
//
fun
f3undecl_get_s2expopt
  ( fdcl: f3undecl ) : s2expopt
//
(* ****** ****** *)

fun
trans34_fundecl
( env0:
! tr34env, f3d0: f3undecl): f4undecl
fun
trans34_fundeclist
( env0:
! tr34env, f3ds: f3undeclist): f4undeclist

(* ****** ****** *)

fun
trans34_valdecl
( env0:
! tr34env, v3d0: v3aldecl): v4aldecl
fun
trans34_valdeclist
( env0:
! tr34env, v3ds: v3aldeclist): v4aldeclist

(* ****** ****** *)

(* end of [xats_trans34.sats] *)
