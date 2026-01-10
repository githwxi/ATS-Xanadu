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
<arg0:t0>
<arg1:t0>
flens_arg$get
(lens, arg0) =
let
val+
flens$get$fset
( get, fset ) = lens in get(arg0)
end//let//end-of-[flens_arg$get(lens,arg0)]
//
#impltmp
<arg0:t0>
<arg1:t0>
flens_arg$fset
(lens, arg0, arg1) =
let
val+
flens$get$fset
( get, fset ) = lens in fset(arg0, arg1)
end//let//end-of-[flens_fset(lens,arg0,arg1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<arg0:t0>
<arg1:t0>
<arg2:t0>
flens_lens$comp
( lns1, lns2 ) =
let
val+
flens$get$fset
( get1, fset1 ) = lns1
val+
flens$get$fset
( get2, fset2 ) = lns2
//
in//let
//
(
  flens$get$fset(get12, fset12))
where
{
fun
get12
( arg0: arg0): arg2 =
let
val arg1 = get1(arg0) in get2(arg1)
end//let
fun
fset12
( arg0: arg0
, arg2: arg2): arg0 =
(
fset1(arg0, fset2(get1(arg0), arg2)))
}(*where*)
//
end//let//end-of-[flens_lens$comp(lns1,lns2)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_flens00.dats] *)
(***********************************************************************)
