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
Mon Mar  9 02:43:10 PM EDT 2026
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
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d2var_get_lctn
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
//
local
//
datatype
i0parsed =
I0PARSED of
(
sint  // stadyn
,
sint  // nerror
,
lcsrc // source
,
i0dclistopt)//program
//
#absimpl
i0parsed_tbox = i0parsed
//
in//local
//
(* ****** ****** *)
//
#implfun
i0parsed_stadyn$get
  (ipar) =
(
  stadyn ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_stadyn$get]
//
#implfun
i0parsed_nerror$get
  (ipar) =
(
  nerror ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_nerror$get]
//
#implfun
i0parsed_source$get
  (ipar) =
(
  source ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_source$get]
//
(* ****** ****** *)
//
#implfun
i0parsed_parsed$get
  (ipar) =
(
  parsed ) where
{
val+
I0PARSED
( stadyn
, nerror, source, parsed) = ipar
} (*where*)//end-of-[i0parsed_parsed$get]
//
(* ****** ****** *)
//
#implfun
i0parsed_make_args
( stadyn
, nerror
, source, parsed) =
(
I0PARSED
( stadyn
, nerror, source, parsed)) where
{
//
(*
val () =
prerrsln
("i0parsed_make_args:nerror=",nerror)
*)
//
} (*where*) // end-of-[i0parsed_make_args]
//
(* ****** ****** *)
//
endloc (*local*) // end of [ local(i0parsed) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_intrep0.dats] *)
(***********************************************************************)
