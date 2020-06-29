(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)
//
(*
#staload
"./../SATS/gseq.sats"
*)
//
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
( gseq_nilq<x0,xs>(xs) )
//
(* ****** ****** *)
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
gseq_consq<x0,xs>(xs)
then
optn_vt_cons
(
gseq_tail_raw<x0,xs>(xs)
) else optn_vt_nil((*void*))
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_uncons_raw(xs) =
(
let
  val () = xs := tl in hd
end
) where
{
val hd =
  gseq_head_raw<x0,xs>(xs)
val tl =
  gseq_tail_raw<x0,xs>(xs)
}
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
| optn_vt_nil() =>
  $raise SubscriptExn()
| optn_vt_cons(x0) => x0
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
gseq_nilq<x0,xs>(xs)
then $raise SubscriptExn()
else gseq_uncons_raw<x0,xs>(xs)
)
impltmp
<x0,xs>
gseq_uncons_opt
  (xs) =
(
if
gseq_nilq<x0,xs>(xs)
then
  optn_vt_nil((*void*))
else
  optn_vt_cons
  (gseq_uncons_raw<x0,xs>(xs))
// end of [if]
)
//
(* ****** ****** *)

impltmp
<x0,xs>
gseq_cmp
(xs1, xs2) =
(
gseq_z2forcmp
<x0,xs><x0,xs>(xs1, xs2)
) where
{
  impltmp
  z2forcmp$fcmp<x0,x0> = g_cmp<x0>
} (* end of [gseq_cmp/z2forcmp] *)

(* ****** ****** *)

impltmp
<x0,xs>
gseq_print(xs) =
let
//
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
impltmp
foldl$fopr<x0><r0>(r0, _) = succ(r0)
//
} (* gseq_length/foldl *)

(* ****** ****** *)

impltmp
<x0,xs>
gseq_drop
  (xs, n0) =
(
  gseq_idropif(xs)
) where
{
  impltmp
  idropif$test<x0>(i0, _) = (i0 < n0)
} (* gseq_drop/idropif *)

(* ****** ****** *)

impltmp
<x0,xs>
gseq_dropif
  (xs) =
(
  gseq_idropif(xs)
) where
{
impltmp
idropif$test<x0>(_, x0) = dropif$test<x0>(x0)
} (* gseq_drop/dropif *)

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
//
impltmp
<x0,xs>
gseq_exists
  (xs) = let
//
  impltmp
  forall$test<x0>(x0) =
  not(exists$test<x0>(x0))
//
in
  if
  gseq_forall
  <x0,xs>(xs) then false else true
end // end of [gseq_exists/forall]
//
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
  impltmp
  forall0$test<x0> = forall$test<x0>
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
//
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
//
(* ****** ****** *)

impltmp
<x0,xs>
gseq_streamize
  (xs) =
( auxseq(xs) ) where
{
fun
auxseq
(xs: xs): stream_vt(x0) =
  $llazy
(
if
gseq_nilq
<x0,xs>(xs)
then strmcon_vt_nil()
else let
val x0 =
gseq_head_raw<x0,xs>(xs)
val xs =
gseq_tail_raw<x0,xs>(xs)
in
strmcon_vt_cons(x0, auxseq(xs))
end // end of [else]
) (* end of [auxseq] *)
} (* end of [gseq_streamize] *)

(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_unlist(xx) =
let
//
val xx =
list_rcopy_vt<x0>(xx)
//
in
gseq_unrlist_vt<x0,xs>(xx)
end // end of [gseq_unlist]
//
impltmp
<x0,xs>
gseq_unrlist(xx) =
let
  val xx =
  list_copy_vt<x0>(xx)
in
gseq_unrlist_vt<x0,xs>(xx)
end // end of [gseq_unrlist]
//
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
( xx
: list_vt(x0), xs: xs): xs =
(
case+ xx of
| ~
list_vt_nil() => xs
| ~
list_vt_cons(x0, xx) =>
loop
(xx, gseq_cons<x0,xs>(x0, xs))
)
in
  loop(xx, gseq_nil<x0,xs>())
end // end of [gseq_unrlist_vt]
//
(* ****** ****** *)

impltmp
<x0,xs>
gseq_unstream_vt
  (xx) =
(
  gseq_unrlist_vt<x0,xs>(xs)
) where
{
val xs = stream_vt_rlistize<x0>(xx)
} // end of [gseq_unstream_vt]

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
<x0><r0>(p0, x0) =
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
(p0, $UN.castlin01(r1)); (p1)
end // foldl$fopr
//
var r0: yy
val pz =
gseq_foldl<x0,xs><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<yy>
(pz, list_vt_nil()); $UN.castlin01(r0)
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
( r0, x0 ) =
list_vt_cons(map$fopr<x0><y0>(x0), r0)
}
//
end // end of [gseq_map_rlist/foldl]

