(* ****** ****** *)
//
// HX-2020-10-31:
// Syntactic candies :)
//
(* ****** ****** *)
//
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<a0>
gs_max_a02
(x1, x2) =
(
g_max<a0>(x1, x2)
) (* end of [gs_max_a02] *)
#impltmp
<a0>
gs_max_a03
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [gs_max_a03]
#impltmp
<a0>
gs_max_a04
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
  f0(f0(f0(x1,x2),x3),x4)
end (*let*) // end of [gs_max_a04]
#impltmp
<a0>
gs_max_a05
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
f0(f0(f0(f0(x1,x2),x3),x4),x5)
end (*let*) // end of [gs_max_a05]
#impltmp
<a0>
gs_max_a06
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [gs_max_a06]
#impltmp
<a0>
gs_max_a07
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
end (*let*) // end of [gs_max_a07]
#impltmp
<a0>
gs_max_a08
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
end (*let*) // end of [gs_max_a08]
#impltmp
<a0>
gs_max_a09
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
end (*let*) // end of [gs_max_a09]
//
#impltmp
<a0>
gs_max_a10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
let
fun
f0(x, y) =
g_max<a0>(x, y)
in//let
f0(f0(f0(f0(
f0(f0(f0(f0(f0(x01,x02),x03),x04),x05),x06),x07),x08),x09),x10)
end (*let*) // end of [gs_max_a10]
//
(* ****** ****** *)
//
#impltmp
<a0>
gs_min_a02
(x1, x2) =
(
g_min<a0>(x1, x2)
) (* end of [gs_min_a02] *)
#impltmp
<a0>
gs_min_a03
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [gs_min_a03]
#impltmp
<a0>
gs_min_a04
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
  f0(f0(f0(x1,x2),x3),x4)
end (*let*) // end of [gs_min_a04]
#impltmp
<a0>
gs_min_a05
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
f0(f0(f0(f0(x1,x2),x3),x4),x5)
end (*let*) // end of [gs_min_a05]
#impltmp
<a0>
gs_min_a06
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [gs_min_a06]
#impltmp
<a0>
gs_min_a07
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
end (*let*) // end of [gs_min_a07]
#impltmp
<a0>
gs_min_a08
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
end (*let*) // end of [gs_min_a08]
#impltmp
<a0>
gs_min_a09
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
end (*let*) // end of [gs_min_a09]
//
#impltmp
<a0>
gs_min_a10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
let
fun
f0(x, y) =
g_min<a0>(x, y)
in//let
f0(f0(f0(f0(
f0(f0(f0(f0(f0(x01,x02),x03),x04),x05),x06),x07),x08),x09),x10)
end (*let*) // end of [gs_min_a10]
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_free_a01
( x1 ) = () where
{
  val () = g_free<a1>(x1) }
#impltmp
<a1><a2>
gs_free_a02
( x1
, x2 ) = () where
{
  val () = g_free<a1>(x1)
  val () = g_free<a2>(x2) }
#impltmp
<a1>
<a2><a3>
gs_free_a03
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
gs_free_a04
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
gs_free_a05
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
gs_free_a06
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
gs_free_a07
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
gs_free_a08
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
gs_free_a09
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
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_free_a10
( x01
, x02
, x03
, x04
, x05
, x06
, x07
, x08
, x09
, x10 ) = () where
{
  val () = g_free<a01>(x01)
  val () = g_free<a02>(x02)
  val () = g_free<a03>(x03)
  val () = g_free<a04>(x04)
  val () = g_free<a05>(x05)
  val () = g_free<a06>(x06)
  val () = g_free<a07>(x07)
  val () = g_free<a08>(x08)
  val () = g_free<a09>(x09)
  val () = g_free<a10>(x10) }
