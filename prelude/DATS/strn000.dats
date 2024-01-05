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

#impltmp
<>(*tmp*)
strn_nilq(cs) =
char_eqz
(strn_head_opt<>(cs))
#impltmp
<>(*tmp*)
strn_consq(cs) =
char_neqz
(strn_head_opt<>(cs))

(* ****** ****** *)

#impltmp
<>(*tmp*)
strn_head(cs) =
(strn_head_raw<>(cs))
#impltmp
<>(*tmp*)
strn_tail(cs) =
(strn_tail_raw<>(cs))

(* ****** ****** *)
//
(*
#impltmp<>
strn_head_opt(cs) = ...
*)
//
#impltmp
<>(*tmp*)
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
(*
#impltmp
<>(*tmp*)
strn_cmp =
gseq_cmp<strn><cgtz>
*)
#impltmp
<>(*tmp*)
strn_cmp(x1, x2) =
let
//
fnx
loop
( x1: strn
, x2: strn): bool =
if
strn_nilq(x1)
then
(
if
strn_nilq(x2)
then (0) else (-1)
)
else
(
if
strn_nilq(x2)
then (1) else let
val c1 =
strn_head_raw(x1)
and c2 =
strn_head_raw(x2)
val
sgn = char_cmp(c1, c2)
in//let
if
(sgn != 0)
then sgn else
loop
( strn_tail_raw(x1)
, strn_tail_raw(x2)) end
)
//
in
  loop(x1, x2) // 0/1/-1
end(*let*)//end[strn_cmp(...)]
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

#impltmp
<>(*tmp*)
strn_print(cs) =
let
#impltmp
gseq_print$beg<>() = ()
#impltmp
gseq_print$sep<>() = ()
#impltmp
gseq_print$end<>() = ()
in//let
gseq_print<strn><cgtz>(cs)
end(*let*)//end of [strn_print]

(* ****** ****** *)

#impltmp
<>(*tmp*)
strn_length
  (xs) =
(
auxloop(xs, 0)) where
{
//
fnx
auxloop
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
auxloop(strn_tail(xs), succ(j0))
endlet // end of [auxloop(xs,j0)]
// end of [if]
}(*where*)//end-of[strn_length(xs)]

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
in//let
  strn_vt_make0_llist<>(zs)
end // end of [strn_append_vt]
//
(* ****** ****** *)

#impltmp<>
strn_reverse
{n0}(cs) =
let
//
val n0 =
strn_length<>(cs)
//
in//let
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
in//let
strn_get_at<>(cs, j0)
endlet//tabulate$fopr
//
in
  strn_tabulate<n0>(n0)
end (*let*)//tabulate$fopr
//
end//end of [strn_reverse(cs)]

(* ****** ****** *)

#impltmp<>
strn_reverse_vt
{n0}(cs) =
let
//
val n0 =
strn_length<>(cs)
//
in//let
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
in//let
  strn_get_at<>(cs, j0)
end(*let*)//tabulate$fopr
//
in
  strn_vt_tabulate<n0>(n0)
end (*let*)//strn_reverse_vt
//
end//end-of-[strn_reverse_vt(cs)]

(* ****** ****** *)
//
#impltmp<>
strn_forall
  ( xs ) =
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
in//let
if
forall$test<x0>(x0)
then
loop
(strn_tail_raw(xs)) else false
// end of [if]
end // end of [else]
} (* end of [strn_forall/uncons] *)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_rforall
  {n}( cs ) =
(
loop(cs, n0)) where
{
//
val n0 = length(cs)
//
fnx
loop
{n:int}
{i:nat
|i <= n}
( cs: strn(n)
, i0: sint(i)): bool =
(
if
(i0 <= 0)
then true else
let
  val i1 = i0 - 1
  val ci = cs[i1]
in//let
if
rforall$test<cgtz>(ci)
then loop(cs, i1) else false
endlet//end-of-(else)//end-of-(if)
)
} (*where*) // end of [strn_rforall]
//
(* ****** ****** *)
//
#impltmp
strn_foreach<> =
gseq_foreach<strn><cgtz>
//
(* ****** ****** *)
//
#impltmp
strn_rforeach<> =
gseq_rforeach<strn><cgtz>
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_listize
  {n}( cs ) =
