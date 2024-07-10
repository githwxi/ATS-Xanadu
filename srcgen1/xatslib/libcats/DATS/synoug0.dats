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
gs_prout0_a01 =
gs_fproc0_a01
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prout0<a0>
}
//
#impltmp
<a1><a2>
gs_prout0_a02 =
gs_fproc0_a02
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
gs_prout0_a03 =
gs_fproc0_a03
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
gs_prout0_a04 =
gs_fproc0_a04
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
gs_prout0_a05 =
gs_fproc0_a05
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
gs_prout0_a06 =
gs_fproc0_a06
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
gs_prout0_a07 =
gs_fproc0_a07
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
gs_prout0_a08 =
gs_fproc0_a08
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
gs_prout0_a09 =
gs_fproc0_a09
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
gs_proutln0_a00
<>(*tmp*)
((*_*)) = g_prout( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_proutln0_a01
(   x1   ) =
(
gs_prout0_a01
(   x1   ) ; gs_proutln0_a00<>()
) (* end of [gs_proutln0_a01] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_proutln0_a02
( x1, x2 ) =
(
gs_prout0_a02
( x1, x2 ) ; gs_proutln0_a00<>()
) (* end of [gs_proutln0_a02] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_proutln0_a03
( x1
, x2
, x3 ) =
(
gs_prout0_a03
( x1
, x2, x3 ) ; gs_proutln0_a00<>()
) (* end of [gs_proutln0_a03] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_proutln0_a04
( x1, x2
, x3, x4 ) =
(
gs_prout0_a04
( x1, x2
, x3, x4 ) ; gs_proutln0_a00<>()
) (* end of [gs_proutln0_a04] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_proutln0_a05
( x1
, x2, x3
, x4, x5 ) =
(
gs_prout0_a05
( x1
, x2, x3
, x4, x5 ) ; gs_proutln0_a00<>()
) (* end of [gs_proutln0_a05] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_proutln0_a06
( x1, x2
, x3, x4
, x5, x6 ) =
(
gs_prout0_a06
( x1, x2
, x3, x4
, x5, x6 ) ; gs_proutln0_a00<>()
) (* end of [gs_proutln0_a06] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_proutln0_a07
( x1
, x2, x3
, x4, x5 
, x6, x7 ) =
(
gs_prout0_a07
( x1
, x2, x3, x4
, x5, x6, x7 ) ; gs_proutln0_a00<>()
) (* end of [gs_proutln0_a07] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_proutln0_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prout0_a08
( x1, x2
, x3, x4, x5
, x6, x7, x8 ) ; gs_proutln0_a00<>()
) (* end of [gs_proutln0_a08] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_proutln0_a09
( x1
, x2, x3
, x4, x5 
, x6, x7
, x8, x9 ) =
(
gs_prout0_a09
( x1, x2, x3
, x4, x5, x6
, x7, x8, x9 ) ; gs_proutln0_a00<>()
) (* end of [gs_proutln0_a09] *)
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
, x08,x09,x10 ) ; gs_proutln0_a00<>()
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
gs_prout1_a01 =
gs_fproc1_a01
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prout1<a0>
}
//
#impltmp
<a1><a2>
gs_prout1_a02 =
gs_fproc1_a02
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
gs_prout1_a03 =
gs_fproc1_a03
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
gs_prout1_a04 =
gs_fproc1_a04
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
gs_prout1_a05 =
gs_fproc1_a05
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
gs_prout1_a06 =
gs_fproc1_a06
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
gs_prout1_a07 =
gs_fproc1_a07
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
gs_prout1_a08 =
gs_fproc1_a08
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
gs_prout1_a09 =
gs_fproc1_a09
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
gs_proutln1_a00
<(*tmp*)>
((*void*)) = g_prout( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_proutln1_a01
( x1 ) =
(
gs_prout1_a01
(   x1   ) ; gs_proutln1_a00<>()
) (* end of [gs_proutln1_a01] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_proutln1_a02
( x1
, x2 ) =
(
gs_prout1_a02
( x1, x2 ) ; gs_proutln1_a00<>()
) (* end of [gs_proutln1_a02] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_proutln1_a03
( x1
, x2
, x3 ) =
(
gs_prout1_a03
( x1
, x2, x3 ) ; gs_proutln1_a00<>()
) (* end of [gs_proutln1_a03] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_proutln1_a04
( x1
, x2
, x3
, x4 ) =
(
gs_prout1_a04
( x1, x2
, x3, x4 ) ; gs_proutln1_a00<>()
) (* end of [gs_proutln1_a04] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_proutln1_a05
( x1
, x2
, x3
, x4
, x5 ) =
(
gs_prout1_a05
( x1
, x2, x3
, x4, x5 ) ; gs_proutln1_a00<>()
) (* end of [gs_proutln1_a05] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_proutln1_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
gs_prout1_a06
( x1, x2
, x3, x4
, x5, x6 ) ; gs_proutln1_a00<>()
) (* end of [gs_proutln1_a06] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_proutln1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
gs_prout1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; gs_proutln1_a00<>()
) (* end of [gs_proutln1_a07] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_proutln1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prout1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; gs_proutln1_a00<>()
) (* end of [gs_proutln1_a08] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_proutln1_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
gs_prout1_a09
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; gs_proutln1_a00<>()
) (* end of [gs_proutln1_a09] *)
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
, x08,x09,x10 ) ; gs_proutln1_a00<>()
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
gs_prerr0_a01 =
gs_fproc0_a01
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
#impltmp
<a1><a2>
gs_prerr0_a02 =
gs_fproc0_a02
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
gs_prerr0_a03 =
gs_fproc0_a03
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
gs_prerr0_a04 =
gs_fproc0_a04
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
gs_prerr0_a05 =
gs_fproc0_a05
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
gs_prerr0_a06 =
gs_fproc0_a06
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
gs_prerr0_a07 =
gs_fproc0_a07
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
gs_prerr0_a08 =
gs_fproc0_a08
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
gs_prerr0_a09 =
gs_fproc0_a09
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
gs_prerrln0_a00
<>(*tmp*)
((*_*)) = g_prerr( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_prerrln0_a01
( x1 ) =
(
gs_prerr0_a01
(   x1   ) ; gs_prerrln0_a00<>()
) (* end of [gs_prerrln0_a01] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_prerrln0_a02
( x1
, x2 ) =
(
gs_prerr0_a02
( x1, x2 ) ; gs_prerrln0_a00<>()
) (* end of [gs_prerrln0_a02] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
gs_prerrln0_a03
( x1
, x2
, x3 ) =
(
gs_prerr0_a03
( x1
, x2, x3 ) ; gs_prerrln0_a00<>()
) (* end of [gs_prerrln0_a03] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_prerrln0_a04
( x1
, x2
, x3
, x4 ) =
(
gs_prerr0_a04
( x1, x2
, x3, x4 ) ; gs_prerrln0_a00<>()
) (* end of [gs_prerrln0_a04] *)
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
gs_prerr1_a01 =
gs_fproc1_a01
<  a1  > where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
#impltmp
<a1><a2>
gs_prerr1_a02 =
gs_fproc1_a02
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
gs_prerr1_a03 =
gs_fproc1_a03
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
gs_prerr1_a04 =
gs_fproc1_a04
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
gs_prerr1_a05 =
gs_fproc1_a05
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
gs_prerr1_a06 =
gs_fproc1_a06
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
gs_prerr1_a07 =
gs_fproc1_a07
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
gs_prerr1_a08 =
gs_fproc1_a08
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
gs_prerr1_a09 =
gs_fproc1_a09
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
gs_prerrln1_a00
<>(*tmp*)
((*_*)) = g_prerr( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
gs_prerrln1_a01
( x1 ) =
(
gs_prerr1_a01
<   a1   >
(   x1   ) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a01] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
gs_prerrln1_a02
( x1, x2 ) =
(
gs_prerr1_a02
< a1><a2 >
( x1, x2 ) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a02] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2><a3>
gs_prerrln1_a03
( x1
, x2, x3 ) =
(
gs_prerr1_a03
<a1><a2><a3>
( x1
, x2, x3 ) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a03] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3><a4>
gs_prerrln1_a04
( x1
, x2, x3, x4 ) =
(
gs_prerr1_a04
<a1>
<a2><a3><a4>
( x1
, x2, x3, x4 ) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a04] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4><a5>
gs_prerrln1_a05
( x1, x2
, x3, x4, x5 ) =
(
gs_prerr1_a05
<a1><a2>
<a3><a4><a5>
( x1, x2
, x3, x4, x5 ) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a05] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prerrln1_a06
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
gs_prerr1_a06
<a1><a2>
<a3><a4>
<a5><a6>
( x1, x2
, x3, x4
, x5, x6 ) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a06] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6><a7>
gs_prerrln1_a07
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
gs_prerr1_a07
<a1><a2>
<a3><a4>
<a5><a6><a7>
( x1, x2, x3
, x4, x5, x6, x7 ) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a07] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4><a5>
<a6><a7><a8>
gs_prerrln1_a08
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prerr1_a08
<a1><a2>
<a3><a4><a5>
<a6><a7><a8>
( x1, x2, x3, x4
, x5, x6, x7, x8 ) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a08] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prerrln1_a09
(x1,x2,x3,x4
,x5,x6,x7,x8,x9) =
(
gs_prerr1_a09
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
(x1,x2,x3,x4
,x5,x6,x7,x8,x9) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a09] *)
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
,x05,x06,x07,x08,x09,x10) ; gs_prerrln1_a00<>()
) (* end of [gs_prerrln1_a10] *)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xatslib_DATS_libcats_synoug0.dats] *)