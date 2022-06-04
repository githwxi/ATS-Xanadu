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
free1(x1: ~a1): void
//
(* ****** ****** *)
//
#symload free with free1
//
(* ****** ****** *)
//
#impltmp
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
print_0
((*void*)) : void
*)
#extern
fun
<a1:vt>
print_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
print_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
print_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
print_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
print_a5
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
print_a6
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
print_a7
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
print_a8
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
print_a9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload print with print_a1
#symload print with print_a2
#symload print with print_a3
#symload print with print_a4
#symload print with print_a5
#symload print with print_a6
#symload print with print_a7
#symload print with print_a8
#symload print with print_a9
//
(* ****** ****** *)
#extern
fun<>
println_a0
((*void*)) : void
#extern
fun
<a1:vt>
println_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
println_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
println_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
println_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
println_a5
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
println_a6
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
println_a7
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
println_a8
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
println_a9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload println with println_a0
#symload println with println_a1
#symload println with println_a2
#symload println with println_a3
#symload println with println_a4
#symload println with println_a5
#symload println with println_a6
#symload println with println_a7
#symload println with println_a8
#symload println with println_a9
//
(* ****** ****** *)
//
// Implementations
//
(* ****** ****** *)
//
#impltmp
<a1>
print_a1(x1) = () where
{
  val () = gl_print1<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
print_a2
( x1
, x2 ) = () where
{
  val () = gl_print1<a1>(x1)
  val () = gl_print1<a2>(x2)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
<a3>
print_a3
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
#impltmp
<a1>
<a2>
<a3>
<a4>
print_a4
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
#impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
print_a5
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
#impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
print_a6
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
#impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
<a7>
print_a7
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
#impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
<a7>
<a8>
print_a8
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
#impltmp
<a1>
<a2>
<a3>
<a4>
<a5>
<a6>
<a7>
<a8>
<a9>
print_a9
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
#impltmp
println_a0
<>(*tmp*)
((*_*)) = gl_print1("\n")
(* ****** ****** *)
//
#impltmp
<a1>
println_a1
( x1 ) =
(
print_a1(x1) ; println_a0<>()
) (* end of [println_a1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
println_a2
( x1
, x2 ) =
(
print_a2
( x1, x2 ) ; println_a0<>()
) (* end of [println_a2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
println_a3
( x1
, x2
, x3 ) =
(
print_a3
( x1
, x2, x3 ) ; println_a0<>()
) (* end of [println_a3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
println_a4
( x1
, x2
, x3
, x4 ) =
(
print_a4
( x1, x2
, x3, x4 ) ; println_a0<>()
) (* end of [println_a4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
println_a5
( x1
, x2
, x3
, x4
, x5 ) =
(
print_a5
( x1
, x2, x3
, x4, x5 ) ; println_a0<>()
) (* end of [println_a5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
println_a6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
print_a6
( x1, x2
, x3, x4
, x5, x6 ) ; println_a0<>()
) (* end of [println_a6] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
println_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
print_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; println_a0<>()
) (* end of [println_a7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
println_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
print_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; println_a0<>()
) (* end of [println_a8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
println_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
print_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; println_a0<>()
) (* end of [println_a9] *)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_synoug0.dats] *)