(
loop(n0, r0)) where
{
//
val n0 = length(cs)
val r0 = list_vt_nil()
//
fnx
loop
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
in//let
  loop(i1, list_vt_cons(ci, r0))
endlet // else // end-of-[if]
) (*if*) // end of [loop(i0,r0)]
} (*where*) // end of [strn_listize]
//
(* ****** ****** *)
//
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
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_strxize(cs) =
(
  auxmain(0)) where
{
//
val n0 = length(cs)
//
fun
auxtail
((*void*)): strx_vt(char) =
$llazy
(
strxcon_vt_cons
(CNUL, auxtail())) where
{  #define CNUL '\000'  }
and
auxmain
(i0: nint): strx_vt(char) =
$llazy
(
if
(i0 >= n0)
then (!auxtail())
else
let
  val ci = cs[i0]
  val i0 = succ(i0)
in
  strxcon_vt_cons(ci, auxmain(i0))
end // end of [else]
)
} (*where*) // end of [strn_strxize]
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_rlistize
  {n}( cs ) =
(
loop(i0, r0)) where
{
//
val i0 = 0
val n0 = length(cs)
val r0 = list_vt_nil()
//
fnx
loop
{i,j:nat
|i <= n}
( i0: sint(i)
, r0
: list_vt(cgtz, j))
: list_vt(cgtz, n-i+j) =
(
if
(i0 >= n0)
then r0 else
let
  val ci = cs[i0]
  val i1 = i0 + 1
in
loop(i1, list_vt_cons(ci, r0))
endlet//end-of-(else)//end-of-(if)
)
} (*where*) // end of [strn_rlistize]
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_rstrmize(cs) =
(
  auxmain(n0)) where
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
(i0 <= 0)
then
(
strmcon_vt_nil())
else
let
  val i0 = (i0-1)
  val ci = cs[i0] in
  strmcon_vt_cons(ci, auxmain(i0))
end // end of [else]
)
} (*where*) // end of [strn_rstrmize]
//
(* ****** ****** *)
//
#impltmp<>
strn_copy_vt(xs) =
strn_vt_make_strn<>(xs)
//
(* ****** ****** *)
//
#impltmp<>
strn_make_list
  (cs) =
(
strn_vt2t
(strn_vt_make_list<>(cs)))
//
#impltmp<>
strn_make0_llist
  (cs) =
(
strn_vt2t
(strn_vt_make0_llist<>(cs)))
//
(* ****** ****** *)
//
#impltmp<>
strn_make_strm
  (cs) =
(
strn_vt2t
(strn_vt_make_strm<>(cs)))
//
#impltmp<>
strn_make0_lstrm
  (cs) =
