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
// Start Time: October, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload "./basics.sats"
//
(* ****** ****** *)

#staload "./label0.sats"
#staload "./locinfo.sats"

(* ****** ****** *)
//
#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
//
#staload D3E = "./dynexp3.sats"
//
(* ****** ****** *)

typedef s2var = $S2E.s2var
typedef s2exp = $S2E.s2exp
typedef t2xtv = $S2T.t2xtv
typedef t2ype = $S2T.t2ype
typedef s2varlst = $S2E.s2varlst
typedef s2explst = $S2E.s2explst
typedef t2xtvlst = $S2T.t2xtvlst
typedef t2ypelst = $S2T.t2ypelst

(* ****** ****** *)
//
typedef d2cst = $D2E.d2cst
//
typedef d3exp = $D3E.d3exp
typedef d3ecl = $D3E.d3ecl
//
typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst
typedef d3eclist = $D3E.d3eclist
//
(* ****** ****** *)
//
absvtype implenv_vtype = ptr
vtypedef implenv = implenv_vtype
//
(* ****** ****** *)
//
fun
implenv_get_s2vs
  (!implenv): s2varlst
fun
implenv_get_t2ps
  (!implenv): t2ypelst
overload
.s2vs with implenv_get_s2vs
overload
.t2ps with implenv_get_t2ps
//
(* ****** ****** *)
//
fun
implenv_add_let1
  (env0: !implenv): void
fun
implenv_pop_let1
  (env0: !implenv): void
//
fun
implenv_add_loc1
  (env0: !implenv): void
fun
implenv_add_loc2
  (env0: !implenv): void
fun
implenv_pop_loc12
  (env0: !implenv): void
//
(* ****** ****** *)
//
fun
implenv_make_nil(): implenv
fun
implenv_free_nil(implenv): void
//
(* ****** ****** *)
//
fun
implenv_pop0_tsub
(env0: !implenv): void
fun
implenv_push_tsub
( env0
: !implenv
, s2vs: s2varlst, tsub: t2ypelst): void
//
(* ****** ****** *)
//
datatype
ti3env =
| TI3ENV of
  (s2varlst, t2xtvlst, t2ypelst)
//
fun
implenv_add_d3ecl
( env0
: !implenv
, d3cl: d3ecl, ti3e: ti3env): void
//
(* ****** ****** *)
//
fun
trans3t_program
  (d3cls: d3eclist): d3eclist
//
(* ****** ****** *)

fun
trans3t_dexp
( env0
: !implenv, d3e0: d3exp): d3exp
fun
trans3t_dexpopt
( env0
: !implenv, opt0: d3expopt): d3expopt
fun
trans3t_dexplst
( env0
: !implenv, d3es: d3explst): d3explst

(* ****** ****** *)

fun
trans3t_decl
( env0
: !implenv, d3cl: d3ecl): d3ecl
fun
trans3t_declist
( env0
: !implenv, d3cs: d3eclist): d3eclist

(* ****** ****** *)
//
fun
trans3t_timp
( env0
: !implenv, d3cl: d3ecl): d3ecl
//
fun
implenv_find_timp
( env0
: !implenv
, d2c0
: d2cst
, t2ps
: t2ypelst)
: Option_vt@(d3ecl, s2varlst, t2ypelst)
//
(* ****** ****** *)

(* end of [xats_trans3t.sats] *)

