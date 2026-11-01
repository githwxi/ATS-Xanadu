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
Sun May 31 03:02:54 PM EDT 2026
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
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1val_nil
(  loc0  ) =
i1val_make_node
(
loc0, I1V000((*void*)))
//
(* ****** ****** *)
//
#implfun
i1val_con(dcon) =
let
val loc0 =
d2con_get_lctn(dcon)
in//let
i1val(loc0, I1Vcon(dcon))
end//let//i1val_con(dcon)
//
#implfun
i1val_cst(dcst) =
let
val loc0 =
d2cst_get_lctn(dcst)
in//let
i1val(loc0, I1Vcst(dcst))
end//let//i1val_cst(dcst)
//
(* ****** ****** *)
//
#implfun
i1val_var(dvar) =
let
val loc0 =
d2var_get_lctn(dvar)
in//let
i1val(loc0, I1Vvar(dvar))
end//let//i1val_var(dvar)
//
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
i1dcl_lctn$get(i1d) =
let
val+
I1DCL(loc,nod) = i1d in loc end
#implfun
i1dcl_node$get(i1d) =
let
val+
I1DCL(loc,nod) = i1d in nod end
//
endloc (*local*) // end of [local(i1dcl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
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
//
(* ****** ****** *)
//
#implfun
i1parsed_stadyn$get
  (ipar) =
(
  stadyn ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_stadyn$get]
//
#implfun
i1parsed_nerror$get
  (ipar) =
(
  nerror ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_nerror$get]
//
#implfun
i1parsed_source$get
  (ipar) =
(
  source ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_source$get]
//
(* ****** ****** *)
//
#implfun
i1parsed_parsed$get
  (ipar) =
(
  parsed ) where
{
val+
I1PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i1parsed_parsed$get]
//
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
prerrsln
("i1parsed_make_args:nerror=",nerror)
*)
//
} (*where*) // end-of-[i1parsed_make_args]
//
(* ****** ****** *)
//
endloc (*local*) // end of [ local(i1parsed) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_intrep1.dats] *)
(***********************************************************************)
(***********************************************************************)
