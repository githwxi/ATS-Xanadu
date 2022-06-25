(* ****** ****** *)
//
// HX-2020-10-31:
// Syntactic candies :)
//
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
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
  f0(f0(f0(x1,x2),x3),x4)
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
f0(f0(f0(f0(x1,x2),x3),x4),x5)
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
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [max_a06]
#impltmp
<a0>
max_a07
( x1
, x2, x3
, x4, x5
, x6, x7) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7)
end (*let*) // end of [max_a07]
#impltmp
<a0>
max_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8)
end (*let*) // end of [max_a08]
#impltmp
<a0>
max_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9)
end (*let*) // end of [max_a09]
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
  f0(f0(f0(x1,x2),x3),x4)
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
f0(f0(f0(f0(x1,x2),x3),x4),x5)
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
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [min_a06]
#impltmp
<a0>
min_a07
( x1
, x2, x3
, x4, x5
, x6, x7) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7)
end (*let*) // end of [min_a07]
#impltmp
<a0>
min_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8)
end (*let*) // end of [min_a08]
#impltmp
<a0>
min_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9)
end (*let*) // end of [min_a09]
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
#impltmp
<a0>
optn_a00
(      ) =
optn_nil((*nil*))
#impltmp
<a0>
optn_a01
(  x1  ) =
optn_cons(  x1  )
//
(* ****** ****** *)
//
#impltmp
<a0>
list_a00
(      ) =
list_nil((*void*))
#impltmp
<a0>
list_a01
(  x1  ) =
list_cons(x1, list_nil())
#impltmp
<a0>
list_a02
(x1, x2) =
list_cons(x1,
list_cons(x2, list_nil()))
#impltmp
<a0>
list_a03
(x1
,x2, x3) =
list_cons(x1,
list_cons(x2,
list_cons(x3, list_nil())))
#impltmp
<a0>
list_a04
(x1, x2
,x3, x4) =
list_cons(x1,
list_cons(x2,
list_cons(x3,
list_cons(x4, list_nil()))))
#impltmp
<a0>
list_a05
(x1
,x2, x3
,x4, x5) =
list_cons(x1,
list_cons(x2,
list_cons(x3,
list_cons(x4,
list_cons(x5, list_nil())))))
#impltmp
<a0>
list_a06
(x1, x2
,x3, x4
,x5, x6) =
list_cons(x1,
list_cons(x2,
list_cons(x3,
list_cons(x4,
list_cons(x5,
list_cons(x6, list_nil()))))))
#impltmp
<a0>
list_a07
(x1
,x2, x3
,x4, x5
,x6, x7) =
list_cons(x1,
list_cons(x2,
list_cons(x3,
list_cons(x4,
list_cons(x5,
list_cons(x6,
list_cons(x7, list_nil())))))))
#impltmp
<a0>
list_a08
(x1, x2
,x3, x4
,x5, x6
,x7, x8) =
list_cons(x1,
list_cons(x2,
list_cons(x3,
list_cons(x4,
list_cons(x5,
list_cons(x6,
list_cons(x7,
list_cons(x8, list_nil()))))))))
#impltmp
<a0>
list_a09
(x1
,x2, x3
,x4, x5
,x6, x7
,x8, x9) =
list_cons(x1,
list_cons(x2,
list_cons(x3,
list_cons(x4,
list_cons(x5,
list_cons(x6,
list_cons(x7,
list_cons(x8,
list_cons(x9, list_nil())))))))))
#impltmp
<a0>
list_a10
(x01,x02
,x03,x04
,x05,x06
,x07,x08
,x09,x10) =
list_cons(x01,
list_cons(x02,
list_cons(x03,
list_cons(x04,
list_cons(x05,
list_cons(x06,
list_cons(x07,
list_cons(x08,
list_cons(x09,
list_cons(x10, list_nil()))))))))))
//
(* ****** ****** *)
//
// HX:
// Implementing fproc
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
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
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
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
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
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
fproc_a10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) = () where
{
val () = g_fproc<a01>(x01)
val () = g_fproc<a02>(x02)
val () = g_fproc<a03>(x03)
val () = g_fproc<a04>(x04)
val () = g_fproc<a05>(x05)
val () = g_fproc<a06>(x06)
val () = g_fproc<a07>(x07)
val () = g_fproc<a08>(x08)
val () = g_fproc<a09>(x09)
val () = g_fproc<a10>(x10)
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
(*
HX-2022-06-22:
printing for special sequences
*)
(* ****** ****** *)
//HX: optn-printing
(* ****** ****** *)
#impltmp
{a:t0}//tmp
g_print<optn(a)> = optn_print<a>
(* ****** ****** *)
//
#impltmp
{a0:t0}(*tmp*)
gseq_print$beg
<optn(a0)><a0> = optn_print$beg<(*0*)>
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<optn(a0)><a0> = optn_print$end<(*0*)>
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
optn_print =
gseq_print<optn(a0)><a0> where
{
//
#impltmp
{a0:t0}(*tmp*)
gseq_print$beg
<optn(a0)><a0> = optn_print$beg<(*0*)>
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<optn(a0)><a0> = optn_print$end<(*0*)>
//
} (*where*) // end of [optn_print<a0>]
//
#impltmp
optn_print$beg<(*0*)>() = print"$optn("
#impltmp
optn_print$end<(*0*)>() = print( ")"  )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
optn_print_begend
(xs, xbeg, xend) =
(
optn_print<a0>(xs)) where
{
#impltmp
optn_print$beg<(*0*)>() = print(xbeg)
#impltmp
optn_print$end<(*0*)>() = print(xend)
}
//
(* ****** ****** *)
//HX: list-printing
(* ****** ****** *)
#impltmp
{a:t0}//tmp
g_print<list(a)> = list_print<a>
(* ****** ****** *)
//
#impltmp
{a0:t0}(*tmp*)
gseq_print$beg
<list(a0)><a0> = list_print$beg<(*0*)>
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<list(a0)><a0> = list_print$end<(*0*)>
#impltmp
{a0:t0}(*tmp*)
gseq_print$sep
<list(a0)><a0> = list_print$sep<(*0*)>
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
list_print =
gseq_print<list(a0)><a0> where
{
//
#impltmp
{a0:t0}(*tmp*)
gseq_print$beg
<list(a0)><a0> = list_print$beg<(*0*)>
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<list(a0)><a0> = list_print$end<(*0*)>
#impltmp
{a0:t0}(*tmp*)
gseq_print$sep
<list(a0)><a0> = list_print$sep<(*0*)>
//
} (*where*) // end of [list_print<a0>]
//
#impltmp
list_print$beg<(*0*)>() = print"$list("
#impltmp
list_print$end<(*0*)>() = print( ")"  )
#impltmp
list_print$sep<(*0*)>() = print( ";"  )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
list_print_begendsep
(xs, xbeg, xend, xsep) =
(
list_print<a0>(xs)) where
{
#impltmp
list_print$beg<(*0*)>() = print(xbeg)
#impltmp
list_print$end<(*0*)>() = print(xend)
#impltmp
list_print$sep<(*0*)>() = print(xsep)
}
//
(* ****** ****** *)
//HX: strm-printing
(* ****** ****** *)
#impltmp
{a:t0}//tmp
g_print<strm(a)> = strm_print<a>
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strm_print$len() = 3
#impltmp
<>(*tmp*)
strm_print$beg() = print"$strm("
#impltmp
<>(*tmp*)
strm_print$end() = print(  ")"  )
#impltmp
<>(*tmp*)
strm_print$sep() = print(  ","  )
#impltmp
<>(*tmp*)
strm_print$rst() = print( "..." )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strm_print(xs) =
let
val len = 
strm_print$len<>()
in//let
if
(len < 0)
then strm_print_all<a0>(xs)
else strm_print_len<a0>(xs, len)
end (*let*) // end-of-(strm_print)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_print_all
  (xs) =
(
loop(xs, 0(*i0*))
) where
{
#typedef
xs = strm(a)
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
|
strmcon_nil() =>
strm_print$end<>()
|
strmcon_cons(x0, xs) =>
let
val () =
if
(i0 > 0)
then
strm_print$sep<>()
val () =
g_print<a>(x0) in loop(xs, succ(i0))
end // end of [strmcon_cons]
)
}(*where*) // end-of(strm_print_all)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_print_len
  (xs, n0) =
