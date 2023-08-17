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
(*
Author: Hongwei Xi
Start Time: June, 2019
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)

(*
#typedef sik = sint_k
#typedef uik = uint_k
#typedef slik = slint_k
#typedef ulik = ulint_k
#typedef ssik = ssize_k
#typedef usik = usize_k
#typedef sllik = sllint_k
#typedef ullik = ullint_k
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

#impltmp
g_si<sint>(i) = i // g_si: sint -> a
#impltmp
g_ui<uint>(u) = u // g_ui: uint -> a

(* ****** ****** *)

#impltmp
g_eqref<sint> = g_equal<sint>
#impltmp
g_neqrf<sint> = g_noteq<sint>

(* ****** ****** *)

#impltmp
g_print<sint> = gint_print_sint<>

(* ****** ****** *)

#impltmp
g_neg<sint> = gint_neg_sint<>
#impltmp
g_succ<sint> = gint_succ_sint<>
#impltmp
g_pred<sint> = gint_pred_sint<>

(* ****** ****** *)

#impltmp
g_lt<sint> = gint_lt_sint_sint<>
#impltmp
g_gt<sint> = gint_gt_sint_sint<>
#impltmp
g_eq<sint> = gint_eq_sint_sint<>
#impltmp
g_lte<sint> = gint_lte_sint_sint<>
#impltmp
g_gte<sint> = gint_gte_sint_sint<>
#impltmp
g_neq<sint> = gint_neq_sint_sint<>

(* ****** ****** *)

#impltmp
g_cmp<sint> = gint_cmp_sint_sint<>
#impltmp
g_cmp<uint> = gint_cmp_uint_uint<>

(* ****** ****** *)

#impltmp
g_add<sint> = gint_add_sint_sint<>
#impltmp
g_sub<sint> = gint_sub_sint_sint<>
#impltmp
g_mul<sint> = gint_mul_sint_sint<>
#impltmp
g_div<sint> = gint_div_sint_sint<>

(* ****** ****** *)

#impltmp
g_parse<sint> = gint_parse_sint<>
#impltmp
g_parse<uint> = gint_parse_uint<>

(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
#impltmp
gint_nilq_sint<>(xs) = (xs <= 0)
#impltmp
gint_consq_sint<>(xs) = (xs >= 1)
//
(*
#impltmp
gint_nilq_uint<>(xs) = (xs <= 0u)
#impltmp
gint_consq_uint<>(xs) = (xs >= 1u)
*)
//
(* ****** ****** *)

#impltmp
gint_forall_sint<>
  (xs) =
( loop(0) ) where
{
//
#typedef x0 = nint
#typedef xs = sint
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
#impltmp
gint_foreach_sint<>
  (xs) =
( loop(0) ) where
{
//
#typedef x0 = nint
#typedef xs = sint
//
fun
loop(x0: sint): void =
if
(x0 < xs)
then
loop(succ(x0)) where
{
val () = foreach$work<x0>(x0)
} else ((*void*)) //end(else)
} (* end of [gint_foreach_sint] *)
//
(* ****** ****** *)
//
#impltmp
gint_rforall_sint<>
  (xs) =
( loop(xs) ) where
{
//
#typedef x0 = nint
#typedef xs = sint
//
fun
loop(xs: sint): bool =
if
(xs > 0)
then
let
val xs = pred(xs)
in//let
if
rforall$test<x0>(xs)
then loop(xs) else false
end(*let*)// end-of-[then]
else true // end-of-[else]
} (* end of [gint_rforall_sint] *)
//
(* ****** ****** *)

#impltmp
<>(*tmp*)
gint_listize_nint
  {n}(xs) = let
//
#typedef x0 = nintlt(n)
#typedef y0 = nintlt(n)
//
#impltmp
map$fopr<x0><y0>(x0) = x0
//
in
  gint_map_llist_nint<y0>( xs )
end // end of [gint_listize_nint]

(* ****** ****** *)

#impltmp
<>(*tmp*)
gint_rlistize_nint
  {n}(xs) = let
//
#typedef x0 = nintlt(n)
#typedef y0 = nintlt(n)
//
#impltmp
map$fopr
<x0><y0>(x0) = ( xs-1-x0 )
//
in
  gint_map_llist_nint<y0>( xs )
end // end of [gint_rlistize_nint]

(* ****** ****** *)

#impltmp
<y0:vt>
gint_map_llist_nint
  {n}(xs) = let
//
#typedef x0 = nintlt(n)
//
fun
loop{i:nat}.<i>.
( i0
: sint(i)
, r0
: &(?list_vt(y0)) >> list_vt(y0, i)
) : void =
(
if
(i0 = xs)
then
(r0 := list_vt_nil())
else
let
val x0 = i0
val i0 = succ(i0)
val y0 =
map$fopr<x0><y0>(x0)
val () =
(r0 := list_vt_cons(y0, _))
in
  loop(i0, r0.1); $fold(r0)
end // else
) (* end of [loop] *)
//
in
let
val i0 = 0
var r0: list_vt(y0) in loop(i0, r0); r0
end
end (* end of [gint_map_llist_nint(xs)] *)

(* ****** ****** *)

#impltmp
<>(*tmp*)
gint_strmize_nint
  (n0) =
(
auxmain(n0, 0)) where
{
fun
auxmain
{n:int
;i:nat
|i <= n}
( n0: int(n)
, i0: int(i))
: strm_vt(nintlt(n)) =
$llazy
(
if
(i0 >= n0)
then
strmcon_vt_nil()
else
strmcon_vt_cons
(i0, auxmain(n0, succ(i0)))
)
}(*where*)//end-of(gint_strmize_nint)

(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gint_strmize_sint
  (i0) =
(
if
(i0 <= 0)
then strm_vt_nil((*void*))
else gint_strmize_nint(i0))//#impltmp
//
(* ****** ****** *)
//
// HX:
// For #implementing
// some g_operations
//
(* ****** ****** *)
//
(*
#impltmp
g_si<sint>(i) = i // see above
#impltmp
g_ui<uint>(u) = u // see above
*)
#impltmp
g_si<uint>(i) = gint_sint2uint(i)
#impltmp
g_ui<sint>(u) = gint_uint2sint(u)
//
(* ****** ****** *)
//
// HX:
// For #implementing
// some gseq_operations
//
(* ****** ****** *)

local
//
#typedef x0 = nint
#typedef xs = sint
//
in(*in-of-local*)

(* ****** ****** *)
//
#impltmp
gseq_nilq<xs><x0> = gint_nilq_sint<>
#impltmp
gseq_consq<xs><x0> = gint_consq_sint<>
//
(* ****** ****** *)
//
#impltmp
gseq_forall<xs><x0> = gint_forall_sint<>
#impltmp
gseq_foreach<xs><x0> = gint_foreach_sint<>
#impltmp
gseq_rforall<xs><x0> = gint_rforall_sint<>
//
(* ****** ****** *)
//
#impltmp
gseq_listize<xs><x0> = gint_listize_sint<>
#impltmp
gseq_strmize<xs><x0> = gint_strmize_sint<>
//
(* ****** ****** *)

endloc // end of [local(gint_... -> gseq_...)]

(* ****** ****** *)
//
(*
HX-2023-08-15:
Tue Aug 15 08:23:58 EDT 2023
*)
//
#impltmp
gint_repeat_sint_c0fr
<(*none*)>(sint, work) =
(
  gint_foreach_sint<>(sint)) where
{
  #impltmp foreach$work<nint>(_) = work() }
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gint000.dats] *)
