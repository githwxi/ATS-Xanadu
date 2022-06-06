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
(* ****** ****** *)
(*
#extern
fun<>
prout_a0
((*void*)) : void
*)
#extern
fun
<a1:vt>
prout_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
prout_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
prout_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
prout_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
prout_a5
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
prout_a6
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
prout_a7
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
prout_a8
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
prout_a9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload prout with prout_a1
#symload prout with prout_a2
#symload prout with prout_a3
#symload prout with prout_a4
#symload prout with prout_a5
#symload prout with prout_a6
#symload prout with prout_a7
#symload prout with prout_a8
#symload prout with prout_a9
//
(* ****** ****** *)
(*
#extern
fun<>
prout_a0
((*void*)) : void
*)
#extern
fun
<a1:vt>
prerr_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
prerr_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
prerr_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
prerr_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
prerr_a5
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
prerr_a6
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
prerr_a7
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
prerr_a8
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
prerr_a9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload prerr with prerr_a1
#symload prerr with prerr_a2
#symload prerr with prerr_a3
#symload prerr with prerr_a4
#symload prerr with prerr_a5
#symload prerr with prerr_a6
#symload prerr with prerr_a7
#symload prerr with prerr_a8
#symload prerr with prerr_a9
//
(* ****** ****** *)
//
#extern
fun<>
proutln_a0
((*void*)) : void
#extern
fun
<a1:vt>
proutln_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
proutln_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
proutln_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
proutln_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
proutln_a5
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
proutln_a6
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
proutln_a7
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
proutln_a8
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
proutln_a9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
//
(* ****** ****** *)
//
#symload proutln with proutln_a0
#symload proutln with proutln_a1
#symload proutln with proutln_a2
#symload proutln with proutln_a3
#symload proutln with proutln_a4
#symload proutln with proutln_a5
#symload proutln with proutln_a6
#symload proutln with proutln_a7
#symload proutln with proutln_a8
#symload proutln with proutln_a9
//
(* ****** ****** *)
//
#extern
fun<>
prerrln_a0
((*void*)) : void
#extern
fun
<a1:vt>
prerrln_a1
( x1: !a1 ) : void
#extern
fun
<a1:vt>
<a2:vt>
prerrln_a2
( x1: !a1, x2: !a2 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
prerrln_a3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
prerrln_a4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
#extern
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
prerrln_a5
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
prerrln_a6
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
prerrln_a7
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
prerrln_a8
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
prerrln_a9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
//
(* ****** ****** *)
//
#symload prerrln with prerrln_a0
#symload prerrln with prerrln_a1
#symload prerrln with prerrln_a2
#symload prerrln with prerrln_a3
#symload prerrln with prerrln_a4
#symload prerrln with prerrln_a5
#symload prerrln with prerrln_a6
#symload prerrln with prerrln_a7
#symload prerrln with prerrln_a8
#symload prerrln with prerrln_a9
//
(* ****** ****** *)
//
(*
HX:
Implementing prout/proutln
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
prout_a1 =
fproc1_a1
<  a1  > where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1><a2>
prout_a2 =
fproc1_a2
<a1><a2> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
prout_a3 =
fproc1_a3
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
prout_a4 =
fproc1_a6
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
prout_a5 =
fproc1_a5
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
prout_a6 =
fproc1_a6
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
prout_a7 =
fproc1_a7
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
prout_a8 =
fproc1_a8
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
prout_a9 =
fproc1_a9
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prout1_ref<a0>
}
//
(* ****** ****** *)
//
#impltmp
proutln_a0
<>(*tmp*)
((*_*)) = strn_print( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
proutln_a1
( x1 ) =
(
prout_a1
(   x1   ) ; proutln_a0<>()
) (* end of [proutln_a1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
proutln_a2
( x1
, x2 ) =
(
prout_a2
( x1, x2 ) ; proutln_a0<>()
) (* end of [proutln_a2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
proutln_a3
( x1
, x2
, x3 ) =
(
prout_a3
( x1
, x2, x3 ) ; proutln_a0<>()
) (* end of [proutln_a3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
proutln_a4
( x1
, x2
, x3
, x4 ) =
(
prout_a4
( x1, x2
, x3, x4 ) ; proutln_a0<>()
) (* end of [proutln_a4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
proutln_a5
( x1
, x2
, x3
, x4
, x5 ) =
(
prout_a5
( x1
, x2, x3
, x4, x5 ) ; proutln_a0<>()
) (* end of [proutln_a5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
proutln_a6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
prout_a6
( x1, x2
, x3, x4
, x5, x6 ) ; proutln_a0<>()
) (* end of [proutln_a6] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
proutln_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
prout_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; proutln_a0<>()
) (* end of [proutln_a7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
proutln_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
prout_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; proutln_a0<>()
) (* end of [proutln_a8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
proutln_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
prout_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; proutln_a0<>()
) (* end of [proutln_a9] *)
//
(* ****** ****** *)
//
(*
HX:
Implementing prerr/prerrln
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
prerr_a1 =
fproc1_a1
<  a1  > where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1><a2>
prerr_a2 =
fproc1_a2
<a1><a2> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
prerr_a3 =
fproc1_a3
<a1>
<a2><a3> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
prerr_a4 =
fproc1_a6
<a1><a2>
<a3><a4> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
prerr_a5 =
fproc1_a5
<a1>
<a2><a3>
<a4><a5> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
prerr_a6 =
fproc1_a6
<a1><a2>
<a3><a4>
<a5><a6> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
prerr_a7 =
fproc1_a7
<a1>
<a2><a3>
<a4><a5>
<a6><a7> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
prerr_a8 =
fproc1_a8
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
prerr_a9 =
fproc1_a9
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9> where
{
#impltmp
{a0:vt}
gl_fproc1<a0> = prerr1_ref<a0>
}
//
(* ****** ****** *)
//
#impltmp
prerrln_a0
<>(*tmp*)
((*_*)) = strn_print( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
prerrln_a1
( x1 ) =
(
prerr_a1
(   x1   ) ; prerrln_a0<>()
) (* end of [prerrln_a1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
prerrln_a2
( x1
, x2 ) =
(
prerr_a2
( x1, x2 ) ; prerrln_a0<>()
) (* end of [prerrln_a2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
prerrln_a3
( x1
, x2
, x3 ) =
(
prerr_a3
( x1
, x2, x3 ) ; prerrln_a0<>()
) (* end of [prerrln_a3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
prerrln_a4
( x1
, x2
, x3
, x4 ) =
(
prerr_a4
( x1, x2
, x3, x4 ) ; prerrln_a0<>()
) (* end of [prerrln_a4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
prerrln_a5
( x1
, x2
, x3
, x4
, x5 ) =
(
prerr_a5
( x1
, x2, x3
, x4, x5 ) ; prerrln_a0<>()
) (* end of [prerrln_a5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
prerrln_a6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
prerr_a6
( x1, x2
, x3, x4
, x5, x6 ) ; prerrln_a0<>()
) (* end of [prerrln_a6] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
prerrln_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
prerr_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; prerrln_a0<>()
) (* end of [prerrln_a7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
prerrln_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
prerr_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; prerrln_a0<>()
) (* end of [prerrln_a8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
prerrln_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
prerr_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; prerrln_a0<>()
) (* end of [prerrln_a9] *)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_synoug0.dats] *)
