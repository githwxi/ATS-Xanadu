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
Tue Nov 28 12:36:44 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/xinterp_dats.hats"
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
(* ****** ****** *)
#staload "./../SATS/xinterp.sats"
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/xinterp.dats"
(* ****** ****** *)
#symload lctn with irdcl_get_lctn
#symload node with irdcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xinterp_irdcl
  (env0, ird0) =
let
//
(* ****** ****** *)
excptcon
XINTERP_IRDCL of irdcl
(* ****** ****** *)
//
(*
val () =
println!
("xinterp_irdcl: ird0 = ", ird0)
*)
//
in//let
//
case+
ird0.node() of
//
|
IRDCLd3ecl _ => ((*0*))
//
|
IRDCLlocal0 _ =>
(
  f0_local0(env0, ird0) )
//
|
IRDCLinclude _ =>
(
  f0_include(env0, ird0) )
|
_(*otherwise*) =>
(
$raise
XINTERP_IRDCL(ird0)) where
{
//
val loc0 =
  ird0.lctn((*void*))
val (  ) = prerrln
  ("xinterp_irdcl: loc0 = ", loc0)
val (  ) = prerrln
  ("xinterp_irdcl: ird0 = ", ird0)
//
}(*where*)
//
end where
// end-of-[let] // xinterp_irdcl(...)
{
//
(* ****** ****** *)
//
fun
f0_local0
( env0:
! xintenv
, ird0: irdcl): void =
let
//
val-
IRDlocal0
( head, body) = ird0.node()
//
val () = xinterp_irdclist(env0, head)
val () = xinterp_irdclist(env0, body)
//
endlet // end-of-[f0_local0(env0,ird0)]
//
(* ****** ****** *)
//
fun
f0_include
( env0:
! xintenv
, ird0: irdcl): void =
let
val-
IRDinclude
( knd0
, tknd, gsrc
, fopt, dopt) = ird0.node()
in
case+ dopt of
|optn_nil
((*void*)) => ( (*void*) )
|optn_cons
(  irds  ) => xinterp_irdclist(env0,irds)
end// let // end-of-[f0_include(env0,ird0)]
//
(* ****** ****** *)
//
} where
{
//
val () =
(
  prerrln("xinterp_irdcl: ird0 = ", ird0) )
//
} (*where*)//end of [xinterp_irdcl(env0,ird0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xinterp_irdclist
( env0, irds ) =
(
case+ irds of
|
list_nil() => ()
|
list_cons(ird1, irds) =>
(
xinterp_irdcl(env0, ird1);
xinterp_irdclist(env0, irds)))//xinterp_irdclist
//
(* ****** ****** *)
//
#implfun
xinterp_irdclistopt
  ( env0, dopt ) =
(
case+ dopt of
|optn_nil() => ( (*void*) )
|optn_cons(irds) => xinterp_irdclist(env0, irds))
//(*case+*)//end of [xinterp_irdclistopt(env0,dopt)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xintrep_decl00.dats] *)
