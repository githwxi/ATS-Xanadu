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
// Start Time: May 21st, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.libxatsopt"
(* ****** ****** *)
//
#staload "./xlabel0.sats"
#staload "./locinfo.sats"
//
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
(* ****** ****** *)
#staload D4E = "./dynexp4.sats"
(* ****** ****** *)
typedef s2var = $S2E.s2var
(* ****** ****** *)
//
typedef d4pat = $D4E.d4pat
typedef f4arg = $D4E.f4arg
typedef d4exp = $D4E.d4exp
typedef d4ecl = $D4E.d4ecl
//
typedef stmap = $D4E.stmap
typedef stmrg = $D4E.stmrg
//
typedef d4gpat = $D4E.d4gpat
typedef d4clau = $D4E.d4clau
//
typedef d4patlst = $D4E.d4patlst
typedef f4arglst = $D4E.f4arglst
typedef d4explst = $D4E.d4explst
typedef d4eclist = $D4E.d4eclist
//
typedef d4claulst = $D4E.d4claulst
//
(* ****** ****** *)
#staload C0S = "./cstrnt0.sats"
#staload C1S = "./cstrnt1.sats"
(* ****** ****** *)
typedef c0str = $C0S.c0str
typedef c1itm = $C1S.c1itm
typedef c1hyp = $C1S.c1hyp
typedef c1str = $C1S.c1str
typedef c1itmlst = $C1S.c1itmlst
(* ****** ****** *)
//
absvtype
tr4xenv_vtype = ptr
vtypedef
tr4xenv = tr4xenv_vtype
//
(* ****** ****** *)
//
fun
tr4xenv_make_nil
  ((*void*)): tr4xenv
//
(* ****** ****** *)
//
fun
tr4xenv_free_top
  (env0: tr4xenv): c1itmlst
//
(* ****** ****** *)
//
fun
tr4xenv_add_bloc
  ( env0: !tr4xenv ) : void
fun
tr4xenv_pop_bloc
  ( env0: !tr4xenv ) : c1itmlst
//
(* ****** ****** *)
//
fun
tr4xenv_add_sexi
  ( env0: !tr4xenv ) : void
fun
tr4xenv_pop_sexi
  ( env0: !tr4xenv ) : c1itmlst
//
(* ****** ****** *)
//
fun
tr4xenv_add_if0
  ( env0: !tr4xenv ) : void
fun
tr4xenv_pop_if0
  ( env0: !tr4xenv ) : c1itmlst
//
fun
tr4xenv_add_cas0
  ( env0: !tr4xenv ) : void
fun
tr4xenv_pop_cas0
  ( env0: !tr4xenv ) : c1itmlst
//
(* ****** ****** *)
//
fun
tr4xenv_add_fun0
  ( env0: !tr4xenv ) : void
fun
tr4xenv_pop_fun0
  ( env0: !tr4xenv ) : c1itmlst
//
(* ****** ****** *)
fun
tr4xenv_add_svar
( env0:
! tr4xenv, s2v0: s2var): void
fun
tr4xenv_add_chyp
( env0:
! tr4xenv, c1h0: c1hyp): void
fun
tr4xenv_add_cstr
( env0:
! tr4xenv, c1s0: c1str): void
(* ****** ****** *)
fun
tr4xenv_add_citm
( env0:
! tr4xenv, itm0: c1itm): void
(* ****** ****** *)
//
fun
trans4x_envless
( dcls: d4eclist ) : c1itmlst
//
(* ****** ****** *)
//
fun
trans4x_dpat
( env0:
! tr4xenv, d4p0: d4pat): void
fun
trans4x_dpatlst
( env0:
! tr4xenv, d4ps: d4patlst): void
//
(* ****** ****** *)
//
fun
trans4x_dexp
( env0:
! tr4xenv, d4e0: d4exp): void
fun
trans4x_dexplst
( env0:
! tr4xenv, d4es: d4explst): void
//
(* ****** ****** *)
//
fun
trans4x_farg
( env0
: !tr4xenv, f4a0: f4arg): void
fun
trans4x_farglst
( env0
: !tr4xenv, f4as: f4arglst): void
//
(* ****** ****** *)
//
fun
trans4x_dgpat
( env0:
! tr4xenv, d4gp: d4gpat): void
//
fun
trans4x_dclau
( env0:
! tr4xenv, d4cl: d4clau): void
fun
trans4x_dclaulst
( env0:
! tr4xenv, dcls: d4claulst): void
//
(* ****** ****** *)
//
fun
trans4x_decl
( env0:
! tr4xenv, d4cl: d4ecl): void
fun
trans4x_declist
( env0:
! tr4xenv, dcls: d4eclist): void
//
(* ****** ****** *)
//
fun
trans4x_c0str
( env0:
! tr4xenv
, loc0: loc_t, cstr: c0str): void
//
(* ****** ****** *)
//
fun
trans4x_stmrg
( env0:
! tr4xenv
, loc0: loc_t, mrg0: stmrg): void
//
(* ****** ****** *)

(* end of [trans4x.sats] *)
