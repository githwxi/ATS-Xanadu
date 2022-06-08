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
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(*
#staload
"./../SATS/strn000.sats"
*)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#impltmp<>
strn_nil() =
strn_make_list<>
(list_nil((*void*)))
//
(* ****** ****** *)

#impltmp<>
strn_nilq(cs) =
char_eqzq(strn_head_opt(cs))
#impltmp<>
strn_consq(cs) =
char_neqzq(strn_head_opt(cs))

(* ****** ****** *)

#impltmp<>
strn_head(cs) =
(strn_head_raw(cs))
#impltmp<>
strn_tail(cs) =
(strn_tail_raw(cs))

(* ****** ****** *)
//
(*
#impltmp<>
strn_head_opt(cs) = ...
*)
//
#impltmp<>
strn_tail_opt(cs) =
if
strn_nilq(cs)
then
optn_vt_nil((*void*))
else
optn_vt_cons(strn_tail_raw(cs))
//
(* ****** ****** *)
//
#impltmp<>
strn_lt(x1, x2) = 
(strn_cmp<>(x1, x2) < 0)
#impltmp<>
strn_gt(x1, x2) = 
(strn_cmp<>(x1, x2) > 0)
#impltmp<>
strn_eq(x1, x2) = 
(strn_cmp<>(x1, x2) = 0)
#impltmp<>
strn_lte(x1, x2) = 
(strn_cmp<>(x1, x2) <= 0)
#impltmp<>
strn_gte(x1, x2) = 
(strn_cmp<>(x1, x2) >= 0)
#impltmp<>
strn_neq(x1, x2) = 
(strn_cmp<>(x1, x2) != 0)
//
(* ****** ****** *)

#impltmp<>
strn_print(cs) =
let
#impltmp
gseq_print$beg<>() = ()
#impltmp
gseq_print$sep<>() = ()
#impltmp
gseq_print$end<>() = ()
in
gseq_print<strn><cgtz>(cs)
end(*let*)//end of [strn_print]

(* ****** ****** *)

#impltmp<>
strn_length
  (xs) =
(
  loop(xs, 0)
) where
{
//
fnx
loop
{i,j:nat}.<i>.
( xs: strn(i)
, j0: sint(j)): sint(i+j) =
let
val
test = strn_nilq(xs)
in
if
test
then j0 else
loop(strn_tail(xs), succ(j0))
end
// end of [if]
}(*where*)//end-of(strn_length)

(* ****** ****** *)
//
#impltmp<>
strn_append
  (xs, ys) =
(
strn_vt2t
(strn_append_vt(xs, ys))
)
//
#impltmp<>
strn_append_vt
  (xs, ys) =
let
//
val zs =
list_vt_append0<cgtz>
( strn_listize<>(xs)
, strn_listize<>(ys))
//
in
strn_vt_make_list_vt<>(zs)
end // end of [strn_append_vt]
//
(* ****** ****** *)

#impltmp<>
strn_reverse
{n0}(cs) =
let
val n0 =
strn_length<>(cs)
in
//
let
//
#typedef c0 = cgtz
//
#impltmp
tabulate$fopr
<c0><n0>(i0) =
let
val j0 = (n0-1)-i0
in
  strn_get_at<>(cs, j0)
end
//
in
  strn_tabulate<n0>(n0)
end
//
end // end of [strn_reverse]

(* ****** ****** *)

#impltmp<>
strn_reverse_vt
{n0}(cs) =
let
val n0 =
strn_length<>(cs)
in
//
let
//
#typedef c0 = cgtz
//
#impltmp
tabulate$fopr
<c0><n0>(i0) =
let
val j0 = (n0-1)-i0
in
  strn_get_at<>(cs, j0)
end
//
in
  strn_vt_tabulate<n0>(n0)
end
//
end // end of [strn_reverse_vt]

(* ****** ****** *)

#impltmp<>
strn_forall
  (xs) =
( loop(xs) ) where
{
//
#typedef x0 = cgtz
#typedef xs = strn
//
fnx
loop(xs: xs): bool =
if
strn_nilq
  (xs)
then true else
let
val x0 =
strn_head_raw(xs)
in
if
forall$test<x0>(x0)
then
loop
(strn_tail_raw(xs)) else false
// end of [if]
end // end of [else]
} (* end of [strn_forall/uncons] *)

(* ****** ****** *)
#impltmp
<>(*tmp*)
strn_listize
  {n}( cs ) =