(* ****** ****** *)

impltmp
<x0,xs><y0>
gseq_map_stream(xs) =
let
val xs =
gseq_streamize<x0,xs>(xs)
in(*in-of-let*)
(
stream_vt_map0<x0><y0>(xs)
) where
{
impltmp
map0$fopr<x0><y0> = map$fopr<x0><y0>
}
end // end of
// [gseq_map_stream/streamize]

(* ****** ****** *)

impltmp
<x0,xs><y0>
gseq_mapopt_stream(xs) =
let
val xs =
gseq_streamize<x0,xs>(xs)
in(*in-of-let*)
let
impltmp
map0$fopr
<x0><y0> = map$fopr<x0><y0>
impltmp
filter1$test<x0> = filter$test<x0>
in
  stream_vt_mapopt0<x0><y0>(xs)
end
end // end of
// [gseq_mapopt_stream/streamize]

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
(p0, $UN.castlin01(r1)); (p1)
end
else p0 // end of [foldl$fopr]
//
var r0: xx
val pz =
gseq_foldl<x0,xs><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<xx>
(pz, list_vt_nil()); $UN.castlin01(r0)
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
gseq_filter_stream
  (xs) =
(
stream_vt_filter0
(gseq_streamize<x0,xs>(xs))
) where
{
impltmp
filter0$test<x0> = filter$test<x0>
} (* end of [gseq_filter_stream] *)

(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_add(xs) =
(
gseq_map_add(xs)
) where
{
  impltmp map$fopr<x0><x0>(x0) = x0
}
//
impltmp
<x0,xs><y0>
gseq_map_add(xs) =
let
//
impltmp
foldl$fopr
<x0><y0>
(r0, x0) =
g_add<y0>
(r0, map$fopr<x0><y0>(x0))
//
in
gseq_foldl<x0,xs><y0>(xs, g_0<y0>())
end // end of [gseq_map_add/foldl]
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_mul(xs) =
(
gseq_map_mul(xs)
) where
{
  impltmp map$fopr<x0><x0>(x0) = x0
}
//
impltmp
<x0,xs><y0>
gseq_map_mul(xs) =
let
//
impltmp
foldl$fopr
<x0><y0>
(r0, x0) =
g_mul<y0>
(r0, map$fopr<x0><y0>(x0))
//
in
gseq_foldl<x0,xs><y0>(xs, g_1<y0>())
end // end of [gseq_map_mul/foldl]
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_max_exn
  (xs) =
(
if
gseq_nilq<x0,xs>(xs)
then
$raise SubscriptExn()
else
gseq_max2
( gseq_tail_raw<x0,xs>(xs)
, gseq_head_raw<x0,xs>(xs))
) (* end of [gseq_max_exn] *)
//
impltmp
<x0,xs>
gseq_min_exn
  (xs) =
(
if
gseq_nilq<x0,xs>(xs)
then
$raise SubscriptExn()
else
gseq_min2
( gseq_tail_raw<x0,xs>(xs)
, gseq_head_raw<x0,xs>(xs))
) (* end of [gseq_min_exn] *)
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_max_opt
  (xs) =
(
if
gseq_nilq<x0,xs>(xs)
then
optn_vt_nil((*void*))
else
optn_vt_cons
(
gseq_max2
( gseq_tail_raw<x0,xs>(xs)
, gseq_head_raw<x0,xs>(xs))
)
) (* end of [gseq_max_opt] *)
//
impltmp
<x0,xs>
gseq_min_opt
  (xs) =
(
if
gseq_nilq<x0,xs>(xs)
then
optn_vt_nil((*void*))
else
optn_vt_cons
(
gseq_min2
( gseq_tail_raw<x0,xs>(xs)
, gseq_head_raw<x0,xs>(xs))
)
) (* end of [gseq_min_opt] *)
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_max2
(xs, x0) = let
//
typedef r0 = x0
//
impltmp
foldl$fopr
<x0><r0>
(r0, x0) = g_max<x0>(r0, x0)
//
in
  gseq_foldl<x0,xs><r0>(xs, x0)
end // end of [gseq_max2/foldl]
//
impltmp
<x0,xs>
gseq_min2
(xs, x0) = let
//
typedef r0 = x0
//
impltmp
foldl$fopr
<x0><r0>
(r0, x0) = g_min<x0>(r0, x0)
//
in
  gseq_foldl<x0,xs><r0>(xs, x0)
end // end of [gseq_min2/foldl]
//
(* ****** ****** *)

impltmp
<x0,xs>
gseq_sortedq(xs) =
let
  val xs =
  gseq_streamize<x0,xs>(xs)
in
  stream_vt_sortedq<x0,xs>(xs)
end // end of [gseq_sortedq]

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
//
impltmp
<x0,xs>
gseq_rexists
  (xs) = let
//
  impltmp
  rforall$test<x0>(x0) =
  not(rexists$test<x0>(x0))
//
in
if
gseq_rforall
<x0,xs>(xs) then false else true
end
// end of [gseq_rexists/rforall]
//
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
(  x0  ) = rforall$test<x0>(x0)
}
end // end of
// [gseq_rforall/list_vt_forall]

