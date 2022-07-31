(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue Jul 26 12:37:48 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
(* ****** ****** *)

#implfun
trans01_d0ecl
  (d0cl) = let
//
// (*
val
loc0 = d0cl.lctn()
val () =
prerrln
("trans01_decl: d0cl = ", d0cl)
// *)
//
in//let
//
case+
d0cl.node() of
//
| D0Cstatic _ => f0_static(d0cl)
| D0Cextern _ => f0_extern(d0cl)
//
|
_ (*otherwise*) => d1ecl_none1(d0cl)
//
end where
{
(* ****** ****** *)

fun
f0_static
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.lctn()
//
val-
D0Cstatic
(tok0, dcl1) = d0cl.node()
//
val dcl1 = trans01_d0ecl(dcl1)
//
in
d1ecl(loc0, D1Cstatic(tok0, dcl1))
end (* let *) // end of [f0_static]

fun
f0_extern
( d0cl
: d0ecl): d1ecl = let
//
val loc0 = d0cl.lctn()
//
val-
D0Cextern
(tknd, dcl1) = d0cl.node()
//
val dcl1 = trans01_d0ecl(dcl1)
//
in
d1ecl(loc0, D1Cextern(tknd, dcl1))
end (* let *) // end of [f0_extern]

(* ****** ****** *)
} (*where*) // end of [trans01_d0ecl(d0cl)]

(* ****** ****** *)

#implfun
trans01_d0eclist
  (dcls) =
(
list_map
<d0ecl><d1ecl>(dcls)) where
{
#impltmp
map$fopr<d0ecl><d1ecl> = trans01_d0ecl
} (*where*) // end of [trans01_d0eclist(dcls)]

(* ****** ****** *)

#implfun
trans01_d0eclistopt
  (opt0) =
(
case+ opt0 of
| optn_nil() => optn_nil()
| optn_cons(dcls) =>
  optn_cons(trans01_d0eclist(dcls))
) (*where*) // end of [trans01_d0eclistopt(opt0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_decl00.dats] *)