//
(* ****** ****** *)
//
#impltmp
<a0>
optn_a00
(      ) = optn_nil()
#impltmp
<a0>
optn_a01
(  x1  ) = optn_cons(x1)
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
//
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
(*
HX:
Implementing fproc
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_fproc_a01(x1) = () where
{
  val () = g_fproc<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2>
gs_fproc_a02
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
gs_fproc_a03
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
gs_fproc_a04
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
gs_fproc_a05
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
gs_fproc_a06
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
gs_fproc_a07
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
gs_fproc_a08
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
gs_fproc_a09
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
gs_fproc_a10
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
(*
HX:
implementing gs_fred2l
Tue Jul  5 13:10:52 EDT 2022
*)
(* ****** ****** *)
//
#impltmp
<a0>
gs_fred2l_a02
(x1, x2) =
(
g_fred2<a0>(x1, x2)
) (* end of [gs_fred2l_a02] *)
#impltmp
<a0>
gs_fred2l_a03
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [gs_fred2l_a03]
#impltmp
<a0>
gs_fred2l_a04
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
  f0(f0(f0(x1,x2),x3),x4)
end (*let*) // end of [gs_fred2l_a04]
#impltmp
<a0>
gs_fred2l_a05
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
f0(f0(f0(f0(x1,x2),x3),x4),x5)
end (*let*) // end of [gs_fred2l_a05]
#impltmp
<a0>
gs_fred2l_a06
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [gs_fred2l_a06]
#impltmp
<a0>
gs_fred2l_a07
( x1
, x2, x3
, x4, x5
, x6, x7) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7)
end (*let*) // end of [gs_fred2l_a07]
#impltmp
<a0>
gs_fred2l_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8)
end (*let*) // end of [gs_fred2l_a08]
#impltmp
<a0>
gs_fred2l_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9)
end (*let*) // end of [gs_fred2l_a09]
//
(* ****** ****** *)
//
#impltmp
<a0>
gs_fred2l_a10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
f0(f0(f0(f0(
f0(f0(f0(f0(f0(x01,x02),x03),x04),x05),x06),x07),x08),x09),x10)
end (*let*) // end of [gs_fred2l_a10]
//
(* ****** ****** *)
(*
HX:
implementing gs_fred2r
Tue Jul  5 13:11:11 EDT 2022
*)
(* ****** ****** *)
//
#impltmp
<a0>
gs_fred2r_a02
(x1, x2) =
(
g_fred2<a0>(x1, x2)
) (* end of [gs_fred2r_a02] *)
#impltmp
<a0>
gs_fred2r_a03
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
  f0(x1, f0(x2, x3))
