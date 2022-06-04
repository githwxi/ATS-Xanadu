(* ****** ****** *)
//
(*
HX-2022-06-03
Syntactic candies :)
*)
//
(* ****** ****** *)
#staload
"./../SATS/libcats.sats"
(* ****** ****** *)
(*
#extern
fun<>
prout_a0
((*void*)) : void
*)
#extern
fun
<a1:vt>
prout_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
prout_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
prout_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
prout_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
prout_a5
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
prout_a6
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
prout_a7
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
prout_a8
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
prout_a9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload prout with prout_a1
#symload prout with prout_a2
#symload prout with prout_a3
#symload prout with prout_a4
#symload prout with prout_a5
#symload prout with prout_a6
#symload prout with prout_a7
#symload prout with prout_a8
#symload prout with prout_a9
//
(* ****** ****** *)
#extern
fun<>
proutln_a0
((*void*)) : void
#extern
fun
<a1:vt>
proutln_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
proutln_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
proutln_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
proutln_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
proutln_a5
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
proutln_a6
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
proutln_a7
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
proutln_a8
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
proutln_a9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload proutln with proutln_a0
#symload proutln with proutln_a1
#symload proutln with proutln_a2
#symload proutln with proutln_a3
#symload proutln with proutln_a4
#symload proutln with proutln_a5
#symload proutln with proutln_a6
#symload proutln with proutln_a7
#symload proutln with proutln_a8
#symload proutln with proutln_a9
//
(* ****** ****** *)
//
// Implementations
//
(* ****** ****** *)
//
#impltmp
<a1>
prout_a1(x1) = () where
{
val () = prout1_ref<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
prout_a2
( x1
, x2 ) = () where
{
val () = prout1_ref<a1>(x1)
val () = prout1_ref<a2>(x2)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
<a3>
prout_a3
( x1
, x2
, x3 ) = () where
{
val () = prout1_ref<a1>(x1)
val () = prout1_ref<a2>(x2)
val () = prout1_ref<a3>(x3)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
<a3>
<a4>
prout_a4
( x1
, x2
, x3
, x4 ) = () where
{
val () = prout1_ref<a1>(x1)
val () = prout1_ref<a2>(x2)
val () = prout1_ref<a3>(x3)
val () = prout1_ref<a4>(x4)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
prout_a5
( x1
, x2
, x3
, x4
, x5 ) = () where
{
val () = prout1_ref<a1>(x1)
val () = prout1_ref<a2>(x2)
val () = prout1_ref<a3>(x3)
val () = prout1_ref<a4>(x4)
val () = prout1_ref<a5>(x5)
}
//
(* ****** ****** *)
//
#impltmp
proutln_a0
<>(*tmp*)
((*_*)) = prout1_ref("\n")
(* ****** ****** *)
//
#impltmp
<a1>
proutln_a1
( x1 ) =
(
prout_a1(x1);proutln_a0<>()
) (* end of [proutln_a1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
proutln_a2
( x1
, x2 ) =
(
prout_a2
( x1, x2 ) ; proutln_a0<>()
) (* end of [proutln_a2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
proutln_a3
( x1
, x2
, x3 ) =
(
prout_a3
( x1
, x2, x3 ) ; proutln_a0<>()
) (* end of [proutln_a3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
proutln_a4
( x1
, x2
, x3
, x4 ) =
(
prout_a4
( x1, x2
, x3, x4 ) ; proutln_a0<>()
) (* end of [proutln_a4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
proutln_a5
( x1
, x2
, x3
, x4
, x5 ) =
(
prout_a5
( x1
, x2, x3
, x4, x5 ) ; proutln_a0<>()
) (* end of [proutln_a5] *)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_synoug0.dats] *)
