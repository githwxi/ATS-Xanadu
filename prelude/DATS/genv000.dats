(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
#staload
"./../SATS/genv000.sats"
*)
(*
#staload
"./../SATS/gseq000.sats"
#staload
"./../SATS/list000.sats"
*)
(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)

#impltmp
<xs>
<x0>
<r0>
<e1>
gseq_foldl_e1nv
( xs, r0, e1 ) =
(
gseq_foldl
<xs>
<x0>
<r0>(xs, r0)) where
{
val e1 =
$UN.datacopy( e1 )
#impltmp
foldl$fopr
< x0><r0 >(r0, x0) =
let
//
val e1 =
$UN.castlin10{e1}(e1)
val res =
foldl$fopr_e1nv
< x0><r0 >< e1>(r0, x0, e1)
//
in//let
//
let
val e1 = $UN.delinear(e1) in res end
//
endlet//end-of(foldl$fopr<x0><r0>(x0))
} (*where*) // end-of-(gseq_foldl_e1nv)

(* ****** ****** *)

#impltmp
<xs>
<x0>
<r0>
<e1>
gseq_foldr_e1nv
( xs, r0, e1 ) =
(
gseq_foldr
<xs>
<x0>
<r0>(xs, r0)) where
{
val e1 =
$UN.datacopy( e1 )
#impltmp
foldr$fopr
< x0><r0 >(x0, r0) =
let
//
val e1 =
$UN.castlin10{e1}(e1)
val res =
foldr$fopr_e1nv
< x0><r0 >< e1>(x0, r0, e1)
//
in//let
//
let
val e1 = $UN.delinear(e1) in res end
//
endlet//end-of(foldr$fopr<x0><r0>(x0))
} (*where*) // end-of-(gseq_foldr_e1nv)

(* ****** ****** *)

#impltmp
<xs>
<x0>
<e1>
gseq_forall_e1nv
  (xs, e1) =
(
gseq_forall
< xs >
< x0 >( xs )) where
{
val e1 =
$UN.datacopy( e1 )
#impltmp
forall$test<x0>(x0) =
let
//
val e1 =
$UN.castlin10{e1}(e1)
val res =
forall$test_e1nv
<   x0   ><   e1   >(x0, e1)
//
in//let
//
let
val e1 = $UN.delinear(e1) in res end
//
endlet // end of [forall$test<x0>(x0)]
} (*where*) // end-of(gseq_forall_e1nv(xs,e1))

(* ****** ****** *)

#impltmp
<xs>
<x0>
<e1><e2>
gseq_forall_e2nv
  (xs, e1, e2) =
(
gseq_forall
< xs >
< x0 >( xs )) where
{
val e1 =
$UN.datacopy( e1 )
val e2 =
$UN.datacopy( e2 )
#impltmp
forall$test<x0>(x0) =
let
//
val e1 =
$UN.castlin10{e1}(e1)
val res =
forall$test_e2nv
< x0 >< e1 >< e2 >(x0, e1, e2)
//
in//let
//
let
val e1 = $UN.delinear(e1)
val e2 = $UN.delinear(e2) in res end
//
endlet // end of [forall$test<x0>(x0)]
} (*where*) // end-of(gseq_forall_e2nv(xs,e1,e2))

(* ****** ****** *)

#impltmp
<xs>
<x0>
<e1>
gseq_foreach_e1nv
  (xs, e1) =
(
gseq_foreach
< xs >
< x0 >( xs )) where
{
val e1 =
$UN.datacopy( e1 )
#impltmp
foreach$work<x0>(x0) =
let
//
val e1 =
$UN.castlin10{e1}(e1)
val res =
foreach$work_e1nv
<   x0   ><   e1   >(x0, e1)
//
in//let
//
let
val e1 = $UN.delinear(e1) in res end
//
endlet // end of [foreach$work<x0>(x0)]
} (*where*) // end-of(gseq_foreach_e1nv(xs,e1))

(* ****** ****** *)

#impltmp
<xs>
<x0>
<e1><e2>
gseq_foreach_e2nv
  (xs, e1, e2) =
(
gseq_foreach
< xs >
< x0 >( xs )) where
{
val e1 =
$UN.datacopy( e1 )
val e2 =
$UN.datacopy( e2 )
#impltmp
foreach$work<x0>(x0) =
let
//
val e1 =
$UN.castlin10{e1}(e1)
val res =
foreach$work_e2nv
< x0 >< e1 >< e2 >(x0, e1, e2)
//
in//let
//
let
val e1 = $UN.delinear(e1)
val e2 = $UN.delinear(e2) in res end
//
endlet // end of [foreach$work<x0>(x0)]
} (*where*) // end-of(gseq_foreach_e2nv(xs,e1,e2))

(* ****** ****** *)

#impltmp
<xs>
<x0>
<y0>
<e1>
gseq_map_e1nv_list
  (xs, e1) =
