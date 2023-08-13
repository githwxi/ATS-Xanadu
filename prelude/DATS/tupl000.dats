(* ****** ****** *)
(*
** for tuples
*)
(* ****** ****** *)
#impltmp<>
t0up_print$beg()=strn_print("@(")
#impltmp<>
t1up_print$beg()=strn_print("#(")
(* ****** ****** *)
#impltmp<>
t0up_print$end() = strn_print(")")
#impltmp<>
t1up_print$end() = strn_print(")")
(* ****** ****** *)
#impltmp<>
t0up_print$sep() = strn_print(",")
#impltmp<>
t1up_print$sep() = strn_print(",")
(* ****** ****** *)
//
(*
HX-2022-07-03
g_print for flat-tuples
Sun Jul  3 22:18:42 EDT 2022
*)
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0}
g_print
<(a0,a1)>(tup) =
let
val () = t0up_print$beg()
val () = g_print<a0>(tup.0)
val () = t0up_print$sep()
val () = g_print<a1>(tup.1)
val () = t0up_print$end((*nil*))
end // end of [g_print<t0up2>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0}
g_print
<
(a0
,a1,a2)>(tup) =
let
val () = t0up_print$beg()
val () = g_print<a0>(tup.0)
val () = t0up_print$sep()
val () = g_print<a1>(tup.1)
val () = t0up_print$sep()
val () = g_print<a2>(tup.2)
val () = t0up_print$end((*nil*))
end // end of [g_print<t0up3>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0}
g_print
<
(a0,a1
,a2,a3)>(tup) =
let
val () = t0up_print$beg()
val () = g_print<a0>(tup.0)
val () = t0up_print$sep()
val () = g_print<a1>(tup.1)
val () = t0up_print$sep()
val () = g_print<a2>(tup.2)
val () = t0up_print$sep()
val () = g_print<a3>(tup.3)
val () = t0up_print$end((*nil*))
end // end of [g_print<t0up4>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0}
g_print
<
(a0
,a1,a2
,a3,a4)>(tup) =
let
val () = t0up_print$beg()
val () = g_print<a0>(tup.0)
val () = t0up_print$sep()
val () = g_print<a1>(tup.1)
val () = t0up_print$sep()
val () = g_print<a2>(tup.2)
val () = t0up_print$sep()
val () = g_print<a3>(tup.3)
val () = t0up_print$sep()
val () = g_print<a4>(tup.4)
val () = t0up_print$end((*nil*))
end // end of [g_print<t0up5>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0}
g_print
<
(a0,a1
,a2,a3
,a4,a5)>(tup) =
let
val () = t0up_print$beg()
val () = g_print<a0>(tup.0)
val () = t0up_print$sep()
val () = g_print<a1>(tup.1)
val () = t0up_print$sep()
val () = g_print<a2>(tup.2)
val () = t0up_print$sep()
val () = g_print<a3>(tup.3)
val () = t0up_print$sep()
val () = g_print<a4>(tup.4)
val () = t0up_print$sep()
val () = g_print<a5>(tup.5)
val () = t0up_print$end((*nil*))
end // end of [g_print<t0up6>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0
,a6:t0}
g_print
<
(a0
,a1,a2
,a3,a4
,a5,a6)>(tup) =
let
val () = t0up_print$beg()
val () = g_print<a0>(tup.0)
val () = t0up_print$sep()
val () = g_print<a1>(tup.1)
val () = t0up_print$sep()
val () = g_print<a2>(tup.2)
val () = t0up_print$sep()
val () = g_print<a3>(tup.3)
val () = t0up_print$sep()
val () = g_print<a4>(tup.4)
val () = t0up_print$sep()
val () = g_print<a5>(tup.5)
val () = t0up_print$sep()
val () = g_print<a6>(tup.6)
val () = t0up_print$end((*nil*))
end // end of [g_print<t0up7>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0
,a6:t0
,a7:t0}
g_print
<
(a0,a1
,a2,a3
,a4,a5
,a6,a7)>(tup) =
let
val () = t0up_print$beg()
val () = g_print<a0>(tup.0)
val () = t0up_print$sep()
val () = g_print<a1>(tup.1)
val () = t0up_print$sep()
val () = g_print<a2>(tup.2)
val () = t0up_print$sep()
val () = g_print<a3>(tup.3)
val () = t0up_print$sep()
val () = g_print<a4>(tup.4)
val () = t0up_print$sep()
val () = g_print<a5>(tup.5)
val () = t0up_print$sep()
val () = g_print<a6>(tup.6)
val () = t0up_print$sep()
val () = g_print<a7>(tup.7)
val () = t0up_print$end((*nil*))
end // end of [g_print<t0up8>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0
,a6:t0
,a7:t0
,a8:t0}
g_print
<
(a0
,a1,a2
,a3,a4
,a5,a6
,a7,a8)>(tup) =
let
val () = t0up_print$beg()
val () = g_print<a0>(tup.0)
val () = t0up_print$sep()
val () = g_print<a1>(tup.1)
val () = t0up_print$sep()
val () = g_print<a2>(tup.2)
val () = t0up_print$sep()
val () = g_print<a3>(tup.3)
val () = t0up_print$sep()
val () = g_print<a4>(tup.4)
val () = t0up_print$sep()
val () = g_print<a5>(tup.5)
val () = t0up_print$sep()
val () = g_print<a6>(tup.6)
val () = t0up_print$sep()
val () = g_print<a7>(tup.7)
val () = t0up_print$sep()
val () = g_print<a8>(tup.8)
val () = t0up_print$end((*nil*))
end // end of [g_print<t0up9>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0
,a6:t0
,a7:t0
,a8:t0
,a9:t0}
g_print
<
(a0,a1
,a2,a3
,a4,a5
,a6,a7
,a8,a9)>(tup) =
let
val () = t0up_print$beg()
val () = g_print<a0>(tup.0)
val () = t0up_print$sep()
val () = g_print<a1>(tup.1)
val () = t0up_print$sep()
val () = g_print<a2>(tup.2)
val () = t0up_print$sep()
val () = g_print<a3>(tup.3)
val () = t0up_print$sep()
val () = g_print<a4>(tup.4)
val () = t0up_print$sep()
val () = g_print<a5>(tup.5)
val () = t0up_print$sep()
val () = g_print<a6>(tup.6)
val () = t0up_print$sep()
val () = g_print<a7>(tup.7)
val () = t0up_print$sep()
val () = g_print<a8>(tup.8)
val () = t0up_print$sep()
val () = g_print<a9>(tup.9)
val () = t0up_print$end((*nil*))
end // end of [g_print<t0up10>(tup)]
//
(* ****** ****** *)
//
(*
HX-2022-07-03:
Sun Jul  3 22:18:42 EDT 2022
gl_print for flat/boxed tuples
*)
//
(* ****** ****** *)
//
#impltmp
{a0:vt}
gl_print1
<
t1up1
( a0 )>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up1>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt}
gl_print1
<
t0up2
(a0,a1)>(tup) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t0up_print$end((*nil*))
end // end of [gl_print1<t0up2>(tup)]
//
#impltmp
{a0:vt
,a1:vt}
gl_print1
<
t1up2
(a0,a1)>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up2>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt
,a2:vt}
gl_print1
<
t0up3
(a0
,a1,a2)>(tup) =
let
val () = t0up_print$beg(   )
val () = gl_print1<a0>(tup.0)
val () = t0up_print$sep(   )
val () = gl_print1<a1>(tup.1)
val () = t0up_print$sep(   )
val () = gl_print1<a2>(tup.2)
val () = t0up_print$end((*nil*))
end // end of [gl_print1<t0up3>(tup)]
//
#impltmp
{a0:vt
,a1:vt
,a2:vt}
gl_print1
<
t1up3
(a0
,a1,a2)>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t1up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up3>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt}
gl_print1
<
t0up4
(a0,a1
,a2,a3)>(tup) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t0up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t0up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t0up_print$end((*nil*))
end // end of [gl_print1<t0up3>(tup)]
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt}
gl_print1
<
t1up4
(a0,a1
,a2,a3)>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t1up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t1up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up3>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt}
gl_print1
<
t0up5
(a0
,a1,a2
,a3,a4)>(tup) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t0up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t0up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t0up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t0up_print$end((*nil*))
end // end of [gl_print1<t0up5>(tup)]
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt}
gl_print1
<
t1up5
(a0
,a1,a2
,a3,a4)>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t1up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t1up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t1up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up5>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt}
gl_print1
<
t0up6
(a0,a1
,a2,a3
,a4,a5)>(tup) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t0up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t0up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t0up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t0up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t0up_print$end((*nil*))
end // end of [gl_print1<t0up6>(tup)]
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt}
gl_print1
<
t1up6
(a0,a1
,a2,a3
,a4,a5)>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t1up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t1up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t1up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t1up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up6>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt}
gl_print1
<
t0up7
(a0
,a1,a2
,a3,a4
,a5,a6)>(tup) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t0up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t0up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t0up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t0up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t0up_print$sep()
val () = gl_print1<a6>(tup.6)
val () = t0up_print$end((*nil*))
end // end of [gl_print1<t0up7>(tup)]
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt}
gl_print1
<
t1up7
(a0
,a1,a2
,a3,a4
,a5,a6)>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t1up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t1up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t1up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t1up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t1up_print$sep()
val () = gl_print1<a6>(tup.6)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up7>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt}
gl_print1
<
t0up8
(a0,a1
,a2,a3
,a4,a5
,a6,a7)>(tup) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t0up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t0up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t0up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t0up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t0up_print$sep()
val () = gl_print1<a6>(tup.6)
val () = t0up_print$sep()
val () = gl_print1<a7>(tup.7)
val () = t0up_print$end((*nil*))
end // end of [gl_print1<t0up8>(tup)]
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt}
gl_print1
<
t1up8
(a0,a1
,a2,a3
,a4,a5
,a6,a7)>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t1up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t1up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t1up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t1up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t1up_print$sep()
val () = gl_print1<a6>(tup.6)
val () = t1up_print$sep()
val () = gl_print1<a7>(tup.7)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up8>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt
,a8:vt}
gl_print1
<
t0up9
(a0
,a1,a2
,a3,a4
,a5,a6
,a7,a8)>(tup) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t0up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t0up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t0up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t0up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t0up_print$sep()
val () = gl_print1<a6>(tup.6)
val () = t0up_print$sep()
val () = gl_print1<a7>(tup.7)
val () = t0up_print$sep()
val () = gl_print1<a8>(tup.8)
val () = t0up_print$end((*nil*))
end // end of [gl_print1<t0up9>(tup)]
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt
,a8:vt}
gl_print1
<
t1up9
(a0
,a1,a2
,a3,a4
,a5,a6
,a7,a8)>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t1up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t1up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t1up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t1up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t1up_print$sep()
val () = gl_print1<a6>(tup.6)
val () = t1up_print$sep()
val () = gl_print1<a7>(tup.7)
val () = t1up_print$sep()
val () = gl_print1<a8>(tup.8)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up9>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt
,a8:vt
,a9:vt}
gl_print1
<
t0up10
(a0,a1
,a2,a3
,a4,a5
,a6,a7
,a8,a9)>(tup) =
let
val () = t0up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t0up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t0up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t0up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t0up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t0up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t0up_print$sep()
val () = gl_print1<a6>(tup.6)
val () = t0up_print$sep()
val () = gl_print1<a7>(tup.7)
val () = t0up_print$sep()
val () = gl_print1<a8>(tup.8)
val () = t0up_print$sep()
val () = gl_print1<a9>(tup.9)
val () = t0up_print$end((*nil*))
end // end of [gl_print1<t0up10>(tup)]
//
#impltmp
{a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt
,a8:vt
,a9:vt}
gl_print1
<
t1up10
(a0,a1
,a2,a3
,a4,a5
,a6,a7
,a8,a9)>(tup) =
let
val () = t1up_print$beg()
val () = gl_print1<a0>(tup.0)
val () = t1up_print$sep()
val () = gl_print1<a1>(tup.1)
val () = t1up_print$sep()
val () = gl_print1<a2>(tup.2)
val () = t1up_print$sep()
val () = gl_print1<a3>(tup.3)
val () = t1up_print$sep()
val () = gl_print1<a4>(tup.4)
val () = t1up_print$sep()
val () = gl_print1<a5>(tup.5)
val () = t1up_print$sep()
val () = gl_print1<a6>(tup.6)
val () = t1up_print$sep()
val () = gl_print1<a7>(tup.7)
val () = t1up_print$sep()
val () = gl_print1<a8>(tup.8)
val () = t1up_print$sep()
val () = gl_print1<a9>(tup.9)
val () = t1up_print$end((*nil*))
end // end of [gl_print1<t1up10>(tup)]
//
(* ****** ****** *)
(*
HX-2023-08-13:
tuples as sequences
*)
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0}
gseq_forall
<(a0,a1)>(tup) =
(
if
not
(forall$test<a0>(tup.0))
then false else
(
  forall$test<a1>(tup.1)) )
