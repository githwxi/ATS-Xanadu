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
