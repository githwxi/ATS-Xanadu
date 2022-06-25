(* ****** ****** *)
#include
"prelude\
/HATS/prelude_dats.hats"
(* ****** ****** *)
//
(*
#ifdef(_XATSOPT_JS_)
*)
//
#include
"prelude\
/HATS/CATS/JS/prelude_dats.hats"
//
(*
#endif // end of [ifdef(_XATSOPT_JS_)]
*)
//
(* ****** ****** *)
#staload
"xatslib\
/libcats/SATS/libcats.sats"
#staload
"xatslib\
/libcats/SATS/synoug0.sats"
(* ****** ****** *)
#staload _ =
"xatslib\
/libcats/DATS/synoug0.dats"
(* ****** ****** *)
#staload
"xatslib\
/githwxi/SATS/genv000.sats"
#staload
"xatslib\
/githwxi/SATS/githwxi.sats"
(* ****** ****** *)
#staload _ =
"xatslib\
/githwxi/DATS/genv000.dats"
#staload _ =
"xatslib\
/githwxi/DATS/f00path.dats"
#staload _ =
"xatslib\
/githwxi/DATS/g00iout.dats"
(* ****** ****** *)
//
(*
#ifdef(_XATSOPT_JS_)
*)
//
#staload
"xatslib\
/githwxi\
/DATS/CATS/JS/Node/basics0.dats"
//
(*
#endif // end of [ifdef(_XATSOPT_JS_)]
*)
//
(* ****** ****** *)

#impltmp
strm_vt_print$len<>() = 5
#impltmp
strx_vt_print$len<>() = 10

(* ****** ****** *)

val () =
prerrln0
(
"optn(0) = ", optn(0)
)
val () =
prerrln0
(
"optn_vt(0) = ", optn_vt(0)
)

(* ****** ****** *)

val () =
prerrln0
(
"list_vt(0,1,2,...) = ", f0(0)
) where
{
val n = 5
fun
f0(x: int): list_vt(int) =
(
  if x >= n
  then list_vt_nil()
  else list_vt_cons(x, f0(x+1))
)
}

(* ****** ****** *)

val () =
prerrln0
(
"strm_vt(0,1,2,...) = ", f0(0)
) where
{
fun
f0(x: int): strm_vt(int) =
$llazy(strmcon_vt_cons(x, f0(x+1)))
}

(* ****** ****** *)

val () =
prerrln0
(
"strx_vt(0,1,2,...) = ", f0(0)
) where
{
fun
f0(x: int): strx_vt(int) =
$llazy(strxcon_vt_cons(x, f0(x+1)))
}

(* ****** ****** *)

(* end of [test01_synoug0.dats] *)