(
strm_print$beg()
;
loop(xs, 0(*i0*))
) where
{
#typedef
xs = strm(a)
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
|
strmcon_nil() =>
strm_print$end<>()
|
strmcon_cons(x0, xs) =>
if
(i0>=n0)
then
let
val () =
if
(i0 > 0)
then
strm_print$sep<>()
val () =
strm_print$rst<>()
in//let
strm_print$end<>()
end // end of [then]
else
let
val () =
if
(i0 > 0)
then
strm_print$sep<>()
val () =
g_print<a>(x0) in loop(xs, succ(i0))
end // end of [else]
) (* strmcon_cons *)
} (*where*) // end-of(strm_print_len)
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strm_print_begendseprst
( xs
, xbeg, xend, xsep, xrst) =
(
strm_print<a0>(xs)) where
{
#impltmp
strm_print$beg<(*0*)>() = print(xbeg)
#impltmp
strm_print$end<(*0*)>() = print(xend)
#impltmp
strm_print$sep<(*0*)>() = print(xsep)
#impltmp
strm_print$rst<(*0*)>() = print(xrst)
}
//
(* ****** ****** *)
//HX:strx-printing
(* ****** ****** *)
#impltmp
{a:t0}//tmp
g_print<strx(a)> = strx_print<a>
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strx_print$len() = 3
#impltmp
<>(*tmp*)
strx_print$beg() = print"$strx("
#impltmp
<>(*tmp*)
strx_print$end() = print(  ")"  )
#impltmp
<>(*tmp*)
strx_print$sep() = print(  ","  )
#impltmp
<>(*tmp*)
strx_print$rst() = print( "..." )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strx_print(xs) =
let
val len = 
strx_print$len<>()
in//let
strx_print_len<a0>(xs, len)
end (*let*) // end-of-(strx_print)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strx_print_len
  (xs, n0) =
