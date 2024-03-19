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
//
(*
Author: Hongwei Xi
//
Tue 19 Mar 2024 01:11:37 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/trcmp01.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i0exp_get_lctn
#symload node with i0exp_get_node
(* ****** ****** *)
(* ****** ****** *)

#implfun
trcmp01_i0exp
( env0, iexp ) =
(
case+
iexp.node() of
//
|I0Eint _ => f0_int(env0, iexp)
|I0Ebtf _ => f0_btf(env0, iexp)
//
|_(*otherwise*) => I1Vnone1(iexp)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_int
( env0:
! trenv01
, iexp: i0exp): i1val =
(
  I1Vint(tok) ) where
{
  val-I0Eint(tok) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_btf
( env0:
! trenv01
, iexp: i0exp): i1val =
(
  I1Vbtf(sym) ) where
{
  val-I0Ebtf(sym) = iexp.node() }
//
(* ****** ****** *)
//
val () =
prerrln("trcmp01_i0exp: iexp = ", iexp)
//
(* ****** ****** *)
//
}(*where*)//end-of-[trcmp01_i0exp(env0,iexp)]


(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trcmp01_dynexp.dats] *)
(***********************************************************************)
