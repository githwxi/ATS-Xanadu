(* ****** ****** *)
(*
** for gl-sequences
*)
(* ****** ****** *)
//
(*
#staload
"./../SATS/gseq_vt.sats"
*)
//
(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)

impltmp
<x0,xs>
glseq_copy(xs) =
glseq_unlist_vt<x0,xs>
(glseq_listize1<x0,xs>(xs))

(* ****** ****** *)

impltmp
<x0,xs>
glseq_free(xs) =
(
glseq_foreach0<x0,xs>(xs)
) where
{
impltmp
foreach0$work<x0> = g_free<x0>
}

(* ****** ****** *)
//
impltmp
<x0,xs>
glseq_uncons_exn
  (xs) =
if
glseq_nilq<x0,xs>(xs)
then let
val
() = g_free<xs>(xs)
in
$raise SubscriptExn()
end // end of [then]
else
glseq_uncons_raw<x0,xs>(xs)
//
impltmp
<x0,xs>
glseq_uncons_opt
  (xs) =
if
glseq_nilq<x0,xs>(xs)
then
optn_vt_nil((*void*))
else
optn_vt_cons
(glseq_uncons_raw<x0,xs>(xs))
//
(* ****** ****** *)

impltmp
<x0,xs>
glseq_length0(xs) =
(
glseq_foldl0
<x0,xs><r0>(xs, 0)
) where
{
//
typedef r0 = nint
//
impltmp
foldl0$fopr
<x0><r0>(r0, x0) =
let
val () =
g_free<x0>(x0) in succ(r0)
end
//
} (* glseq_length0/foldl0 *)

impltmp
<x0,xs>
glseq_length1(xs) =
(
glseq_foldl1
<x0,xs><r0>(xs, 0)
) where
{
//
typedef r0 = nint
//
impltmp
foldl1$fopr
<x0><r0>(r0, x0) = succ(r0)
//
} (* glseq_length1/foldl1 *)

(* ****** ****** *)
//
(*
impltmp
<x0,xs>
glseq_listize0(xs) =
stream_vt_listize<x0>
(glseq_streamize<x0,xs>(xs))
*)
(*
impltmp
<x0,xs>
glseq_rlistize0(xs) =
stream_vt_rlistize<x0>
(glseq_streamize<x0,xs>(xs))
*)
//
impltmp
<x0,xs>
glseq_listize0(xs) =
(
glseq_map0_list<x0><x0>(xs)
) where
{
impltmp map0$fopr<x0><x0>(x0) = x0
}
impltmp
<x0,xs>
glseq_rlistize0(xs) =
(
glseq_map0_rlist<x0><x0>(xs)
) where
{
impltmp map0$fopr<x0><x0>(x0) = x0
}
//
(* ****** ****** *)

impltmp
<x0,xs><r0>
glseq_foldl0
(xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  glseq_foreach0<x0,xs>(xs)
) where
{
impltmp
foreach0$work<x0>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldl0$fopr<x0><r0>(r0, x0))
//
end // end of [foreach0$work]
}
//
} (* end of [glseq_foldl0/foreach0] *)

(* ****** ****** *)
//
impltmp
<x0,xs><y0>
glseq_map0_list
  (xs) = let
//
typedef
yy =
list_vt(y0)
typedef
r0 = p2tr(yy)
//
impltmp
foldl0$fopr
<x0><r0>(p0, x0) =
let
//
val y0 =
map0$fopr<x0><y0>(x0)
val r1 = 
list_vt_cons( y0, _ )
val p1 = $addr( r1.1 )
//
in
$UN.p2tr_set<yy>
(p0, $UN.castlin01(r1)); (p1)
end // foldl$fopr
//
var r0: yy
val pz =
glseq_foldl0<x0,xs><r0>(xs, $addr(r0))
//
in
$UN.p2tr_set<yy>
(pz, list_vt_nil()); $UN.castlin01(r0)
end // end of [glseq_map0_list/foldl]
//
(* ****** ****** *)
//
impltmp
<x0,xs><y0>
glseq_map0_rlist
  (xs) = let
//
typedef r0 = list_vt(y0)
//
in
//
glseq_foldl0
<x0,xs>< r0 >
(xs, list_vt_nil()) where
{
impltmp
foldl0$fopr
< x0 >< r0 >
(r0, x0) =
list_vt_cons(map0$fopr<x0><y0>(x0), r0)
}
//
end // end of [glseq_map0_rlist/foldl0]
//
(* ****** ****** *)

impltmp
<x0,xs><y0>
glseq_map0_stream(xs) =
let
val xs =
glseq_streamize<x0,xs>(xs)
in(*in-of-let*)
(
  stream_vt_map0<x0><y0>(xs)
)
end // end of [glseq_map0_stream/streamize]