end (*let*) // end of [gs_fred2r_a03]
#impltmp
<a0>
gs_fred2r_a04
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,x4)))
end (*let*) // end of [gs_fred2r_a04]
#impltmp
<a0>
gs_fred2r_a05
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,f0(x4,x5))))
end (*let*) // end of [gs_fred2r_a05]
#impltmp
<a0>
gs_fred2r_a06
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,x6)))))
end (*let*) // end of [gs_fred2r_a06]
#impltmp
<a0>
gs_fred2r_a07
( x1
, x2, x3
, x4, x5
, x6, x7) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,f0(x6,x7))))))
end (*let*) // end of [gs_fred2r_a07]
#impltmp
<a0>
gs_fred2r_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,f0(x6,f0(x7,x8)))))))
end (*let*) // end of [gs_fred2r_a08]
#impltmp
<a0>
gs_fred2r_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,f0(x6,f0(x7,f0(x8,x9))))))))
end (*let*) // end of [gs_fred2r_a09]
(* ****** ****** *)
#impltmp
<a0>
gs_fred2r_a10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
let
fun
f0(x, y) =
g_fred2<a0>(x, y)
in//let
f0(x01,f0(x02,
f0(x03,f0(x04,f0(x05,f0(x06,f0(x07,f0(x08,f0(x09,x10)))))))))
end (*let*) // end of [gs_fred2r_a10]
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
gs_print_a01 =
gs_fproc_a01
<  a1  > where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_print<a0>
}
//
#impltmp
<a1><a2>
gs_print_a02 =
gs_fproc_a02
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
gs_print_a03 =
gs_fproc_a03
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
gs_print_a04 =
gs_fproc_a04
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
gs_print_a05 =
gs_fproc_a05
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
gs_print_a06 =
gs_fproc_a06
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
gs_print_a07 =
gs_fproc_a07
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
gs_print_a08 =
gs_fproc_a08
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
gs_print_a09 =
gs_fproc_a09
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
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_print_a10 =
gs_fproc_a10
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10> where
{
#impltmp
{a00:t0}
g_fproc<a00> = g_print<a00>
}
//
(* ****** ****** *)
#impltmp
gs_println_a00
<>(*tmp*)
( (*_*) ) = g_print( "\n" )
(* ****** ****** *)
//
#impltmp
<a1>
gs_println_a01
( x1 ) =
(
gs_print_a01
(   x1   ) ; gs_println_a00<>()
)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_println_a02
( x1
, x2 ) =
(
gs_print_a02
( x1, x2 ) ; gs_println_a00<>()
)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_println_a03
( x1
, x2
, x3 ) =
(
gs_print_a03
( x1
, x2, x3 ) ; gs_println_a00<>()
)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_println_a04
( x1
, x2
, x3
, x4 ) =
(
gs_print_a04
( x1, x2
, x3, x4 ) ; gs_println_a00<>()
)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_println_a05
( x1
, x2
, x3
, x4
, x5 ) =
(
gs_print_a05
( x1
, x2, x3
, x4, x5 ) ; gs_println_a00<>()
)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_println_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
gs_print_a06
( x1, x2
, x3, x4
, x5, x6 ) ; gs_println_a00<>()
)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_println_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
gs_print_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; gs_println_a00<>()
)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_println_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_print_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; gs_println_a00<>()
)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_println_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
gs_print_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; gs_println_a00<>()
)
//
(* ****** ****** *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_println_a10
( x01, x02
, x03, x04, x05, x06
, x07, x08, x09, x10 ) =
(
gs_print_a10
( x01, x02
, x03, x04, x05, x06
, x07, x08, x09, x10 ) ; gs_println_a00<>()
) (* end of [gs_println_a10] *)
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
<optn(a0)><a0> = optn_print$beg<>
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<optn(a0)><a0> = optn_print$end<>
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
<optn(a0)><a0> = optn_print$beg<>
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<optn(a0)><a0> = optn_print$end<>
//
} (*where*) // end of [optn_print<a0>]
//
#impltmp
optn_print$beg<>() = print"$optn("
#impltmp
optn_print$end<>() = print( ")"  )
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
optn_print$beg<>() = print( xbeg )
#impltmp
optn_print$end<>() = print( xend )
}
//
(* ****** ****** *)
//HX: list-printing
(* ****** ****** *)
#impltmp
{a0:t0}//tmp
g_print<list(a0)> = list_print<a0>
(* ****** ****** *)
//
#impltmp
{a0:t0}(*tmp*)
gseq_print$beg
<list(a0)><a0> = list_print$beg< >
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<list(a0)><a0> = list_print$end< >
#impltmp
{a0:t0}(*tmp*)
gseq_print$sep
<list(a0)><a0> = list_print$sep< >
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
<list(a0)><a0> = list_print$beg< >
#impltmp
{a0:t0}(*tmp*)
gseq_print$end
<list(a0)><a0> = list_print$end< >
#impltmp
{a0:t0}(*tmp*)
gseq_print$sep
<list(a0)><a0> = list_print$sep< >
//
} (*where*) // end of [list_print<a0>]
//
#impltmp
list_print$beg<(*0*)>() = print"$list("
#impltmp
list_print$end<(*0*)>() = print( ")"  )
#impltmp
list_print$sep<(*0*)>() = print( ","  )
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
list_print$beg<>() = print(xbeg)
#impltmp
list_print$end<>() = print(xend)
#impltmp
list_print$sep<>() = print(xsep)
}
//
(* ****** ****** *)
//HX: strm-printing
(* ****** ****** *)
#impltmp
{a0:t0}//tmp
g_print<strm(a0)> = strm_print<a0>
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
<a0>(*tmp*)
strm_print_all
  (xs) =
