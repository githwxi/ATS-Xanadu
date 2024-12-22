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
(*
Fri 12 Jul 2024 11:29:01 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
#typedef si = sint
#typedef ut = unit
(* ****** ****** *)
(* ****** ****** *)
#impltmp
g_0<si>() = ( 0 )
#impltmp
g_1<si>() = ( 1 )
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_si<si>(i0) = (i0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_lt<si> = sint_lt$sint<>
#impltmp
g_gt<si> = sint_gt$sint<>
#impltmp
g_eq<si> = sint_eq$sint<>
//
#impltmp
g_lte<si> = sint_lte$sint<>
#impltmp
g_gte<si> = sint_gte$sint<>
#impltmp
g_neq<si> = sint_neq$sint<>
//
#impltmp
g_cmp<si> = sint_cmp$sint<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_add<si> = sint_add$sint<>
#impltmp
g_sub<si> = sint_sub$sint<>
#impltmp
g_mul<si> = sint_mul$sint<>
#impltmp
g_div<si> = sint_div$sint<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<si> = sint_print<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_neg( i1 ) = ( 0 - i1 )
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_suc( i1 ) = ( i1 + 1 )
#impltmp
<(*tmp*)>
sint_pre( i1 ) = ( i1 - 1 )
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_abs( i1 ) =
(
if i1 >= 0 then i1 else -i1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_cmp$sint
  (i1, i2) =
(
if
(i1 < i2) then -1 else
(if (i1 > i2) then 1 else 0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
gasz_length<ni><ut>(ni) = (ni)
#impltmp
gseq_length<ni><ut>(ni) = (ni)
//
#impltmp
gasz_length<ni><ni>(ni) = (ni)
#impltmp
gseq_length<ni><ni>(ni) = (ni)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-07:
For some unsafe stuff:
Wed 07 Aug 2024 03:56:12 PM EDT
*)
//
#impltmp
$UN.gasz_get$at$raw
< nint >< unit >(ni, i0) = unit
#impltmp
$UN.gasz_lget$at$raw
< nint >< unit >(ni, i0) =
let
prval pf =
  owed_t0_make{unit}() in (pf|unit) end
//let//end($UN.gasz_get$at$raw<strn><cgtz>)
//
(* ****** ****** *)
//
#impltmp
$UN.gasz_get$at$raw
< nint >< nint >(ni, i0) = (i0)
#impltmp
$UN.gasz_lget$at$raw
< nint >< nint >(ni, i0) =
let
prval pf =
  owed_t0_make{nint}() in (pf|(i0)) end
//let//end($UN.gasz_get$at$raw<strn><cgtz>)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gint000.dats] *)
