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
Sun 12 Feb 2023 09:36:32 AM EST
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
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2b.sats"
(* ****** ****** *)

#implfun
d2parsed_at_trsym2b
  (dpar) = let
//
val
parsed =
d2parsed_get_parsed(dpar)
//
val
env0 = tr2aenv_make_nil()
//
val () =
trsym2b_d2eclistopt(env0, parsed)
//
in//let
let
val d2cenv = tr2aenv_free_top(env0)
end
end (*let*)//end-of-[d2parsed_at_trsym2b(dpar)]

(* ****** ****** *)
//
#implfun
<x0>(*tmp*)
list_trsym2b_fnp
( e1, xs, work ) =
(
  loop(e1, xs) ) where
{
fun
loop
( e1: !tr2aenv
, xs: list(x0)): void =
(
case+ xs of
| list_nil() => ()
| list_cons(x1, xs) =>
  (work(e1, x1); loop(e1, xs)))
}(*where*)//end(list_trsym2b_fnp(e1,xs,work))
//
(* ****** ****** *)
//
#implfun
<x0>(*tmp*)
optn_trsym2b_fnp
( e1, xs, work ) =
(
case+ xs of
| optn_nil() => ()
| optn_cons(x1) => work(e1, x1)
)(*case+*)//end(optn_trsym2b_fnp(e1,xs,work))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trsym2b.dats] *)
