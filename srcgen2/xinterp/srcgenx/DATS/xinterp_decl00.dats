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
(* ****** ****** *)
excptcon
XINTERP_IRDCL of irdcl
excptcon
XINTERP_IRVALDCL of irvaldcl
(* ****** ****** *)
(* ****** ****** *)
//
#symload lctn with irdcl_get_lctn
#symload node with irdcl_get_node
//
(* ****** ****** *)
//
#implfun
xinterp_irdcl
  (env0, ird0) =
let
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
fun
f0_vardclst
( env0:
! xintenv
, irdcl: irdcl): void =
let
val-
IRDvardclst
( tknd
, irvs) = irdcl.node()
in
  xinterp_irvardclist(env0, irvs)
end// let // end-of-[f0_vardclst(env0,ird0)]
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
//
#implfun
xinterp_irvaldcl
  (env0, dval) = let
//
val loc0 =
irvaldcl_get_lctn(dval)
val dpat =
irvaldcl_get_dpat(dval)
val tdxp =
irvaldcl_get_tdxp(dval)
//
in//let
case+ tdxp of
|
TEQIREXPnone
( (*void*) ) => ()
|
TEQIREXPsome
(teq0, ire1) =>
let
val irv1 =
xinterp_irexp(env0, ire1)
in//let
//
if
irpat_valck
(dpat, irv1)
then
(
irpat_match(env0,dpat,irv1))
else
(
$raise XINTERP_IRVALDCL(dval)) where
{
val () =
prerrln("xinterp_irvaldcl: dpat = ", dpat)
val () =
prerrln("xinterp_irvaldcl: irv1 = ", irv1)
}
//
end//let
end//let
//(*let*)//end-of[trans3a_d3valdcl(env0,dval)]
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
//(*case+*)//end-of-[xinterp_irdclistopt(env0, dopt)
//
(* ****** ****** *)
//
#implfun
xinterp_irvaldclist
( env0, irvs ) =
(
case+ irvs of
|
list_nil() => ()
|
list_cons(irv1, irvs) =>
(
xinterp_irvaldcl(env0, irv1);
xinterp_irvaldclist(env0, irvs)))//xinterp_irvaldclist
//
(* ****** ****** *)
//
#implfun
xinterp_irvardclist
( env0, irvs ) =
(
case+ irvs of
|
list_nil() => ()
|
list_cons(irv1, irvs) =>
(
xinterp_irvardcl(env0, irv1);
xinterp_irvardclist(env0, irvs)))//xinterp_irvardclist
//
(* ****** ****** *)
//
#implfun
xinterp_irfundclist
( env0, irfs ) =
(
case+ irfs of
|
list_nil() => ()
|
list_cons(irf1, irfs) =>
(
xinterp_irfundcl(env0, irf1);
xinterp_irfundclist(env0, irfs)))//xinterp_irvardclist
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xintrep_decl00.dats] *)
