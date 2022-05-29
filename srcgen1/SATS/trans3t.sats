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
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload "./xlabel0.sats"
#staload "./locinfo.sats"
//
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
typedef t3imp = $D3E.t3imp
//
typedef d3ecl = $D3E.d3ecl
//
typedef d3gua = $D3E.d3gua
typedef d3gpat = $D3E.d3gpat
typedef d3clau = $D3E.d3clau
//
typedef d3expopt = $D3E.d3expopt
//
typedef d3explst = $D3E.d3explst
typedef t3implst = $D3E.t3implst
//
typedef d3eclist = $D3E.d3eclist
//
typedef d3gualst = $D3E.d3gualst
typedef d3claulst = $D3E.d3claulst
//
(* ****** ****** *)

#staload T33 = "./trans33.sats"

(* ****** ****** *)
//
absvtype
implenv_vtype = ptr
vtypedef
implenv = implenv_vtype
//
(* ****** ****** *)
//
(*
HX: copy the path out!
*)
fun
implenv_get_path
  (!implenv): t3implst
overload
.path with implenv_get_path
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
implenv_pop0_init
(env0: !implenv): void
fun
implenv_push_init
(env0: !implenv): void
//
fun
implenv_pop0_timp
(env0: !implenv): void
fun
implenv_push_timp
( env0:
! implenv
, d3e0: d3exp
, s2vs: s2varlst
, tsub: t2ypelst): void
//
(* ****** ****** *)
//
fun
implenv_path_recq
(env0: !implenv, d3e0: d3exp): bool
//
(* ****** ****** *)
//
fun
t2ype_subst_implenv
(t2ype, env0: !implenv): t2ype
fun
t2ypelst_subst_implenv
(t2ypelst, env0: !implenv): t2ypelst
//
(* ****** ****** *)
//
fun
implenv_add_staload
( env0:
! implenv
, d3cl: d3ecl): void
fun
implenv_add_implmnt3
( env0:
! implenv
, d3cl: d3ecl
, ti3e: $T33.ti3env): void
//
(* ****** ****** *)
//
fun
trans3t_envless
  (d3cls: d3eclist): d3eclist
//
(* ****** ****** *)

fun
trans3t_dexp
( env0:
! implenv, d3e0: d3exp): d3exp
fun
trans3t_dexpopt
( env0:
! implenv, opt0: d3expopt): d3expopt
fun
trans3t_dexplst
( env0:
! implenv, d3es: d3explst): d3explst

(* ****** ****** *)
//
fun
trans3t_dgua
( env0:
! implenv, d3g0: d3gua): d3gua
fun
trans3t_dgualst
( env0:
! implenv, d3gs: d3gualst): d3gualst
//
(* ****** ****** *)
//
fun
trans3t_dgpat
( env0:
! implenv, d3gp: d3gpat): d3gpat
//
fun
trans3t_dclau
( env0:
! implenv, d3cl: d3clau): d3clau
fun
trans3t_dclaulst
( env0:
! implenv, dcls: d3claulst): d3claulst
//
(* ****** ****** *)

fun
trans3t_decl
( env0:
! implenv, d3cl: d3ecl): d3ecl
fun
trans3t_declist
( env0:
! implenv, d3cs: d3eclist): d3eclist

(* ****** ****** *)
//
fun
trans3t_fundclst
( env0:
! implenv, d3cl: d3ecl): d3ecl
//
(* ****** ****** *)
//
fun
trans3t_timp
( env0:
! implenv, d3cl: d3ecl): d3ecl
//
fun
staload_find_timp
( d3cl
: d3ecl
, d2c0
: d2cst
, targ
: t2ypelst)
: Option_vt@(d3ecl, s2varlst, t2ypelst)
fun
implenv_find_timp
( env0:
! implenv
, d2c0
: d2cst
, targ
: t2ypelst)
: Option_vt@(d3ecl, s2varlst, t2ypelst)
//
(* ****** ****** *)

(* end of [xats_trans3t.sats] *)

