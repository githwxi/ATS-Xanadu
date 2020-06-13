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
impltmp
<x0,xs>
glseq_listize0(xs) =
stream_vt_listize<x0>
(glseq_streamize<x0,xs>(xs))
impltmp
<x0,xs>
glseq_rlistize0(xs) =
stream_vt_rlistize<x0>
(glseq_streamize<x0,xs>(xs))
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
end (* end of [glseq_forall] *)
//
end // end of [glseq_iforall0/forall0]

(* ****** ****** *)

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
val () = iforeach0$work<x0>(i0, x0) in true
end
}
in
  // nothing
end // end of [glseq_iforeach0/iforall0]

(* ****** ****** *)

(* end of [gseq_vt.dats] *)
