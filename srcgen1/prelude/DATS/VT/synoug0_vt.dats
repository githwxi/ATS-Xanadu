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
optn_vt_n0
(      ) =
optn_vt_nil((*nil*))
#impltmp
<a0>
optn_vt_n1
(  x1  ) =
optn_vt_cons(  x1  )
//
(* ****** ****** *)
//
(*
HX: 2022-07-05:
Tue Jul  5 20:38:08 EDT 2022
*)
//
#impltmp
<a0>
list_vt_n0
(      ) =
list_vt_nil((*void*))
#impltmp
<a0>
list_vt_n1
(  x1  ) =
list_vt_cons(x1, list_vt_nil())
#impltmp
<a0>
list_vt_n2
(x1, x2) =
list_vt_cons(x1,
list_vt_cons(x2, list_vt_nil()))
#impltmp
<a0>
list_vt_n3
(x1
,x2, x3) =
list_vt_cons(x1,
list_vt_cons(x2,
list_vt_cons(x3, list_vt_nil())))
#impltmp
<a0>
list_vt_n4
(x1, x2
,x3, x4) =
list_vt_cons(x1,
list_vt_cons(x2,
list_vt_cons(x3,
list_vt_cons(x4, list_vt_nil()))))
#impltmp
<a0>
list_vt_n5
(x1
,x2, x3
,x4, x5) =
list_vt_cons(x1,
list_vt_cons(x2,
list_vt_cons(x3,
list_vt_cons(x4,
list_vt_cons(x5, list_vt_nil())))))
#impltmp
<a0>
list_vt_n6
(x1, x2
,x3, x4
,x5, x6) =
list_vt_cons(x1,
list_vt_cons(x2,
list_vt_cons(x3,
list_vt_cons(x4,
list_vt_cons(x5,
list_vt_cons(x6, list_vt_nil()))))))
#impltmp
<a0>
list_vt_n7
(x1
,x2, x3
,x4, x5
,x6, x7) =
list_vt_cons(x1,
list_vt_cons(x2,
list_vt_cons(x3,
list_vt_cons(x4,
list_vt_cons(x5,
list_vt_cons(x6,
list_vt_cons(x7, list_vt_nil())))))))
#impltmp
<a0>
list_vt_n8
(x1, x2
,x3, x4
,x5, x6
,x7, x8) =
list_vt_cons(x1,
list_vt_cons(x2,
list_vt_cons(x3,
list_vt_cons(x4,
list_vt_cons(x5,
list_vt_cons(x6,
list_vt_cons(x7,
list_vt_cons(x8, list_vt_nil()))))))))
#impltmp
<a0>
list_vt_n9
(x1
,x2, x3
,x4, x5
,x6, x7
,x8, x9) =
list_vt_cons(x1,
list_vt_cons(x2,
list_vt_cons(x3,
list_vt_cons(x4,
list_vt_cons(x5,
list_vt_cons(x6,
list_vt_cons(x7,
list_vt_cons(x8,
list_vt_cons(x9, list_vt_nil())))))))))
#impltmp
<a0>
list_vt_n10
(x01,x02
,x03,x04
,x05,x06
,x07,x08
,x09,x10) =
list_vt_cons(x01,
list_vt_cons(x02,
list_vt_cons(x03,
list_vt_cons(x04,
list_vt_cons(x05,
list_vt_cons(x06,
list_vt_cons(x07,
list_vt_cons(x08,
list_vt_cons(x09,
list_vt_cons(x10, list_vt_nil()))))))))))
//
(* ****** ****** *)
//
// HX:
// Implementing fproc0/1
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_fproc0_n1
( x1 ) = () where
{
  val () = g_fproc0<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_fproc0_n2
( x1
, x2 ) = () where
{
  val () = g_fproc0<a1>(x1)
  val () = g_fproc0<a2>(x2)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_fproc0_n3
( x1
, x2
, x3 ) = () where
{
  val () = g_fproc0<a1>(x1)
  val () = g_fproc0<a2>(x2)
  val () = g_fproc0<a3>(x3)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_fproc0_n4
( x1
, x2
, x3
, x4 ) = () where
{
  val () = g_fproc0<a1>(x1)
  val () = g_fproc0<a2>(x2)
  val () = g_fproc0<a3>(x3)
  val () = g_fproc0<a4>(x4)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_fproc0_n5
( x1
, x2
, x3
, x4
, x5 ) = () where
{
  val () = g_fproc0<a1>(x1)
  val () = g_fproc0<a2>(x2)
  val () = g_fproc0<a3>(x3)
  val () = g_fproc0<a4>(x4)
  val () = g_fproc0<a5>(x5)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_fproc0_n6
( x1
, x2
, x3
, x4
, x5
, x6 ) = () where
{
  val () = g_fproc0<a1>(x1)
  val () = g_fproc0<a2>(x2)
  val () = g_fproc0<a3>(x3)
  val () = g_fproc0<a4>(x4)
  val () = g_fproc0<a5>(x5)
  val () = g_fproc0<a6>(x6)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_fproc0_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) = () where
{
  val () = g_fproc0<a1>(x1)
  val () = g_fproc0<a2>(x2)
  val () = g_fproc0<a3>(x3)
  val () = g_fproc0<a4>(x4)
  val () = g_fproc0<a5>(x5)
  val () = g_fproc0<a6>(x6)
  val () = g_fproc0<a7>(x7)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_fproc0_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) = () where
{
  val () = g_fproc0<a1>(x1)
  val () = g_fproc0<a2>(x2)
  val () = g_fproc0<a3>(x3)
  val () = g_fproc0<a4>(x4)
  val () = g_fproc0<a5>(x5)
  val () = g_fproc0<a6>(x6)
  val () = g_fproc0<a7>(x7)
  val () = g_fproc0<a8>(x8)
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
gs_fproc0_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) = () where
{
  val () = g_fproc0<a1>(x1)
  val () = g_fproc0<a2>(x2)
  val () = g_fproc0<a3>(x3)
  val () = g_fproc0<a4>(x4)
  val () = g_fproc0<a5>(x5)
  val () = g_fproc0<a6>(x6)
  val () = g_fproc0<a7>(x7)
  val () = g_fproc0<a8>(x8)
  val () = g_fproc0<a9>(x9)
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
gs_fproc0_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10 ) = () where
{
val () = g_fproc0<a01>(x01)
val () = g_fproc0<a02>(x02)
val () = g_fproc0<a03>(x03)
val () = g_fproc0<a04>(x04)
val () = g_fproc0<a05>(x05)
val () = g_fproc0<a06>(x06)
val () = g_fproc0<a07>(x07)
val () = g_fproc0<a08>(x08)
val () = g_fproc0<a09>(x09)
val () = g_fproc0<a10>(x10)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_fproc1_n1
( x1 ) = () where
{
  val () = g_fproc1<a1>(x1)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_fproc1_n2
( x1
, x2 ) = () where
{
  val () = g_fproc1<a1>(x1)
  val () = g_fproc1<a2>(x2)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_fproc1_n3
( x1
, x2
, x3 ) = () where
{
  val () = g_fproc1<a1>(x1)
  val () = g_fproc1<a2>(x2)
  val () = g_fproc1<a3>(x3)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_fproc1_n4
( x1
, x2
, x3
, x4 ) = () where
{
  val () = g_fproc1<a1>(x1)
  val () = g_fproc1<a2>(x2)
  val () = g_fproc1<a3>(x3)
  val () = g_fproc1<a4>(x4)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_fproc1_n5
( x1
, x2
, x3
, x4
, x5 ) = () where
{
  val () = g_fproc1<a1>(x1)
  val () = g_fproc1<a2>(x2)
  val () = g_fproc1<a3>(x3)
  val () = g_fproc1<a4>(x4)
  val () = g_fproc1<a5>(x5)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_fproc1_n6
( x1
, x2
, x3
, x4
, x5
, x6 ) = () where
{
  val () = g_fproc1<a1>(x1)
  val () = g_fproc1<a2>(x2)
  val () = g_fproc1<a3>(x3)
  val () = g_fproc1<a4>(x4)
  val () = g_fproc1<a5>(x5)
  val () = g_fproc1<a6>(x6)
}
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_fproc1_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) = () where
{
  val () = g_fproc1<a1>(x1)
  val () = g_fproc1<a2>(x2)
  val () = g_fproc1<a3>(x3)
  val () = g_fproc1<a4>(x4)
  val () = g_fproc1<a5>(x5)
  val () = g_fproc1<a6>(x6)
  val () = g_fproc1<a7>(x7)
}
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_fproc1_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) = () where
{
  val () = g_fproc1<a1>(x1)
  val () = g_fproc1<a2>(x2)
  val () = g_fproc1<a3>(x3)
  val () = g_fproc1<a4>(x4)
  val () = g_fproc1<a5>(x5)
  val () = g_fproc1<a6>(x6)
  val () = g_fproc1<a7>(x7)
  val () = g_fproc1<a8>(x8)
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
gs_fproc1_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) = () where
{
  val () = g_fproc1<a1>(x1)
  val () = g_fproc1<a2>(x2)
  val () = g_fproc1<a3>(x3)
  val () = g_fproc1<a4>(x4)
  val () = g_fproc1<a5>(x5)
  val () = g_fproc1<a6>(x6)
  val () = g_fproc1<a7>(x7)
  val () = g_fproc1<a8>(x8)
  val () = g_fproc1<a9>(x9)
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
gs_fproc1_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10 ) = () where
{
val () = g_fproc1<a01>(x01)
val () = g_fproc1<a02>(x02)
val () = g_fproc1<a03>(x03)
val () = g_fproc1<a04>(x04)
val () = g_fproc1<a05>(x05)
val () = g_fproc1<a06>(x06)
val () = g_fproc1<a07>(x07)
val () = g_fproc1<a08>(x08)
val () = g_fproc1<a09>(x09)
val () = g_fproc1<a10>(x10)
}
//
(* ****** ****** *)
(*
HX: implementing gs_fred2l0
Tue Jul  5 16:35:26 EDT 2022
*)
(* ****** ****** *)
//
#impltmp
<a0>
gs_fred2l0_n2
(x1, x2) =
(
g_fred20<a0>(x1, x2)
) (* end of [gs_fred2l0_n2] *)
#impltmp
<a0>
gs_fred2l0_n3
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [gs_fred2l0_n3]
#impltmp
<a0>
gs_fred2l0_n4
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
  f0(f0(f0(x1,x2),x3),x4)
end (*let*) // end of [gs_fred2l0_n4]
#impltmp
<a0>
gs_fred2l0_n5
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(x1,x2),x3),x4),x5)
end (*let*) // end of [gs_fred2l0_n5]
#impltmp
<a0>
gs_fred2l0_n6
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [gs_fred2l0_n6]
#impltmp
<a0>
gs_fred2l0_n7
( x1
, x2, x3
, x4, x5
, x6, x7) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7)
end (*let*) // end of [gs_fred2l0_n7]
#impltmp
<a0>
gs_fred2l0_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8)
end (*let*) // end of [gs_fred2l0_n8]
#impltmp
<a0>
gs_fred2l0_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9)
end (*let*) // end of [gs_fred2l0_n9]
//
#impltmp
<a0>
gs_fred2l0_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(
f0(f0(f0(f0(f0(x01,x02),x03),x04),x05),x06),x07),x08),x09),x10)
end (*let*) // end of [gs_fred2l0_n10]
//
(* ****** ****** *)
(*
HX: implementing gs_fred2l1
Tue Jul  5 16:37:10 EDT 2022
*)
(* ****** ****** *)
//
#impltmp
<a0>
gs_fred2l1_n2
(x1, x2) =
(
g_fred20<a0>(x1, x2)
) (* end of [gs_fred2l1_n2] *)
#impltmp
<a0>
gs_fred2l1_n3
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [gs_fred2l1_n3]
#impltmp
<a0>
gs_fred2l1_n4
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
  f0(f0(f0(x1,x2),x3),x4)
