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
(* ****** ****** *)
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1val_none0
(  loc0  ) =
i1val_make_node
(loc0,I1Vnone0((*void*)))
#implfun
i1val_none1
(  i0e0  ) =
i1val_make_node
(
i0e0.lctn(),I1Vnone1(i0e0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_none0
(  loc0  ) =
i1dcl_make_node
(loc0,I1Dnone0((*void*)))
#implfun
i1dcl_none1
(  dcl0  ) =
i1dcl_make_node
(
dcl0.lctn(),I1Dnone1(dcl0))
//
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
i1reg_new0() =
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
//
local
//
datatype
i1val =
I1VAL of
(loctn, i1val_node)
datavwtp
i1val_vt =
I1VAL_vt of
(loctn, i1val_node)
//
#absimpl i1val_tbox = i1val
//
in (* in-of-local *)
//
#implfun
i1val_make_node
(   loc,nod   ) =
(
  I1VAL(loc, nod) )
//
#implfun
i1val_get_lctn(i1v) =
let
val+
I1VAL(loc,nod) = i1v in loc end
#implfun
i1val_get_node(i1v) =
let
val+
I1VAL(loc,nod) = i1v in nod end
//
endloc (*local*) // end of [local(i1val)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
i1dcl =
I1DCL of
(loctn, i1dcl_node)
datavwtp
i1dcl_vt =
I1DCL_vt of
(loctn, i1dcl_node)
//
#absimpl i1dcl_tbox = i1dcl
//
in (* in-of-local *)
//
#implfun
i1dcl_make_node
(   loc,nod   ) =
(
  I1DCL(loc, nod) )
//
#implfun
i1dcl_get_lctn(i1d) =
let
val+
I1DCL(loc,nod) = i1d in loc end
#implfun
i1dcl_get_node(i1d) =
let
val+
I1DCL(loc,nod) = i1d in nod end
//
endloc (*local*) // end of [local(i1dcl)]
//
(* ****** ****** *)
(* ****** ****** *)

local
//
datatype
i1parsed =
I1PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
i1dclistopt)//program
//
#absimpl
i1parsed_tbox = i1parsed
//
in//local

(* ****** ****** *)
//
#implfun
i1parsed_get_stadyn
  (ipar) =
(
  stadyn ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_get_stadyn]
//
#implfun
i1parsed_get_nerror
  (ipar) =
(
  nerror ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_get_nerror]
//
#implfun
i1parsed_get_source
  (ipar) =
(
  source ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_get_source]
//
(* ****** ****** *)

#implfun
i1parsed_get_parsed
  (ipar) =
(
  parsed ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_get_parsed]

(* ****** ****** *)
//
#implfun
i1parsed_make_args
( stadyn
, nerror
, source, parsed) =
(
I1PARSED
( stadyn
, nerror, source, parsed)) where
{
//
(*
val () =
prerrln
("i1parsed_make_args:nerror=",nerror)
*)
//
} (*where*) // end-of-[i1parsed_make_args]
//
(* ****** ****** *)

endloc (*local*) // end of [ local(i1parsed) ]

(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep1.dats] *)
(***********************************************************************)
