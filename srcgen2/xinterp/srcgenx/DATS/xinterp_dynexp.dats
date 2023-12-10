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
Tue Nov 28 12:33:03 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/libxinterp.hats"
//
(* ****** ****** *)
//
#include
"./../HATS/xinterp_dats.hats"
//
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
(* ****** ****** *)
#staload "./../SATS/xinterp.sats"
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/xinterp.dats"
(* ****** ****** *)
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xinterp_irexp
  (env0, ire0) =
let
//
(* ****** ****** *)
excptcon
XINTERP_IREXP of irexp
(* ****** ****** *)
//
(*
val () =
println!
("xinterp_irexp: ire0 = ", ire0)
*)
//
in//let
//
case+
ire0.node() of
//
|IREint(tok) =>
(
 IRVint(token2dint(tok)))
|IREbtf(sym) =>
(
 IRVbtf(symbl2dbtf(sym)))
|IREchr(tok) =>
(
 IRVchr(token2dchr(tok)))
|IREstr(tok) =>
(
 IRVstr(token2dstr(tok)))
//
|
_(*otherwise*) =>
(
$raise XINTERP_IREXP(ire0)
) where
{
//
val loc0 =
  ire0.lctn((*void*))
val (  ) = prerrln
  ("xinterp_irexp: loc0 = ", loc0)
val (  ) = prerrln
  ("xinterp_irexp: ire0 = ", ire0)
//
}(*where*)
//
end where
// end-of-[let] // xinterp_irexp(...)
{
} (*where*)//end of [xinterp_irexp(env0,ire0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xinterp_irexplst
( env0, ires ) =
(
list_xinterp_fnp
(env0, ires, xinterp_irexp))//xinterp_irexplst
//
#implfun
xinterp_irexpopt
( env0, dopt ) =
(
optn_xinterp_fnp
(env0, dopt, xinterp_irexp))//xinterp_irexpopt
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xintrep_dynexp.dats] *)
