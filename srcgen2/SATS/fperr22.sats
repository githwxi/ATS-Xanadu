(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
(*
Sun 29 Jan 2023 06:46:30 PM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
LEX = "./lexing0.sats"
(* ****** ****** *)
#staload
S2E = "./staexp2.sats"
#staload
D2E = "./dynexp2.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
#typedef l2d2p = $D2E.l2d2p
#typedef l2d2e = $D2E.l2d2e
(* ****** ****** *)
#typedef f2arg = $D2E.f2arg
(* ****** ****** *)
#typedef d2ecl = $D2E.d2ecl
(* ****** ****** *)
#typedef d2patlst = $D2E.d2patlst
#typedef d2patopt = $D2E.d2patopt
(* ****** ****** *)
#typedef d2explst = $D2E.d2explst
#typedef d2expopt = $D2E.d2expopt
(* ****** ****** *)
#typedef l2d2plst = $D2E.l2d2plst
#typedef l2d2elst = $D2E.l2d2elst
(* ****** ****** *)
#typedef f2arglst = $D2E.f2arglst
(* ****** ****** *)
#typedef d2eclist = $D2E.d2eclist
(* ****** ****** *)
#typedef teqd2exp = $D2E.teqd2exp
(* ****** ****** *)
#typedef d2valdcl = $D2E.d2valdcl
#typedef d2vardcl = $D2E.d2vardcl
#typedef d2fundcl = $D2E.d2fundcl
#typedef d2cstdcl = $D2E.d2cstdcl
(* ****** ****** *)
//
#typedef d2parsed = $D2E.d2parsed
//
(* ****** ****** *)
#typedef d2valdclist = $D2E.d2valdclist
#typedef d2vardclist = $D2E.d2vardclist
#typedef d2fundclist = $D2E.d2fundclist
#typedef d2cstdclist = $D2E.d2cstdclist
(* ****** ****** *)
#typedef d2explstopt = $D2E.d2explstopt
#typedef d2eclistopt = $D2E.d2eclistopt
(* ****** ****** *)
(*
//
//HX-2023-01-29: printing errmsgs
//
*)
(* ****** ****** *)
#typedef
fperr22_t
(syn:tbox) = (FILR, syn)->void
(* ****** ****** *)
//
fun
list_fperr22_fnp
{ syn:tbox }
( out: FILR,
  list(syn), fperr22_t(syn)): void
fun
optn_fperr22_fnp
{ syn:tbox }
( out: FILR,
  optn(syn), fperr22_t(syn)): void
//
(* ****** ****** *)
fun fperr22_d2pat(FILR, d2pat): void
fun fperr22_d2exp(FILR, d2exp): void
(* ****** ****** *)
fun fperr22_l2d2p(FILR, l2d2p): void
fun fperr22_l2d2e(FILR, l2d2e): void
(* ****** ****** *)
fun fperr22_f2arg(FILR, f2arg): void
(* ****** ****** *)
fun fperr22_d2ecl(FILR, d2ecl): void
(* ****** ****** *)
fun fperr22_d2patlst(FILR, d2patlst): void
fun fperr22_d2explst(FILR, d2explst): void
(* ****** ****** *)
fun fperr22_l2d2plst(FILR, l2d2plst): void
fun fperr22_l2d2elst(FILR, l2d2elst): void
(* ****** ****** *)
fun fperr22_f2arglst(FILR, f2arglst): void
(* ****** ****** *)
fun fperr22_d2eclist(FILR, d2eclist): void
(* ****** ****** *)
fun fperr22_teqd2exp(FILR, teqd2exp): void
(* ****** ****** *)
fun fperr22_d2valdcl(FILR, d2valdcl): void
fun fperr22_d2vardcl(FILR, d2vardcl): void
fun fperr22_d2fundcl(FILR, d2fundcl): void
(* ****** ****** *)
fun
fperr22_d2valdclist(FILR, d2valdclist): void
(* ****** ****** *)
fun
fperr22_d2vardclist(FILR, d2vardclist): void
(* ****** ****** *)
fun
fperr22_d2fundclist(FILR, d2fundclist): void
(* ****** ****** *)
//
fun
fperr22_d2parsed
( out: FILR, dpar: d2parsed ): void
//
(* ****** ****** *)
//
fun
fperr22_d2explstopt(FILR, d2explstopt): void
fun
fperr22_d2eclistopt(FILR, d2eclistopt): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_fperr22.sats] *)
