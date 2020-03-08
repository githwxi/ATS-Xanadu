(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
// For 1-gseq-operations
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_nilq(xs) =
(
gseq_forall<x0,xs>(xs)
) where
{
impltmp
forall$test<x0>(_) = false
}
//
impltmp
<x0,xs>
gseq_consq(xs) =
bool_neg
( gseq_nilq <x0,xs> (xs) )
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_head_raw(xs) =
  ( x0 ) where
{
var xs = xs
val x0 =
gseq_uncons_raw<x0,xs>(xs)
}
impltmp
<x0,xs>
gseq_tail_raw(xs) =
  ( xs ) where
{
var xs = xs
val x0 =
gseq_uncons_raw<x0,xs>(xs)
}
//
impltmp
<x0,xs>
gseq_head_exn(xs) =
if
gseq_consq<x0,xs>(xs)
then
gseq_head_raw<x0,xs>(xs)
else $raise SubscriptExn()
impltmp
<x0,xs>
gseq_tail_exn(xs) =
if
gseq_consq<x0,xs>(xs)
then
gseq_tail_raw<x0,xs>(xs)
else $raise SubscriptExn()
//
impltmp
<x0,xs>
gseq_head_opt(xs) =
if
gseq_consq<x0,xs>(xs)
then
optn_vt_cons
(
gseq_head_raw<x0,xs>(xs)
) else optn_vt_nil((*void*))
impltmp
<x0,xs>
gseq_tail_opt(xs) =
if
gseq_consq <x0,xs> (xs)
then
optn_vt_cons
(
gseq_tail_raw<x0,xs>(xs)
) else optn_vt_nil((*void*))
//
(* ****** ****** *)
//
(*
impltmp
<x0,xs>
gseq_uncons_exn
  (xs) =
let
val opt =
gseq_uncons_opt<x0,xs>(xs)
in
//
case+ opt of
| ~optn_vt_nil() =>
   $raise SubscriptExn()
| ~optn_vt_cons(x0) => x0
//
end // end of [gseq_uncons_exn]
*)
//
impltmp
<x0,xs>
gseq_uncons_exn
  (xs) =
(
if
gseq_nilq <x0,xs> (xs)
then $raise SubscriptExn()
else gseq_uncons_raw<x0,xs>(xs)
)
impltmp
<x0,xs>
gseq_uncons_opt
  (xs) =
(
if
gseq_nilq <x0,xs> (xs)
then optn_nil() else optn_cons(x0)
)
//
(* ****** ****** *)

impltmp
<x0,xs><r0>
gseq_foldl
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_foreach<x0,xs>(xs)
) where
{
impltmp
foreach$work<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldl$fopr<x0><r0>(r0, x0))
//
end // end of [foreach$work]
}
//
} (* end of [gseq_foldl/foreach] *)

(* ****** ****** *)

impltmp
<x0,xs>
gseq_print(xs) =
let
val () =
gseq_print$beg<x0,xs>()
//
val () =
(
  gseq_iforeach<x0,xs>(xs)
) where
{
//
impltmp
iforeach$work<x0>
  (i0, x0) =
(
  g_print<x0>(x0)
) where
{
  val () =
  if
  (i0 > 0)
  then gseq_print$sep<x0,xs>()
} (* where *)
//
} (* where *)
//
val () =
gseq_print$end<x0,xs>((*void*))
//
endlet (* end of [gseq_print] *)

impltmp
<x0,xs>
gseq_print$beg() = string_print("(")
impltmp
<x0,xs>
gseq_print$end() = string_print(")")
impltmp
<x0,xs>
gseq_print$sep() = string_print(",")

(* ****** ****** *)

impltmp
<x0,xs>
gseq_length(xs) =
(
gseq_foldl
<x0,xs><r0>(xs, 0)
) where
{
//
typedef r0 = nint
//
implement
foldl$fopr<x0><r0>(r0, x0) = succ(r0)
//
} (* gseq_length/foldl *)

(* ****** ****** *)
//
(*
impltmp
<x0,xs>
gseq_forall
  (xs) =
( loop(xs) ) where
{
fun
loop(xs: xs): bool =
if
gseq_nilq
<x0,xs>(xs)
then true else
let
var xs = xs
val x0 =
gseq_uncons_raw<x0,xs>(xs)
in
if
forall$test<x0>(x0)
  then loop(xs) else false
// end of [if]
end // end of [else]
} (* end of [gseq_forall/uncons] *)
*)
//
impltmp
<x0,xs>
gseq_forall
  (xs) =