// end of [gseq_forall<t2up>(tup)]
//
#impltmp
{a0:t0
,a1:t0
,a2:t0}
gseq_forall
<
(a0
,a1,a2)>(tup) =
(
if
not
(forall$test<a0>(tup.0))
then false else
if
not
(forall$test<a1>(tup.1))
then false else
(
  forall$test<a2>(tup.2)) )
// end of [gseq_forall<t3up>(tup)]
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0}
gseq_forall
<
(a0,a1
,a2,a3)>(tup) =
(
if
not
(forall$test<a0>(tup.0))
then false else
if
not
(forall$test<a1>(tup.1))
then false else
if
not
(forall$test<a2>(tup.2))
then false else
(
  forall$test<a3>(tup.3)) )
// end of [gseq_forall<t4up>(tup)]
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0}
gseq_forall
<
(a0
,a1,a2
,a3,a4)>(tup) =
(
if
not
(forall$test<a0>(tup.0))
then false else
if
not
(forall$test<a1>(tup.1))
then false else
if
not
(forall$test<a2>(tup.2))
then false else
if
not
(forall$test<a3>(tup.3))
then false else
(
  forall$test<a4>(tup.4)) )
// end of [gseq_forall<t5up>(tup)]
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0}
gseq_forall
<
(a0,a1
,a2,a3
,a4,a5)>(tup) =
(
if
not
(forall$test<a0>(tup.0))
then false else
if
not
(forall$test<a1>(tup.1))
then false else
if
not
(forall$test<a2>(tup.2))
then false else
if
not
(forall$test<a3>(tup.3))
then false else
if
not
(forall$test<a4>(tup.4))
then false else
(
  forall$test<a5>(tup.5)) )
