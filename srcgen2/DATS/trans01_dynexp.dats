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
Tue Jul 26 12:37:25 EDT 2022
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
#staload
_(*TRANS01*) = "./trans01.dats"
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
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with d0gua_get_lctn
#symload node with d0gua_get_node
#symload lctn with d0gpt_get_lctn
#symload node with d0gpt_get_node
#symload lctn with d0cls_get_lctn
#symload node with d0cls_get_node
(* ****** ****** *)

#implfun
trans01_d0pat
  (tenv, d0p0) =
let
//
val loc0 = d0p0.lctn()
//
val () =
prerrln
("trans01_d0pat: loc0 = ", loc0)
val () =
prerrln
("trans01_d0pat: d0p0 = ", d0p0)
//
in//let
case+
d0p0.node() of
| _(*otherwise*) => d1pat_none1(d0p0)
end (*let*) // end of [trans01_d0pat(d0p0)]

(* ****** ****** *)

#implfun
trans01_d0exp
  (tenv, d0e0) =
let
//
val loc0 = d0e0.lctn()
//
val () =
prerrln
("trans01_d0exp: loc0 = ", loc0)
val () =
prerrln
("trans01_d0exp: d0e0 = ", d0e0)
//
in//let
case+
d0e0.node() of
| _(*otherwise*) => d1exp_none1(d0e0)
end (*let*) // end of [trans01_d0exp(d0e0)]

(* ****** ****** *)

#implfun
trans01_d0gua
  (tenv, d0g0) =
let
//
val loc0 = d0g0.lctn()
//
val () =
prerrln
("trans01_d0gua: loc0 = ", loc0)
val () =
prerrln
("trans01_d0gua: d0g0 = ", d0g0)
//
in//let
case+
d0g0.node() of
|
D0GUAexp(d0e1) =>
d1gua_make_node
(loc0, D1GUAexp(d1e1)) where
{
val
d1e1 = trans01_d0exp(tenv, d0e1) }
|
D0GUAmat(d0e1,tkas,d0p2) =>
d1gua_make_node
(loc0, D1GUAmat(d1e1, d1p2)) where
{
val d1e1 = trans01_d0exp(tenv, d0e1)
val d1p2 = trans01_d0pat(tenv, d0p2)
}
end (*let*) // end of [trans01_d0gua(d0g0)]

(* ****** ****** *)

#implfun
trans01_d0gua
  (tenv, d0g0) =
let
//
val loc0 = d0g0.lctn()
//
(*
val () =
prerrln
("trans01_d0gua: loc0 = ", loc0)
val () =
prerrln
("trans01_d0gua: d0g0 = ", d0g0)
*)
//
in//let
case+
d0g0.node() of
|
D0GUAexp(d0e1) =>
d1gua_make_node
(loc0, D1GUAexp(d1e1)) where
{
val
d1e1 = trans01_d0exp(tenv, d0e1) }
|
D0GUAmat(d0e1,tkas,d0p2) =>
d1gua_make_node
(loc0, D1GUAmat(d1e1, d1p2)) where
{
val d1e1 = trans01_d0exp(tenv, d0e1)
val d1p2 = trans01_d0pat(tenv, d0p2)
}
end (*let*) // end of [trans01_d0gua(d0g0)]

(* ****** ****** *)

#implfun
trans01_d0gpt
  (tenv, dgt0) =
let
//
val loc0 = dgt0.lctn()
//
(*
val () =
prerrln
("trans01_d0gpt: loc0 = ", loc0)
val () =
prerrln
("trans01_d0gpt: dgt0 = ", dgt0)
*)
//
in//let
case+
dgt0.node() of
|
D0GPTpat(d0p1) =>
d1gpt_make_node
(loc0, D1GPTpat(d1p1)) where
{
val
d1p1 = trans01_d0pat(tenv, d0p1) }
|
D0GPTgua
(d0p1,twhn,d0gs) =>
d1gpt_make_node
(loc0, D1GPTgua(d1p1, d1gs)) where
{
val d1p1 = trans01_d0pat(tenv, d0p1)
val d1gs = trans01_d0gualst(tenv, d0gs)
}
end (*let*) // end of [trans01_d0gpt(d0g0)]

(* ****** ****** *)

#implfun
trans01_d0cls
  (tenv, dcls) =
let
//
val loc0 = dcls.lctn()
//
(*
val () =
prerrln
("trans01_d0cls: loc0 = ", loc0)
val () =
prerrln
("trans01_d0cls: dcls = ", dcls)
*)
//
in//let
case+
dcls.node() of
|
D0CLSgpt(dgt1) =>
d1cls_make_node
(loc0, D1CLSgpt(dgt1)) where
{
val
dgt1 = trans01_d0gpt(tenv, dgt1) }
|
D0CLScls
(dgt1,tkeg,d0e2) =>
d1cls_make_node
(loc0, D1CLScls(dgt1, d1e2)) where
{
val dgt1 = trans01_d0gpt(tenv, dgt1)
val d1e2 = trans01_d0exp(tenv, d0e2)
}
end (*let*) // end of [trans01_d0cls(dcls)]

(* ****** ****** *)
//
#implfun
trans01_s0eff
(tenv, seff) =
(
case+ seff of
|
S0EFFnone
(  tok  ) =>
S1EFFnone((*void*))
|
S0EFFsome
(tbeg,s0es,tend) =>
S1EFFsome( s1es ) where
{
val s1es = trans01_s0explst(tenv, s0es)
}
) (*case+*) // end of [trans01_s0eff(...)]
//
(* ****** ****** *)
//
#implfun
trans01_s0res
(tenv, sres) =
(
case+ sres of
|
S0RESnone() => S1RESnone()
|
S0RESsome(seff,s0e1) =>
S1RESsome(seff,s1e1) where
{
val seff = trans01_s0eff(tenv, seff)
val s1e1 = trans01_s0exp(tenv, s0e1)
}
) (*case+*) // end of [trans01_s0res(...)]
//
(* ****** ****** *)
//
#implfun
trans01_d0res
(tenv, dres) =
(
case+ dres of
|
D0RESnone() =>
TEQD1EXPnone((*void*))
|
D0RESsome(teq0,d0e1) =>
TEQD1EXPsome(teq0,d1e1) where
{
val d1e1 = trans01_d0exp(tenv, d0e1)
}
) (*case+*) // end of [trans01_d0res(...)]
//
(* ****** ****** *)

#implfun
trans01_d0patlst
(tenv, d0ps) =
list_trans01_fnp(tenv, d0ps, trans01_d0pat)

(* ****** ****** *)

#implfun
trans01_d0explst
(tenv, d0es) =
list_trans01_fnp(tenv, d0es, trans01_d0exp)

(* ****** ****** *)

#implfun
trans01_d0gualst
(tenv, d0ps) =
list_trans01_fnp(tenv, d0ps, trans01_d0gua)

(* ****** ****** *)

#implfun
trans01_d0clslst
(tenv, d0ps) =
list_trans01_fnp(tenv, d0ps, trans01_d0cls)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_dynexp.dats] *)
