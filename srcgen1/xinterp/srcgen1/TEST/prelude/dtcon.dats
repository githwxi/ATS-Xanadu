(* ****** ****** *)
(* ****** ****** *)
#staload // _ =
"srcgen1\
/prelude\
/DATS/CATS/Xint/basics0.dats"
(* ****** ****** *)
#staload // _ =
"srcgen1\
/xatslib\
/githwxi/DATS/CATS/Xint/basics0.dats"
(* ****** ****** *)
(* ****** ****** *)
(*
//
val xs =
list_cons
( 0
, list_cons
  (1, list_nil()))
//
val x0 = xs.0
val x1 = xs.1
val () = xs.0 := 1
//
*)
(* ****** ****** *)

fun
double1
( xs0
: !list_vt(int)): void =
(
case+ xs0 of
|list_vt_nil() => ()
|list_vt_cons(!x0, xs1) =>
(x0 := 2*x0; double1(xs1); $fold(xs0))
)
fun
double2
( xs0
: &list_vt(int)): void =
(
case+ xs0 of
|list_vt_nil() => ()
|
@list_vt_cons(!x0, !xs1) =>
(x0 := 2*x0; double2(xs1); $fold(xs0))
)

(* ****** ****** *)
//
val xs =
list_vt_cons(1,
list_vt_cons(2, list_vt_nil((*void*))))
//
val xs = xs where { val () = double1(xs) }
//
(* ****** ****** *)
//
var ys =
list_vt_cons(10,
list_vt_cons(20,
list_vt_cons(30, list_vt_nil((*void*)))))
//
val ys = ys where { val () = double2(ys) }
//
(* ****** ****** *)

(* end of [ATS-Xanadu/srcgen1/xinterp/srcgen1/TEST/prelude_dtcon.dats] *)
