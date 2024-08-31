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
(* ****** ****** *)
//
(*
HX: Implementing prout
*)
//
#impltmp
<a1>
gs_prout_n1 =
gs_fproc_n1
<  a1  > where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
#impltmp
<a1><a2>
gs_prout_n2 =
gs_fproc_n2
<a1><a2> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
#impltmp
<a1>
<a2><a3>
gs_prout_n3 =
gs_fproc_n3
<a1>
<a2><a3> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
gs_prout_n4 =
gs_fproc_n4
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prout_n5 =
gs_fproc_n5
<a1><a2>
<a3><a4><a5> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prout_n6 =
gs_fproc_n6
<a1><a2><a3>
<a4><a5><a6> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prout_n7 =
gs_fproc_n7
<a1>
<a2><a3><a4>
<a5><a6><a7> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prout_n8 =
gs_fproc_n8
<a1><a2>
<a3><a4><a5>
<a6><a7><a8> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prout_n9 =
gs_fproc_n9
<a1><a2><a3>
<a4><a5><a6>
<a7><a8><a9> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prout_n10 =
gs_fproc_n10
<a01>
<a02><a03><a04>
<a05><a06><a07>
<a08><a09><a10> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prout<a0>
}
//
(* ****** ****** *)
//
(*
HX: Implementing prout0
*)
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
gs_prout0_n10 =
gs_fproc0_n10
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
(*
HX: Implementing prout1
*)
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
gs_prout1_n10 =
gs_fproc1_n10
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
(* ****** ****** *)
//
(*
HX: Implementing prerr
*)
//
#impltmp
<a1>
gs_prerr_n1 =
gs_fproc_n1
<  a1  > where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
#impltmp
<a1><a2>
gs_prerr_n2 =
gs_fproc_n2
<a1><a2> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
#impltmp
<a1>
<a2><a3>
gs_prerr_n3 =
gs_fproc_n3
<a1>
<a2><a3> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
gs_prerr_n4 =
gs_fproc_n4
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prerr_n5 =
gs_fproc_n5
<a1><a2>
<a3><a4><a5> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prerr_n6 =
gs_fproc_n6
<a1><a2><a3>
<a4><a5><a6> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prerr_n7 =
gs_fproc_n7
<a1>
<a2><a3><a4>
<a5><a6><a7> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prerr_n8 =
gs_fproc_n8
<a1><a2>
<a3><a4><a5>
<a6><a7><a8> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prerr_n9 =
gs_fproc_n9
<a1><a2><a3>
<a4><a5><a6>
<a7><a8><a9> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prerr_n10 =
gs_fproc_n10
<a01>
<a02><a03><a04>
<a05><a06><a07>
<a08><a09><a10> where
{
#impltmp
{a0:t0}
g_fproc<a0> = g_prerr<a0>
}
//
(* ****** ****** *)
//
(*
HX: Implementing prerr0
*)
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
<a1><a2>
<a3><a4><a5> where
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
<a1><a2><a3>
<a4><a5><a6> where
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
<a2><a3><a4>
<a5><a6><a7> where
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
<a3><a4><a5>
<a6><a7><a8> where
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
<a1><a2><a3>
<a4><a5><a6>
<a7><a8><a9> where
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
gs_prerr0_n10 =
gs_fproc0_n10
<a01>
<a02><a03><a04>
<a05><a06><a07>
<a08><a09><a10> where
{
#impltmp
{a0:vt}
g_fproc0<a0> = g_prerr0<a0>
}
//
(* ****** ****** *)
//
(*
HX: Implementing prerr1
*)
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
<a1><a2>
<a3><a4><a5> where
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
<a1><a2><a3>
<a4><a5><a6> where
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
<a2><a3><a4>
<a5><a6><a7> where
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
<a3><a4><a5>
<a6><a7><a8> where
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
<a1><a2><a3>
<a4><a5><a6>
<a7><a8><a9> where
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
gs_prerr1_n10 =
gs_fproc1_n10
<a01>
<a02><a03><a04>
<a05><a06><a07>
<a08><a09><a10> where
{
#impltmp
{a0:vt}
g_fproc1<a0> = g_prerr1<a0>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
g_prout_newln
((*void*)) = g_prout("\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gs_proutln_n0
((*void*)) = g_prout_newln<>()
//
#impltmp
<a1>
gs_proutln_n1
(   x1   ) =
(
gs_prout_n1
(   x1   ) ; g_prout_newln<>()
) (* end of [gs_proutln_n1] *)
//
#impltmp
<a1><a2>
gs_proutln_n2
( x1, x2 ) =
(
gs_prout_n2
( x1, x2 ) ; g_prout_newln<>()
) (* end of [gs_proutln_n2] *)
//
#impltmp
<a1>
<a2><a3>
gs_proutln_n3
( x1
, x2
, x3 ) =
(
gs_prout_n3
(x1, x2, x3) ; g_prout_newln<>()
) (* end of [gs_proutln_n3] *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_proutln_n4
( x1, x2
, x3, x4 ) =
(
gs_prout_n4
(x1, x2, x3, x4) ; g_prout_newln<>()
) (* end of [gs_proutln_n4] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_proutln_n5
( x1
, x2, x3
, x4, x5 ) =
(
gs_prout_n5
(x1, x2, x3, x4, x5) ; g_prout_newln<>()
) (* end of [gs_proutln_n5] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_proutln_n6
( x1, x2
, x3, x4
, x5, x6 ) =
(
gs_prout_n6
(x1, x2, x3, x4, x5, x6) ; g_prout_newln<>()
) (* end of [gs_proutln_n6] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_proutln_n7
( x1
, x2, x3
, x4, x5 
, x6, x7 ) =
(
gs_prout_n7
(x1, x2, x3, x4, x5, x6, x7) ; g_prout_newln<>()
) (* end of [gs_proutln_n7] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_proutln_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prout_n8
(x1, x2, x3, x4, x5, x6, x7, x8) ; g_prout_newln<>()
) (* end of [gs_proutln_n8] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_proutln_n9
( x1
, x2, x3
, x4, x5 
, x6, x7
, x8, x9 ) =
(
gs_prout_n9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) ; g_prout_newln<>()
) (* end of [gs_proutln_n9] *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_proutln_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
(
gs_prout_n10
(x01,x02,x03,x04,x05,x06,x07,x08,x09,x10) ; g_prout_newln<>()
) (* end of [gs_proutln_n10] *)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gs_prout0ln_n0
((*void*)) = g_prout_newln<>()
//
#impltmp
<a1>
gs_prout0ln_n1
(   x1   ) =
(
gs_prout0_n1
(   x1   ) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n1] *)
//
#impltmp
<a1><a2>
gs_prout0ln_n2
( x1, x2 ) =
(
gs_prout0_n2
( x1, x2 ) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n2] *)
//
#impltmp
<a1>
<a2><a3>
gs_prout0ln_n3
( x1
, x2
, x3 ) =
(
gs_prout0_n3
(x1, x2, x3) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n3] *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_prout0ln_n4
( x1, x2
, x3, x4 ) =
(
gs_prout0_n4
(x1, x2, x3, x4) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n4] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prout0ln_n5
( x1
, x2, x3
, x4, x5 ) =
(
gs_prout0_n5
(x1, x2, x3, x4, x5) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n5] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prout0ln_n6
( x1, x2
, x3, x4
, x5, x6 ) =
(
gs_prout0_n6
(x1, x2, x3, x4, x5, x6) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n6] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prout0ln_n7
( x1
, x2, x3
, x4, x5 
, x6, x7 ) =
(
gs_prout0_n7
(x1, x2, x3, x4, x5, x6, x7) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n7] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prout0ln_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prout0_n8
(x1, x2, x3, x4, x5, x6, x7, x8) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n8] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prout0ln_n9
( x1
, x2, x3
, x4, x5 
, x6, x7
, x8, x9 ) =
(
gs_prout0_n9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n9] *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prout0ln_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
(
gs_prout0_n10
(x01,x02,x03,x04,x05,x06,x07,x08,x09,x10) ; g_prout_newln<>()
) (* end of [gs_prout0ln_n10] *)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gs_prout1ln_n0
((*void*)) = g_prout_newln<>()
//
#impltmp
<a1>
gs_prout1ln_n1
( x1 ) =
(
gs_prout1_n1
(   x1   ) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n1] *)
//
#impltmp
<a1><a2>
gs_prout1ln_n2
( x1
, x2 ) =
(
gs_prout1_n2
( x1, x2 ) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n2] *)
//
#impltmp
<a1>
<a2><a3>
gs_prout1ln_n3
( x1
, x2
, x3 ) =
(
gs_prout1_n3
(x1, x2, x3) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n3] *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_prout1ln_n4
( x1
, x2
, x3
, x4 ) =
(
gs_prout1_n4
(x1, x2, x3, x4) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n4] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prout1ln_n5
( x1
, x2
, x3
, x4
, x5 ) =
(
gs_prout1_n5
(x1, x2, x3, x4, x5) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n5] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prout1ln_n6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
gs_prout1_n6
(x1, x2, x3, x4, x5, x6) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n6] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prout1ln_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
gs_prout1_n7
(x1, x2, x3, x4, x5, x6, x7) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n7] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prout1ln_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prout1_n8
(x1, x2, x3, x4, x5, x6, x7, x8) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n8] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prout1ln_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
gs_prout1_n9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n9] *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prout1ln_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10 ) =
(
gs_prout1_n10
(x01,x02,x03,x04,x05,x06,x07,x08,x09,x10) ; g_prout_newln<>()
) (* end of [gs_prout1ln_n10] *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
g_prerr_newln
((*void*)) = g_prerr("\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gs_prerrln_n0
((*void*)) = g_prerr_newln<>()
//
#impltmp
<a1>
gs_prerrln_n1
(   x1   ) =
(
gs_prerr_n1
(   x1   ) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n1] *)
//
#impltmp
<a1><a2>
gs_prerrln_n2
( x1, x2 ) =
(
gs_prerr_n2
( x1, x2 ) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n2] *)
//
#impltmp
<a1>
<a2><a3>
gs_prerrln_n3
( x1
, x2
, x3 ) =
(
gs_prerr_n3
(x1, x2, x3) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n3] *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_prerrln_n4
( x1, x2
, x3, x4 ) =
(
gs_prerr_n4
(x1, x2, x3, x4) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n4] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prerrln_n5
( x1
, x2, x3
, x4, x5 ) =
(
gs_prerr_n5
(x1, x2, x3, x4, x5) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n5] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prerrln_n6
( x1, x2
, x3, x4
, x5, x6 ) =
(
gs_prerr_n6
(x1, x2, x3, x4, x5, x6) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n6] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prerrln_n7
( x1
, x2, x3
, x4, x5 
, x6, x7 ) =
(
gs_prerr_n7
(x1, x2, x3, x4, x5, x6, x7) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n7] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prerrln_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prerr_n8
(x1, x2, x3, x4, x5, x6, x7, x8) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n8] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prerrln_n9
( x1
, x2, x3
, x4, x5 
, x6, x7
, x8, x9 ) =
(
gs_prerr_n9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n9] *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prerrln_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
(
gs_prerr_n10
(x01,x02,x03,x04,x05,x06,x07,x08,x09,x10) ; g_prerr_newln<>()
) (* end of [gs_prerrln_n10] *)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gs_prerr0ln_n0
((*void*)) = g_prerr_newln<>()
//
#impltmp
<a1>
gs_prerr0ln_n1
(   x1   ) =
(
gs_prerr0_n1
(   x1   ) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n1] *)
//
#impltmp
<a1><a2>
gs_prerr0ln_n2
( x1, x2 ) =
(
gs_prerr0_n2
( x1, x2 ) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n2] *)
//
#impltmp
<a1>
<a2><a3>
gs_prerr0ln_n3
( x1
, x2
, x3 ) =
(
gs_prerr0_n3
(x1, x2, x3) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n3] *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_prerr0ln_n4
( x1, x2
, x3, x4 ) =
(
gs_prerr0_n4
(x1, x2, x3, x4) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n4] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prerr0ln_n5
( x1
, x2, x3
, x4, x5 ) =
(
gs_prerr0_n5
(x1, x2, x3, x4, x5) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n5] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prerr0ln_n6
( x1, x2
, x3, x4
, x5, x6 ) =
(
gs_prerr0_n6
(x1, x2, x3, x4, x5, x6) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n6] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prerr0ln_n7
( x1
, x2, x3
, x4, x5 
, x6, x7 ) =
(
gs_prerr0_n7
(x1, x2, x3, x4, x5, x6, x7) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n7] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prerr0ln_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prerr0_n8
(x1, x2, x3, x4, x5, x6, x7, x8) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n8] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prerr0ln_n9
( x1
, x2, x3
, x4, x5 
, x6, x7
, x8, x9 ) =
(
gs_prerr0_n9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n9] *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prerr0ln_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10) =
(
gs_prerr0_n10
(x01,x02,x03,x04,x05,x06,x07,x08,x09,x10) ; g_prerr_newln<>()
) (* end of [gs_prerr0ln_n10] *)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gs_prerr1ln_n0
((*void*)) = g_prerr_newln<>()
//
#impltmp
<a1>
gs_prerr1ln_n1
( x1 ) =
(
gs_prerr1_n1
(   x1   ) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n1] *)
//
#impltmp
<a1><a2>
gs_prerr1ln_n2
( x1
, x2 ) =
(
gs_prerr1_n2
( x1, x2 ) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n2] *)
//
#impltmp
<a1>
<a2><a3>
gs_prerr1ln_n3
( x1
, x2
, x3 ) =
(
gs_prerr1_n3
(x1, x2, x3) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n3] *)
//
#impltmp
<a1><a2>
<a3><a4>
gs_prerr1ln_n4
( x1
, x2
, x3
, x4 ) =
(
gs_prerr1_n4
(x1, x2, x3, x4) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n4] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
gs_prerr1ln_n5
( x1
, x2
, x3
, x4
, x5 ) =
(
gs_prerr1_n5
(x1, x2, x3, x4, x5) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n5] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
gs_prerr1ln_n6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
gs_prerr1_n6
(x1, x2, x3, x4, x5, x6) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n6] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
gs_prerr1ln_n7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
gs_prerr1_n7
(x1, x2, x3, x4, x5, x6, x7) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n7] *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
gs_prerr1ln_n8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
gs_prerr1_n8
(x1, x2, x3, x4, x5, x6, x7, x8) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n8] *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
gs_prerr1ln_n9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
gs_prerr1_n9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n9] *)
//
#impltmp
<a01><a02>
<a03><a04>
<a05><a06>
<a07><a08>
<a09><a10>
gs_prerr1ln_n10
( x01, x02
, x03, x04
, x05, x06
, x07, x08
, x09, x10 ) =
(
gs_prerr1_n10
(x01,x02,x03,x04,x05,x06,x07,x08,x09,x10) ; g_prerr_newln<>()
) (* end of [gs_prerr1ln_n10] *)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xatslib_DATS_libcats_synoug0.dats] *)