(* ****** ****** *)
//
impltmp
<x0,xs>
glseq_forall0
  (xs) =
stream_vt_forall0<x0>
(glseq_streamize<x0,xs>(xs))
//
(* ****** ****** *)
//
impltmp
<x0,xs>
glseq_exists0
  (xs) = let
//
  impltmp
  forall0$test<x0>(x0) =
  not(exists0$test<x0>(x0))
//
in
  if
  glseq_forall0
  <x0,xs>(xs) then false else true
end // end of [glseq_exists0/forall0]
//
(* ****** ****** *)
//
impltmp
<x0,xs>
glseq_foreach0(xs) =
let
val
test =
glseq_forall0<x0,xs>(xs) where
{
impltmp
forall0$test<x0>(x0) =
let
val () = foreach0$work<x0>(x0) in true
end
}
in
  // nothing
end // end of [glseq_foreach0/forall0]
//
impltmp
<x0,xs>
glseq_foreach1(xs) =
let
val
test =
glseq_forall1<x0,xs>(xs) where
{
impltmp
forall1$test<x0>(x0) =
let
val () = foreach1$work<x0>(x0) in true
end
}
in
  // nothing
end // end of [glseq_foreach1/forall1]
//
(* ****** ****** *)

impltmp
<x0,xs>
glseq_append00
  (xs1, xs2) =
(
glseq_foldr0
<x0,xs>< xs >(xs1, xs2)
) where
{
impltmp
foldr0$fopr
< x0><xs >
( x0, r0 ) = glseq_cons<x0,xs>(x0, r0)
} (* end of [glseq_append00/foldr0] *)

(* ****** ****** *)

impltmp
<x0,xs>
glseq_reverse0(xs) =
glseq_rappend00
(xs, glseq_nil<x0,xs>())
impltmp
<x0,xs>
glseq_rappend00
  (xs1, xs2) =
(
glseq_foldl0
<x0,xs>< xs >(xs1, xs2)
) where
{
impltmp
foldl0$fopr
< x0><xs >
( r0, x0 ) = glseq_cons<x0,xs>(x0, r0)
} (* end of [glseq_rappend00/foldl0] *)

(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
impltmp
<x0,xs>
glseq_iforall0(xs) =
let
//
var i0: nint = 0
val p0 = $addr(i0)
//
in
//
let
impltmp
forall0$test<x0>(x0) =
(
iforall0$test<x0>(i0, x0)
) where
{
val i0 =
$UN.p2tr_get<nint>(p0)
val () =
$UN.p2tr_set<nint>(p0, succ(i0))
}
in
  glseq_forall0<x0,xs>(xs)
end (* end of [glseq_forall0] *)
//
end // end of [glseq_iforall0/forall0]
//
impltmp
<x0,xs>
glseq_iforall1(xs) =
let
//
var i0: nint = 0
val p0 = $addr(i0)
//
in
//
let
impltmp
forall1$test<x0>(x0) =
(
iforall1$test<x0>(i0, x0)
) where
{
val i0 =
$UN.p2tr_get<nint>(p0)
val () =
$UN.p2tr_set<nint>(p0, succ(i0))
}
in
  glseq_forall1<x0,xs>(xs)
end (* end of [glseq_forall1] *)
//
end // end of [glseq_iforall1/forall1]
//
(* ****** ****** *)
//
impltmp
<x0,xs>
glseq_iexists0
  (xs) = let
//
  impltmp
  iforall0$test<x0>(i0, x0) =
  not(iexists0$test<x0>(i0, x0))
//
in
  if
  glseq_iforall0
  <x0,xs>(xs) then false else true
end // end of [glseq_iexists0/iforall0]
//
impltmp
<x0,xs>
glseq_iexists1
  (xs) = let
//
  impltmp
  iforall1$test<x0>(i0, x0) =
  not(iexists1$test<x0>(i0, x0))
//
in
  if
  glseq_iforall1
  <x0,xs>(xs) then false else true
end // end of [glseq_iexists1/iforall1]
//
(* ****** ****** *)
//
impltmp
<x0,xs>
glseq_iforeach0(xs) =
let
val
test =
glseq_iforall0<x0,xs>(xs) where
{
impltmp
iforall0$test<x0>(i0, x0) =
let
  val () =
  iforeach0$work<x0>(i0, x0) in true
end
}
in
  // nothing
end // end of [glseq_iforeach0/iforall0]
//
impltmp
<x0,xs>
glseq_iforeach1(xs) =
let
val
test =
glseq_iforall1<x0,xs>(xs) where
{
impltmp
iforall1$test<x0>(i0, x0) =
let
  val () =
  iforeach1$work<x0>(i0, x0) in true
end
}
in
  // nothing
end // end of [glseq_iforeach1/iforall1]
//
(* ****** ****** *)

(* end of [gseq_vt.dats] *)
