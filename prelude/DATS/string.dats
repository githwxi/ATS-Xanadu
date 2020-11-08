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
"./../SATS/string.sats"
*)

(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp<>
string_nil() =
string_make_list<>
(list_nil())
//
(* ****** ****** *)
//
impltmp<>
string_vt_nil() =
string_vt_make_list_vt<>
(list_vt_nil())
//
(* ****** ****** *)

impltmp<>
string_nilq(cs) =
char_eqzq
(string_head_opt(cs))
impltmp<>
string_consq(cs) =
char_neqzq
(string_head_opt(cs))

(* ****** ****** *)

impltmp<>
string_head(cs) =
(string_head_raw(cs))
impltmp<>
string_tail(cs) =
(string_tail_raw(cs))

(* ****** ****** *)
//
(*
impltmp<>
string_head_opt(cs) = ...
*)
//
impltmp<>
string_tail_opt(cs) =
if
string_nilq(cs)
then
optn_vt_nil((*void*))
else
optn_vt_cons(string_tail_raw(cs))
//
(* ****** ****** *)
impltmp<>
string_lt(x1, x2) = 
(string_cmp<>(x1, x2) < 0)
impltmp<>
string_gt(x1, x2) = 
(string_cmp<>(x1, x2) > 0)
impltmp<>
string_eq(x1, x2) = 
(string_cmp<>(x1, x2) = 0)
(* ****** ****** *)
impltmp<>
string_lte(x1, x2) = 
(string_cmp<>(x1, x2) <= 0)
impltmp<>
string_gte(x1, x2) = 
(string_cmp<>(x1, x2) >= 0)
impltmp<>
string_neq(x1, x2) = 
(string_cmp<>(x1, x2) != 0)
(* ****** ****** *)

impltmp<>
string_print(cs) =
let
impltmp
gseq_print$beg<>() = ()
impltmp
gseq_print$sep<>() = ()
impltmp
gseq_print$end<>() = ()
in
gseq_print<string><cgtz>(cs)
end // end of [string_print]

(* ****** ****** *)
//
impltmp<>
string_vt_print =
string_vt_print1<>
impltmp<>
string_vt_print0(cs) =
(
  string_vt_free<>(cs)
) where
{
  val () =
  string_vt_print1<>(cs)
}
//
impltmp<>
string_vt_print1(cs) =
let
impltmp
glseq_print$beg<>() = ()
impltmp
glseq_print$sep<>() = ()
impltmp
glseq_print$end<>() = ()
in
glseq_print1<string_vt><cgtz>(cs)
end // end of [string_print1]
//
(* ****** ****** *)

impltmp<>
string_length
  (xs) =
(
  loop(xs, 0)
) where
{
//
fun
loop
{i,j:nat}.<i>.
( xs
: string(i)
, j0: sint(j)): sint(i+j) =
let
val
test = string_nilq(xs)
in
if
test
then j0 else
loop(string_tail(xs), succ(j0))
end
// end of [if]
} (* end of [string_length] *)

(* ****** ****** *)
//
impltmp
<>(*tmp*)
string_vt_length =
string_vt_length1<>
//
impltmp
<>(*tmp*)
string_vt_length0(cs) =
let
val n0 =
string_vt_length1<>(cs)
in
let
  val () = g_free(cs) in n0
end
end (* [string_vt_length0] *)
//
impltmp
<>(*tmp*)
string_vt_length1(cs) =
$UN.cast01
(glseq_length1<string_vt><cgtz>(cs))
//
(* ****** ****** *)
//
impltmp<>
string_append
  (xs, ys) =
(
string_vt2t
(string_append_vt(xs, ys))
)
//
impltmp<>
string_append_vt
  (xs, ys) =
let
//
val zs =
list_vt_append<cgtz>
( string_listize<>(xs)
, string_listize<>(ys))
//
in
string_vt_make_list_vt<>(zs)
end // end of [string_append_vt]
//
(* ****** ****** *)

impltmp<>
string_reverse
{n0}(cs) =
let
val n0 =
string_length<>(cs)
in
//
let
//
typedef c0 = cgtz
//
impltmp
tabulate$fopr
<c0><n0>(i0) =
let
val j0 = (n0-1)-i0
in
  string_get_at<>(cs, j0)
end
//
in
  string_tabulate<n0>(n0)
end
//
end // end of [string_reverse]

(* ****** ****** *)

impltmp<>
string_reverse_vt
{n0}(cs) =
let
val n0 =
string_length<>(cs)
in
//
let
//
typedef c0 = cgtz
//
impltmp
tabulate$fopr
<c0><n0>(i0) =
let
val j0 = (n0-1)-i0
in
  string_get_at<>(cs, j0)
end
//
in
  string_tabulate_vt<n0>(n0)
end
//
end // end of [string_reverse_vt]

(* ****** ****** *)

impltmp<>
string_forall
  (xs) =
( loop(xs) ) where
{
//
typedef x0 = cgtz
typedef xs = string
//
fun
loop(xs: xs): bool =
if
string_nilq
  (xs)
then true else
let
val x0 =
string_head_raw(xs)
in
if
forall$test<x0>(x0)
then
loop
(string_tail_raw(xs)) else false
// end of [if]
end // end of [else]
} (* end of [string_forall/uncons] *)

(* ****** ****** *)
impltmp
<>(*tmp*)
string_listize(cs) =
$UN.castlin01(gseq_listize(cs))
(* ****** ****** *)
impltmp
<>(*tmp*)
string_rlistize(cs) =
$UN.castlin01(gseq_rlistize(cs))
(* ****** ****** *)
impltmp
<>(*tmp*)
string_streamize
  (cs) =
(
  auxmain(0)
) where
{
val n0 =
string_length<>(cs)
fun
auxmain
(i0: int):
stream_vt(cgtz) =
$llazy
(
if
(i0 >= n0)
then
strmcon_vt_nil()
else
let
val ci = cs[i0]
val i0 = succ(i0)
in
strmcon_vt_cons(ci, auxmain(i0))
end // end of [else]
)
} (* end of [string_streamize] *)
(* ****** ****** *)

impltmp<>
string_make_list
  (cs) =
(
string_vt2t
(string_vt_make_list<>(cs))
)
impltmp<>
string_make_list_vt
  (cs) =
(
string_vt2t
(string_vt_make_list_vt<>(cs))
)

(* ****** ****** *)

impltmp<>
string_vt_make_list
  {n}(cs) =
(
UN_string_vt_cast(p0)
) where
{
//
val p0 =
strtmp_vt_alloc<>
(list_length(cs))
val () =
loop(p0, 0(*i0*), cs)
//
} where
{
//
sexpdef
stmp=strtmp1_vt
//
fun
loop
{i:nat
|i<=n}.<n-i>.
( p0: stmp(n)
, i0: sint(i)
, cs
: list
  (cgtz, n-i)): void =
(
case+ cs of
|
list_nil() => ()
|
list_cons(c0, cs) =>
(
  loop(p0, succ(i0), cs)
) where
{
val () =
strtmp_vt_set_at<>(p0, i0, c0)
}
)
//
} (* end of [string_vt_make_list] *)

(* ****** ****** *)

impltmp<>
string_vt_make_list_vt
  {n}(cs) =
(
UN_string_vt_cast(p0)
) where
{
//
val p0 =
strtmp_vt_alloc<>
(list_vt_length(cs))
val () =
loop(p0, 0(*i0*), cs)
//
} where
{
//
sexpdef
stmp=strtmp1_vt
//
fun
loop
{i:nat
|i<=n}.<n-i>.
( p0: stmp(n)
, i0: sint(i)
, cs
: list_vt
  (cgtz, n-i)): void =
(
case+ cs of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(c0, cs) =>
(
  loop(p0, succ(i0), cs)
) where
{
val () =
strtmp_vt_set_at<>(p0, i0, c0)
}
)
//
} (* end of [string_vt_make_list_vt] *)

(* ****** ****** *)
//
impltmp
<>(*tmp*)
string_vt_make_stream
  (cs) =
string_vt_make_list_vt
  (stream_listize(cs))
impltmp
<>(*tmp*)
string_vt_make_stream_vt
  (cs) =
string_vt_make_list_vt
  (stream_vt_listize(cs))
//
(* ****** ****** *)
//
impltmp
<n>(*tmp*)
string_tabulate
( n0 ) =
(
string_vt2t
(string_vt_tabulate<n>(n0))
)
//
impltmp
<n>(*tmp*)
string_vt_tabulate
( n0 ) =
(
UN_string_vt_cast(p0)
) where
{
//
val p0 =
strtmp_vt_alloc<>(n0)
//
val i0 = 0
val () = loop(p0, i0)
//
} where
{
//
sexpdef
stmp=strtmp1_vt
//
fun
loop
{i:nat
|i<=n}.<n-i>.
( p0: stmp(n)
, i0: sint(i)): void =
(
if
(i0 < n0)
then
(
  loop(p0, succ(i0))
) where
{
val c0 =
tabulate$fopr<cgtz><n>(i0)
val () =
strtmp_vt_set_at<>(p0, i0, c0)
}
)
//
} (* end of [string_vt_tabulate] *)

(* ****** ****** *)
//
impltmp
<>(*tmp*)
string_tabulate_cfr
{n}
(n0, f0) =
(
string_tabulate<n>(n0)
) where
{
impltmp
tabulate$fopr<cgtz><n>(i0) = f0(i0)
}
impltmp
<>(*tmp*)
string_vt_tabulate_cfr
{n}
(n0, f0) =
(
string_vt_tabulate<n>(n0)
) where
{
impltmp
tabulate$fopr<cgtz><n>(i0) = f0(i0)
}
//
(* ****** ****** *)
//
// HX:
// For implementing
// some gseq_operations
//
(* ****** ****** *)

local
//
typedef x0 = cgtz
typedef xs = string
//
in (* in-of-local *)

(* ****** ****** *)
impltmp
g_lt<xs> = string_lt<>
impltmp
g_gt<xs> = string_gt<>
impltmp
g_eq<xs> = string_eq<>
(* ****** ****** *)
impltmp
g_lte<xs> = string_lte<>
impltmp
g_gte<xs> = string_gte<>
impltmp
g_neq<xs> = string_neq<>
(* ****** ****** *)
//
impltmp
g_cmp<xs> = string_cmp<>
//
impltmp
string_cmp<> = gseq_cmp<xs><x0>
//
(* ****** ****** *)
//
impltmp
g_print<xs> = string_print<>
//
impltmp
gseq_print$beg<xs><x0>() = ()
impltmp
gseq_print$end<xs><x0>() = ()
impltmp
gseq_print$sep<xs><x0>() = ()
impltmp
string_print<> = gseq_print<xs><x0>
//
(* ****** ****** *)

impltmp
gseq_nilq<xs><x0> = string_nilq<>
impltmp
gseq_consq<xs><x0> = string_consq<>

(* ****** ****** *)

impltmp
gseq_forall<xs><x0> = string_forall<>
impltmp
gseq_streamize<xs><x0> = string_streamize<>

(* ****** ****** *)

impltmp
gseq_head_raw<xs><x0> = string_head_raw<>
impltmp
gseq_tail_raw<xs><x0> = string_tail_raw<>

(* ****** ****** *)

impltmp
gseq_unlist<xs><x0> = string_make_list<>
impltmp
gseq_unlist_vt<xs><x0> = string_make_list_vt<>

(* ****** ****** *)

impltmp
gseq_unstream<xs><x0> = string_make_stream<>
impltmp
gseq_unstream_vt<xs><x0> = string_make_stream_vt<>

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [string.dats] *)
