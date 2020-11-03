(* ****** ****** *)
//
// HX-2020-10-31:
// Syntactic candies :)
//
(* ****** ****** *)
//
#extern
fun
<a1:vt>
free1( x1: ~a1): void
//
(* ****** ****** *)
//
#symload free with free1
//
(* ****** ****** *)
//
impltmp
<a1>
free1(x1) = g_free<a1>(x1)
//
(* ****** ****** *)
//
(*
HX:
for overloading
print and println
*)
//
(* ****** ****** *)
(*
#extern
fun<>
print0
((*void*)) : void
*)
#extern
fun
<a1:vt>
print1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
print2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
print3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
print4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
print5
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
print6
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
print7
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
print8
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
print9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload print with print1
#symload print with print2
#symload print with print3
#symload print with print4
#symload print with print5
#symload print with print6
#symload print with print7
#symload print with print8
#symload print with print9
//
(* ****** ****** *)
#extern
fun<>
println0
((*void*)) : void
#extern
fun
<a1:vt>
println1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
println2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
println3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
println4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
println5
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
println6
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
println7
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
println8
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
println9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload println with println0
#symload println with println1
#symload println with println2
#symload println with println3
#symload println with println4
#symload println with println5
#symload println with println6
#symload println with println7
#symload println with println8
#symload println with println9
//
(* ****** ****** *)
//
// Implementations
//
(* ****** ****** *)
//
impltmp
<a1>
print1(x1) = () where
{
  val () = gl_print1<a1>(x1)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
print2
( x1
, x2 ) = () where
{
  val () = gl_print1<a1>(x1)
  val () = gl_print1<a2>(x2)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
print3
( x1
, x2
, x3 ) = () where
{
  val () = gl_print1<a1>(x1)
  val () = gl_print1<a2>(x2)
  val () = gl_print1<a3>(x3)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
print4
( x1
, x2
, x3
, x4 ) = () where
{
  val () = gl_print1<a1>(x1)
  val () = gl_print1<a2>(x2)
  val () = gl_print1<a3>(x3)
  val () = gl_print1<a4>(x4)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
print5
( x1
, x2
, x3
, x4
, x5 ) = () where
{
  val () = gl_print1<a1>(x1)
  val () = gl_print1<a2>(x2)
  val () = gl_print1<a3>(x3)
  val () = gl_print1<a4>(x4)
  val () = gl_print1<a5>(x5)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
print6
( x1
, x2
, x3
, x4
, x5
, x6 ) = () where
{
  val () = gl_print1<a1>(x1)
  val () = gl_print1<a2>(x2)
  val () = gl_print1<a3>(x3)
  val () = gl_print1<a4>(x4)
  val () = gl_print1<a5>(x5)
  val () = gl_print1<a6>(x6)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
<a7>
print7
( x1
, x2, x3
, x4, x5
, x6, x7 ) = () where
{
  val () = gl_print1<a1>(x1)
  val () = gl_print1<a2>(x2)
  val () = gl_print1<a3>(x3)
  val () = gl_print1<a4>(x4)
  val () = gl_print1<a5>(x5)
  val () = gl_print1<a6>(x6)
  val () = gl_print1<a7>(x7)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
<a7>
<a8>
print8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) = () where
{
  val () = gl_print1<a1>(x1)
  val () = gl_print1<a2>(x2)
  val () = gl_print1<a3>(x3)
  val () = gl_print1<a4>(x4)
  val () = gl_print1<a5>(x5)
  val () = gl_print1<a6>(x6)
  val () = gl_print1<a7>(x7)
  val () = gl_print1<a8>(x8)
}
//
(* ****** ****** *)
//
impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
<a7>
<a8>
<a9>
print9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) = () where
{
  val () = gl_print1<a1>(x1)
  val () = gl_print1<a2>(x2)
  val () = gl_print1<a3>(x3)
  val () = gl_print1<a4>(x4)
  val () = gl_print1<a5>(x5)
  val () = gl_print1<a6>(x6)
  val () = gl_print1<a7>(x7)
  val () = gl_print1<a8>(x8)
  val () = gl_print1<a9>(x9)
}
//
(* ****** ****** *)
impltmp
println0
<>(*tmp*)
((*_*)) = gl_print1("\n")
(* ****** ****** *)
//
impltmp
<a1>
println1
( x1 ) =
(
print1(x1) ; println0<>()
) (* end of [println1] *)
//
(* ****** ****** *)
//
impltmp
<a1><a2>
println2
( x1
, x2 ) =
(
print2
( x1, x2 ) ; println0<>()
) (* end of [println2] *)
//
(* ****** ****** *)
//
impltmp
<a1>
<a2><a3>
println3
( x1
, x2
, x3 ) =
(
print3
( x1
, x2, x3 ) ; println0<>()
) (* end of [println3] *)
//
(* ****** ****** *)
//
impltmp
<a1><a2>
<a3><a4>
println4
( x1
, x2
, x3
, x4 ) =
(
print4
( x1, x2
, x3, x4 ) ; println0<>()
) (* end of [println4] *)
//
(* ****** ****** *)
//
impltmp
<a1>
<a2><a3>
<a4><a5>
println5
( x1
, x2
, x3
, x4
, x5 ) =
(
print5
( x1
, x2, x3
, x4, x5 ) ; println0<>()
) (* end of [println5] *)
//
(* ****** ****** *)
//
impltmp
<a1><a2>
<a3><a4>
<a5><a6>
println6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
print6
( x1, x2
, x3, x4
, x5, x6 ) ; println0<>()
) (* end of [println6] *)
//
(* ****** ****** *)
//
impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
println7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
print7
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; println0<>()
) (* end of [println7] *)
//
(* ****** ****** *)
//
impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
println8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
print8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; println0<>()
) (* end of [println8] *)
//
(* ****** ****** *)
//
impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
println9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
print9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; println0<>()
) (* end of [println9] *)
//
(* ****** ****** *)

(* end of [synougat.dats] *)
