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
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload "./xlabel0.sats"
#staload "./locinfo.sats"
//
(* ****** ****** *)

#define VARG 0 // arg. vars
#define VLOC 0 // local vars
#define VENV 1 // environ. vars
#define VFIX 2 // fixed binding
#define VTOP %(~1) // top-level vars

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
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst
typedef d2var = $D2E.d2var
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
typedef d3eclist = $D3E.d3eclist
//
typedef d3gualst = $D3E.d3gualst
typedef d3claulst = $D3E.d3claulst
//
(* ****** ****** *)
//
absvtype
tr3xenv_vtype = ptr
vtypedef
tr3xenv = tr3xenv_vtype
//
(* ****** ****** *)
//
fun
tr3xenv_add_let1
  ( env0: !tr3xenv ) : void
//
fun
tr3xenv_add_loc1
  ( env0 : !tr3xenv ) : void
fun
tr3xenv_add_loc2
  ( env0 : !tr3xenv ) : void
//
fun
tr3xenv_pop_let1
  ( env0 : !tr3xenv ) : void
fun
tr3xenv_pop_loc12
  ( env0 : !tr3xenv ) : void
//
(* ****** ****** *)
//
fun
tr3xenv_add_fix1
( env0:
! tr3xenv, d2f1: d2var): void
fun
tr3xenv_add_lams
( env0
: !tr3xenv, f3as: f3arglst): void
//
fun
tr3xenv_pop_fix1
  ( env0 : !tr3xenv ) : void
fun
tr3xenv_pop_lams
  ( env0 : !tr3xenv ) : void
//
(* ****** ****** *)
//
fun
tr3xenv_add_dvar
( env0
: !tr3xenv, d2v1: d2var ) : void
//
fun
tr3xenv_add_dpat
( env0
: !tr3xenv, d3p1: d3pat ) : void
//
(* ****** ****** *)
//
fun
tr3xenv_make_nil(): tr3xenv
fun
tr3xenv_free_nil( tr3xenv ) : void
//
(* ****** ****** *)
//
fun
tr3xenv_nilq
  ( env0: !tr3xenv ) : bool
fun
tr3xenv_consq
  ( env0: !tr3xenv ) : bool
//
fun
tr3xenv_dvar_kind
( env0: !tr3xenv, d2v0: d2var ) : int
//
(* ****** ****** *)
//
fun
trans3x_envless
( d3cls: d3eclist ) : d3eclist
//
(* ****** ****** *)
//
fun
trans3x_dpat
( env0:
! tr3xenv, d3p0: d3pat): d3pat
fun
trans3x_dpatlst
( env0:
! tr3xenv, d3ps: d3patlst): d3patlst
//
(* ****** ****** *)
//
fun
trans3x_farg
( env0:
! tr3xenv, f3a0: f3arg): f3arg
fun
trans3x_farglst
( env0:
! tr3xenv, f3as: f3arglst): f3arglst
//
(* ****** ****** *)
//
fun
trans3x_dexp
( env0:
! tr3xenv, d3e0: d3exp): d3exp 
fun
trans3x_dexplst
( env0:
! tr3xenv, d3es: d3explst): d3explst
fun
trans3x_dexpopt
( env0:
! tr3xenv, opt0: d3expopt): d3expopt 
//
(* ****** ****** *)
//
fun
trans3x_decl
( env0:
! tr3xenv, d3c0: d3ecl): d3ecl
fun
trans3x_declist
( env0:
! tr3xenv, d3cs: d3eclist): d3eclist
//
(* ****** ****** *)
//
fun
trans3x_dgua
( env0:
! tr3xenv, d3g0: d3gua): d3gua
fun
trans3x_dgualst
( env0:
! tr3xenv, d3gs: d3gualst): d3gualst
//
(* ****** ****** *)
//
fun
trans3x_dgpat
( env0:
! tr3xenv, d3gp: d3gpat): d3gpat
//
fun
trans3x_dclau
( env0:
! tr3xenv, d3cl: d3clau): d3clau
fun
trans3x_dclaulst
( env0:
! tr3xenv, dcls: d3claulst): d3claulst
//
(* ****** ****** *)

(* end of [xats_trans3x.sats] *)