(
gseq_map_list
<xs>
<x0><y0>( xs )) where
{
val e1 =
$UN.datacopy( e1 )
#impltmp
map$fopr<x0><y0>(x0) =
let
//
val e1 =
$UN.castlin10{e1}(e1)
val res =
map$fopr_e1nv<x0><y0>(x0, e1)
//
in//let
//
let
val e1 = $UN.delinear(e1) in res end
//
endlet // end of [map$fopr<x0><y0>(x0)]
} (*where*) // end-of(gseq_map_e1nv_list)

(* ****** ****** *)
//
#impltmp
<x0>
<y0>
<e1>
list_map_e1nv
  (xs, e1) =
(
list_vt2t
(list_map_e1nv_vt<x0><y0><e1>(xs, e1))
)
//
#impltmp
<x0>
<y0>
<e1>
list_map_e1nv_vt
  (xs, e1) = let
//
#vwtpdef
ys = list_vt(y0)
#vwtpdef
ys(i:int) = list_vt(y0, i)
//
fnx
loop
{i:nat}.<i>.
( e1: !e1
, xs:
  list(x0, i)
, r0:
& (?ys) >> ys(i)): void =
(
case+ xs of
|
list_nil() =>
(r0 := list_vt_nil())
|
list_cons(x0, xs) =>
let
val y0 =
map$fopr_e1nv
<x0><y0><e1>(x0, e1)
val () =
(r0 := list_vt_cons(y0, _))
in
  loop(e1, xs, r0.1); $fold(r0)
end
) (* end of [loop] *)
//
in
let
var r0: list_vt(y0) in loop(e1, xs, r0); r0
end
end (*let*) // end of [list_map_e1nv_vt(xs,e1)]
//
(* ****** ****** *)
//
#impltmp
<x0>
<y0>
<e1>
optn_map_e1nv
  (xs, e1) =
(
optn_vt2t
(optn_map_e1nv_vt<x0><y0><e1>(xs, e1))
)
//
#impltmp
<x0>
<y0>
<e1>
optn_map_e1nv_vt
  (xs, e1) =
(
case+ xs of
|
optn_nil() =>
optn_vt_nil()
|
optn_cons(x1) =>
let
val y1 =
map$fopr_e1nv
<x0><y0><e1>(x1,e1) in optn_vt_cons(y1) end
) (*case+*) // end of [optn_map_e1nv_vt(xs,e1)]
//
(* ****** ****** *)

#impltmp
<xs>
<x0>
<y0>
<e1><e2>
gseq_map_e2nv_list
  (xs, e1, e2) =
(
gseq_map_list
<xs>
<x0><y0>( xs )) where
{
//
val e1 =
$UN.datacopy( e1 )
val e2 =
$UN.datacopy( e2 )
//
#impltmp
map$fopr<x0><y0>(x0) =
let
//
val e1 =
$UN.castlin10{e1}(e1)
val e2 =
$UN.castlin10{e2}(e1)
val res =
map$fopr_e2nv<x0><y0>(x0, e1, e2)
//
in//let
//
let
val e1 = $UN.delinear(e1)
val e2 = $UN.delinear(e2) in res end
//
endlet // end of [map$fopr<x0><y0>(x0)]
//
} (*where*) // end-of(gseq_map_e2nv_list(xs,e1,e2))

(* ****** ****** *)
//
#impltmp
<x0>
<y0>
<e1><e2>
list_map_e2nv
( xs, e1, e2 ) =
(
list_vt2t
(
list_map_e2nv_vt
<x0><y0><e1><e2>(xs, e1, e2)))
//
#impltmp
<x0>
<y0>
<e1><e2>
list_map_e2nv_vt
  (xs, e1, e2) = let
//
#vwtpdef
ys = list_vt(y0)
#vwtpdef
ys(i:int) = list_vt(y0, i)
//
fnx
loop
{i:nat}.<i>.
( e1: !e1
, e2: !e2
, xs:
  list(x0, i)
, r0:
& (?ys) >> ys(i)): void =
(
case+ xs of
|
list_nil() =>
(r0 := list_vt_nil())
|
list_cons(x0, xs) =>
let
val y0 =
map$fopr_e2nv
<x0><y0><e1>(x0, e1, e2)
val () =
(r0 := list_vt_cons(y0, _))
in
  loop(e1, e2, xs, r0.1); $fold(r0)
end
) (* end of [loop] *)
//
in
let
var r0: list_vt(y0) in loop(e1, e2, xs, r0); r0
end
end (*let*) // end of [list_map_e2nv_vt(xs,e1,e2)]
//
(* ****** ****** *)
//
#impltmp
<x0>
<y0>
<e1><e2>
optn_map_e2nv
( xs, e1, e2 ) =
(
optn_vt2t
(
optn_map_e2nv_vt
<x0><y0><e1><e2>(xs, e1, e2)))
//
#impltmp
<x0>
<y0>
<e1><e2>
optn_map_e2nv_vt
( xs, e1, e2 ) =
(
case+ xs of
|
optn_nil() => optn_vt_nil()
|
optn_cons(x1) =>
let
val y1 =
map$fopr_e2nv
< x0 >< y0 >
< e1 >< e2 >(x1,e1,e2) in optn_vt_cons(y1) end
) (*case+*) // end of [optn_map_e2nv_vt(xs,e1,e2)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_genv000.dats] *)
