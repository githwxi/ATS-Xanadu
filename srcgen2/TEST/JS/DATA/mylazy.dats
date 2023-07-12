(* ****** ****** *)
(*
HX-2023-07-11:
let us do some testing
on constructor-overloading
*)
(* ****** ****** *)
#symload nil with optn_nil
#symload cons with optn_cons
#symload nil with optn_vt_nil
#symload cons with optn_vt_cons
(* ****** ****** *)
#symload nil_vt with optn_vt_nil
#symload cons_vt with optn_vt_cons
(* ****** ****** *)
#symload nil with list_nil
#symload cons with list_cons
#symload nil with list_vt_nil
#symload cons with list_vt_cons
(* ****** ****** *)
#symload nil_vt with list_vt_nil
#symload cons_vt with list_vt_cons
(* ****** ****** *)
#symload nil with strmcon_nil
#symload cons with strmcon_cons
#symload nil with strmcon_vt_nil
#symload cons with strmcon_vt_cons
(* ****** ****** *)
#symload nil_vt with strmcon_vt_nil
#symload cons_vt with strmcon_vt_cons
(* ****** ****** *)
//
fun
sint_strm_from
(n: sint): strm(sint) =
$lazy(cons(n, sint_strm_from(n+1)))
//
(* ****** ****** *)
//
fun
sint_lstrm_from
(n: sint): lstrm(sint) =
$llazy(lcons(n, sint_lstrm_from(n+1)))
//
(* ****** ****** *)

fun
<x0:t0>
strm_append
(xs: strm(x0)
,ys: strm(x0)): strm(x0) = $lazy
(
case+ !xs of
|nil(*void*) => !ys
|cons(x1, xs) => cons(x1, strm_append(xs, ys))
)

(* ****** ****** *)

fun
<x0:t0>
lstrm_append
(xs: lstrm(x0)
,ys: lstrm(x0)): lstrm(x0) = $lazy
(
case+ !xs of
|nil(*void*) => !ys
|cons(x1, xs) => cons(x1, lstrm_append(xs, ys))
)

(* ****** ****** *)

(* end of [DATA/mylazy.dats] *)
