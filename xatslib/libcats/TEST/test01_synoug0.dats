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
strm_print$len<>() = 5
#impltmp
strx_print$len<>() = 10
#impltmp
strm_vt_print$len<>() = 5
#impltmp
strx_vt_print$len<>() = 10

(* ****** ****** *)
//
val () =
prerrln
(
"a0ref(0) = ", A0
) where
{
  val A0 = a0ref(0)
}
//
val () =
prerrln
(
"a1ref(1,2,3,4,5) = ", A1
) where
{
val A1 =
a1ref_make_list
(list(1,2,3,4,5))
#impltmp
{a:vt}
a1ref_length<a><5>(A1) = 5
}
//
(* ****** ****** *)

val () =
prerrln
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
prerrln
(
"list(0,1,2) = ", list(0,1,2)
) (* end of [val] *)

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
prerrln
(
"strm(0,1,2,...) = ", f0(0)
) where
{
fun
f0(x: int): strm(int) =
$lazy(strmcon_cons(x, f0(x+1)))
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
prerrln
(
"strx(0,1,2,...) = ", f0(0)
) where
{
fun
f0(x: int): strx(int) =
$lazy(strxcon_cons(x, f0(x+1)))
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

#impltmp
{a:t0}
gseq_strmize<list(a)><a> = list_strmize<a>

#impltmp
<xs><x0>
gseq_forall
  (xs) =
let
val
xs = gseq_strmize<xs><x0>(xs)
in//let
strm_vt_forall0<x0>(xs) where
{
  #impltmp
  forall0$test<x0> = forall$test<x0>
}
end (*let*)//end of [gseq_forall/strmize]

(* ****** ****** *)
(*
// HX:
// Fri Jul  1 20:34:36 EDT 2022
*)
val xys =
gseq_z2map_list_cfr2
( list(1,3,5)
, list(2,4,6)
, lam(x:int,y:int) => 10*x + y)
val ( ) = prerrln("xys = ", xys)
//
(* ****** ****** *)
(*
// HX:
// Fri Jul  1 21:41:55 EDT 2022
*)
val xys =
gseq_x2map_strm_cfr2
( list(1,3,5)
, list(2,4,6)
, lam(x:int,y:int) => 10*x + y)
val ( ) =
prerrln0("xys = ", xys)
where { #impltmp strm_vt_print$len() = -1 }
//
(* ****** ****** *)

(* end of [test01_synoug0.dats] *)
