(* ****** ****** *)
(*
** HX: For
** finite lin-streams
*)
(* ****** ****** *)
#abstbox box_tx
#typedef box = box_tx
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strmcon_vt_nil_
((*void*)) =
strmcon_vt_nil(*void*)
#impltmp
<a>(*tmp*)
strmcon_vt_cons_
( x0, xs ) =
strmcon_vt_cons(x0, xs)
//
#impltmp
<a>(*tmp*)
strxcon_vt_cons_
( x0, xs ) =
strxcon_vt_cons(x0, xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><r0>
strmcon_vt_uncons_cfr
(xs, f0, f1) =
(
case+ xs of
| ~
strmcon_vt_nil() => f0((*void*))
| ~
strmcon_vt_cons(x0, xs) => f1(x0, xs)
)
#impltmp
<x0><r0>
strxcon_vt_uncons_cfr
(xs, f1) =
(
case+ xs of
| ~
strxcon_vt_cons(x0, xs) => f1(x0, xs)
)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<a:vt>
strq_vt_strmize0
(xs: strq_vt(a)): strm_vt(a)
*)
#impltmp
<a>(*tmp*)
strq_vt_strmize0(xs) =
$UN.castlin01{strq_vt(a)}(xs)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strq_vt_listize0(xs) =
$UN.castlin01
(strm_vt_listize0(strq_vt_strmize0(xs)))
//
#impltmp
<a>(*tmp*)
strq_vt_rlistize0(xs) =
$UN.castlin01
(strm_vt_rlistize0(strq_vt_strmize0(xs)))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strm001_vt.dats] *)