(
loop(xs, 0(*i0*))
) where
{
#typedef
xs = strm(a0)
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
g_print<a0>(x0) in loop(xs, succ(i0))
end // end of [strmcon_cons]
)
} (*where*) // end-of(strm_print_all)
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strm_print_len
  (xs, n0) =
(
strm_print$beg()
;
loop(xs, 0(*i0*))
) where
{
#typedef
xs = strm(a0)
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
g_print<a0>(x0) in loop(xs, succ(i0))
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
strm_print$beg<>() = print(xbeg)
#impltmp
strm_print$end<>() = print(xend)
#impltmp
strm_print$sep<>() = print(xsep)
#impltmp
strm_print$rst<>() = print(xrst) }
//
(* ****** ****** *)
//HX:strx-printing
(* ****** ****** *)
#impltmp
{a0:t0}//tmp
g_print<strx(a0)> = strx_print<a0>
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
<a0>(*tmp*)
strx_print_len
  (xs, n0) =
(
strx_print$beg()
;
loop(xs, 0(*i0*))
) where
{
#typedef
xs = strx(a0)
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
g_print<a0>(x0) in loop(xs, succ(i0))
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
strx_print$beg<>() = print(xbeg)
#impltmp
strx_print$end<>() = print(xend)
#impltmp
strx_print$sep<>() = print(xsep)
#impltmp
strx_print$rst<>() = print(xrst)
}(*where*)//end-of-[strx_print...]
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
<a0:vt>
a0ref_print1(A0) =
let
val x0 =
  a0ref_get0<a0>(A0)
val x0 =
  $UN.castlin10{a0}(x0)