(
strx_print$beg()
;
loop(xs, 0(*i0*))
) where
{
#typedef
xs = strx(a)
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
|
strxcon_cons(x0, xs) =>
if
(i0>=n0)
then
let
//
val () =
if
(i0 > 0)
then
strx_print$sep<>()
//
val () =
strx_print$rst<>()
//
in//let
strx_print$end<>()
end // end of [then]
else
let
val () =
if
(i0 > 0)
then
strx_print$sep<>()
val () =
g_print<a>(x0) in loop(xs, succ(i0))
end // end of [else]
) (* strxcon_cons *)
} (*where*) // end-of(strx_print_len)
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strx_print_begendseprst
( xs
, xbeg, xend, xsep, xrst) =
(
strx_print<a0>(xs)) where
{
#impltmp
strx_print$beg<(*0*)>() = print(xbeg)
#impltmp
strx_print$end<(*0*)>() = print(xend)
#impltmp
strx_print$sep<(*0*)>() = print(xsep)
#impltmp
strx_print$rst<(*0*)>() = print(xrst)
}
//
(* ****** ****** *)
//HX:a0ref-printing
(* ****** ****** *)
#impltmp
{a0:t0}
g_print
<a0ref(a0)> = a0ref_print1<a0>
(* ****** ****** *)
//
#impltmp
{a0:t0}(*tmp*)
gseq_print$beg
<a0ref(a0)><a0> = a0ref_print$beg<>
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<a0ref(a0)><a0> = a0ref_print$end<>
//
(* ****** ****** *)
//
#impltmp
<a:vt>
a0ref_print1(A0) =
let
val x0 = a0ref_get0<a>(A0)
val x0 = $UN.castlin10{a}(x0)
//
val () = a0ref_print$beg<>( )
val () = gl_print0<a>(  x0  )
val () = a0ref_print$end<>( )
//
val x0 = $UN.castlin10{?a}(x0)
end (* end of [a0ref_print1] *)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
a0ref_print$beg() = print"$a0ref("
#impltmp
<>(*tmp*)
a0ref_print$end() = print(  ")"  )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
a0ref_print1_begend
(A0, xbeg, xend) =
(
a0ref_print1<a0>(A0)) where
{
#impltmp
a0ref_print$beg<(*0*)>() = print(xbeg)
#impltmp
a0ref_print$end<(*0*)>() = print(xend)
}
//
(* ****** ****** *)
//HX:a1ref-printing
(* ****** ****** *)
#impltmp
{a0:t0}
{n0:i0}
g_print
<a1ref(a0,n0)>(A0) =
(
a1ref_print1<a0>{n0}(A0, n0)
) where
{
//
// HX: the length is contextual
//
  val n0 = a1ref_length<a0><n0>(A0)
} (*where*) // end-of-[g_print(A0)]
(* ****** ****** *)
//
#impltmp
{a0:t0}{n0:i0}
gseq_print$beg
<a1ref(a0,n0)><a0> = a1ref_print$beg<>
#impltmp
{a0:t0}{n0:i0}
gseq_print$end
<a1ref(a0,n0)><a0> = a1ref_print$end<>
#impltmp
{a0:t0}{n0:i0}
gseq_print$sep
<a1ref(a0,n0)><a0> = a1ref_print$sep<>
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
a1ref_print1
{n0}(A0, n0) =
glseq_print1
<a1ref(a0,n0)><a0>(A0) where
{
//
#impltmp
a1ref_length<a0><n0>(A0) = n0
//
#impltmp
{a0:t0}(*tmp*)
gseq_print$beg
<a1ref(a0)><a0> = a1ref_print$beg<>
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<a1ref(a0)><a0> = a1ref_print$end<>
#impltmp
{a0:t0}(*tmp*)
gseq_print$sep
<a1ref(a0)><a0> = a1ref_print$sep<>
//
}(*where*)//end-of-[a1ref_print1<a0>]
//
(* ****** ****** *)
//
#impltmp
a1ref_print$beg<>() = print"$a1ref("
#impltmp
a1ref_print$end<>() = print(  ")"  )
#impltmp
a1ref_print$sep<>() = print(  ";"  )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
a1ref_print1_begendsep
(A0, n0, xbeg, xend, xsep) =
(
a1ref_print1<a0>(A0, n0)) where
{
#impltmp
a1ref_print$beg<(*0*)>() = print(xbeg)
#impltmp
a1ref_print$end<(*0*)>() = print(xend)
#impltmp
a1ref_print$sep<(*0*)>() = print(xsep)
}(*where*)//end(a1ref_print1_begendsep)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_synoug0.dats] *)
