(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// HX-2020-03-21:
// It is time to start a code diary:
// This is really just a potpourri of my own code for all sorts of uses.
// Please use it for whatever purpose you see fit.
//
(* ****** ****** *)
//
// HX-2020-03-21:
// Zoe has started learning programming in Python. Maybe in ATS later :)
// One of her exercises is to reverse the digits of a four digit number.
//
(* ****** ****** *)
//
#extern
fun<>
digitize$base
  ((*void*)): sintgt(0)
//
#extern
fun<>
gint_digitize_sint
{n:nat}
(n0: sint(n)): list_vt(sint)
//
(* ****** ****** *)
//
#extern
fun<>
rdigitize$base
  ((*void*)): sintgt(0)
//
#extern
fun<>
gint_rdigitize_sint
{n:nat}
(n0: sint(n)): strm_vt(sint)
//
(* ****** ****** *)
//
#symload
digitize with gint_digitize_sint
#symload
rdigitize with gint_rdigitize_sint
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
digitize$base((*void*)) = 10
#impltmp
<>(*tmp*)
rdigitize$base((*void*)) = 10
//
(* ****** ****** *)

#impltmp
<>(*tmp*)
gint_digitize_sint
  (n0) =
(
loop(n0, list_vt_nil())
) where
{
//
val
b0 = digitize$base<>()
//
#vwtpdef
digitseq = list_vt(sint)
//
fun
loop
{n:nat}
( n0
: sint(n)
, r0
: digitseq): digitseq =
(
if
(n0 = 0)
then (r0)
else let
  val d0 =
  gint_mod_sint_sint(n0, b0)
in
loop(n0 / b0, list_vt_cons(d0, r0))
end
)
//
} (*where*) // [gint_digitize_sint]

(* ****** ****** *)

#impltmp
<>(*tmp*)
gint_rdigitize_sint
  (n0) =
( auxmain(n0) ) where
{
//
val
b0 = rdigitize$base<>()
//
#vwtpdef
digitseq = strm_vt(sint)
//
fun
auxmain
{n:nat}
( n0
: sint(n)): digitseq =
$llazy
(
if
(n0 = 0)
then strmcon_vt_nil()
else let
val d0 =
gint_mod_sint_sint(n0, b0)
in
strmcon_vt_cons(d0, auxmain(n0/b0))
end // end of [else] // end-of-if
)
//
} (*where*) // [gint_rdigitize_sint]

(* ****** ****** *)
//
// HX-2020-03-22: list_permutize!!!
// This is a classic example for FP.
//
(* ****** ****** *)
//
#extern
fun
<a:t0>
strm_vt_mcons
( x0: a
, xss
: strm_vt(list(a))
)
: strm_vt(list(a))
//
#impltmp
<a>(*tmp*)
strm_vt_mcons
  (x0, xss) =
(
strm_vt_map0(xss)
) where
{
#impltmp
map0$fopr
<list(a)>
<list(a)>(xs) = list_cons(x0, xs)
}
//
(* ****** ****** *)
//
#extern
fun
<a:t0>
list_permutize
( xs: list(a) ): strm_vt(list(a))
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_permutize
  (xs) =
(
  auxmain0(xs)
) where
{
//
fun
rapp2
( xs:
  list(a)
, ys:
~ list_vt(a)): list(a) =
(
case+ ys of
| ~
list_vt_nil() => xs
| ~
list_vt_cons(y0, ys) =>
rapp2(list_cons(y0, xs), ys)
)
//
fun
auxmain0
( xs: list(a))
: strm_vt(list(a)) =
$llazy
(
case+ xs of
| list_nil() =>
  strmcon_vt_sing(xs)
| list_cons(_, _) =>
  $eval(auxmain1(xs))
) // end of [auxmain0]
//
and
auxmain1
( xs: list(a))
: strm_vt(list(a)) =
$llazy
let
val-
list_cons(x0, xs1) = xs
in
case+ xs1 of
| list_nil() =>
  strmcon_vt_sing(xs)
| list_cons(_, _) =>
  let
    val
    ys2 = list_vt_nil()
  in
    $eval(auxmain2(x0, xs1, ys2))
  end
end // end of [auxmain1]
//
and
auxmain2
( x0: a
, xs: list(a)
, ys: list_vt(a))
: strm_vt(list(a)) =
$llazy
(
g_free(ys);
let
val
xss =
(
strm_vt_mcons
(x0, auxmain1(rapp2(xs, ys)))
)
in
//
case+ xs of
|
list_nil() =>
let
  val () = g_free(ys) in !xss
end
|
list_cons(x1, xs) =>
let
  val ys = list_vt_cons(x0, ys)
in
  !(strm_vt_append(xss, auxmain2(x1, xs, ys)))
end (*let*) // end of [list_cons]
//
end // end-of-let // end-of(auxmain2)
)
//
} endwhr (* end of [list_permutize] *)

(* ****** ****** *)
//
// HX-2020-04-19: list_nchoose!!!
// This is a classic example for FP.
//
(* ****** ****** *)
//
#extern
fun
<a:t0>
list_nchoose1
(xs: list(a), n0: nint): strm_vt(list(a))
//
#extern
fun
<a:t0>
list_nchoose2
(xs: list(a), n0: nint): strm_vt@(list(a), list(a))
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_nchoose1
  (xs, n0) =
(
let
val
m0 =
list_length(xs)
in
if
(m0 < n0)
then
strm_vt_nil()
else
auxmain(xs, m0, n0)
end
) where
{
//
#typedef res = list(a)
//
fun
auxmain
( xs
: list(a)
, m0: nint
, n0: nint)
: strm_vt(res) =
$llazy
(
if
(m0 = n0)
then
strmcon_vt_sing(xs)
else
(
case+ xs of
|
list_nil() =>
strmcon_vt_nil()
|
list_cons(x0, xs) => !
let
//
val m1 = m0-1
and n1 = n0-1
//
val rr1 =
  auxmain(xs, m1, n1)
val rr1 =
  strm_vt_mcons<a>(x0, rr1)
val rr2 =
  auxmain(xs, m1, n0)
//
in
strm_vt_append<res>(rr1, rr2)
end (* list_cons *)
) (* end of [else] *)
) (* end of [auxmain] *)
//
} endwhr (* end of [list_nchoose1] *)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
list_nchoose2
  (xs, n0) =
(
let
val
m0 =
list_length(xs)
in
if
(m0 < n0)
then
strm_vt_nil()
else
auxmain(xs, m0, n0)
end
) where
{
//
#typedef
res =
(list(a), list(a))
//
fun
auxmain
( xs
: list(a)
, m0: nint
, n0: nint)
: strm_vt(res) =
$llazy
(
if
(m0 = n0)
then
strmcon_vt_sing
@(xs, list_nil())
else
(
case+ xs of
|
list_nil() =>
strmcon_vt_nil()
|
list_cons(x0, xs) =>
let
//
val m1 = m0-1
and n1 = n0-1
//
val
rs1 =
strm_vt_map0
(
auxmain(xs, m1, n1)
) where
{
#impltmp
map0$fopr<res><res>(rr) =
  (list_cons(x0, rr.0), rr.1)
}
val
rs2 =
strm_vt_map0
(
auxmain(xs, m1, n0)
) where
{
#impltmp
map0$fopr<res><res>(rr) =
  (rr.0, list_cons(x0, rr.1))
}
in
  !(strm_vt_append<res>(rs1, rs2))
end // list_cons
) (* end of [else] *)
) (* end of [auxmain] *)
//
} endwhr (* end of [list_nchoose2] *)

(* ****** ****** *)
//
// HX-2020-05-31:
// typical integer streams
//
(* ****** ****** *)
//
#extern
fun<>
sint_from_up
{i:int}
(i0: sint(i)):
strm_vt(sintgte(i))
#extern
fun<>
sint_from_dn
{i:int}
(i0: sint(i)):
strm_vt(sintlte(i))
//
#impltmp
<>(*tmp*)
sint_from_up
  (i0) =
( auxmain(i0) ) where
{
fun
auxmain
{i:int}
( i0
: sintgte(i))
: strm_vt(sintgte(i)) =
$llazy
(
strmcon_vt_cons(i0, auxmain(succ(i0)))
)
}
//
#impltmp
<>(*tmp*)
sint_from_dn
  (i0) =
( auxmain(i0) ) where
{
fun
auxmain
{i:int}
( i0
: sintgte(i))
: strm_vt(sintlte(i)) =
$llazy
(
strmcon_vt_cons(i0, auxmain(pred(i0)))
)
}
//
(* ****** ****** *)
//
#extern
fun<>
sint_fromto_up
{i,j:int}
( i0: sint(i)
, j0: sint(j)): strm_vt(sintbtw(i, j))
#extern
fun<>
sint_fromto_dn
{i,j:int}
( i0: sint(i)
, j0: sint(j)): strm_vt(sintbtwe(j+1, i))
//
#impltmp
<>(*tmp*)
sint_fromto_up
  (i0, j0) =
( auxmain(i0) ) where
{
fun
auxmain
{i:int}
( i0
: sintgte(i))
: strm_vt(sintgte(i)) =
$llazy
(
if
(i0 >= j0)
then strmcon_vt_nil()
else strmcon_vt_cons(i0, auxmain(succ(i0)))
)
}
//
#impltmp
<>(*tmp*)
sint_fromto_dn
  (i0, j0) =
( auxmain(i0) ) where
{
fun
auxmain
{i:int}
( i0
: sintgte(i))
: strm_vt(sintgte(i)) =
$llazy
(
if
(i0 <= j0)
then strmcon_vt_nil()
else strmcon_vt_cons(i0, auxmain(pred(i0)))
)
}
//
(* ****** ****** *)
//
// HX-2020-07-03:
// for concatenating strings
//
(* ****** ****** *)
(*
(*
HX: the code has moved into prelude/gseq.dats
*)
#impltmp
<cz:type>
gseq_concat_strn
  (cz) =
let
#typedef c0 = cgtz
#typedef cs = strn
in//let
strn_vt_make_strm_vt<>
(strm_vt_gconcat<c0,cs>(gseq_strmize<cs,cz>(cz)))
end // end of [gseq_concat_strn]
*)
(* ****** ****** *)
//
// HX-2020-11-02:
// Turning a strn into lines
//
(* ****** ****** *)
//
#extern
fun<>
strn_split_lines
(cs:strn): strm_vt(strn)
#extern
fun<>
strn_split_lines_vt
(cs:strn): strm_vt(strn_vt)
#extern
fun<>
strn_vt_split_lines
(cs:strn_vt): strm_vt(strn_vt)
//
(* ****** ****** *)
//
#vwtpdef
cstrm_vt = strm_vt(cgtz)
//
#extern
fun<>
cstrm_vt_split_lines
(cs:cstrm_vt): strm_vt(strn_vt)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_split_lines(cs) =
let
//
#typedef y0 = strn
#vwtpdef x0 = strn_vt
//
#impltmp
map0$fopr<x0><y0> = strn_vt2t
in//let
strm_vt_map0<x0><y0>
(
cstrm_vt_split_lines(strmize(cs))
)
end
//
#impltmp
<>(*tmp*)
strn_split_lines_vt(cs) =
cstrm_vt_split_lines(strmize(cs))
//
#impltmp
<>(*tmp*)
strn_vt_split_lines(cs) =
cstrm_vt_split_lines(strmize(cs))
//
(* ****** ****** *)
#impltmp
<>(*tmp*)
cstrm_vt_split_lines
  (cs) =
(
  auxmain0(cs)
) where
{
//
fun
iseol
( c0
: cgtz )
: bool = (c0 = '\n')
fun
auxmain0
( cs
: cstrm_vt)
: strm_vt(strn_vt) =
$llazy
(
free(cs);
case+ !cs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(c0, cs) =>
if
iseol(c0)
then
strmcon_vt_cons
(l1, auxmain0(cs)) where
{
  val l1 = strn_vt_nil()
}
else
let
val rs =
list_vt_sing(c0) in auxmain1(cs, rs)
end
)
and
auxmain1
( cs
: cstrm_vt
, rs
: list_vt(cgtz))
: strmcon_vt(strn_vt) =
(
case+ !cs of
| ~
strmcon_vt_nil() =>
(
strmcon_vt_sing(l1)
) where
{
val rs =
list_vt_reverse0(rs)
val l1 =
strn_vt_make_llist(rs)
}
| ~
strmcon_vt_cons(c0, cs) =>
if
iseol(c0)
then
let
val rs =
list_vt_reverse0(rs)
val l1 =
strn_vt_make_llist(rs)
in
  strmcon_vt_cons(l1, auxmain0(cs))
end
else 
(
  auxmain1(cs, list_vt_cons(c0, rs))
)
) (* end of [auxmain1] *)
//
} (* end of [cstrm_vt_split_lines] *)

(* ****** ****** *)
//
// HX-2020-11-09:
//
(* ****** ****** *)
(*
(*
HX-2020-11-09:
These functions are
declared in prelude/strn.sats
*)
#extern
fun<>
strn_lower
{n:int}
(cs: strn(n)): strn(n)
#extern
fun<>
strn_upper
{n:int}
(cs: strn(n)): strn(n)
*)
(* ****** ****** *)

#impltmp
<>(*tmp*)
strn_lower(cs) =
let
val n0 = length(cs)
in
strn_tabulate(n0)
where
{
fun
lower
(c0: cgtz): cgtz =
if
(c0 < 'A')
then c0 else
(
if
(c0 > 'Z')
then c0 else
char(code('a')+(code(c0)-code('A')))
)
#impltmp
tabulate$fopr<cgtz>(i0) = lower(cs[i0])
}
end // end of [strn_lower]

(* ****** ****** *)

#impltmp
<>(*tmp*)
strn_upper(cs) =
let
val n0 = length(cs)
in
strn_tabulate(n0)
where
{
fun
upper
(c0: cgtz): cgtz =
if
(c0 < 'a')
then c0 else
(
if
(c0 > 'z')
then c0 else
char(code('A')+(code(c0)-code('a')))
)
#impltmp
tabulate$fopr<cgtz>(i0) = upper(cs[i0])
}
end // end of [strn_upper]

(* ****** ****** *)

(* end of [xatslib_githwxi_mygist0.dats] *)