end (*let*) // end of [gs_fred2l1_n4]
#impltmp
<a0>
gs_fred2l1_n5
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(x1,x2),x3),x4),x5)
end (*let*) // end of [gs_fred2l1_n5]
#impltmp
<a0>
gs_fred2l1_n6
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [gs_fred2l1_n6]
#impltmp
<a0>
gs_fred2l1_n7
( x1
, x2, x3
, x4, x5
, x6, x7) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7)
end (*let*) // end of [gs_fred2l1_n7]
#impltmp
<a0>
gs_fred2l1_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8)
end (*let*) // end of [gs_fred2l1_n8]
#impltmp
<a0>
gs_fred2l1_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9)
end (*let*) // end of [gs_fred2l1_n9]
//
#impltmp
<a0>
gs_fred2l1_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(f0(f0(f0(
f0(f0(f0(f0(f0(x01,x02),x03),x04),x05),x06),x07),x08),x09),x10)
end (*let*) // end of [gs_fred2l1_n10]
//
(* ****** ****** *)
(*
HX: implementing gs_fred2r0
Tue Jul  5 16:45:16 EDT 2022
*)
(* ****** ****** *)
//
#impltmp
<a0>
gs_fred2r0_n2
(x1, x2) =
(
g_fred20<a0>(x1, x2)
) (* end of [gs_fred2r0_n2] *)
#impltmp
<a0>
gs_fred2r0_n3
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
  f0(x1, f0(x2, x3))
