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
impltmp
<x0,xs>
gseq_nil?(xs) =
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
gseq_cons?(xs) =
bool_neg(gseq_nil? <x0,xs> (xs))
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
gseq_nil? <x0,xs> (xs)
then $raise SubscriptExn()
else $UN.gseq_uncons<x0,xs>(xs)
)
impltmp
<x0,xs>
gseq_uncons_opt
  (xs) =
(
if
gseq_nil? <x0,xs> (xs)
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
gseq_length(xs) =
(
gseq_foldl
<x0,xs><r0>(xs, 0)
) where
{
typedef r0 = nint
implement
foldl$fopr<x0><r0>(r0, x0) = r0 + 1
} (* gseq_length/foldl *)

(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_forall(xs) =
stream_vt_forall0<x0>
(gseq_streamize<x0,xs>(xs)) where
{
implement
forall0$test<x0>(x0) = forall$test<x0>(x0)
}
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

(* ****** ****** *)

impltmp
<x0,xs>
gseq_streamize
  (xs) = $llazy
(
if
gseq_nil?
<x0,xs>(xs)
then stream_vt_nil()
else let
  var xs = xs
  val x0 = $UN.gseq_uncons<x0,xs>(xs)
in
  stream_vt_cons(x0, gseq_streamize(xs))
end
)

(* ****** ****** *)

impltmp
<x0,xs><y0>
gseq_map_list
  (xs) = let
//
typedef r0 =
p2tr(list_vt(x0))
//
impltmp
foldl$fopr
<x0><r0>
(p0, x0) =
let
//
val r1 = 
list_vt_cons
(map$fopr(x0), _)
//
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<r0>
(p0, $UN.castlin(r1)); (p1)
end // foldl$fopr
//
var r0: list_vt(y0)
val r1 =
gseq_foldl<x0,xs>(xs, $addr(r0))
//
in
$UN.p2tr_set
(p1, list_vt_nil()); $UN.castlin(r0)
end // end of [gseq_map_list/foldl]

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
gseq_foldl<x0,xs>
(xs, list_vt_nil()) where
{
  impltmp
  foldl$fopr
  <x0><r0>
  (r0, x0) =
  list_vt_cons(map$fopr(x0), r0)
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
//
impltmp
<x0,xs>
gseq_append(xs1, xs2) =
(
gseq_foldr<x0,xs>(xs1, xs2)
) where
{
impltmp
<x0><xs>
foldr(x0, r0) = gseq_cons<x0,xs>(x0, r0)
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
gseq_foldl<x0,xs>(xs1, xs2)
) where
{
impltmp
<x0><xs>
foldl(r0, x0) = gseq_cons<x0,xs>(x0, r0)
}
//
(* ****** ****** *)

(* end of [gseq.dats] *)
