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
(*
Sun 21 Jul 2024 02:34:24 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gasq_get$at
 ( xs,i0 ) =
let
val n0 =
gasq_length<xs><x0>(xs)
in//let
if
(i0 >= n0)
then
get$at$exn<xs><x0>(xs, i0)
else
let
val
(
pf|x0) =
$UN.gasq_lget$at$raw
<   xs   ><   x0   >(xs, i0)
in//let
let
pvx () = owed_t0_elim0(pf) in x0
end//let
end//let
end//let//end-of-[gasq_get$at(xs,i0)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gasq_set$at
(xs, i0, x0) =
let
val n0 =
gasq_length<xs><x0>(xs)
in//let
if
(i0 >= n0)
then
set$at$exn<xs><x0>(xs,i0,x0)
else
let
pvx pf = owed_t0_make{x0}()
in//let
$UN.gasq_lset$at$raw
<   xs   ><   x0   >(pf | xs,i0,x0)
end//let//else//end-of-[if]
//
end//let//end-of-[gasq_set$at(xs,i0,x0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
HX:
This one is
moved to [unsfx00.dats]
//
#impltmp
< xs:t0 >
< x0:vt >
$UN.gasq_cget$at$raw
  (xs, i0) =
let
//
val
(
pf|x0) =
$UN.gasq_lget$at$raw
<  xs  ><  x0  >( xs, i0 )
//
in//let
//
let
val x1 = g_copy<x0>(x0)
pvx () =
  owed_vt_return0(pf, x0) in x1 end
//
end//let//end-of-[$UN.gasq_cget$at$raw]
*)
//
(* ****** ****** *)
//
(*
//
HX:
This one is
moved to [unsfx00.dats]
//
#impltmp
< xs:t0 >
< x0:vt >
$UN.gasq_setf$at$raw
  (xs, i0, x0) =
let
//
val
(pf | x1) =
$UN.gasq_lget$at$raw
<  xs  ><  x0  >( xs, i0 )
//
in//let
let
  val () = g_free< x0 >( x1 )
in//let
(
$UN.gasq_set$at$raw(pf | xs, i0, x0))
end//let
end//let//end-of-[$UN.gasq_setf$at$raw]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_gasq000.dats] *)
(***********************************************************************)
