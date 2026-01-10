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
//
(*
Author: Hongwei Xi
(*
Fri Jan  9 09:05:35 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/flens00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{arg0:t0}
{arg1:t0}
flens_get
<
flens$get$fset
( arg0, arg1 )
>
< arg0><arg1 >
( lens, arg0 ) =
let
val+
flens$get$fset
( fget, fset ) = lens in fget(arg0)
end//let//end-of-[flens_get<flens$get$fset(arg0,arg1)>]
//
#impltmp
{arg0:t0}
{arg1:t0}
flens_fset
<
flens$get$fset
( arg0, arg1 )
>
< arg0><arg1 >
(lens, arg0, arg1) =
let
val+
flens$get$fset
( fget, fset ) = lens in fset(arg0, arg1)
end//let//end-of-[flens_fset<flens$get$fset(arg0,arg1)>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{lns1:t0
,lns2:t0
,arg0:t0
,arg1:t0
,arg2:t0}
flens_get
<
flens$2comp
( lns1, lns2 )
>
< arg0><arg2 >
( lens, arg0) =
let
val+
flens$2comp
(lns1, lns2) = lens
in//let
(
flens_get
<lns2><arg1><arg2>(lns2,
  flens_get<lns1><arg0><arg1>(lns1, arg0)))
end(*let*)//end-of-[flens_get<flens$2comp(lns1,lns2)>]
//
(* ****** ****** *)
//
#impltmp
{lns1:t0
,lns2:t0
,arg0:t0
,arg1:t0
,arg2:t0}
flens_fset
<
flens$2comp
( lns1, lns2 )
>
< arg0><arg2 >
( lens
, arg0, arg2 ) =
let
val+
flens$2comp(lns1, lns2) = lens
in//let
//
let
val arg1 =
flens_get<lns1><arg0><arg1>(lns1, arg0)
val arg1 =
flens_fset<lns2><arg1><arg2>(lns2, arg1, arg2)
in//let
(
flens_fset<lns1><arg0><arg1>(lns1, arg0, arg1))
end//let
//
end(*let*)//end-of-[flens_get<flens$2comp(lns1,lns2)>]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_flens00.dats] *)
(***********************************************************************)
