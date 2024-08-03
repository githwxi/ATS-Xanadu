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
#staload
"./../SATS/synoug0.sats"
(* ****** ****** *)
//
(*
HX:
Implementing prout0/proutln0
Implementing prout1/proutln1
*)
//
(* ****** ****** *)
//
(*
HX:
Implementing prout0/proutln0
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_prout0_n1 =
gs_fproc0_n1
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a1><a2>
gs_prout0_n2 =
gs_fproc0_n2
<a1><a2> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a1>
<a2><a3>
gs_prout0_n3 =
gs_fproc0_n3
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
gs_prout0_n4 =
gs_fproc0_n4
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prout0_n5 =
gs_fproc0_n5
<a1><a2>
<a3><a4><a5> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prout0_n6 =
gs_fproc0_n6
<a1><a2><a3>
<a4><a5><a6> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prout0_n7 =
gs_fproc0_n7
<a1>
<a2><a3><a4>
<a5><a6><a7> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prout0_n8 =
gs_fproc0_n8
<a1><a2>
<a3><a4><a5>
<a6><a7><a8> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prout0_n9 =
gs_fproc0_n9
<a1><a2><a3>
<a4><a5><a6>
<a7><a8><a9> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prout0_a10 =
gs_fproc0_a10
<a01>
<a02><a03><a04>
<a05><a06><a07>
<a08><a09><a10> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
(* ****** ****** *)
//
#impltmp
gs_proutln0_n0
<>(*tmp*)
((*_*)) = g_prout( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_proutln0_n1
(   x1   ) =
(
gs_prout0_n1
(   x1   ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_n1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_proutln0_n2
( x1, x2 ) =
(
gs_prout0_n2
( x1, x2 ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_n2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_proutln0_n3
( x1
, x2
, x3 ) =
(
gs_prout0_n3
( x1
, x2, x3 ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_n3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_proutln0_n4
( x1, x2
, x3, x4 ) =
(
gs_prout0_n4
( x1, x2
, x3, x4 ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_n4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_proutln0_n5
( x1
, x2, x3
, x4, x5 ) =
(
gs_prout0_n5
( x1
, x2, x3
, x4, x5 ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_n5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_proutln0_n6
( x1, x2
, x3, x4
, x5, x6 ) =
(
gs_prout0_n6
( x1, x2
, x3, x4
, x5, x6 ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_n6] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_proutln0_n7
( x1
, x2, x3
, x4, x5 
, x6, x7 ) =
(
gs_prout0_n7
( x1
, x2, x3, x4
, x5, x6, x7 ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_n7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_proutln0_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prout0_n8
( x1, x2
, x3, x4, x5
, x6, x7, x8 ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_n8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_proutln0_n9
( x1
, x2, x3
, x4, x5 
, x6, x7
, x8, x9 ) =
(
gs_prout0_n9
( x1, x2, x3
, x4, x5, x6
, x7, x8, x9 ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_n9] *)
//
(* ****** ****** *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_proutln0_a10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
(
gs_prout1_a10
( x01
, x02,x03,x04
, x05,x06,x07
, x08,x09,x10 ) ; gs_proutln0_n0<>()
) (* end of [gs_proutln0_a10] *)
//
(* ****** ****** *)
//
(*
Implementing prout1/proutln1
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_prout1_n1 =
gs_fproc1_n1
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a1><a2>
gs_prout1_n2 =
gs_fproc1_n2
<a1><a2> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a1>
<a2><a3>
gs_prout1_n3 =
gs_fproc1_n3
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
gs_prout1_n4 =
gs_fproc1_n4
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prout1_n5 =
gs_fproc1_n5
<a1><a2>
<a3><a4><a5> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prout1_n6 =
gs_fproc1_n6
<a1><a2><a3>
<a4><a5><a6> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prout1_n7 =
gs_fproc1_n7
<a1>
<a2><a3><a4>
<a5><a6><a7> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prout1_n8 =
gs_fproc1_n8
<a1><a2>
<a3><a4><a5>
<a6><a7><a8> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prout1_n9 =
gs_fproc1_n9
<a1><a2><a3>
<a4><a5><a6>
<a7><a8><a9> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prout1_a10 =
gs_fproc1_a10
<a01>
<a02><a03><a04>
<a05><a06><a07>
<a08><a09><a10> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
(* ****** ****** *)
//
#impltmp
gs_proutln1_n0
<(*tmp*)>
((*void*)) = g_prout( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_proutln1_n1
( x1 ) =
(
gs_prout1_n1
(   x1   ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_n1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_proutln1_n2
( x1
, x2 ) =
(
gs_prout1_n2
( x1, x2 ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_n2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_proutln1_n3
( x1
, x2
, x3 ) =
(
gs_prout1_n3
( x1
, x2, x3 ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_n3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_proutln1_n4
( x1
, x2
, x3
, x4 ) =
(
gs_prout1_n4
( x1, x2
, x3, x4 ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_n4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_proutln1_n5
( x1
, x2
, x3
, x4
, x5 ) =
(
gs_prout1_n5
( x1
, x2, x3
, x4, x5 ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_n5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_proutln1_n6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
gs_prout1_n6
( x1, x2
, x3, x4
, x5, x6 ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_n6] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_proutln1_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
gs_prout1_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_n7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_proutln1_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prout1_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_n8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_proutln1_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
gs_prout1_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_n9] *)
//
(* ****** ****** *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_proutln1_a10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10 ) =
(
gs_prout1_a10
( x01
, x02,x03,x04
, x05,x06,x07
, x08,x09,x10 ) ; gs_proutln1_n0<>()
) (* end of [gs_proutln1_a10] *)
//
(* ****** ****** *)
//
(*
HX:
Implementing prerr0/prerrln0
Implementing prerr1/prerrln1
*)
//
(* ****** ****** *)
(*
HX:
prerr0/prerrln0-implementation
*)
(* ****** ****** *)
//
#impltmp
<a1>
gs_prerr0_n1 =
gs_fproc0_n1
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a1><a2>
gs_prerr0_n2 =
gs_fproc0_n2
<a1><a2> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a1>
<a2><a3>
gs_prerr0_n3 =
gs_fproc0_n3
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
gs_prerr0_n4 =
gs_fproc0_n4
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prerr0_n5 =
gs_fproc0_n5
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prerr0_n6 =
gs_fproc0_n6
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prerr0_n7 =
gs_fproc0_n7
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prerr0_n8 =
gs_fproc0_n8
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prerr0_n9 =
gs_fproc0_n9
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prerr0_a10 =
gs_fproc0_a10
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
(* ****** ****** *)
//
#impltmp
gs_prerrln0_n0
<>(*tmp*)
((*_*)) = g_prerr( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_prerrln0_n1
( x1 ) =
(
gs_prerr0_n1
(   x1   ) ; gs_prerrln0_n0<>()
) (* end of [gs_prerrln0_n1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_prerrln0_n2
( x1
, x2 ) =
(
gs_prerr0_n2
( x1, x2 ) ; gs_prerrln0_n0<>()
) (* end of [gs_prerrln0_n2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_prerrln0_n3
( x1
, x2
, x3 ) =
(
gs_prerr0_n3
( x1
, x2, x3 ) ; gs_prerrln0_n0<>()
) (* end of [gs_prerrln0_n3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_prerrln0_n4
( x1
, x2
, x3
, x4 ) =
(
gs_prerr0_n4
( x1, x2
, x3, x4 ) ; gs_prerrln0_n0<>()
) (* end of [gs_prerrln0_n4] *)
//
(* ****** ****** *)
(*
HX:
prerr1/prerrln1-implementation
*)
(* ****** ****** *)
//
#impltmp
<a1>
gs_prerr1_n1 =
gs_fproc1_n1
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a1><a2>
gs_prerr1_n2 =
gs_fproc1_n2
<a1><a2> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a1>
<a2><a3>
gs_prerr1_n3 =
gs_fproc1_n3
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
gs_prerr1_n4 =
gs_fproc1_n4
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prerr1_n5 =
gs_fproc1_n5
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prerr1_n6 =
gs_fproc1_n6
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prerr1_n7 =
gs_fproc1_n7
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prerr1_n8 =
gs_fproc1_n8
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prerr1_n9 =
gs_fproc1_n9
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prerr1_a10 =
gs_fproc1_a10
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
(* ****** ****** *)
//
#impltmp
gs_prerrln1_n0
<>(*tmp*)
((*_*)) = g_prerr( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_prerrln1_n1
( x1 ) =
(
gs_prerr1_n1
<   a1   >
(   x1   ) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_n1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_prerrln1_n2
( x1, x2 ) =
(
gs_prerr1_n2
< a1><a2 >
( x1, x2 ) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_n2] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2><a3>
gs_prerrln1_n3
( x1
, x2, x3 ) =
(
gs_prerr1_n3
<a1><a2><a3>
( x1
, x2, x3 ) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_n3] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3><a4>
gs_prerrln1_n4
( x1
, x2, x3, x4 ) =
(
gs_prerr1_n4
<a1>
<a2><a3><a4>
( x1
, x2, x3, x4 ) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_n4] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4><a5>
gs_prerrln1_n5
( x1, x2
, x3, x4, x5 ) =
(
gs_prerr1_n5
<a1><a2>
<a3><a4><a5>
( x1, x2
, x3, x4, x5 ) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_n5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prerrln1_n6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
gs_prerr1_n6
<a1><a2>
<a3><a4>
<a5><a6>
( x1, x2
, x3, x4
, x5, x6 ) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_n6] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6><a7>
gs_prerrln1_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
gs_prerr1_n7
<a1><a2>
<a3><a4>
<a5><a6><a7>
( x1, x2, x3
, x4, x5, x6, x7 ) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_n7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4><a5>
<a6><a7><a8>
gs_prerrln1_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prerr1_n8
<a1><a2>
<a3><a4><a5>
<a6><a7><a8>
( x1, x2, x3, x4
, x5, x6, x7, x8 ) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_n8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prerrln1_n9
(x1,x2,x3,x4
,x5,x6,x7,x8,x9) =
(
gs_prerr1_n9
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
(x1,x2,x3,x4
,x5,x6,x7,x8,x9) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_n9] *)
//
(* ****** ****** *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prerrln1_a10
(x01,x02,x03,x04
,x05,x06,x07,x08,x09,x10) =
(
gs_prerr1_a10
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
(x01,x02,x03,x04
,x05,x06,x07,x08,x09,x10) ; gs_prerrln1_n0<>()
) (* end of [gs_prerrln1_a10] *)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xatslib_DATS_libcats_synoug0.dats] *)