(
auxmain(n0, r0)) where
{
//
val n0 = length(cs)
val r0 = list_vt_nil()
//
fun
auxmain
{i,j:nat}
( i0: sint(i)
, r0
: list_vt(cgtz, j))
: list_vt(cgtz, i+j) =
(
if
(i0 <= 0)
then r0 else
let
  val i1 = i0 - 1
  val ci = cs[i1]
in
auxmain(i1, list_vt_cons(ci, r0))
end // end of [else]
)
} (*where*) // end of [strn_listize]
(* ****** ****** *)
#impltmp
<>(*tmp*)
strn_strmize(cs) =
(
  auxmain(0)) where
{
//
val n0 = length(cs)
//
fun
auxmain
(i0: nint): strm_vt(cgtz) =
$llazy
(
if
(i0 >= n0)
then
(
  strmcon_vt_nil()
)
else
let
  val ci = cs[i0]
  val i0 = succ(i0)
in
  strmcon_vt_cons(ci, auxmain(i0))
end // end of [else]
)
} (*where*) // end of [strn_strmize]
(* ****** ****** *)
#impltmp
<>(*tmp*)
strn_rlistize
  {n}(cs) =
(
auxmain(n0, r0)) where
{
//
val i0 = 0
val n0 = length(cs)
val r0 = list_vt_nil()
//
fun
auxmain
{i,j:nat
|i <= n}
( i0: sint(i)
, r0
: list_vt(cgtz, j))
: list_vt(cgtz, n-i+j) =
(
if
(i0 < n0)
then r0 else
let
  val ci = cs[i0]
  val i1 = i0 + 1
in
auxmain(i1, list_vt_cons(ci, r0))
end // end of [else]
)
} (*where*) // end of [strn_rlistize]
(* ****** ****** *)
//
#impltmp<>
strn_make_list
  (cs) =
(
strn_vt2t
(strn_vt_make_list<>(cs))
)
#impltmp<>
strn_make_list_vt
  (cs) =
(
strn_vt2t
(strn_vt_make_list_vt<>(cs))
)
//
(* ****** ****** *)
//
#impltmp
<n>(*tmp*)
strn_tabulate(n0) =
(
strn_vt2t(strn_vt_tabulate<n>(n0))
)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_tabulate_cfr
{n}
(n0, f0) =
(
strn_tabulate<n>(n0)
) where
{
#impltmp
tabulate$fopr<cgtz><n>(i0) = f0(i0)
}
#impltmp
<>(*tmp*)
strn_vt_tabulate_cfr
{n}
(n0, f0) =
(
strn_vt_tabulate<n>(n0)
) where
{
#impltmp
tabulate$fopr<cgtz><n>(i0) = f0(i0)
}
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
#typedef x0 = cgtz
#typedef xs = strn
//
in (* in-of-local *)

(* ****** ****** *)
#impltmp
g_lt<xs> = strn_lt<>
#impltmp
g_gt<xs> = strn_gt<>
#impltmp
g_eq<xs> = strn_eq<>
(* ****** ****** *)
#impltmp
g_lte<xs> = strn_lte<>
#impltmp
g_gte<xs> = strn_gte<>
#impltmp
g_neq<xs> = strn_neq<>
(* ****** ****** *)
//
#impltmp
g_cmp<xs> = strn_cmp<>
//
#impltmp
strn_cmp<> = gseq_cmp<xs><x0>
//
(* ****** ****** *)
//
#impltmp
g_print<xs> = strn_print<>
//
#impltmp
gseq_print$beg<xs><x0>() = ()
#impltmp
gseq_print$end<xs><x0>() = ()
#impltmp
gseq_print$sep<xs><x0>() = ()
#impltmp
strn_print<> = gseq_print<xs><x0>
//
(* ****** ****** *)

#impltmp
gseq_nilq<xs><x0> = strn_nilq<>
#impltmp
gseq_consq<xs><x0> = strn_consq<>

(* ****** ****** *)

#impltmp
gseq_forall<xs><x0> = strn_forall<>

(* ****** ****** *)

#impltmp
gseq_listize<xs><x0> = strn_listize<>
#impltmp
gseq_strmize<xs><x0> = strn_strmize<>

(* ****** ****** *)

#impltmp
gseq_head_raw<xs><x0> = strn_head_raw<>
#impltmp
gseq_tail_raw<xs><x0> = strn_tail_raw<>

(* ****** ****** *)

#impltmp
gseq_unlist<xs><x0> = strn_make_list<>
#impltmp
gseq_unstrm<xs><x0> = strn_make_strm<>

(* ****** ****** *)

#impltmp
gseq_unlist_vt<xs><x0> = strn_make_list_vt<>
#impltmp
gseq_unstrm_vt<xs><x0> = strn_make_strm_vt<>

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strn000.dats] *)