(* ****** ****** *)

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
gseq_append
(xs1, xs2) =
(
gseq_foldr
<x0,xs><r0>(xs1, xs2)
) where
{
//
typedef r0 = xs
//
impltmp
foldr$fopr
<x0><r0>(x0, r0) =
gseq_cons<x0,xs>(x0, r0)
}
//
impltmp
<x0,xs,xz>
gseq_concat(xss) =
gseq_unstream_vt<x0>
(
gseq_concat_stream<x0,xs,xz>(xss)
)
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_reverse(xs) =
gseq_rappend<x0,xs>
(xs, gseq_nil<x0,xs>())
//
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
<x0><xs>(r0, x0) =
let
  val r0 =
  gseq_cons<x0,xs>(x0, r0) in r0
end
}
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_append_stream
  (xs1, xs2) = let
//
val
xs1 =
gseq_streamize<x0,xs>(xs1)
val
xs2 =
gseq_streamize<x0,xs>(xs2)
//
in
stream_vt_append<x0>(xs1, xs2)
end // gseq_append_stream
//
impltmp
<x0,xs,xz>
gseq_concat_stream
  (xss) = let
//
typedef
ys = stream_vt(x0)
//
val
xss =
let
impltmp
map$fopr<xs><ys> =
gseq_streamize<x0,xs>
in
gseq_map_stream<xs,xz>(xss)
end
//
in
  stream_vt_concat<x0>(  xss  )
end // gseq_concat_stream
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_idropif
  (xs) =
( loop(xs, 0) ) where
{
//
fun
loop
( xs: xs
, i0: nint): xs =
if
gseq_nilq<x0,xs>(xs)
then
(
  gseq_nil<x0,xs>()
)
else
let
val x0 =
gseq_head_raw<x0,xs>(xs)
in
if
idropif$test<x0>(i0, x0)
then
(
  loop(xs, succ(i0))
) where
{
val xs =
gseq_tail_raw<x0,xs>(xs)
} (* end of [then] *)
else xs // end-of-else
endlet (* end of [loop] *)
//
} (* end of [gseq_idropif] *)
//
(* ****** ****** *)

impltmp
<x0,xs><r0>
gseq_ifoldl
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_iforeach<x0,xs>(xs)
) where
{
impltmp
iforeach$work<x0>(i0, x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
(p0, ifoldl$fopr<x0><r0>(r0, i0, x0))
//
end // end of [iforeach$work]
}
//
} (* end of [gseq_ifoldl/iforeach] *)

