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
(*
Sun Apr 12 11:53:56 AM EDT 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/gasqseg.sats"
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
#impltmp
< xs:t0 >
< x0:vt >
gasq$seg_make
(xs, lb, ub) =
(
gasq$seg_encd@(xs, lb, ub)
) where
{
//
val ln = xs.length((*void*))
//
val lb = sint_max$sint<>(lb, 0)
val ub = sint_min$sint<>(ub, ln)
//
}(*where*)//end-of-[gasq$seg(xs,lb,ub)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0 }
{ x0:vt }
g_print
<
gasq$seg
(xs, x0)>(sg) =
(
prints("\
gasq$seg(",
xs, ";", lb, ";", ub, ")"))
where
{
val (xs, lb, ub) = gasq$seg_decd(sg)
}(*where*)//end(g_print<gasq$seg(xs,x0)>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:vt }
gasq_length
<
gasq$seg(xs,x0)>
<      x0      >
(      sg      ) =
let
//
val
( xs
, lb
, ub ) =
gasq$seg_decd(sg)
val xs =
GASQ_unmk<xs><x0>(xs) in (ub - lb)
end(*let*)//end(gasq_length<gasq$seg(xs,x0)>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:vt }
gasq_forall
<
gasq$seg(xs,x0)>
<      x0      >
(      sg      ) =
let
//
val
( xs
, lb
, ub ) =
gasq$seg_decd(sg)
val xs =
GASQ_unmk<xs><x0>(xs)
in//let
(
  nint_forall<>(ub - lb))
where
{
#impltmp
forall$test<ni>(i0) =
let
val b0 =
(
  forall$test1<x0>(x0))
pvx () =
(
  owed_vt_return0(pf, x0)) in b0 end
where
{
val
(pf|x0) =
$UN.gasq_lget$at$raw<xs><x0>(xs, lb+i0)
}(*where*)
}(*where*)
end(*let*)//end(gasq_forall<gasq$seg(xs,x0)>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:vt }
gasq_rforall
<
gasq$seg(xs,x0)>
<      x0      >
(      sg      ) =
let
//
val
( xs
, lb
, ub ) =
gasq$seg_decd(sg)
val xs =
GASQ_unmk<xs><x0>(xs)
//
in//let
(
  nint_rforall<>(ub - lb))
where
{
#impltmp
rforall$test<ni>(i0) =
let
val b0 =
(
  rforall$test1<x0>(x0))
pvx () =
(
  owed_vt_return0(pf, x0)) in b0 end
where
{
val
(pf|x0) =
$UN.gasq_lget$at$raw<xs><x0>(xs, lb+i0)
}(*where*)
}(*where*)
end(*let*)//end(gasq_rforall<gasq$seg(xs,x0)>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:vt }
gasq_strmize
<
gasq$seg(xs,x0)>
<      x0      >
(      sg      ) =
let
//
val
( xs
, lb
, ub ) =
gasq$seg_decd(sg)
val xs =
GASQ_unmk<xs><x0>(xs)
//
in//let
(
nint_map_lstrm<x0>(ub-lb))
where
{
#impltmp
map$fopr<ni><x0>(i0) =
(
$UN.gasq_cget$at$raw
<   xs   ><   x0   >( xs, lb+i0 ))
}
end(*let*)//end(gasq_strmize<gasq$seg(xs,x0)>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0 }
$UN.gasq_lget$at$raw
<
gasq$seg(xs, x0)><x0>
(      sg , i0      ) =
let
val
( xs
, lb
, ub ) = gasq$seg_decd(sg)
val xs = GASQ_unmk<xs><x0>(xs) in
(
  $UN.gasq_lget$at$raw<xs><x0>(xs, lb+i0))
end(*let*)//end($UN.gasq_lget$at$raw<gasq$seg>)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_pre2026_DATS_gasqseg.dats] *)
(***********************************************************************)
