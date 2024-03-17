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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Sat 16 Mar 2024 01:05:12 PM EDT
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
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../../SATS/xstamp0.sats"
#staload
"./../../../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)
(* ****** ****** *)
//
local
val
stamper = stamper_new((*0*))
//
val
_(*nil*) = stamper.getinc((*0*))
//
in//local
fun
the_i1reg_stamp_new
  ((*void*)): stamp = stamper.getinc()
endloc // end-of-[the_i1reg_stamp_new()]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i1opr =
I1OPR of (symbl)
#absimpl
i1opr_tbox = i1opr
//
in // in-of-local
//
#implfun
i1opr_fprint
(out, iopr) =
let
//
#impltmp
g_print$out<>() = out
//
val+I1OPR(name) = iopr
//
in//let
  print("I1OPR(", name, ")") endlet
//
end (*local*) // end of [local(i1opr_tbox)]
//
(* ****** ****** *)
//
local
//
datatype
i1reg =
I1REG of (stamp)
//
#absimpl i1reg_tbox = i1reg
//
in//local
//
#implfun
i1reg_new1() =
(
  I1REG(stmp)) where
{
  val stmp = the_i1reg_stamp_new()
}
//
#implfun
i1reg_fprint
(out, ireg) =
let
//
#impltmp
g_print$out<>() = out
//
val+I1REG(stmp) = ireg
//
in//let
  print("I1REG(", stmp, ")") endlet
//
end (*local*) // end of [local(i1reg_tbox)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep1.dats] *)
(***********************************************************************)