end (*let*) // end of [gs_fred2r0_n3]
#impltmp
<a0>
gs_fred2r0_n4
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,x4)))
end (*let*) // end of [gs_fred2r0_n4]
#impltmp
<a0>
gs_fred2r0_n5
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,f0(x4,x5))))
end (*let*) // end of [gs_fred2r0_n5]
#impltmp
<a0>
gs_fred2r0_n6
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,x6)))))
end (*let*) // end of [gs_fred2r0_n6]
#impltmp
<a0>
gs_fred2r0_n7
( x1
, x2, x3
, x4, x5
, x6, x7) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,f0(x6,x7))))))
end (*let*) // end of [gs_fred2r0_n7]
#impltmp
<a0>
gs_fred2r0_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,f0(x6,f0(x7,x8)))))))
end (*let*) // end of [gs_fred2r0_n8]
#impltmp
<a0>
gs_fred2r0_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,f0(x6,f0(x7,f0(x8,x9))))))))
end (*let*) // end of [gs_fred2r0_n9]
(* ****** ****** *)
#impltmp
<a0>
gs_fred2r0_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
let
fun
f0(x, y) =
g_fred20<a0>(x, y)
in//let
f0(x01,f0(x02,
f0(x03,f0(x04,f0(x05,f0(x06,f0(x07,f0(x08,f0(x09,x10)))))))))
end (*let*) // end of [gs_fred2r0_n10]
(* ****** ****** *)
(*
HX: implementing gs_fred2r1
Tue Jul  5 16:46:17 EDT 2022
*)
(* ****** ****** *)
//
#impltmp
<a0>
gs_fred2r1_n2
(x1, x2) =
(
g_fred21<a0>(x1, x2)
) (* end of [gs_fred2r1_n2] *)
#impltmp
<a0>
gs_fred2r1_n3
( x1
, x2, x3) =
let
fun
f0(x, y) =
g_fred21<a0>(x, y)
in//let
  f0(x1, f0(x2, x3))
