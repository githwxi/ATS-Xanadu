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
Sun 04 Dec 2022 02:08:24 AM EST
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)
//
fun
fint_rep_bas
( rep
: strn
, bas
: sint): sint =
gseq_foldl
<strn><cgtz><sint>(rep, 0) where
{
#impltmp
foldl$fopr
<cgtz><sint>(r0, c0) = r0*bas+(c0-'0')
}
//
(* ****** ****** *)

#implfun
trg1mac_d1pat
(    d1p0    ) =
(
case+
d1p0.node() of
//
| D1Pid0 _ => f0_id0(d1p0)
//
| D1Pint _ => f0_int(d1p0)
//
|
_(*otherwise*) => G1Mdpat(d1p0)
//
) where
{
//
(*
val () =
println!
("trg1mac_d1pat: loc0 = ", loc0)
val () =
println!
("trg1mac_d1pat: d1p0 = ", d1p0)
*)
//
(* ****** ****** *)
//
fun
f0_id0
(d1p0: d1pat): g1mac =
(
  G1Mid0(sym)) where
{
val-D1Pid0(sym) = d1p0.node()
} (*where*) // end of [f0_id0(d1p0)]
//
(* ****** ****** *)
//
fun
f0_int
(d1p0: d1pat): g1mac =
let
val-
D1Pint(tok1) = d1p0.node()
in//let
(
  G1Mint(int1)) where
{
val
int1 =
(
case-
tok1.node() of
|
T_INT01(rep) =>
let
val bas = 10 in
fint_rep_bas(rep, bas)
end // end-of-(T_INT01)
|
T_INT02(bas,rep) =>
(
fint_rep_bas(rep, bas))): sint
}
end (*end*) // end of [f0_int(d1p0)]
//
(* ****** ****** *)
//
} (*where*) // end of [trg1mac_d1pat]

(* ****** ****** *)

#implfun
trg1mac_d1exp
(    d1e0    ) =
(
case+
d1e0.node() of
//
| D1Eid0 _ => f0_id0(d1e0)
//
| D1Eint _ => f0_int(d1e0)
//
|
_(*otherwise*) => G1Mdexp(d1e0)
//
) where
{
//
(*
val () =
println!
("trg1mac_d1exp: loc0 = ", loc0)
val () =
println!
("trg1mac_d1exp: d1e0 = ", d1e0)
*)
//
(* ****** ****** *)
//
fun
f0_id0
(d1e0: d1exp): g1mac =
(
  G1Mid0(sym)) where
{
val-D1Eid0(sym) = d1e0.node()
} (*where*) // end of [f0_id0(d1e0)]
//
(* ****** ****** *)
//
fun
f0_int
(d1e0: d1exp): g1mac =
let
val-
D1Eint(tok1) = d1e0.node()
in//let
(
  G1Mint(int1)) where
{
val
int1 =
(
case-
tok1.node() of
|
T_INT01(rep) =>
let
val bas = 10 in
fint_rep_bas(rep, bas)
end // end-of-(T_INT01)
|
T_INT02(bas,rep) =>
(
fint_rep_bas(rep, bas))): sint
}
end (*end*) // end of [f0_int(d1e0)]
//
(* ****** ****** *)
//
} (*where*) // end of [trg1mac_d1exp]

(* ****** ****** *)

#implfun
trg1mac_s1explst
(     s1es     ) =
(
list_map<x0><y0>(s1es)) where
{
#typedef x0 = s1exp
#typedef y0 = g1mac
#impltmp map$fopr<x0><y0> = trg1mac_s1exp
} (*where*)//end of [trg1mac_s1explst(s1es)]

(* ****** ****** *)

#implfun
trg1mac_d1patlst
(     d1ps     ) =
(
list_map<x0><y0>(d1ps)) where
{
#typedef x0 = d1pat
#typedef y0 = g1mac
#impltmp map$fopr<x0><y0> = trg1mac_d1pat
} (*where*)//end of [trg1mac_d1patlst(d1ps)]

(* ****** ****** *)

#implfun
trg1mac_d1explst
(     d1es     ) =
(
list_map<x0><y0>(d1es)) where
{
#typedef x0 = d1exp
#typedef y0 = g1mac
#impltmp map$fopr<x0><y0> = trg1mac_d1exp
} (*where*)//end of [trg1mac_d1explst(d1es)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_gmacro1.dats] *)
