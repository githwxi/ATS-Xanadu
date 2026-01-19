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
Sat Jan 10 04:52:53 PM EST 2026
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
#staload "./../SATS/glens00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{nam1:t0}
{nam2:t0}
{arg0:vt}
{arg1:vt}
{arg2:vt}
glens_lget
<
glens$2comp
( nam1
, nam2, arg1)><arg0><arg2>
(
    arg0    ) =
let
pvx () =
owed_vt_return0
( pf01 , arg1 ) in (pf12 | arg2) end
where
{
val
(pf01 | arg1) =
(
  glens_lget<nam1><arg0><arg1>(arg0))
val
(pf12 | arg2) =
(
  glens_lget<nam2><arg1><arg2>(arg1)) }
//
(* ****** ****** *)
//
#impltmp
{nam1:t0}
{nam2:t0}
{arg0:vt}
{arg1:vt}
{arg2:vt}
glens_lset
<
glens$2comp
( nam1
, nam2, arg1)><arg0><arg2>
( pf12
| arg0, arg2) =
let
pvx () =
owed_vt_return0
( pf01 , arg1 ) in ( (*void*) ) end
where
{
val
(pf01 | arg1) =
(
  glens_lget<nam1><arg0><arg1>(arg0))
val
( (*void*) ) =
(
  glens_lset
  <nam2><arg1><arg2>(pf12 | arg1, arg2))
}(*where*)//end-of-[glens_lset<glens$2comp>]
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
glens$t2up$0 = glens$t2up$0
datatype
glens$t2up$1 = glens$t2up$1
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
{ x1:t0 }
glens_get
<glens$t2up$0><(x0, x1)><x0>(xs) = xs.0
#impltmp
{ x0:t0 }
{ x1:t0 }
glens_get
<glens$t2up$1><(x0, x1)><x1>(xs) = xs.1
//
#impltmp
{ x0:t0 }
{ x1:t0 }
glens_fset
<glens$t2up$0><(x0, x1)><x0>(xs, x0) = (x0, xs.1)
#impltmp
{ x0:t0 }
{ x1:t0 }
glens_fset
<glens$t2up$1><(x0, x1)><x1>(xs, x1) = (xs.0, x1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_glens00.dats] *)
(***********************************************************************)