// end of [gseq_forall<t6up>(tup)]
//
(* ****** ****** *)
//
#impltmp
{a0:t0
,a1:t0}
gseq_foreach
<(a0,a1)>(tup) =
( foreach$work<a0>(tup.0)
; foreach$work<a1>(tup.1) )
// end of [gseq_foreach<t2up>(tup)]
//
#impltmp
{a0:t0
,a1:t0
,a2:t0}
gseq_foreach
<
(a0
,a1,a2)>(tup) =
( foreach$work<a0>(tup.0)
; foreach$work<a1>(tup.1)
; foreach$work<a2>(tup.2) )
// end of [gseq_foreach<t3up>(tup)]
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0}
gseq_foreach
<
(a0,a1
,a2,a3)>(tup) =
( foreach$work<a0>(tup.0)
; foreach$work<a1>(tup.1)
; foreach$work<a2>(tup.2)
; foreach$work<a3>(tup.3) )
// end of [gseq_foreach<t4up>(tup)]
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0}
gseq_foreach
<
(a0
,a1,a2
,a3,a4)>(tup) =
( foreach$work<a0>(tup.0)
; foreach$work<a1>(tup.1)
; foreach$work<a2>(tup.2)
; foreach$work<a3>(tup.3)
; foreach$work<a4>(tup.4) )
// end of [gseq_foreach<t5up>(tup)]
//
#impltmp
{a0:t0
,a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0}
gseq_foreach
<
(a0,a1
,a2,a3
,a4,a5)>(tup) =
( foreach$work<a0>(tup.0)
; foreach$work<a1>(tup.1)
; foreach$work<a2>(tup.2)
; foreach$work<a3>(tup.3)
; foreach$work<a4>(tup.4)
; foreach$work<a5>(tup.5) )
// end of [gseq_foreach<t6up>(tup)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_tupl000.dats] *)
