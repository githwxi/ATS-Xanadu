(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

(*
typedef sik = sint_k
typedef uik = uint_k
typedef slik = slint_k
typedef ulik = ulint_k
typedef ssik = ssize_k
typedef usik = usize_k
typedef sllik = sllint_k
typedef ullik = ullint_k
*)

(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)
(*
#staload "./../SATS/gint.sats"
*)
(* ****** ****** *)

impltmp
g_i<sint>(i) = i // g_i: sint -> a
impltmp
g_u<uint>(u) = u // g_u: uint -> a

(* ****** ****** *)

impltmp
g_print<sint> = gint_print_sint<>

(* ****** ****** *)

impltmp
g_neg<sint> = gint_neg_sint<>
impltmp
g_succ<sint> = gint_succ_sint<>
impltmp
g_pred<sint> = gint_pred_sint<>

(* ****** ****** *)

impltmp
g_lt<sint> = gint_lt_sint_sint<>
impltmp
g_gt<sint> = gint_gt_sint_sint<>
impltmp
g_eq<sint> = gint_eq_sint_sint<>
impltmp
g_lte<sint> = gint_lte_sint_sint<>
impltmp
g_gte<sint> = gint_gte_sint_sint<>
impltmp
g_neq<sint> = gint_neq_sint_sint<>

(* ****** ****** *)

impltmp
g_cmp<sint> = gint_cmp_sint_sint<>

(* ****** ****** *)

impltmp
g_add<sint> = gint_add_sint_sint<>
impltmp
g_sub<sint> = gint_sub_sint_sint<>
impltmp
g_mul<sint> = gint_mul_sint_sint<>
impltmp
g_div<sint> = gint_div_sint_sint<>

(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
impltmp
gint_nilq_sint<>(xs) = (xs <= 0)
impltmp
gint_consq_sint<>(xs) = (xs >= 1)
//
(*
impltmp
gint_nilq_uint<>(xs) = (xs <= 0u)
impltmp
gint_consq_uint<>(xs) = (xs >= 1u)
*)
//
(* ****** ****** *)

impltmp
gint_forall_sint<>
  (xs) =
( loop(0) ) where
{
//
typedef x0 = nint
typedef xs = sint
//
fun
loop(x0: sint): bool =
if
(x0 < xs)
then
(
if
forall$test<x0>(x0)
  then loop(succ(x0)) else false
) (* then *)
else true // end of [else]
} (* end of [gint_forall_sint] *)
//
(* ****** ****** *)
//
impltmp
gint_rforall_sint<>
  (xs) =
( loop(xs) ) where
{
//
typedef x0 = nint
typedef xs = sint
//
fun
loop(xs: sint): bool =
if
(xs > 0)
then
let
val xs = pred(xs)
in
if
rforall$test<x0>(xs) then loop(xs) else false
end
else true // end of [else]
} (* end of [gint_rforall_sint] *)
//
(* ****** ****** *)

impltmp
<y0:vt>
gint_map_list_nint
  (xs) = let
//
typedef
x0 = nint
//
fun
loop{i:nat}.<i>.
( xs
: sint(i)
, r0
: &(?list_vt(y0)) >> list_vt(y0, i)
) : void =
(
if
(xs = 0)
then
(r0 := list_vt_nil())
else
let
val x0 = xs
val xs = pred(xs)
val y0 =
map$fopr<x0><y0>(x0)
val () =
(r0 := list_vt_cons(y0, _))
in
  loop(xs, r0.1); $fold(r0)
end // else
) (* end of [loop] *)
//
in
let
var r0: list_vt(y0) in loop(xs, r0); r0
end
end (* end of [gint_map_list_nint] *)

(* ****** ****** *)

impltmp
<>(*tmp*)
gint_streamize_nint
  (n0) =
(
  auxmain(n0, 0)
) where
{
fun
auxmain
{n:int
;i:nat
|i <= n}
( n0: int(n)
, i0: int(i))
: stream_vt(nintlt(n)) =
$llazy
(
if
(i0 >= n0)
then
strmcon_vt_nil()
else
strmcon_vt_cons(i0, auxmain(n0, succ(i0)))
)
} (* end of [gint_streamize_nint] *)

(* ****** ****** *)
//
// HX:
// For implementing
// some gseq_operations
//
(* ****** ****** *)

local
//
typedef x0 = nint
typedef xs = sint
//
in(*in-of-local*)

(* ****** ****** *)
//
impltmp
gseq_nilq<x0><xs> = gint_nilq_sint<>
impltmp
gseq_consq<x0><xs> = gint_consq_sint<>
//
(* ****** ****** *)
//
impltmp
gseq_forall<x0><xs> = gint_forall_sint<>
impltmp
gseq_rforall<x0><xs> = gint_rforall_sint<>
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [gint.dats] *)