end (*let*) // end of [gs_fred2r1_n3]
#impltmp
<a0>
gs_fred2r1_n4
( x1, x2
, x3, x4) =
let
fun
f0(x, y) =
g_fred21<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,x4)))
end (*let*) // end of [gs_fred2r1_n4]
#impltmp
<a0>
gs_fred2r1_n5
( x1
, x2, x3
, x4, x5) =
let
fun
f0(x, y) =
g_fred21<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,f0(x4,x5))))
end (*let*) // end of [gs_fred2r1_n5]
#impltmp
<a0>
gs_fred2r1_n6
( x1, x2
, x3, x4
, x5, x6) =
let
fun
f0(x, y) =
g_fred21<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,x6)))))
end (*let*) // end of [gs_fred2r1_n6]
#impltmp
<a0>
gs_fred2r1_n7
( x1
, x2, x3
, x4, x5
, x6, x7) =
let
fun
f0(x, y) =
g_fred21<a0>(x, y)
in//let
  f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,f0(x6,x7))))))
end (*let*) // end of [gs_fred2r1_n7]
#impltmp
<a0>
gs_fred2r1_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8) =
let
fun
f0(x, y) =
g_fred21<a0>(x, y)
in//let
f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,f0(x6,f0(x7,x8)))))))
end (*let*) // end of [gs_fred2r1_n8]
#impltmp
<a0>
gs_fred2r1_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9) =
let
fun
f0(x, y) =
g_fred21<a0>(x, y)
in//let
f0(x1,f0(x2,f0(x3,f0(x4,f0(x5,f0(x6,f0(x7,f0(x8,x9))))))))
end (*let*) // end of [gs_fred2r1_n9]
(* ****** ****** *)
#impltmp
<a0>
gs_fred2r1_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
let
fun
f0(x, y) =
g_fred21<a0>(x, y)
in//let
f0(x01,f0(x02,
f0(x03,f0(x04,f0(x05,f0(x06,f0(x07,f0(x08,f0(x09,x10)))))))))
end (*let*) // end of [gs_fred2r1_n10]
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
gs_print0_n1 =
gs_fproc0_n1
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_print0<a0>
}
//
#impltmp
<a1><a2>
gs_print0_n2 =
gs_fproc0_n2
<a1><a2> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_print0<a0>
}
//
#impltmp
<a1>
<a2><a3>
gs_print0_n3 =
gs_fproc0_n3
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_print0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
gs_print0_n4 =
gs_fproc0_n4
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_print0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_print0_n5 =
gs_fproc0_n5
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_print0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_print0_n6 =
gs_fproc0_n6
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_print0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_print0_n7 =
gs_fproc0_n7
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_print0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_print0_n8 =
gs_fproc0_n8
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_print0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_print0_n9 =
gs_fproc0_n9
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_print0<a0>
}
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_print0_n10 =
gs_fproc0_n10
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10> where
{
#impltmp
{a00:vt}
g_fproc0<a00> = g_print0<a00>
}
//
(* ****** ****** *)
//
#impltmp
gs_println0_n0
<>(*tmp*)
( (*_*) ) = g_print( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_println0_n1
( x1 ) =
(
gs_print0_n1
(   x1   ) ; gs_println0_n0<>()
) (* end of [gs_println0_n1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_println0_n2
( x1
, x2 ) =
(
gs_print0_n2
( x1, x2 ) ; gs_println0_n0<>()
) (* end of [gs_println0_n2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_println0_n3
( x1
, x2
, x3 ) =
(
gs_print0_n3
( x1
, x2, x3 ) ; gs_println0_n0<>()
) (* end of [gs_println0_n3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_println0_n4
( x1
, x2
, x3
, x4 ) =
(
gs_print0_n4
( x1, x2
, x3, x4 ) ; gs_println0_n0<>()
) (* end of [gs_println0_n4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_println0_n5
( x1
, x2
, x3
, x4
, x5 ) =
(
gs_print0_n5
( x1
, x2, x3
, x4, x5 ) ; gs_println0_n0<>()
) (* end of [gs_println0_n5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_println0_n6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
gs_print0_n6
( x1, x2
, x3, x4
, x5, x6 ) ; gs_println0_n0<>()
) (* end of [gs_println0_n6] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_println0_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
gs_print0_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; gs_println0_n0<>()
) (* end of [gs_println0_n7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_println0_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_print0_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; gs_println0_n0<>()
) (* end of [gs_println0_n8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_println0_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
gs_print0_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; gs_println0_n0<>()
) (* end of [gs_println0_n9] *)
//
(* ****** ****** *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_println0_n10
( x01
, x02, x03, x04
, x05, x06, x07
, x08, x09, x10 ) =
(
gs_print0_n10
( x01
, x02, x03, x04
, x05, x06, x07
, x08, x09, x10 ) ; gs_println0_n0<>()
) (* end of [gs_println0_n10] *)
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
gs_print1_n1 =
gs_fproc1_n1
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_print1<a0>
}
//
#impltmp
<a1><a2>
gs_print1_n2 =
gs_fproc1_n2
<a1><a2> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_print1<a0>
}
//
#impltmp
<a1>
<a2><a3>
gs_print1_n3 =
gs_fproc1_n3
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_print1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
gs_print1_n4 =
gs_fproc1_n4
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_print1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_print1_n5 =
gs_fproc1_n5
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_print1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_print1_n6 =
gs_fproc1_n6
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_print1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_print1_n7 =
gs_fproc1_n7
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_print1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_print1_n8 =
gs_fproc1_n8
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_print1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_print1_n9 =
gs_fproc1_n9
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_print1<a0>
}
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_print1_n10 =
gs_fproc1_n10
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10> where
{
#impltmp
{a00:vt}
g_fproc1<a00> = g_print1<a00>
}
//
(* ****** ****** *)
//
#impltmp
gs_println1_n0
<>(*tmp*)
( (*_*) ) = g_print( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_println1_n1
( x1 ) =
(
gs_print1_n1
(   x1   ) ; gs_println1_n0<>()
) (* end of [gs_println1_n1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_println1_n2
( x1
, x2 ) =
(
gs_print1_n2
( x1, x2 ) ; gs_println1_n0<>()
) (* end of [gs_println1_n2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_println1_n3
( x1
, x2
, x3 ) =
(
gs_print1_n3
( x1
, x2, x3 ) ; gs_println1_n0<>()
) (* end of [gs_println1_n3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_println1_n4
( x1
, x2
, x3
, x4 ) =
(
gs_print1_n4
( x1, x2
, x3, x4 ) ; gs_println1_n0<>()
) (* end of [gs_println1_n4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_println1_n5
( x1
, x2
, x3
, x4
, x5 ) =
(
gs_print1_n5
( x1
, x2, x3
, x4, x5 ) ; gs_println1_n0<>()
) (* end of [gs_println1_n5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_println1_n6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
gs_print1_n6
( x1, x2
, x3, x4
, x5, x6 ) ; gs_println1_n0<>()
) (* end of [gs_println1_n6] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_println1_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
gs_print1_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; gs_println1_n0<>()
) (* end of [gs_println1_n7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_println1_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_print1_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; gs_println1_n0<>()
) (* end of [gs_println1_n8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_println1_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
gs_print1_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; gs_println1_n0<>()
) (* end of [gs_println1_n9] *)
//
(* ****** ****** *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_println1_n10
( x01
, x02, x03, x04
, x05, x06, x07
, x08, x09, x10 ) =
(
gs_print1_n10
( x01
, x02, x03, x04
, x05, x06, x07
, x08, x09, x10 ) ; gs_println1_n0<>()
) (* end of [gs_println1_n10] *)
//
(* ****** ****** *)
(*
HX-2022-06-22:
printing for special sequences
*)
(* ****** ****** *)
//HX: optn(vt)-printing
(* ****** ****** *)
#impltmp
{a:vt}//tmp
g_print1
<optn_vt(a)> = optn_vt_print1<a>
(* ****** ****** *)
//
#impltmp
{a0:vt}(*tmp*)
gseq_print$beg1
<optn_vt(a0)><a0> = optn_vt_print$beg<>
#impltmp
{a0:vt}(*tmp*)
gseq_print$end1
<optn_vt(a0)><a0> = optn_vt_print$end<>
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
optn_vt_print1 =
gseq_print1<optn_vt(a0)><a0> where
{
//
#impltmp
{a0:vt}(*tmp*)
gseq_print$beg1
<optn_vt(a0)><a0> = optn_vt_print$beg<>
#impltmp
{a0:vt}(*tmp*)
gseq_print$end1
<optn_vt(a0)><a0> = optn_vt_print$end<>
//
}(*where*)//end-of-[optn_vt_print1<a0>]
//
#impltmp
optn_vt_print$beg<>() = print"$optn_vt("
#impltmp
optn_vt_print$end<>() = print(   ")"   )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
optn_vt_print1_begend
  (xs, xbeg, xend) =
(
optn_vt_print1<a0>(xs)) where
{
#impltmp
optn_vt_print$beg<(*0*)>() = print(xbeg)
#impltmp
optn_vt_print$end<(*0*)>() = print(xend)
}
//
(* ****** ****** *)
//HX: list(vt)-printing
(* ****** ****** *)
#impltmp
{a:vt}//tmp
g_print1
<list_vt(a)> = list_vt_print1<a>
(* ****** ****** *)
//
#impltmp
{a0:vt}(*tmp*)
gseq_print$beg1
<list_vt(a0)><a0> = list_vt_print$beg<>
#impltmp
{a0:vt}(*tmp*)
gseq_print$end1
<list_vt(a0)><a0> = list_vt_print$end<>
#impltmp
{a0:vt}(*tmp*)
gseq_print$sep1
<list_vt(a0)><a0> = list_vt_print$sep<>
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
list_vt_print1 =
gseq_print1<list_vt(a0)><a0> where
{
//
#impltmp
{a0:vt}(*tmp*)
gseq_print$beg1
<list_vt(a0)><a0> = list_vt_print$beg<>
#impltmp
{a0:vt}(*tmp*)
gseq_print$end1
<list_vt(a0)><a0> = list_vt_print$end<>
#impltmp
{a0:vt}(*tmp*)
gseq_print$sep1
<list_vt(a0)><a0> = list_vt_print$sep<>
//
}(*where*)//end-of-[list_vt_print1<a0>]
//
//
#impltmp
list_vt_print$beg<>() = print"$list_vt("
#impltmp
list_vt_print$end<>() = print(   ")"   )
#impltmp
list_vt_print$sep<>() = print(   ","   )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
list_vt_print1_begendsep
(xs, xbeg, xend, xsep) =
(
list_vt_print1<a0>(xs)) where
{
#impltmp
list_vt_print$beg<(*0*)>() = print(xbeg)
#impltmp
list_vt_print$end<(*0*)>() = print(xend)
#impltmp
list_vt_print$sep<(*0*)>() = print(xsep)
}
//
(* ****** ****** *)
//HX: strm(vt)-printing
(* ****** ****** *)
#impltmp
{a:vt}//tmp
g_print0
<strm_vt(a)> = strm_vt_print0<a>
#impltmp
{a:vt}
g_print1
<strm_vt(a)>(xs) =
(
  strn_print(  "$strm_vt(...)"  )
)
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strm_vt_print0(xs) =
let
val len = 
strm_vt_print$len<>()
in
if
(len < 0)
then strm_vt_print0_all(xs)
else strm_vt_print0_len(xs, len)
end (*let*) // end of [strm_vt_print0]
//
#impltmp
<>(*tmp*)
strm_vt_print$len() = 3
//
#impltmp
<>(*tmp*)
strm_vt_print$beg() = strn_print"$strm_vt("
#impltmp
<>(*tmp*)
strm_vt_print$end() = strn_print(   ")"   )
#impltmp
<>(*tmp*)
strm_vt_print$sep() = strn_print(   ","   )
#impltmp
<>(*tmp*)
strm_vt_print$rst() = strn_print(  "..."  )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strm_vt_print0_all
  (xs) =
(
loop
(xs, 0(*i0*)) where
{
val () =
strm_vt_print$beg<>()
}
) where
{
#vwtpdef
xs = strm_vt(a0)
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(
strm_vt_print$end<>()
)
| ~
strmcon_vt_cons(x0, xs) =>
let
//
val () =
if
(i0 > 0)
then
strm_vt_print$sep<>()
//
in
loop(xs, suc(i0)) where
{
  val () = g_print0<a0>(x0)
}
end // end of [strmcon_vt_cons]
)
}(*where*)//end-of(strm_vt_print0_all)
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strm_vt_print0_len
  (xs, n0) =
(
loop
(xs, 0(*i0*)) where
{
val () =
strm_vt_print$beg<>()
}
) where
{
//
#vwtpdef
xs = strm_vt(a0)
//
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
strm_vt_print$end<>()
| ~
strmcon_vt_cons(x0, xs) =>
if
(i0 >= n0)
then
let
//
val () =
g_free<a0>(x0)
val () =
strm_vt_free<a0>(xs)
//
val () =
if
(i0 > 0)
then
strm_vt_print$sep<>()
val () =
strm_vt_print$rst<>()
//
in
  strm_vt_print$end<>()
end // end of [then]
else
let
//
val () =
if
(i0 > 0)
then
strm_vt_print$sep<>()
//
in
loop(xs, suc(i0)) where
{
  val () = g_print0<a0>(x0)
}
end // end of [else]
) (* strmcon_vt_cons *)
}(*where*)//end-of(strm_vt_print0_len)
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strm_vt_print0_begendseprst
( xs
, xbeg, xend, xsep, xrst) =
(
strm_vt_print0<a0>(xs)) where
{
#impltmp
strm_vt_print$beg<(*0*)>() = print(xbeg)
#impltmp
strm_vt_print$end<(*0*)>() = print(xend)
#impltmp
strm_vt_print$sep<(*0*)>() = print(xsep)
#impltmp
strm_vt_print$rst<(*0*)>() = print(xrst)
}
//
(* ****** ****** *)
//HX:strx(vt)-printing
(* ****** ****** *)
#impltmp
{a:vt}//tmp
g_print0
<strx_vt(a)> = strx_vt_print0<a>
#impltmp
{a:vt}//tmp
g_print1
<strx_vt(a)>(xs) =
(
  strn_print(  "$strx_vt(...)"  )
)
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strx_vt_print0(xs) =
let
val len = 
strx_vt_print$len<>()
in
  strx_vt_print0_len(xs, len)
end (*let*) // end of [strx_vt_print0]
//
#impltmp
<>(*tmp*)
strx_vt_print$len() = 3
//
#impltmp
<>(*tmp*)
strx_vt_print$beg() = print"$strx_vt("
#impltmp
<>(*tmp*)
strx_vt_print$end() = print(   ")"   )
#impltmp
<>(*tmp*)
strx_vt_print$sep() = print(   ","   )
#impltmp
<>(*tmp*)
strx_vt_print$rst() = print(  "..."  )
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strx_vt_print0_len
  (xs, n0) =
(
loop
(xs, 0(*i0*)) where
{
val () =
strx_vt_print$beg<>()
}
) where
{
//
#vwtpdef
xs = strx_vt(a0)
//
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strxcon_vt_cons(x0, xs) =>
if
(i0>=n0)
then
let
//
val () =
g_free<a0>(x0)
val () =
strx_vt_free<a0>(xs)
//
val () =
if
(i0 > 0)
then
strx_vt_print$sep<>()
val () =
strx_vt_print$rst<>()
//
in
  strx_vt_print$end<>()
end // end of [then]
else
let
//
val () =
if
(i0 > 0)
then
strx_vt_print$sep<>()
//
in
loop(xs, suc(i0)) where
{
  val () = g_print0<a0>(x0)
}
end // end of [else]
) (* strxcon_vt_cons *)
}(*where*)//end-of(strx_vt_print0_len)
//
(* ****** ****** *)
//
#impltmp
<a0>(*tmp*)
strx_vt_print0_begendseprst
( xs
, xbeg, xend, xsep, xrst) =
(
strx_vt_print0<a0>(xs)) where
{
#impltmp
strx_vt_print$beg<(*0*)>() = print(xbeg)
#impltmp
strx_vt_print$end<(*0*)>() = print(xend)
#impltmp
strx_vt_print$sep<(*0*)>() = print(xsep)
#impltmp
strx_vt_print$rst<(*0*)>() = print(xrst)
}
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 15:12:21 EDT 2022
*)
//
#impltmp
<>(*tmp*)
strn_vt_append0_n2 =
gs_fred2r0_n2<strn_vt> where
{
#impltmp
g_fred20<strn_vt> = strn_vt_append0<> }
#impltmp
<>(*tmp*)
strn_vt_append0_n3 =
gs_fred2r0_n3<strn_vt> where
{
#impltmp
g_fred20<strn_vt> = strn_vt_append0<> }
//
#impltmp
<>(*tmp*)
strn_vt_append0_n4 =
gs_fred2r0_n4<strn_vt> where
{
#impltmp
g_fred20<strn_vt> = strn_vt_append0<> }
//
#impltmp
<>(*tmp*)
strn_vt_append0_n5 =
gs_fred2r0_n5<strn_vt> where
{
#impltmp
g_fred20<strn_vt> = strn_vt_append0<> }
//
#impltmp
<>(*tmp*)
strn_vt_append0_n6 =
gs_fred2r0_n6<strn_vt> where
{
#impltmp
g_fred20<strn_vt> = strn_vt_append0<> }
//
#impltmp
<>(*tmp*)
strn_vt_append0_n7 =
gs_fred2r0_n7<strn_vt> where
{
#impltmp
g_fred20<strn_vt> = strn_vt_append0<> }
//
#impltmp
<>(*tmp*)
strn_vt_append0_n8 =
gs_fred2r0_n8<strn_vt> where
{
#impltmp
g_fred20<strn_vt> = strn_vt_append0<> }
//
#impltmp
<>(*tmp*)
strn_vt_append0_n9 =
gs_fred2r0_n9<strn_vt> where
{
#impltmp
g_fred20<strn_vt> = strn_vt_append0<> }
//
#impltmp
<>(*tmp*)
strn_vt_append0_n10 =
gs_fred2r0_n10<strn_vt> where
{
#impltmp
g_fred20<strn_vt> = strn_vt_append0<> }
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 18:30:51 EDT 2022
*)
//
#impltmp
<>(*tmp*)
strn_vt_append1_n2 =
gs_fred2r1_n2<strn_vt> where
{
#impltmp
g_fred21<strn_vt> = strn_vt_append1<> }
#impltmp
<>(*tmp*)
strn_vt_append1_n3 =
gs_fred2r1_n3<strn_vt> where
{
#impltmp
g_fred21<strn_vt> = strn_vt_append1<> }
//
#impltmp
<>(*tmp*)
strn_vt_append1_n4 =
gs_fred2r1_n4<strn_vt> where
{
#impltmp
g_fred21<strn_vt> = strn_vt_append1<> }
//
#impltmp
<>(*tmp*)
strn_vt_append1_n5 =
gs_fred2r1_n5<strn_vt> where
{
#impltmp
g_fred21<strn_vt> = strn_vt_append1<> }
//
#impltmp
<>(*tmp*)
strn_vt_append1_n6 =
gs_fred2r1_n6<strn_vt> where
{
#impltmp
g_fred21<strn_vt> = strn_vt_append1<> }
//
#impltmp
<>(*tmp*)
strn_vt_append1_n7 =
gs_fred2r1_n7<strn_vt> where
{
#impltmp
g_fred21<strn_vt> = strn_vt_append1<> }
//
#impltmp
<>(*tmp*)
strn_vt_append1_n8 =
gs_fred2r1_n8<strn_vt> where
{
#impltmp
g_fred21<strn_vt> = strn_vt_append1<> }
//
#impltmp
<>(*tmp*)
strn_vt_append1_n9 =
gs_fred2r1_n9<strn_vt> where
{
#impltmp
g_fred21<strn_vt> = strn_vt_append1<> }
//
#impltmp
<>(*tmp*)
strn_vt_append1_n10 =
gs_fred2r1_n10<strn_vt> where
{
#impltmp
g_fred21<strn_vt> = strn_vt_append1<> }
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 19:07:51 EDT 2022
*)
//
#impltmp
<a0>(*tmp*)
list_vt_append0_n2 =
gs_fred2r0_n2<list_vt(a0)> where
{
#impltmp
g_fred20<list_vt(a0)> = list_vt_append0<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append0_n3 =
gs_fred2r0_n3<list_vt(a0)> where
{
#impltmp
g_fred20<list_vt(a0)> = list_vt_append0<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append0_n4 =
gs_fred2r0_n4<list_vt(a0)> where
{
#impltmp
g_fred20<list_vt(a0)> = list_vt_append0<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append0_n5 =
gs_fred2r0_n5<list_vt(a0)> where
{
#impltmp
g_fred20<list_vt(a0)> = list_vt_append0<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append0_n6 =
gs_fred2r0_n6<list_vt(a0)> where
{
#impltmp
g_fred20<list_vt(a0)> = list_vt_append0<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append0_n7 =
gs_fred2r0_n7<list_vt(a0)> where
{
#impltmp
g_fred20<list_vt(a0)> = list_vt_append0<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append0_n8 =
gs_fred2r0_n8<list_vt(a0)> where
{
#impltmp
g_fred20<list_vt(a0)> = list_vt_append0<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append0_n9 =
gs_fred2r0_n9<list_vt(a0)> where
{
#impltmp
g_fred20<list_vt(a0)> = list_vt_append0<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append0_n10 =
gs_fred2r0_n10<list_vt(a0)> where
{
#impltmp
g_fred20<list_vt(a0)> = list_vt_append0<a0> }
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 20:23:29 EDT 2022
*)
//
#impltmp
<a0>(*tmp*)
list_vt_append1_n2 =
gs_fred2r1_n2<list_vt(a0)> where
{
#impltmp
g_fred21<list_vt(a0)> = list_vt_append1<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append1_n3 =
gs_fred2r1_n3<list_vt(a0)> where
{
#impltmp
g_fred21<list_vt(a0)> = list_vt_append1<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append1_n4 =
gs_fred2r1_n4<list_vt(a0)> where
{
#impltmp
g_fred21<list_vt(a0)> = list_vt_append1<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append1_n5 =
gs_fred2r1_n5<list_vt(a0)> where
{
#impltmp
g_fred21<list_vt(a0)> = list_vt_append1<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append1_n6 =
gs_fred2r1_n6<list_vt(a0)> where
{
#impltmp
g_fred21<list_vt(a0)> = list_vt_append1<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append1_n7 =
gs_fred2r1_n7<list_vt(a0)> where
{
#impltmp
g_fred21<list_vt(a0)> = list_vt_append1<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append1_n8 =
gs_fred2r1_n8<list_vt(a0)> where
{
#impltmp
g_fred21<list_vt(a0)> = list_vt_append1<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append1_n9 =
gs_fred2r1_n9<list_vt(a0)> where
{
#impltmp
g_fred21<list_vt(a0)> = list_vt_append1<a0> }
//
#impltmp
<a0>(*tmp*)
list_vt_append1_n10 =
gs_fred2r1_n10<list_vt(a0)> where
{
#impltmp
g_fred21<list_vt(a0)> = list_vt_append1<a0> }
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_synoug0_vt.dats] *)
