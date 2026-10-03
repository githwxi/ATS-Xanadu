(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Fri Sep 25 12:45:24 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
//
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/xats2cc.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/cc0emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0exp_cc0emit
(iexp, env0) =
let
//
(*
//
val () =
prerrsln
("i0exp_cc0emit: iexp = ", iexp)
//
*)
//
in//let
//
case+
iexp.node() of
//
(* ****** ****** *)
| _
(*otherwise*) => f0_otherwise(iexp, env0)
(* ****** ****** *)
//
end where//endof(i0dcl_cc0emit(iexp,env0))
{
//
fun
f0_otherwise
(
iexp: i0exp,
env0: !envxcc0): void =
(
i0exp_fprint(iexp, filr)) where
{
val filr = envxcc0_filr$get(env0)
}(*where*)//end-of-[f0_otherwise(env0,dcl0)]
//
}(*where*)//end-of-[i0exp_cc0emit(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_cc0emit_dynexp.dats] *)
(***********************************************************************)
