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
free_a1
(x1: ~a1): void
#extern
fun
<a1:vt>
<a2:vt>
free_a2
(x1: ~a1, x2: ~a2): void
fun
<a1:vt>
<a2:vt>
<a3:vt>
free_a3
( x1: ~a1
, x2: ~a2, x3: ~a3): void
//
(* ****** ****** *)
//
#symload free with free_a1
#symload free with free_a2
#symload free with free_a3
//
(* ****** ****** *)
//
#impltmp
<a1>
free_a1
( x1 ) = () where
{
  val () = g_free<a1>(x1) }
#impltmp
<a1>
<a2>
free_a2
( x1
, x2 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2) }
#impltmp
<a1>
<a2>
<a3>
free_a3
( x1
, x2
, x3 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2)
  val () = g_free<a3>(x3) }
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
print_a0
((*void*)) : void
*)
#extern
fun
<a1:t0>
print_a1
( x1: a1 ) : void
#extern
fun
<a1:t0>
<a2:t0>
print_a2
( x1: a1, x2: a2 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
print_a3
( x1: a1
, x2: a2, x3: a3 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
print_a4
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
print_a5
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
print_a6
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
print_a7
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
print_a8
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6
, x7: a7, x8: a8 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
<a9:t0>
print_a9
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7
, x8: a8, x9: a9 ) : void
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
<a1:t0>
println_a1
( x1: a1 ) : void
#extern
fun
<a1:t0>
<a2:t0>
println_a2
( x1: a1, x2: a2 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
println_a3
( x1: a1
, x2: a2, x3: a3 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
println_a4
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
println_a5
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
println_a6
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
println_a7
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
println_a8
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6
, x7: a7, x8: a8 ) : void
#extern
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
<a9:t0>
println_a9
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7
, x8: a8, x9: a9 ) : void
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
(*
HX:
for overloading
print0 and println0
*)
//
(* ****** ****** *)
//
(*
#extern
fun<>
print0_a0
((*void*)) : void
*)
#extern
fun
<a1:vt>
print0_a1
( x1: ~a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
print0_a2
( x1: ~a1, x2: ~a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
print0_a3
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
print0_a4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
print0_a5
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ) : void
//
(* ****** ****** *)
//
#symload print0 with print0_a1
#symload print0 with print0_a2
#symload print0 with print0_a3
#symload print0 with print0_a4
#symload print0 with print0_a5
//
(* ****** ****** *)
//
#extern
fun<>
println0_a0
((*void*)) : void
#extern
fun
<a1:vt>
println0_a1
( x1: ~a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
println0_a2
( x1: ~a1, x2: ~a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
println0_a3
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
println0_a4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
println0_a5
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ) : void
//
(* ****** ****** *)
//
#symload println0 with println0_a1
#symload println0 with println0_a2
#symload println0 with println0_a3
#symload println0 with println0_a4
#symload println0 with println0_a5
//
(* ****** ****** *)
//
(*
HX:
for overloading
print1 and println1
*)
//
(* ****** ****** *)
//
(*
#extern
fun<>
print1_a0
((*void*)) : void
*)
#extern
fun
<a1:vt>
print1_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
print1_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
print1_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
print1_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
print1_a5
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
//
(* ****** ****** *)
//
#symload print1 with print1_a1
#symload print1 with print1_a2
#symload print1 with print1_a3
#symload print1 with print1_a4
#symload print1 with print1_a5
//
(* ****** ****** *)
//
#extern
fun<>
println1_a0
((*void*)) : void
#extern
fun
<a1:vt>
println1_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
println1_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
println1_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
println1_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
println1_a5
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
//
(* ****** ****** *)
//
#symload println1 with println1_a1
#symload println1 with println1_a2
#symload println1 with println1_a3
#symload println1 with println1_a4
#symload println1 with println1_a5
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
  val () = g_print<a1>(x1)
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
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
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
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
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
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
  val () = g_print<a4>(x4)
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
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
  val () = g_print<a4>(x4)
  val () = g_print<a5>(x5)
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
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
  val () = g_print<a4>(x4)
  val () = g_print<a5>(x5)
  val () = g_print<a6>(x6)
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
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
  val () = g_print<a4>(x4)
  val () = g_print<a5>(x5)
  val () = g_print<a6>(x6)
  val () = g_print<a7>(x7)
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
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
  val () = g_print<a4>(x4)
  val () = g_print<a5>(x5)
  val () = g_print<a6>(x6)
  val () = g_print<a7>(x7)
  val () = g_print<a8>(x8)
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
  val () = g_print<a1>(x1)
  val () = g_print<a2>(x2)
  val () = g_print<a3>(x3)
  val () = g_print<a4>(x4)
  val () = g_print<a5>(x5)
  val () = g_print<a6>(x6)
  val () = g_print<a7>(x7)
  val () = g_print<a8>(x8)
  val () = g_print<a9>(x9)
}
//
(* ****** ****** *)
#impltmp
println_a0
<>(*tmp*)
((*_*)) = g_print("\n")
(* ****** ****** *)
//
#impltmp
<a1>
println_a1
( x1 ) =
(
print_a1
(   x1   ) ; println_a0<>()
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
//
#impltmp
<a1>
print0_a1(x1) = () where
{
  val () = gl_print0<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
print0_a2
( x1
, x2 ) = () where
{
  val () = gl_print0<a1>(x1)
  val () = gl_print0<a2>(x2)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
<a3>
print0_a3
( x1
, x2
, x3 ) = () where
{
  val () = gl_print0<a1>(x1)
  val () = gl_print0<a2>(x2)
  val () = gl_print0<a3>(x3)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
<a3>
<a4>
print0_a4
( x1
, x2
, x3
, x4 ) = () where
{
  val () = gl_print0<a1>(x1)
  val () = gl_print0<a2>(x2)
  val () = gl_print0<a3>(x3)
  val () = gl_print0<a4>(x4)
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
print0_a5
( x1
, x2
, x3
, x4 ) = () where
{
  val () = gl_print0<a1>(x1)
  val () = gl_print0<a2>(x2)
  val () = gl_print0<a3>(x3)
  val () = gl_print0<a4>(x4)
  val () = gl_print0<a5>(x4)
}
//
(* ****** ****** *)
#impltmp
println0_a0
<>(*tmp*)
((*_*)) = g_print("\n")
(* ****** ****** *)
//
#impltmp
<a1>
println0_a1
( x1 ) =
(
print0_a1
(   x1   ) ; println0_a0<>()
) (* end of [println0_a1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
println0_a2
( x1
, x2 ) =
(
print0_a2
( x1, x2 ) ; println0_a0<>()
) (* end of [println0_a2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
println0_a3
( x1
, x2
, x3 ) =
(
print0_a3
( x1
, x2, x3 ) ; println0_a0<>()
) (* end of [println0_a3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
println0_a4
( x1
, x2
, x3
, x4 ) =
(
print0_a4
( x1, x2
, x3, x4 ) ; println0_a0<>()
) (* end of [println0_a4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
println0_a5
( x1
, x2
, x3
, x4 ) =
(
print0_a5
( x1, x2
, x3, x4 ) ; println0_a0<>()
) (* end of [println0_a5] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
print1_a1(x1) = () where
{
  val () = gl_print1<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
print1_a2
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
print1_a3
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
print1_a4
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
print1_a5
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
#impltmp
println1_a0
<>(*tmp*)
((*_*)) = g_print("\n")
(* ****** ****** *)
//
#impltmp
<a1>
println1_a1
( x1 ) =
(
print1_a1
(   x1   ) ; println1_a0<>()
) (* end of [println1_a1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
println1_a2
( x1
, x2 ) =
(
print1_a2
( x1, x2 ) ; println1_a0<>()
) (* end of [println1_a2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
println1_a3
( x1
, x2
, x3 ) =
(
print1_a3
( x1
, x2, x3 ) ; println1_a0<>()
) (* end of [println1_a3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
println1_a4
( x1
, x2
, x3
, x4 ) =
(
print1_a4
( x1, x2
, x3, x4 ) ; println1_a0<>()
) (* end of [println1_a4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
println1_a5
( x1
, x2
, x3
, x4 ) =
(
print1_a5
( x1, x2
, x3, x4 ) ; println1_a0<>()
) (* end of [println1_a5] *)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_synoug0.dats] *)
