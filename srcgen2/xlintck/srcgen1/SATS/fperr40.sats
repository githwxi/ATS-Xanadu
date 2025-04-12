(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Mon Jan  8 19:50:21 EST 2024
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload
LEX = "./lexing0.sats"
(* ****** ****** *)
#staload
S2E = "./staexp2.sats"
#staload
T2P = "./statyp2.sats"
#staload
D4E = "./dynexp4.sats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d4pat = $D4E.d4pat
#typedef l4d4p = $D4E.l4d4p
(* ****** ****** *)
#typedef d4exp = $D4E.d4exp
#typedef l4d4e = $D4E.l4d4e
(* ****** ****** *)
#typedef d4ecl = $D4E.d4ecl
(* ****** ****** *)
(* ****** ****** *)
#typedef s2typlst = $S2E.s2typlst
(* ****** ****** *)
#typedef d4patlst = $D4E.d4patlst
#typedef l4d4plst = $D4E.l4d4plst
(* ****** ****** *)
#typedef d4explst = $D4E.d4explst
#typedef d4expopt = $D4E.d4expopt
#typedef l4d4elst = $D4E.l4d4elst
(* ****** ****** *)
#typedef d4eclist = $D4E.d4eclist
(* ****** ****** *)
#typedef d4valdcl = $D4E.d4valdcl
#typedef d4vardcl = $D4E.d4vardcl
#typedef d4fundcl = $D4E.d4fundcl
(* ****** ****** *)
//
#typedef d4parsed = $D4E.d4parsed
//
(* ****** ****** *)
#typedef d4valdclist = $D4E.d4valdclist
#typedef d4vardclist = $D4E.d4vardclist
#typedef d4fundclist = $D4E.d4fundclist
(* ****** ****** *)
#typedef d4explstopt = $D4E.d4explstopt
#typedef d4eclistopt = $D4E.d4eclistopt
(* ****** ****** *)
#typedef d4eclistopt = $D4E.d4eclistopt
(* ****** ****** *)
(*
//
//HX-2024-01-08: printing errmsgs
//
*)
(* ****** ****** *)
#typedef
fperr40_t
(syn:tbox) = (FILR, syn)->void
(* ****** ****** *)
//
fun
list_fperr40_fnp
{ syn:tbox }
( out: FILR,
  list(syn), fperr40_t(syn)): void
fun
optn_fperr40_fnp
{ syn:tbox }
( out: FILR,
  optn(syn), fperr40_t(syn)): void
//
(* ****** ****** *)
(*
HX: fperr40 for statics
*)
(* ****** ****** *)
fun fperr40_s2typ(FILR, s2typ): void
(* ****** ****** *)
(*
HX: fperr40 for dynamics
*)
(* ****** ****** *)
fun fperr40_d4pat(FILR, d4pat): void
fun fperr40_l4d4p(FILR, l4d4p): void
(* ****** ****** *)
fun fperr40_d4exp(FILR, d4exp): void
fun fperr40_l4d4e(FILR, l4d4e): void
(* ****** ****** *)
fun fperr40_d4ecl(FILR, d4ecl): void
(* ****** ****** *)
fun fperr40_d4explst(FILR, d4explst): void
fun fperr40_d4expopt(FILR, d4expopt): void
fun fperr40_l4d4elst(FILR, l4d4elst): void
(* ****** ****** *)
fun fperr40_d4eclist(FILR, d4eclist): void
(* ****** ****** *)
fun fperr40_d4valdcl(FILR, d4valdcl): void
fun fperr40_d4vardcl(FILR, d4vardcl): void
fun fperr40_d4fundcl(FILR, d4fundcl): void
(* ****** ****** *)
fun
fperr40_d4valdclist(FILR, d4valdclist): void
(* ****** ****** *)
fun
fperr40_d4vardclist(FILR, d4vardclist): void
(* ****** ****** *)
fun
fperr40_d4fundclist(FILR, d4fundclist): void
(* ****** ****** *)
(* ****** ****** *)
//
fun
fperr40_d4parsed
( out: FILR, dpar: d4parsed ): void//end-fun
//
(* ****** ****** *)
//
fun
fperr40_d4explstopt(FILR, d4explstopt): void
fun
fperr40_d4eclistopt(FILR, d4eclistopt): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****************************************** *)
(* ****************************************** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_fperr40.sats] *)