//
val () =
(
a0ref_print$beg<>((*beg*)))
val () = g_print0<a0>( x0 )
val () = a0ref_print$end<>()
//
val x0 = $UN.castlin10{?a0}(x0)
endlet (* end of [a0ref_print1] *)
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
a0ref_print$beg<>() = print(xbeg)
#impltmp
a0ref_print$end<>() = print(xend)
}
//
(* ****** ****** *)
//HX:a1ref-printing
(* ****** ****** *)
//
//HX: list-printing
(* ****** ****** *)
//
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
//
#impltmp
{a0:t0}
g_print<a1rsz(a0)> = a1rsz_print1<a0>
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
a1ref_print1
{n0}(A0, n0) =
(
gseq_print1
<A0><a0>(A0)) where
{
//
#typedef A0 = a1ref(a0)
//
#impltmp
a1ref_length<a0><n0>(A0) = n0
//
#impltmp
{a0:t0}(*tmp*)
gseq_print1$beg
<A0><a0> = a1ref_print$beg<>
#impltmp
{a0:t0}(*tmp*)
gseq_print1$end
<A0><a0> = a1ref_print$end<>
#impltmp
{a0:t0}(*tmp*)
gseq_print1$sep
<A0><a0> = a1ref_print$sep<>
//
}(*where*)//end-of-[a1ref_print1<a0>]
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
a1rsz_print1
{n0}(A0, n0) =
(
gseq_print1
<A0><a0>(A0)) where
{
//
#typedef A0 = a1rsz(a0)
//
#impltmp
{a0:t0}(*tmp*)
gseq_print1$beg
<A0><a0> = a1rsz_print$beg<>
#impltmp
{a0:t0}(*tmp*)
gseq_print1$end
<A0><a0> = a1rsz_print$end<>
#impltmp
{a0:t0}(*tmp*)
gseq_print1$sep
<A0><a0> = a1rsz_print$sep<>
//
}(*where*)//end-of-[a1rsz_print1<a0>]
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
a1rsz_print$beg<>() = print"$a1rsz("
#impltmp
a1rsz_print$end<>() = print(  ")"  )
#impltmp
a1rsz_print$sep<>() = print(  ";"  )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
a1ref_print1_begendsep
( A0, n0
, xbeg, xend, xsep) =
(
a1ref_print1
<a0>(A0, n0)) where
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
//
#impltmp
<a0>(*tmp*)
a1rsz_print1_begendsep
(A0, xbeg, xend, xsep) =
(
a1rsz_print1<a0>(A0)) where
{
#impltmp
a1rsz_print$beg<(*0*)>() = print(xbeg)
#impltmp
a1rsz_print$end<(*0*)>() = print(xend)
#impltmp
a1rsz_print$sep<(*0*)>() = print(xsep)
}(*where*)//end(a1rsz_print1_begendsep)
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 13:29:33 EDT 2022
*)
//
#impltmp
<>(*tmp*)
strn_append_a02 =
gs_fred2r_a02<strn> where
{
#impltmp
g_fred2<strn> = strn_append<> }
//
#impltmp
<>(*tmp*)
strn_append_a03 =
gs_fred2r_a03<strn> where
{
#impltmp
g_fred2<strn> = strn_append<> }
//
#impltmp
<>(*tmp*)
strn_append_a04 =
gs_fred2r_a04<strn> where
{
#impltmp
g_fred2<strn> = strn_append<> }
//
#impltmp
<>(*tmp*)
strn_append_a05 =
gs_fred2r_a05<strn> where
{
#impltmp
g_fred2<strn> = strn_append<> }
//
#impltmp
<>(*tmp*)
strn_append_a06 =
gs_fred2r_a06<strn> where
{
#impltmp
g_fred2<strn> = strn_append<> }
//
#impltmp
<>(*tmp*)
strn_append_a07 =
gs_fred2r_a07<strn> where
{
#impltmp
g_fred2<strn> = strn_append<> }
//
#impltmp
<>(*tmp*)
strn_append_a08 =
gs_fred2r_a08<strn> where
{
#impltmp
g_fred2<strn> = strn_append<> }
//
#impltmp
<>(*tmp*)
strn_append_a09 =
gs_fred2r_a09<strn> where
{
#impltmp
g_fred2<strn> = strn_append<> }
//
#impltmp
<>(*tmp*)
strn_append_a10 =
gs_fred2r_a10<strn> where
{
#impltmp
g_fred2<strn> = strn_append<> }
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 13:50:57 EDT 2022
*)
//
#impltmp
<a0>(*tmp*)
list_append_a02 =
gs_fred2r_a02<list(a0)> where
{
#impltmp
g_fred2<list(a0)> = list_append<a0> }
//
#impltmp
<a0>(*tmp*)
list_append_a03 =
gs_fred2r_a03<list(a0)> where
{
#impltmp
g_fred2<list(a0)> = list_append<a0> }
//
#impltmp
<a0>(*tmp*)
list_append_a04 =
gs_fred2r_a04<list(a0)> where
{
#impltmp
g_fred2<list(a0)> = list_append<a0> }
//
#impltmp
<a0>(*tmp*)
list_append_a05 =
gs_fred2r_a05<list(a0)> where
{
#impltmp
g_fred2<list(a0)> = list_append<a0> }
//
#impltmp
<a0>(*tmp*)
list_append_a06 =
gs_fred2r_a06<list(a0)> where
{
#impltmp
g_fred2<list(a0)> = list_append<a0> }
//
#impltmp
<a0>(*tmp*)
list_append_a07 =
gs_fred2r_a07<list(a0)> where
{
#impltmp
g_fred2<list(a0)> = list_append<a0> }
//
#impltmp
<a0>(*tmp*)
list_append_a08 =
gs_fred2r_a08<list(a0)> where
{
#impltmp
g_fred2<list(a0)> = list_append<a0> }
//
#impltmp
<a0>(*tmp*)
list_append_a09 =
gs_fred2r_a09<list(a0)> where
{
#impltmp
g_fred2<list(a0)> = list_append<a0> }
//
#impltmp
<a0>(*tmp*)
list_append_a10 =
gs_fred2r_a10<list(a0)> where
{
#impltmp
g_fred2<list(a0)> = list_append<a0> }
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_synoug0.dats] *)
