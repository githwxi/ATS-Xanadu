(* ****** ****** *)
(*
** for tuples
*)
(* ****** ****** *)
//
(*
#vwtpdef
t0up1(a0:vt) = @(a0)
*)
#vwtpdef
t1up1(a0:vt) = $(a0)
//
(* ****** ****** *)
#vwtpdef
t0up2
(a0:vt,a1:vt) = @(a0,a1)
#vwtpdef
t1up2
(a0:vt,a1:vt) = $(a0,a1)
(* ****** ****** *)
#vwtpdef
t0up3
(a0:vt
,a1:vt,a2:vt) = @(a0,a1,a2)
#vwtpdef
t1up3
(a0:vt
,a1:vt,a2:vt) = $(a0,a1,a2)
(* ****** ****** *)
fun<>
t0up_print$beg(): void // print("@(")
fun<>
t0up_print$end(): void // print (")" )
fun<>
t0up_print$sep(): void // print( "," )
(* ****** ****** *)
fun<>
t1up_print$beg(): void // print("$(")
fun<>
t1up_print$end(): void // print( ")" )
fun<>
t1up_print$sep(): void // print( "," )
(* ****** ****** *)
#vwtpdef
t0up4
(a0:vt
,a1:vt
,a2:vt
,a3:vt) = @(a0,a1,a2,a3)
#vwtpdef
t1up4
(a0:vt
,a1:vt
,a2:vt
,a3:vt) = $(a0,a1,a2,a3)
(* ****** ****** *)
#vwtpdef
t0up5
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt) = @(a0,a1,a2,a3,a4)
#vwtpdef
t1up5
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt) = $(a0,a1,a2,a3,a4)
(* ****** ****** *)
#vwtpdef
t0up6
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt) = @(a0,a1,a2,a3,a4,a5)
#vwtpdef
t1up6
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt) = $(a0,a1,a2,a3,a4,a5)
(* ****** ****** *)
#vwtpdef
t0up7
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt) = @(a0,a1,a2,a3,a4,a5,a6)
#vwtpdef
t1up7
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt) = $(a0,a1,a2,a3,a4,a5,a6)
(* ****** ****** *)
#vwtpdef
t0up8
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt) = @(a0,a1,a2,a3,a4,a5,a6,a7)
#vwtpdef
t1up8
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt) = $(a0,a1,a2,a3,a4,a5,a6,a7)
(* ****** ****** *)
#vwtpdef
t0up9
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt
,a8:vt) = @(a0,a1,a2,a3,a4,a5,a6,a7,a8)
#vwtpdef
t1up9
(a0:vt
,a1:vt
,a2:vt
,a3:vt
,a4:vt
,a5:vt
,a6:vt
,a7:vt
,a8:vt) = $(a0,a1,a2,a3,a4,a5,a6,a7,a8)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_tupl000.sats] *)
