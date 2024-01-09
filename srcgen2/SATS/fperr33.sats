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
Wed 26 Jul 2023 12:24:40 PM EDT
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
T2P = "./statyp2.sats"
#staload
D3E = "./dynexp3.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
#typedef l3d3p = $D3E.l3d3p
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3gua = $D3E.d3gua
#typedef d3gpt = $D3E.d3gpt
#typedef d3cls = $D3E.d3cls
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
#typedef s2typlst = $S2E.s2typlst
(* ****** ****** *)
#typedef d3patlst = $D3E.d3patlst
#typedef d3patopt = $D3E.d3patopt
(* ****** ****** *)
#typedef d3explst = $D3E.d3explst
#typedef d3expopt = $D3E.d3expopt
(* ****** ****** *)
#typedef l3d3plst = $D3E.l3d3plst
#typedef l3d3elst = $D3E.l3d3elst
(* ****** ****** *)
#typedef f3arglst = $D3E.f3arglst
(* ****** ****** *)
#typedef d3gualst = $D3E.d3gualst
#typedef d3clslst = $D3E.d3clslst
(* ****** ****** *)
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
#typedef teqd3exp = $D3E.teqd3exp
(* ****** ****** *)
#typedef d3valdcl = $D3E.d3valdcl
#typedef d3vardcl = $D3E.d3vardcl
#typedef d3fundcl = $D3E.d3fundcl
(* ****** ****** *)
//
#typedef d3parsed = $D3E.d3parsed
//
(* ****** ****** *)
#typedef d3valdclist = $D3E.d3valdclist
#typedef d3vardclist = $D3E.d3vardclist
#typedef d3fundclist = $D3E.d3fundclist
(* ****** ****** *)
#typedef d3explstopt = $D3E.d3explstopt
#typedef d3eclistopt = $D3E.d3eclistopt
(* ****** ****** *)
(*
//
//HX-2023-07-26: printing errmsgs
//
*)
(* ****** ****** *)
#typedef
fperr33_t
(syn:tbox) = (FILR, syn)->void
(* ****** ****** *)
//
fun
list_fperr33_fnp
{ syn:tbox }
( out: FILR,
  list(syn), fperr33_t(syn)): void
fun
optn_fperr33_fnp
{ syn:tbox }
( out: FILR,
  optn(syn), fperr33_t(syn)): void
//
(* ****** ****** *)
(*
HX: fperr33 for statics
*)
(* ****** ****** *)
fun fperr33_s2typ(FILR, s2typ): void
(* ****** ****** *)
(*
HX: fperr33 for dynamics
*)
(* ****** ****** *)
fun fperr33_d3pat(FILR, d3pat): void
fun fperr33_d3exp(FILR, d3exp): void
(* ****** ****** *)
fun fperr33_l3d3p(FILR, l3d3p): void
fun fperr33_l3d3e(FILR, l3d3e): void
(* ****** ****** *)
fun fperr33_f3arg(FILR, f3arg): void
(* ****** ****** *)
fun fperr33_d3gua(FILR, d3gua): void
fun fperr33_d3gpt(FILR, d3gpt): void
fun fperr33_d3cls(FILR, d3cls): void
(* ****** ****** *)
fun fperr33_d3ecl(FILR, d3ecl): void
(* ****** ****** *)
fun fperr33_s2typlst(FILR, s2typlst): void
(* ****** ****** *)
fun fperr33_d3patlst(FILR, d3patlst): void
fun fperr33_d3patopt(FILR, d3patopt): void
(* ****** ****** *)
fun fperr33_d3explst(FILR, d3explst): void
fun fperr33_d3expopt(FILR, d3expopt): void
(* ****** ****** *)
fun fperr33_l3d3plst(FILR, l3d3plst): void
fun fperr33_l3d3elst(FILR, l3d3elst): void
(* ****** ****** *)
fun fperr33_f3arglst(FILR, f3arglst): void
(* ****** ****** *)
fun fperr33_d3gualst(FILR, d3gualst): void
fun fperr33_d3clslst(FILR, d3clslst): void
(* ****** ****** *)
fun fperr33_d3eclist(FILR, d3eclist): void
(* ****** ****** *)
fun fperr33_teqd3exp(FILR, teqd3exp): void
(* ****** ****** *)
fun fperr33_d3valdcl(FILR, d3valdcl): void
fun fperr33_d3vardcl(FILR, d3vardcl): void
fun fperr33_d3fundcl(FILR, d3fundcl): void
(* ****** ****** *)
fun
fperr33_d3valdclist(FILR, d3valdclist): void
(* ****** ****** *)
fun
fperr33_d3vardclist(FILR, d3vardclist): void
(* ****** ****** *)
fun
fperr33_d3fundclist(FILR, d3fundclist): void
(* ****** ****** *)
//
fun
fperr33_d3parsed
( out: FILR, dpar: d3parsed ): void
//
(* ****** ****** *)
//
fun
fperr33_d3explstopt(FILR, d3explstopt): void
fun
fperr33_d3eclistopt(FILR, d3eclistopt): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_fperr33.sats] *)
