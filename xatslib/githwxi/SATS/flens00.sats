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
Fri Jan  9 08:22:13 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
flens$get
( arg0: t0
, arg1: t0) = (arg0) -> arg1
//
#typedef
flens$fset
( arg0: t0
, arg1: t0) = (arg0, arg1) -> arg0
//
(* ****** ****** *)
//
datatype
flens$get$fset
( arg0: t0
, arg1: t0) =
flens$get$fset of (
flens$get(arg0, arg1), flens$fset(arg0, arg1))
//
#typedef
flens(arg0:t0,arg1:t0) = flens$get$fset(arg0, arg1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<arg0:t0>
<arg1:t0>
flens_arg$get
( lens
: flens(arg0, arg1), arg0): arg1
//
fun
<arg0:t0>
<arg1:t0>
flens_arg$fset
( lens
: flens(arg0, arg1), arg0, arg1): arg0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<arg0:t0>
<arg1:t0>
<arg2:t0>
flens_lens$comp
( lens: flens(arg0, arg1)
, lns2: flens(arg1, arg2)): flens(arg0, arg2)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_SATS_flens00.sats] *)
(***********************************************************************)
