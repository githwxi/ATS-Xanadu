(* ****** ****** *)
//
// HX-2020-10-31:
// Syntactic candies :)
//
(* ****** ****** *)
//
#impltmp
<a0>
max_a02
(x1, x2) =
(
g_max<a0>(x1, x2)
) (* end of [max_a02] *)
#impltmp
<a0>
max_a03
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [max_a03]
#impltmp
<a0>
max_a04
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
  f0(f0(f0(x1, x2), x3), x4)
end (*let*) // end of [max_a04]
#impltmp
<a0>
max_a05
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
f0(f0(f0(f0(x1, x2), x3), x4), x5)
end (*let*) // end of [max_a05]
#impltmp
<a0>
max_a06
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
f0(f0(f0(f0(f0(x1, x2), x3), x4), x5), x6)
end (*let*) // end of [max_a06]
//
(* ****** ****** *)
//
#impltmp
<a0>
min_a02
(x1, x2) =
(
g_min<a0>(x1, x2)
) (* end of [min_a02] *)
#impltmp
<a0>
min_a03
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [min_a03]
#impltmp
<a0>
min_a04
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
  f0(f0(f0(x1, x2), x3), x4)
end (*let*) // end of [min_a04]
#impltmp
<a0>
min_a05
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
f0(f0(f0(f0(x1, x2), x3), x4), x5)
end (*let*) // end of [min_a05]
#impltmp
<a0>
min_a06
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
f0(f0(f0(f0(f0(x1, x2), x3), x4), x5), x6)
end (*let*) // end of [min_a06]
//
(* ****** ****** *)
//
#impltmp
<a1>
free_a01
( x1 ) = () where
{
  val () = g_free<a1>(x1) }
#impltmp
<a1><a2>
free_a02
( x1
, x2 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2) }
#impltmp
<a1>
<a2><a3>
free_a03
( x1
, x2
, x3 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2)
  val () = g_free<a3>(x3) }
#impltmp
<a1><a2>
<a3><a4>
free_a04
( x1
, x2
, x3
, x4 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2)
  val () = g_free<a3>(x3)
  val () = g_free<a4>(x4) }
#impltmp
<a1>
<a2><a3>
<a4><a5>
free_a05
( x1
, x2
, x3
, x4
, x5 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2)
  val () = g_free<a3>(x3)
  val () = g_free<a4>(x4)
  val () = g_free<a5>(x5) }
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
free_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2)
  val () = g_free<a3>(x3)
  val () = g_free<a4>(x4)
  val () = g_free<a5>(x5)
  val () = g_free<a6>(x6) }
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
free_a07
( x1
, x2
, x3
, x4
, x5
, x6
, x7 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2)
  val () = g_free<a3>(x3)
  val () = g_free<a4>(x4)
  val () = g_free<a5>(x5)
  val () = g_free<a6>(x6)
  val () = g_free<a7>(x7) }
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
free_a08
( x1
, x2
, x3
, x4
, x5
, x6
, x7
, x8 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2)
  val () = g_free<a3>(x3)
  val () = g_free<a4>(x4)
  val () = g_free<a5>(x5)
  val () = g_free<a6>(x6)
  val () = g_free<a7>(x7)
  val () = g_free<a8>(x8) }
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
free_a09
( x1
, x2
, x3
, x4
, x5
, x6
, x7
, x8
, x9 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2)
  val () = g_free<a3>(x3)
  val () = g_free<a4>(x4)
  val () = g_free<a5>(x5)
  val () = g_free<a6>(x6)
  val () = g_free<a7>(x7)
  val () = g_free<a8>(x8)
  val () = g_free<a9>(x9) }