stream_vt_forall0<x0>
(gseq_streamize<x0,xs>(xs)) where
{
implement
forall0$test<x0>(x0) = forall$test<x0>(x0)
} (* end of [gseq_forall/streamize] *)
//
(* ****** ****** *)

impltmp
<x0,xs>
gseq_foreach(xs) =
let
val
test =
gseq_forall<x0,xs>(xs) where
{
impltmp
forall$test<x0>(x0) =
let
val () = foreach$work<x0>(x0) in true
end
}
in
  // nothing
end // end of [gseq_foreach/forall]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_listize
  (xs) =
(
gseq_map_list<x0,xs><x0>(xs)
) where
{
  impltmp map$fopr<x0><x0>(x0) = x0
}
impltmp
<x0,xs>
gseq_rlistize
  (xs) =
(
gseq_map_rlist<x0,xs><x0>(xs)
) where
{
  impltmp map$fopr<x0><x0>(x0) = x0
}

(* ****** ****** *)

impltmp
<x0,xs>
gseq_streamize
  (xs) =
(
  auxseq(xs)
) where
{
fun
auxseq
(xs: xs): stream_vt(x0) =
  $llazy
(
if
gseq_nilq
<x0,xs>(xs)
then stream_vt_nil()
else let
var xs = xs
val x0 =
gseq_uncons_raw<x0,xs>(xs)
in
stream_vt_cons(x0, auxseq(xs))
end // end of [else]
)
} (* end of [gseq_streamize] *)