(
strn_vt2t
(strn_vt_make0_lstrm<>(cs)))
//
(* ****** ****** *)
//
#impltmp<>
strnlst_concat(css) =
strn_vt2t
(strnlst_concat_vt<>(css))
#impltmp<>
strnlst_concat_vt(css) =
gseq_concat_lstrn<list(strn)>(css)
//
(* ****** ****** *)
//
#impltmp<>
strntrm_concat(css) =
strn_vt2t
(strntrm_concat_vt<>(css))
#impltmp<>
strntrm_concat_vt(css) =
gseq_concat_lstrn<strm(strn)>(css)
//
(* ****** ****** *)
//
#impltmp
<n0>(*tmp*)
strn_tabulate(n0) =
(
strn_vt2t(strn_vt_tabulate<n0>(n0))
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
(*
// HX-2022-07-01
// Fri Jul  1 12:09:16 EDT 2022
*)
//
#implfun
<>(*tmp*)
strn_prefixq
( s1, s2 ) =
(
loop(s1, s2)) where
{
fnx
loop
( s1: strn
, s2: strn): bool =
let
val c1 =
strn_head_opt(s1)
in//let
if
char_eqz(c1)
then true else
let
val c2 =
strn_head_opt(s2)
in//let
if
char_eqz(c2)
then false else
(
if
(c1 = c2)
then
loop(tail(s1), tail(s2)) else false)
endlet // end of [loop(s1, s2)]
endlet // end of [loop(s1, s2)]
} (*where*)//end-of-[strn_prefix(s1,s2)]
//
(* ****** ****** *)
//
(*
// HX-2022-07-01
// Fri Jul  1 12:28:23 EDT 2022
*)
//
#implfun
<>(*tmp*)
strn_suffixq
( s1, s2 ) =
(
if
(n1 <= n2)
then loop(n1, 0) else false
) where
{
//
val n1 =
length(s1) and n2 = length(s2)
//
fnx
loop
{n:int}
{i:nat|i<=n} .<n-i>.
(n1: sint(n), i0: int(i)): bool =
if
(i0 >= n1)
then true else
let
val c1 = s1[i0]
val c2 = s2[n2-n1+i0]
in//let
if
(c1 = c2) then loop(n1,i0+1) else false
endlet // end of [loop{...}(n1,i0)]
} (*where*)//end-of-[strn_suffix(s1,s2)]
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
(* ****** ****** *)
//
#typedef x0 = cgtz
#typedef xs = strn
//
(* ****** ****** *)
//
in//in-of-local
//
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
//
(* ****** ****** *)
#impltmp
gseq_nil<xs><x0> = strn_nil<>
(* ****** ****** *)
#impltmp
gseq_nilq<xs><x0> = strn_nilq<>
#impltmp
gseq_consq<xs><x0> = strn_consq<>
(* ****** ****** *)
//
#impltmp
gseq_append<xs><x0> = strn_append<>
//
(* ****** ****** *)
//
#impltmp
gseq_reverse<xs><x0> = strn_reverse<>
//
(* ****** ****** *)
//
#impltmp
gseq_forall<xs><x0> = strn_forall<>
//
#impltmp
gseq_rforall<xs><x0> = strn_rforall<>
//
(* ****** ****** *)
//
#impltmp
gseq_listize<xs><x0> = strn_listize<>
#impltmp
gseq_strmize<xs><x0> = strn_strmize<>
//
(* ****** ****** *)
//
#impltmp
gseq_rlistize<xs><x0> = strn_rlistize<>
//
#impltmp
gras_rstrmize<xs><x0> = strn_rstrmize<>
#impltmp
gseq_rstrmize<xs><x0> = strn_rstrmize<>
//
(* ****** ****** *)
//
#impltmp
gseq_head_raw<xs><x0> = strn_head_raw<>
#impltmp
gseq_tail_raw<xs><x0> = strn_tail_raw<>
//
(* ****** ****** *)
//
#impltmp
gseq_make_list<xs><x0> = strn_make_list<>
#impltmp
gseq_make_strm<xs><x0> = strn_make_strm<>
//
(* ****** ****** *)
//
#impltmp
gseq_make0_llist
<xs><x0>(*cs*) = strn_make0_llist<>(*cs*)
#impltmp
gseq_make0_lstrm
<xs><x0>(*cs*) = strn_make0_lstrm<>(*cs*)
//
(* ****** ****** *)
//
#impltmp
gseq_prefixq<xs><x0> = strn_prefixq<>(*void*)
#impltmp
gseq_suffixq<xs><x0> = strn_suffixq<>(*void*)
//
(* ****** ****** *)
//
end (*local*) // end of [local] // g/gseq-ops

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strn000.dats] *)