//
(* ****** ****** *)
//
// HX:
// Implementing
// fproc/fproc0/fproc1
//
(* ****** ****** *)
//
#impltmp
<a1>
fproc_a01(x1) = () where
{
  val () = g_fproc<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
fproc_a02
( x1
, x2 ) = () where
{
  val () = g_fproc<a1>(x1)
  val () = g_fproc<a2>(x2)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
<a3>
fproc_a03
( x1
, x2
, x3 ) = () where
{
  val () = g_fproc<a1>(x1)
  val () = g_fproc<a2>(x2)
  val () = g_fproc<a3>(x3)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
<a3>
<a4>
fproc_a04
( x1
, x2
, x3
, x4 ) = () where
{
  val () = g_fproc<a1>(x1)
  val () = g_fproc<a2>(x2)
  val () = g_fproc<a3>(x3)
  val () = g_fproc<a4>(x4)
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
fproc_a05
( x1
, x2
, x3
, x4
, x5 ) = () where
{
  val () = g_fproc<a1>(x1)
  val () = g_fproc<a2>(x2)
  val () = g_fproc<a3>(x3)
  val () = g_fproc<a4>(x4)
  val () = g_fproc<a5>(x5)
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
fproc_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) = () where
{
  val () = g_fproc<a1>(x1)
  val () = g_fproc<a2>(x2)
  val () = g_fproc<a3>(x3)
  val () = g_fproc<a4>(x4)
  val () = g_fproc<a5>(x5)
  val () = g_fproc<a6>(x6)
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
fproc_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) = () where
{
  val () = g_fproc<a1>(x1)
  val () = g_fproc<a2>(x2)
  val () = g_fproc<a3>(x3)
  val () = g_fproc<a4>(x4)
  val () = g_fproc<a5>(x5)
  val () = g_fproc<a6>(x6)
  val () = g_fproc<a7>(x7)
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
fproc_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) = () where
{
  val () = g_fproc<a1>(x1)
  val () = g_fproc<a2>(x2)
  val () = g_fproc<a3>(x3)
  val () = g_fproc<a4>(x4)
  val () = g_fproc<a5>(x5)
  val () = g_fproc<a6>(x6)
  val () = g_fproc<a7>(x7)
  val () = g_fproc<a8>(x8)
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
fproc_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) = () where
{
  val () = g_fproc<a1>(x1)
  val () = g_fproc<a2>(x2)
  val () = g_fproc<a3>(x3)
  val () = g_fproc<a4>(x4)
  val () = g_fproc<a5>(x5)
  val () = g_fproc<a6>(x6)
  val () = g_fproc<a7>(x7)
  val () = g_fproc<a8>(x8)
  val () = g_fproc<a9>(x9)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
fproc0_a01(x1) = () where
{
  val () = gl_fproc0<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
fproc0_a02
( x1
, x2 ) = () where
{
  val () = gl_fproc0<a1>(x1)
  val () = gl_fproc0<a2>(x2)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
fproc0_a03
( x1
, x2
, x3 ) = () where
{
  val () = gl_fproc0<a1>(x1)
  val () = gl_fproc0<a2>(x2)
  val () = gl_fproc0<a3>(x3)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
fproc0_a04
( x1
, x2
, x3
, x4 ) = () where
{
  val () = gl_fproc0<a1>(x1)
  val () = gl_fproc0<a2>(x2)
  val () = gl_fproc0<a3>(x3)
  val () = gl_fproc0<a4>(x4)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
fproc0_a05
( x1
, x2
, x3
, x4
, x5 ) = () where
{
  val () = gl_fproc0<a1>(x1)
  val () = gl_fproc0<a2>(x2)
  val () = gl_fproc0<a3>(x3)
  val () = gl_fproc0<a4>(x4)
  val () = gl_fproc0<a5>(x5)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
fproc0_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) = () where
{
  val () = gl_fproc0<a1>(x1)
  val () = gl_fproc0<a2>(x2)
  val () = gl_fproc0<a3>(x3)
  val () = gl_fproc0<a4>(x4)
  val () = gl_fproc0<a5>(x5)
  val () = gl_fproc0<a6>(x6)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
fproc0_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) = () where
{
  val () = gl_fproc0<a1>(x1)
  val () = gl_fproc0<a2>(x2)
  val () = gl_fproc0<a3>(x3)
  val () = gl_fproc0<a4>(x4)
  val () = gl_fproc0<a5>(x5)
  val () = gl_fproc0<a6>(x6)
  val () = gl_fproc0<a7>(x7)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
fproc0_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) = () where
{
  val () = gl_fproc0<a1>(x1)
  val () = gl_fproc0<a2>(x2)
  val () = gl_fproc0<a3>(x3)
  val () = gl_fproc0<a4>(x4)
  val () = gl_fproc0<a5>(x5)
  val () = gl_fproc0<a6>(x6)
  val () = gl_fproc0<a7>(x7)
  val () = gl_fproc0<a8>(x8)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
fproc0_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) = () where
{
  val () = gl_fproc0<a1>(x1)
  val () = gl_fproc0<a2>(x2)
  val () = gl_fproc0<a3>(x3)
  val () = gl_fproc0<a4>(x4)
  val () = gl_fproc0<a5>(x5)
  val () = gl_fproc0<a6>(x6)
  val () = gl_fproc0<a7>(x7)
  val () = gl_fproc0<a8>(x8)
  val () = gl_fproc0<a9>(x9)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
fproc1_a01(x1) = () where
{
  val () = gl_fproc1<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
fproc1_a02
( x1
, x2 ) = () where
{
  val () = gl_fproc1<a1>(x1)
  val () = gl_fproc1<a2>(x2)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
fproc1_a03
( x1
, x2
, x3 ) = () where
{
  val () = gl_fproc1<a1>(x1)
  val () = gl_fproc1<a2>(x2)
  val () = gl_fproc1<a3>(x3)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
fproc1_a04
( x1
, x2
, x3
, x4 ) = () where
{
  val () = gl_fproc1<a1>(x1)
  val () = gl_fproc1<a2>(x2)
  val () = gl_fproc1<a3>(x3)
  val () = gl_fproc1<a4>(x4)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
fproc1_a05
( x1
, x2
, x3
, x4
, x5 ) = () where
{
  val () = gl_fproc1<a1>(x1)
  val () = gl_fproc1<a2>(x2)
  val () = gl_fproc1<a3>(x3)
  val () = gl_fproc1<a4>(x4)
  val () = gl_fproc1<a5>(x5)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
fproc1_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) = () where
{
  val () = gl_fproc1<a1>(x1)
  val () = gl_fproc1<a2>(x2)
  val () = gl_fproc1<a3>(x3)
  val () = gl_fproc1<a4>(x4)
  val () = gl_fproc1<a5>(x5)
  val () = gl_fproc1<a6>(x6)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
fproc1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) = () where
{
  val () = gl_fproc1<a1>(x1)
  val () = gl_fproc1<a2>(x2)
  val () = gl_fproc1<a3>(x3)
  val () = gl_fproc1<a4>(x4)
  val () = gl_fproc1<a5>(x5)
  val () = gl_fproc1<a6>(x6)
  val () = gl_fproc1<a7>(x7)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
fproc1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) = () where
{
  val () = gl_fproc1<a1>(x1)
  val () = gl_fproc1<a2>(x2)
  val () = gl_fproc1<a3>(x3)
  val () = gl_fproc1<a4>(x4)
  val () = gl_fproc1<a5>(x5)
  val () = gl_fproc1<a6>(x6)
  val () = gl_fproc1<a7>(x7)
  val () = gl_fproc1<a8>(x8)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
fproc1_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) = () where
{
  val () = gl_fproc1<a1>(x1)
  val () = gl_fproc1<a2>(x2)
  val () = gl_fproc1<a3>(x3)
  val () = gl_fproc1<a4>(x4)
  val () = gl_fproc1<a5>(x5)
  val () = gl_fproc1<a6>(x6)
  val () = gl_fproc1<a7>(x7)
  val () = gl_fproc1<a8>(x8)
  val () = gl_fproc1<a9>(x9)
}
//
(* ****** ****** *)
//
(*
HX:
Implementing print/println
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
print_a01 =
fproc_a01
<  a1  > where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
#impltmp
<a1><a2>
print_a02 =
fproc_a02
<a1><a2> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
#impltmp
<a1>
<a2><a3>
print_a03 =
fproc_a03
<a1>
<a2><a3> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
print_a04 =
fproc_a04
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
print_a05 =
fproc_a05
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
print_a06 =
fproc_a06
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
print_a07 =
fproc_a07
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
print_a08 =
fproc_a08
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
print_a09 =
fproc_a09
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
(* ****** ****** *)
#impltmp
println_a00
<>(*tmp*)
( (*_*) ) = g_print( "\n" )
(* ****** ****** *)
//
#impltmp
<a1>
println_a01
( x1 ) =
(
print_a01
(   x1   ) ; println_a00<>()
) (* end of [println_a01] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
println_a02
( x1
, x2 ) =
(
print_a02
( x1, x2 ) ; println_a00<>()
) (* end of [println_a02] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
println_a03
( x1
, x2
, x3 ) =
(
print_a03
( x1
, x2, x3 ) ; println_a00<>()
) (* end of [println_a03] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
println_a04
( x1
, x2
, x3
, x4 ) =
(
print_a04
( x1, x2
, x3, x4 ) ; println_a00<>()
) (* end of [println_a04] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
println_a05
( x1
, x2
, x3
, x4
, x5 ) =
(
print_a05
( x1
, x2, x3
, x4, x5 ) ; println_a00<>()
) (* end of [println_a05] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
println_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
print_a06
( x1, x2
, x3, x4
, x5, x6 ) ; println_a00<>()
) (* end of [println_a06] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
println_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
print_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; println_a00<>()
) (* end of [println_a07] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
println_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
print_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; println_a00<>()
) (* end of [println_a08] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
println_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
print_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; println_a00<>()
) (* end of [println_a09] *)
//
(* ****** ****** *)
//
(*
HX:
Implementing print0/println0
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
print0_a01 =
fproc0_a01
<  a1  > where
{
#impltmp
{a0:vt}
gl_fproc0<a0> = gl_print0<a0>
}
//
#impltmp
<a1><a2>
print0_a02 =
fproc0_a02
<a1><a2> where
{
#impltmp
{a0:vt}
gl_fproc0<a0> = gl_print0<a0>
}
//
#impltmp
<a1>
<a2><a3>
print0_a03 =
fproc0_a03
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
gl_fproc0<a0> = gl_print0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
print0_a04 =
fproc0_a04
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
gl_fproc0<a0> = gl_print0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
print0_a05 =
fproc0_a05
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
gl_fproc0<a0> = gl_print0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
print0_a06 =
fproc0_a06
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
gl_fproc0<a0> = gl_print0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
print0_a07 =
fproc0_a07
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
gl_fproc0<a0> = gl_print0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
print0_a08 =
fproc0_a08
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
gl_fproc0<a0> = gl_print0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
print0_a09 =
fproc0_a09
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
gl_fproc0<a0> = gl_print0<a0>
}
//
(* ****** ****** *)
//
#impltmp
println0_a00
<>(*tmp*)
( (*_*) ) = g_print( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
println0_a01
( x1 ) =
(
print0_a01
(   x1   ) ; println0_a00<>()
) (* end of [println0_a01] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
println0_a02
( x1
, x2 ) =
(
print0_a02
( x1, x2 ) ; println0_a00<>()
) (* end of [println0_a02] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
println0_a03
( x1
, x2
, x3 ) =
(
print0_a03
( x1
, x2, x3 ) ; println0_a00<>()
) (* end of [println0_a03] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
println0_a04
( x1
, x2
, x3
, x4 ) =
(
print0_a04
( x1, x2
, x3, x4 ) ; println0_a00<>()
) (* end of [println0_a04] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
println0_a05
( x1
, x2
, x3
, x4
, x5 ) =
(
print0_a05
( x1
, x2, x3
, x4, x5 ) ; println0_a00<>()
) (* end of [println0_a05] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
println0_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
print0_a06
( x1, x2
, x3, x4
, x5, x6 ) ; println0_a00<>()
) (* end of [println0_a06] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
println0_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
print0_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; println0_a00<>()
) (* end of [println0_a07] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
println0_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
print0_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; println0_a00<>()
) (* end of [println0_a08] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
println0_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
print0_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; println0_a00<>()
) (* end of [println0_a09] *)
//
(* ****** ****** *)
//
(*
HX:
Implementing print1/println1
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
print1_a01 =
fproc1_a01
<  a1  > where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = gl_print1<a0>
}
//
#impltmp
<a1><a2>
print1_a02 =
fproc1_a02
<a1><a2> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = gl_print1<a0>
}
//
#impltmp
<a1>
<a2><a3>
print1_a03 =
fproc1_a03
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = gl_print1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
print1_a04 =
fproc1_a04
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = gl_print1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
print1_a05 =
fproc1_a05
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = gl_print1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
print1_a06 =
fproc1_a06
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = gl_print1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
print1_a07 =
fproc1_a07
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = gl_print1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
print1_a08 =
fproc1_a08
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = gl_print1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
print1_a09 =
fproc1_a09
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = gl_print1<a0>
}
//
(* ****** ****** *)
//
#impltmp
println1_a00
<>(*tmp*)
( (*_*) ) = g_print( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
println1_a01
( x1 ) =
(
print1_a01
(   x1   ) ; println1_a00<>()
) (* end of [println1_a01] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
println1_a02
( x1
, x2 ) =
(
print1_a02
( x1, x2 ) ; println1_a00<>()
) (* end of [println1_a02] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
println1_a03
( x1
, x2
, x3 ) =
(
print1_a03
( x1
, x2, x3 ) ; println1_a00<>()
) (* end of [println1_a03] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
println1_a04
( x1
, x2
, x3
, x4 ) =
(
print1_a04
( x1, x2
, x3, x4 ) ; println1_a00<>()
) (* end of [println1_a04] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
println1_a05
( x1
, x2
, x3
, x4
, x5 ) =
(
print1_a05
( x1
, x2, x3
, x4, x5 ) ; println1_a00<>()
) (* end of [println1_a05] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
println1_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
print1_a06
( x1, x2
, x3, x4
, x5, x6 ) ; println1_a00<>()
) (* end of [println1_a06] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
println1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
print1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; println1_a00<>()
) (* end of [println1_a07] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
println1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
print1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; println1_a00<>()
) (* end of [println1_a08] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
println1_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
print1_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; println1_a00<>()
) (* end of [println1_a09] *)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_synoug0.dats] *)