(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_unlist(xx) =
let
//
val xx =
list_reverse_vt<x0>(xx)
//
in
gseq_unrlist_vt<x0,xs>(xx)
end // end of [gseq_unlist]
impltmp
<x0,xs>
gseq_unlist_vt(xx) =
let
//
val xx =
list_vt_reverse<x0>(xx)
//
in
  gseq_unrlist_vt<x0,xs>(xx)
end // end of [gseq_unlist_vt]
//
impltmp
<x0,xs>
gseq_unrlist_vt(xx) =
let
//
fun
loop
(xx: list_vt(x0), xs: xs): xs =
(
case+ xx of
|
~ list_vt_nil() => xs
|
~ list_vt_cons(x0, xx) =>
  loop(xx, gseq_cons<x0,xs>(x0, xs))
)
in
loop(xx, gseq_nil<x0,xs>())
end // end of [gseq_unrlist_vt]
//
(* ****** ****** *)
//
impltmp
<x0,xs><y0>
gseq_map_list
  (xs) = let
//
typedef
yy =
list_vt(y0)
typedef
r0 = p2tr(yy)
//
impltmp
foldl$fopr
<x0><r0>
(p0, x0) =
let
//
val y0 =
map$fopr<x0><y0>(x0)
val r1 = 
list_vt_cons(y0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<yy>
(p0, $UN.castlin(r1)); (p1)
end // foldl$fopr
//
var r0: yy
val pz =
gseq_foldl<x0,xs><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<yy>
(pz, list_vt_nil()); $UN.castlin(r0)
end // end of [gseq_map_list/foldl]
//
(* ****** ****** *)

impltmp
<x0,xs><y0>
gseq_map_rlist
  (xs) = let
//
typedef r0 = list_vt(y0)
//
in
//
gseq_foldl
<x0,xs><r0>
(xs, list_vt_nil()) where
{
impltmp
foldl$fopr
<x0><r0>
(r0, x0) =
list_vt_cons(map$fopr<x0><y0>(x0), r0)
}
//
end // end of [gseq_map_rlist/foldl]

(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_copy_list(xs) =
(
  gseq_map_list<x0,xs><x0>(xs)
) where
{
  impltmp map$fopr<x0><x0>(x0) = x0
}
impltmp
<x0,xs>
gseq_copy_rlist(xs) =
(
gseq_map_rlist<x0,xs><x0>(xs)
) where
{
  impltmp map$fopr<x0><x0>(x0) = x0
}
//
(* ****** ****** *)

impltmp
<x0,xs>
gseq_filter_list
  (xs) = let
//
typedef
xx =
list_vt(x0)
typedef
r0 = p2tr(xx)
//
impltmp
foldl$fopr
<x0><r0>
(p0, x0) =
if
filter$test<x0>(x0)
then
let
//
val r1 = 
list_vt_cons(x0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<xx>
(p0, $UN.castlin(r1)); (p1)
end
else p0 // end of [foldl$fopr]
//
var r0: xx
val pz =
gseq_foldl<x0,xs><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<xx>
(pz, list_vt_nil()); $UN.castlin(r0)
end // end of [gseq_filter_list/foldl]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_filter_rlist
  (xs) = let
//
typedef r0 = list_vt(x0)
//
in
//
gseq_foldl
<x0,xs><r0>
(xs, list_vt_nil()) where
{
  impltmp
  foldl$fopr
  <x0><r0>
  (r0, x0) =
  if
  filter$test<x0>(x0)
  then list_vt_cons(x0, r0) else r0
}
//
end // end of [gseq_filter_rlist/foldl]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_add(xs) =
let
//
typedef r0 = x0
//
implement
foldl$fopr
<x0><r0>
(r0, x0) = g_add<x0>(r0, x0)
//
in
  gseq_foldl<x0,xs><r0>(xs, g_0<r0>())
end // end of [gseq_add/foldl]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_mul(xs) =
let
//
typedef r0 = x0
//
implement
foldl$fopr
<x0><r0>
(r0, x0) = g_mul<x0>(r0, x0)
//
in
  gseq_foldl<x0,xs><r0>(xs, g_1<r0>())
end // end of [gseq_mul/foldl]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_max2
(xs, x0) = let
//
typedef r0 = x0
//
implement
foldl$fopr
<x0><r0>
(r0, x0) = g_max<x0>(r0, x0)
//
in
  gseq_foldl<x0,xs><r0>(xs, x0)
end // end of [gseq_max2/foldl]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_min2
(xs, x0) = let
//
typedef r0 = x0
//
implement
foldl$fopr
<x0><r0>
(r0, x0) = g_min<x0>(r0, x0)
//
in
  gseq_foldl<x0,xs><r0>(xs, x0)
end // end of [gseq_min2/foldl]

(* ****** ****** *)

impltmp
<x0,xs><r0>
gseq_foldr
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_rforeach<x0,xs>(xs)
) where
{
impltmp
rforeach$work<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldr$fopr<x0><r0>(x0, r0))
//
end // end of [rforeach$work]
}
//
} (* end of [gseq_foldr/rforeach] *)

(* ****** ****** *)

impltmp
<x0,xs>
gseq_rforall(xs) =
let
val xs =
gseq_rlistize<x0,xs>(xs)
in
(
  list_vt_forall0<x0>(xs)
) where
{
impltmp
forall0$test<x0>
  (x0) = rforall$test<x0>(x0)
}
end // end of
// [gseq_rforall/list_vt_forall]

impltmp
<x0,xs>
gseq_rforeach(xs) =
let
val
test =
gseq_rforall<x0,xs>(xs) where
{
impltmp
rforall$test<x0>(x0) =
let
val () = rforeach$work<x0>(x0) in true
end
}
in
  // nothing
end // end of [gseq_rforeach/rforall]

(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_append(xs1, xs2) =
(
gseq_foldr<x0,xs><r0>(xs1, xs2)
) where
{
//
typedef r0 = xs
//
impltmp
foldr$fopr
<x0><r0>(x0, r0) = gseq_cons<x0,xs>(x0, r0)
}
//
impltmp
<x0,xs>
gseq_reverse(xs) =
gseq_rappend<x0,xs>
(xs, gseq_nil<x0,xs>())
impltmp
<x0,xs>
gseq_rappend(xs1, xs2) =
(
gseq_foldl<x0,xs><r0>(xs1, xs2)
) where
{
//
typedef r0 = xs
//
impltmp
foldl$fopr
<x0><xs>(r0, x0) = gseq_cons<x0,xs>(x0, r0)
}
//
(* ****** ****** *)

impltmp
<x0,xs>
gseq_iforall(xs) =
let
//
var i0: nint = 0
val p0 = $addr(i0)
//
in
//
let
impltmp
forall$test<x0>(x0) =
(
iforall$test<x0>(i0, x0)
) where
{
val i0 =
$UN.p2tr_get<nint>(p0)
val () =
$UN.p2tr_set<nint>(p0, succ(i0))
}
in
  gseq_forall<x0,xs>(xs)
end (* end of [gseq_forall] *)
//
end // end of [gseq_iforall/forall]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_iforeach(xs) =
let
val
test =
gseq_iforall<x0,xs>(xs) where
{
impltmp
iforall$test<x0>(i0, x0) =
let
val () = iforeach$work<x0>(i0, x0) in true
end
}
in
  // nothing
end // end of [gseq_iforeach/iforall]

(* ****** ****** *)
//
// For x2-gseq-operations
//
(* ****** ****** *)
//
// For z2-gseq-operations
//
(* ****** ****** *)


(* ****** ****** *)

(* end of [gseq.dats] *)
