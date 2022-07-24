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
"./..\
/SATS/VT/string_vt.sats"
*)

(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#impltmp<>
strn_vt_nil() =
strn_vt_make_llist<>
(list_vt_nil((*void*)))
//
(* ****** ****** *)
(*
#impltmp
<>(*tmp*)
strn_vt_set_at
( cs, i0, c0 ) =
strtmp_set_at<>(cs,i0,c0)
*)
(* ****** ****** *)
//
#impltmp<>
strn_vt_print0(cs) =
(
  strn_vt_free<>(cs)
) where
{
  val () =
  strn_vt_print1<>(cs)
}
//
#impltmp<>
strn_vt_print1(cs) =
let
#impltmp
glseq_print$beg<>() = ()
#impltmp
glseq_print$sep<>() = ()
#impltmp
glseq_print$end<>() = ()
in
glseq_print1<strn_vt><cgtz>(cs)
end // end of [strn_print1]
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_vt_length0(cs) =
let
val n0 =
strn_vt_length1<>(cs)
in
let
  val () = g_free(cs) in n0
end
end (* [strn_vt_length0] *)
//
#impltmp
<>(*tmp*)
strn_vt_length1(cs) =
$UN.cast01
(
glseq_length1<strn_vt><cgtz>(cs)
) (* end of [strn_vt_length1] *)
//
(* ****** ****** *)
//
#impltmp<>
strn_vt_append0
  (xs, ys) =
let
//
val zs =
list_vt_append0<cgtz>
( strn_vt_listize<>(xs)
, strn_vt_listize<>(ys))
//
in
  strn_vt_make_llist<>(zs)
end(*let*)//end-of(strn_vt_append0)
//
(* ****** ****** *)
//
#impltmp<>
strn_vt_append1
  (xs, ys) =
let
//
val zs =
list_vt_append0<cgtz>
( strn_vt_listize1<>(xs)
, strn_vt_listize1<>(ys))
//
in
  strn_vt_make_llist<>(zs)
end(*let*)//end-of(strn_vt_append1)
//
(* ****** ****** *)

#impltmp<>
strn_vt_forall1
  (xs) =
let
//
val
len = length1(xs)
//
in
  loop(xs, len, 0)
end where // end-of-let
{
//
fnx
loop
{n:int}
{i:nat| i <= n}
( xs:
! strn_vt(n)
, len: sint(n)
, ind: sint(i)): bool =
if
(ind >= len)
then true else
let
val x0 = xs[ind]
in
if
forall$test<cgtz>(x0)
then
loop(xs, len, succ(ind)) else false
// end of [if]
end // end of [else]
//
} (* end of [strn_vt_forall1/get_at] *)

(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_vt_listize
  (  cs  ) = let
//
val ln = length1(cs)
val r0 = list_vt_nil()
//
in
auxloop(cs, ln, ln, r0)
end where // end of [let]
{
//
#vwtpdef
clst(i:int) = list_vt(cgtz, i)
//
fnx
auxloop
{n:int}
{i:nat|i <= n}
( cs:
! strn_vt(n)
, ln: sint(n)
, i0: sint(i)
, r0: clst(i))
: list_vt(cgtz, n) =
(
if
(i0 <= 0)
then r0 else
let
val ci = cs[i0-1]
in//let
auxloop
(cs,ln,i0-1,list_vt_cons(ci, r0))
end // end of [else] // end-of-[if]
)
}(*where*)//end-of-[strn_vt_listize(cs)]
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_vt_strmize
  (cs) = let
//
val i0 = 0(*start*)
val ln = length1(cs)
//
in
  auxmain(cs, ln, i0)
end where // end of [let]
{
fun
auxmain
{n:int}
{i:nat|i <= n}
( cs:
! strn_vt(n)
, ln: sint(n)
, i0: sint(i))
: strm_vt(cgtz) =
$llazy
(
free(cs);
if
(i0 >= ln)
then
strmcon_vt_nil()
else
let
val ci = cs[i0]
in//let
strmcon_vt_cons(ci,auxmain(cs,ln,i0+1))
end // end of [else]
)
}(*where*)//end-of-[strn_vt_strmize(cs)]
//
(* ****** ****** *)
#impltmp
<>(*tmp*)
strn_vt_rlistize
  (  cs  ) = let
//
val i0 = 0(*start*)
val ln = length1(cs)
val r0 = list_vt_nil()
//
in
auxloop(cs, ln, i0, r0)
end where // end of [let]
{
//
#vwtpdef
clst(i:int) = list_vt(cgtz, i)
//
fnx
auxloop
{n:int}
{i:nat|i <= n}
( cs:
! strn_vt(n)
, ln: sint(n)
, i0: sint(i)
, r0: clst(i))
: list_vt(cgtz, n) =
(
if
(i0 >= ln)
then r0 else
let
val ci = cs[i0]
in//let
auxloop
(cs,ln,i0+1,list_vt_cons(ci, r0))
end // end of [else] // end-of-[if]
)
}(*where*)//end-of-[strn_vt_rlistize(cs)]
//
(* ****** ****** *)
#impltmp
<>(*tmp*)
strn_vt_listize1(cs) =
$UN.castlin01(glseq_copy_list(cs))
#impltmp
<>(*tmp*)
strn_vt_rlistize1(cs) =
$UN.castlin01(glseq_rcopy_list(cs))
(* ****** ****** *)

#impltmp<>
strn_vt_make_strn
  {n}(cs) =
(
UN_strn_vt_cast(p0)
) where
{
//
val p0 =
strtmp_vt_alloc<>(n0)
//
val () =
loop(p0, 0(*i0*), cs)
//
} where
{
//
val n0 =
strn_length<>(cs)
//
#sexpdef
stmp = strtmp1_vt
//
fnx
loop
{i:nat
|i<=n}.<n-i>.
( p0: stmp(n)
, i0: sint(i)
, cs: strn(n)): void =
(
if
(i0 >= n0)
then () else
(
  loop(p0, succ(i0), cs)
) where
{
val c0 = cs[i0]
val () = strtmp_vt_set_at<>(p0,i0,c0)
}
)
//
}(*where*)//end-of-[strn_vt_make_strn]

(* ****** ****** *)

#impltmp<>
strn_vt_make_list
  {n}(cs) =
(
UN_strn_vt_cast(p0)
) where
{
//
val p0 =
strtmp_vt_alloc<>(n0)
//
val () =
loop(p0, 0(*i0*), cs)
//
} where
{
//
val n0 =
list_length<>(cs)
//
#sexpdef
stmp = strtmp1_vt
//
fnx
loop
{i:nat
|i<=n}.<n-i>.
( p0: stmp(n)
, i0: sint(i)
, cs
: list(cgtz, n-i)): void =
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
}(*where*)//end-of-[strn_vt_make_list]

(* ****** ****** *)

#impltmp<>
strn_vt_make_llist
  {n}(cs) =
(
UN_strn_vt_cast(p0)
) where
{
//
val p0 =
strtmp_vt_alloc<>
(list_vt_length1(cs))
val () =
loop(p0, 0(*i0*), cs)
//
} where
{
//
#sexpdef
stmp = strtmp1_vt
//
fnx
loop
{i:nat
|i<=n}.<n-i>.
( p0: stmp(n)
, i0: sint(i)
, cs
: list_vt(cgtz, n-i)): void =
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
}(*where*)//end-of-[strn_vt_make_llist]

(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_vt_make_strm
  (cs) =
let
val cs =
strm_listize(cs)
in
  strn_vt_make_llist<>(cs)
end(*let*)//end-of-[strn_vt_make_strm]
//
#impltmp
<>(*tmp*)
strn_vt_make_lstrm
  (cs) =
let
val cs =
strm_vt_listize(cs)
in
  strn_vt_make_llist<>(cs)
end(*let*)//end-of-[strn_vt_make_lstrm]
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strntrm_vt_concat
( css ) =
strn_vt_make_lstrm<>
(strm_vt_gconcat<strn><cgtz>(css))
#impltmp
<>(*tmp*)
strnlst_vt_concat(css) =
strntrm_vt_concat<>(list_vt_strmize(css))
//
(* ****** ****** *)
//
#impltmp
<n>(*tmp*)
strn_vt_tabulate
(  n0  ) =
(
UN_strn_vt_cast(p0)
) where
{
//
val p0 =
strtmp_vt_alloc<>(n0)
//
val i0 = 0(*start*)
val () = loop(p0, i0)
//
} where
{
//
#sexpdef
stmp = strtmp1_vt
//
fnx
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
) (* end-of-of[loop(p0, i0)] *)
//
} (*where*)//end-of-[strn_vt_tabulate]

(* ****** ****** *)
//
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
#viewdef xs = strn_vt
//
in//local

(* ****** ****** *)
//
#impltmp
gl_print0<xs> = strn_vt_print0<>
#impltmp
gl_print1<xs> = strn_vt_print1<>
//
(* ****** ****** *)

#impltmp
glseq_forall0<xs><x0> = strn_vt_forall0<>
#impltmp
glseq_forall1<xs><x0> = strn_vt_forall1<>

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strn000_vt.dats] *)
