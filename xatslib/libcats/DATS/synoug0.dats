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
Implementing prout/proutln
*)
//
(* ****** ****** *)
//
#impltmp
<a1>
prout1_a1 =
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
prout1_a2 =
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
prout1_a3 =
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
prout1_a4 =
fproc1_a4
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
prout1_a5 =
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
prout1_a6 =
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
prout1_a7 =
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
prout1_a8 =
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
prout1_a9 =
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
proutln1_a0
<>(*tmp*)
((*_*)) = prout_ref( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
proutln1_a1
( x1 ) =
(
prout1_a1
(   x1   ) ; proutln1_a0<>()
) (* end of [proutln1_a1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
proutln1_a2
( x1
, x2 ) =
(
prout1_a2
( x1, x2 ) ; proutln1_a0<>()
) (* end of [proutln1_a2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
proutln1_a3
( x1
, x2
, x3 ) =
(
prout1_a3
( x1
, x2, x3 ) ; proutln1_a0<>()
) (* end of [proutln1_a3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
proutln1_a4
( x1
, x2
, x3
, x4 ) =
(
prout1_a4
( x1, x2
, x3, x4 ) ; proutln1_a0<>()
) (* end of [proutln1_a4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
proutln1_a5
( x1
, x2
, x3
, x4
, x5 ) =
(
prout1_a5
( x1
, x2, x3
, x4, x5 ) ; proutln1_a0<>()
) (* end of [proutln1_a5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
proutln1_a6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
prout1_a6
( x1, x2
, x3, x4
, x5, x6 ) ; proutln1_a0<>()
) (* end of [proutln1_a6] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
proutln1_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
prout1_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; proutln1_a0<>()
) (* end of [proutln1_a7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
proutln1_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
prout1_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; proutln1_a0<>()
) (* end of [proutln1_a8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
proutln1_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
prout1_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; proutln1_a0<>()
) (* end of [proutln1_a9] *)
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
prerr1_a1 =
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
prerr1_a2 =
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
prerr1_a3 =
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
prerr1_a4 =
fproc1_a4
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
prerr1_a5 =
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
prerr1_a6 =
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
prerr1_a7 =
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
prerr1_a8 =
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
prerr1_a9 =
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
prerrln1_a0
<>(*tmp*)
((*_*)) = prerr_ref( "\n" )
//
(* ****** ****** *)
//
#impltmp
<a1>
prerrln1_a1
( x1 ) =
(
prerr1_a1
(   x1   ) ; prerrln1_a0<>()
) (* end of [prerrln1_a1] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
prerrln1_a2
( x1
, x2 ) =
(
prerr1_a2
( x1, x2 ) ; prerrln1_a0<>()
) (* end of [prerrln1_a2] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
prerrln1_a3
( x1
, x2
, x3 ) =
(
prerr1_a3
( x1
, x2, x3 ) ; prerrln1_a0<>()
) (* end of [prerrln1_a3] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
prerrln1_a4
( x1
, x2
, x3
, x4 ) =
(
prerr1_a4
( x1, x2
, x3, x4 ) ; prerrln1_a0<>()
) (* end of [prerrln1_a4] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
prerrln1_a5
( x1
, x2
, x3
, x4
, x5 ) =
(
prerr1_a5
( x1
, x2, x3
, x4, x5 ) ; prerrln1_a0<>()
) (* end of [prerrln1_a5] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
prerrln1_a6
( x1
, x2
, x3
, x4
, x5
, x6 ) =
(
prerr1_a6
( x1, x2
, x3, x4
, x5, x6 ) ; prerrln1_a0<>()
) (* end of [prerrln1_a6] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
prerrln1_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) =
(
prerr1_a7
( x1
, x2, x3
, x4, x5
, x6, x7 ) ; prerrln1_a0<>()
) (* end of [prerrln1_a7] *)
//
(* ****** ****** *)
//
#impltmp
<a1><a2>
<a3><a4>
<a5><a6>
<a7><a8>
prerrln1_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) =
(
prerr1_a8
( x1, x2
, x3, x4
, x5, x6
, x7, x8 ) ; prerrln1_a0<>()
) (* end of [prerrln1_a8] *)
//
(* ****** ****** *)
//
#impltmp
<a1>
<a2><a3>
<a4><a5>
<a6><a7>
<a8><a9>
prerrln1_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) =
(
prerr1_a9
( x1
, x2, x3
, x4, x5
, x6, x7
, x8, x9 ) ; prerrln1_a0<>()
) (* end of [prerrln1_a9] *)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_synoug0.dats] *)