(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_iexists
  (xs) = let
//
impltmp
iforall$test<x0>(i0, x0) =
not(iexists$test<x0>(i0, x0))
//
in
if
gseq_iforall
<x0,xs>(xs) then false else true
end
// end of [gseq_rexists/rforall]
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

impltmp
<x0,xs>
gseq_indexof
  (xs, x0) = let
//
var i0: sint = -1
val p0 = $addr(i0)
//
impltmp
iforall$test<x0>
  (i1, x1) =
if
g_equal<x0>(x0, x1)
then
let
val () =
$UN.p2tr_set<sint>(p0, i1)
in
  false // HX: found
end // then
else true // else // end-of-if
//
in
let
val yn =
gseq_iforall<x0,xs>(xs) in i0
end
end // end of [gseq_indexof/iforall]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_rindexof
  (xs, x0) = let
//
var i0: sint = -1
val p0 = $addr(i0)
//
impltmp
iforeach$work<x0>
  (i1, x1) =
if
g_equal<x0>(x0, x1)
then
let
val () =
$UN.p2tr_set<sint>(p0, i1)
end // then // end of [if]
//
in
let
val () =
gseq_iforeach<x0,xs>(xs) in i0
end
end // end of [gseq_rindexof/iforeach]

(* ****** ****** *)
//
impltmp
<x0,xs><y0>
gseq_imap_list
  (xs) = let
//
typedef
yy =
list_vt(y0)
typedef
r0 = p2tr(yy)
//
impltmp
ifoldl$fopr
<x0><r0>
(p0, i0, x0) =
let
//
val y0 =
imap$fopr
<x0><y0>(i0, x0)
val r1 = 
list_vt_cons(y0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<yy>
(p0, $UN.castlin01(r1)); (p1)
end // foldl$fopr
//
var r0: yy
val pz =
gseq_ifoldl<x0,xs><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<yy>
(pz, list_vt_nil()); $UN.castlin01(r0)
end // end of [gseq_imap_list/ifoldl]
//
(* ****** ****** *)

impltmp
<x0,xs><y0>
gseq_imap_rlist
  (xs) = let
//
typedef r0 = list_vt(y0)
//
in
//
gseq_ifoldl
<x0,xs><r0>
(xs, list_vt_nil()) where
{
impltmp
ifoldl$fopr
 <x0><r0>
( r0, i0, x0 ) =
list_vt_cons
  ( imap$fopr<x0><y0>(i0, x0), r0 )
// list_vt_cons
}
//
end // end of [gseq_imap_rlist/ifoldl]

(* ****** ****** *)

impltmp
<x0,xs><y0>
gseq_imap_stream(xs) =
let
val xs =
gseq_streamize<x0,xs>(xs)
in(*in-of-let*)
(
stream_vt_imap0<x0><y0>(xs)
) where
{
impltmp
imap0$fopr
<x0><y0> = imap$fopr<x0><y0>
}
end // end of
// [gseq_imap_stream/streamize]

(* ****** ****** *)

impltmp
<x0,xs><y0>
gseq_imapopt_stream(xs) =
let
val xs =
gseq_streamize<x0,xs>(xs)
in(*in-of-let*)
(
stream_vt_imapopt0<x0><y0>(xs)
) where
{
impltmp
imap0$fopr
<x0><y0> = imap$fopr<x0><y0>
impltmp
ifilter1$test<x0> = ifilter$test<x0>
}
end // end of
// [gseq_imap_stream/streamize]

(* ****** ****** *)
//
// For z2-gseq-operations
//
(* ****** ****** *)
//
impltmp
<x0,xs>
<y0,ys>
gseq_z2listize
  (xs, ys) =
let
val
xys =
gseq_z2streamize
<x0,xs><y0,ys>(xs, ys)
in
stream_vt_listize<(x0,y0)>(xys)
end
//
impltmp
<x0,xs>
<y0,ys>
gseq_z2streamize
  (xs, ys) =
let
val xs =
gseq_streamize<x0,xs>(xs)
val ys =
gseq_streamize<y0,ys>(ys)
in
stream_vt_z2streamize<x0,y0>(xs, ys)
end
//
(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys><r0>
gseq_z2foldl
(xs, ys, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  gseq_z2foreach
  <x0,xs><y0,ys>(xs, ys)
) where
{
impltmp
z2foreach$work<x0,y0>
  (x0, y0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
( p0
, z2foldl$fopr<x0,y0><r0>(r0, x0, y0))
//
end // end of [z2foreach$work]
}
//
} (* end of [gseq_z2foldl/z2foreach] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys>
gseq_z2forall
  (xs, ys) =
(
stream_vt_z2forall0<x0,y0>
(
  gseq_streamize<x0,xs>(xs)
,
  gseq_streamize<y0,ys>(ys))
) where
{
impltmp
z2forall0$test<x0,y0> = z2forall$test<x0,y0>
} (* end of [gseq_z2forall] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys>
gseq_z2forcmp
  (xs, ys) =
(
stream_vt_z2forcmp0<x0,y0>
(
  gseq_streamize<x0,xs>(xs)
,
  gseq_streamize<y0,ys>(ys))
) where
{
impltmp
z2forcmp0$fcmp<x0,y0> = z2forcmp$fcmp<x0,y0>
} (* end of [gseq_z2forcmp] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys>
gseq_z2foreach
  (xs, ys) =
let
val
test =
gseq_z2forall<x0,xs><y0,ys>
  (xs, ys) where
{
impltmp
z2forall$test<x0,y0>(x0, y0) =
let
val () =
z2foreach$work<x0,y0>(x0, y0) in true
end
}
in
  // nothing
end // end of [gseq_z2foreach/z2forall]

(* ****** ****** *)
//
impltmp
<x0,xs>
<y0,ys><z0>
gseq_z2map_list
  (xs, ys) = let
//
typedef
zz =
list_vt(z0)
typedef
r0 = p2tr(zz)
//
impltmp
z2foldl$fopr
<x0,y0><r0>
(p0, x0, y0) =
let
//
val z0 =
z2map$fopr
<x0,y0><z0>(x0, y0)
val r1 = 
list_vt_cons(z0, _ )
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<zz>
(p0, $UN.castlin01(r1)); (p1)
end // z2foldl$fopr
//
var r0: zz
val pz =
gseq_z2foldl
<x0,xs><y0,ys><r0>(xs, ys, $addr(r0))
//
in
  $UN.p2tr_set<zz>
  (pz, list_vt_nil()); $UN.castlin01(r0)
end // end of [gseq_z2map_list/z2foldl]
//
(* ****** ****** *)
//
// HX:
// Miscellaneous gseq-operations
//
(* ****** ****** *)

impltmp
<x0,xs>
gseq_mergesort
  (xs) = let
//
val xx =
gseq_listize<x0,xs>(xs)
val xx =
list_vt_mergesort<x0>(xx)
//
in
  gseq_unlist_vt<x0,xs>(xx)
end // end of [gseq_mergesort]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_permutize
  (xs) = let
//
val y0 =
gseq_listize<x0,xs>(xs)
val ys =
list_vt_permutize<x0>(y0)
//
in
(
  stream_vt_map0<y0><xs>(ys)
) where
{
  typedef y0 = list_vt(x0)
  impltmp map0$fopr<y0><xs> = gseq_unlist_vt<x0,xs>
}
end // end of [gseq_permutize]

(* ****** ****** *)
//
// For x2-gseq-operations
//
(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys><z0>
gseq_x2map_stream
  (xs, ys) =
(
stream_vt_concat<z0>(zss)
) where
{
//
typedef
zs = stream_vt(z0)
//
val
zss =
let
//
impltmp
map$fopr<x0><zs>(x0) =
let
impltmp
map$fopr<y0><z0>(y0) =
x2map$fopr<x0,y0>(x0, y0)
in
gseq_map_stream<y0,ys><z0>(ys)
end
//
in
gseq_map_stream<x0,xs><zs>(xs)
end
//
} (* end of [gseq_x2map_stream] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys><z0>
gseq_x2mapopt_stream
  (xs, ys) =
(
stream_vt_concat<z0>(zss)
) where
{
//
typedef
zs = stream_vt(z0)
//
val
zss =
let
//
impltmp
map$fopr<x0><zs>(x0) =
let
impltmp
map$fopr
<y0><z0>(y0) =
x2map$fopr<x0,y0>(x0, y0)
impltmp
filter$test<y0>(y0) =
x2filter$test<x0,y0>(x0, y0)
in
gseq_mapopt_stream<y0,ys><z0>(ys)
end
//
in
  gseq_map_stream<x0,xs><zs>( xs )
end
//
} (* end of [gseq_x2mapopt_stream] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys>
gseq_x2streamize
  (xs, ys) =
let
impltmp
x2map$fopr<x0,y0>(x0, y0) = (x0, y0)
in
gseq_x2map_stream<x0,xs><y0,ys>(xs, ys)
end // end of [gseq_x2streamize]

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys>
gseq_x2foreach_row
(xs, ys) =
(
gseq_foreach<x0,xs>(xs)
) where
{
//
impltmp
foreach$work<x0>(x0) =
let
//
val () =
x2foreach_row$beg<>()
//
val () =
(
gseq_foreach<y0,ys>(ys)
) where
{
impltmp
foreach$work<y0>(y0) =
x2foreach_row$work<x0,y0>(x0, y0)
}
//
val () = x2foreach_row$end<>()
//
end // end of [let]
//
} (* end of [gseq_x2foreach_row] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys>
gseq_x2foreach_col
(xs, ys) =
let
impltmp
x2foreach_row$beg<>() =
x2foreach_col$beg<>()
impltmp
x2foreach_row$end<>() =
x2foreach_col$end<>()
impltmp
x2foreach_row$work<y0,x0>(y0, x0) =
x2foreach_col$work<x0,y0>(x0, y0)
in
gseq_x2foreach_row<y0,ys><x0,xs>(ys, xs)
end (* end of [gseq_x2foreach_col] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys><z0>
gseq_x2imap_stream
  (xs, ys) =
(
stream_vt_concat<z0>(zss)
) where
{
//
typedef
zs = stream_vt(z0)
//
val
zss =
let
//
impltmp
imap$fopr<x0><zs>(i, x0) =
let
impltmp
imap$fopr
<y0><z0>(j, y0) =
x2imap$fopr<x0,y0>(i, x0, j, y0)
in
gseq_imap_stream<y0,ys><z0>(ys)
end
//
in
  gseq_imap_stream<x0,xs><zs>( xs )
end
//
} (* end of [gseq_x2imap_stream] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys><z0>
gseq_x2imapopt_stream
  (xs, ys) =
(
stream_vt_concat<z0>(zss)
) where
{
//
typedef
zs = stream_vt(z0)
//
val
zss =
let
//
impltmp
imap$fopr<x0><zs>(i, x0) =
let
impltmp
imap$fopr
<y0><z0>(j, y0) =
x2imap$fopr<x0,y0>(i, x0, j, y0)
impltmp
ifilter$test<y0>(j, y0) =
x2ifilter$test<x0,y0>(i, x0, j, y0)
in
gseq_imapopt_stream<y0,ys><z0>(ys)
end
//
in
  gseq_imap_stream<x0,xs><zs>( xs )
end
//
} (* end of [gseq_x2imapopt_stream] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys>
gseq_x2iforeach_row
(xs, ys) =
(
gseq_iforeach<x0,xs>(xs)
) where
{
//
impltmp
iforeach$work<x0>(i, x0) =
let
//
val () =
x2iforeach_row$beg<>(i)
//
val () =
(
gseq_iforeach<y0,ys>(ys)
) where
{
impltmp
iforeach$work<y0>(j, y0) =
x2iforeach_row$work<x0,y0>(i, x0, j, y0)
}
//
val () = x2iforeach_row$end<>(i)
//
end // end of [let]
//
} (* end of [gseq_x2iforeach_row] *)

(* ****** ****** *)

impltmp
<x0,xs>
<y0,ys>
gseq_x2iforeach_col
(xs, ys) =
let
impltmp
x2iforeach_row$beg<>(i) =
x2iforeach_col$beg<>(i)
impltmp
x2iforeach_row$end<>(i) =
x2iforeach_col$end<>(i)
impltmp
x2iforeach_row$work<y0,x0>(j, y0, i, x0) =
x2iforeach_col$work<x0,y0>(i, x0, j, y0)
in
gseq_x2iforeach_row<y0,ys><x0,xs>(ys, xs)
end (* end of [gseq_x2foreach_col] *)

(* ****** ****** *)

(* end of [gseq.dats] *)
