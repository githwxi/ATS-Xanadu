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
("strm(0,1,2,...) = ", strm_from(0))
val () =
prerrln
("strx(0,1,2,...) = ", strx_from(0))

(* ****** ****** *)

val () =
prerrln0
("strm_vt(0,1,2,...) = ", strm_vt_from(0))

(* ****** ****** *)

val () =
prerrln0
("strx_vt(0,1,2,...) = ", strx_vt_from(0))

(* ****** ****** *)
(*
// HX:
// Fri Jul  1 20:34:36 EDT 2022
*)
val xys =
gseq_z2map_fnp2
( list(1,3,5)
, list(2,4,6)
, lam(x:int,y:int) => 10*x+y)
val ( ) = prerrln("xys = ", xys)
//
(* ****** ****** *)
(*
// HX:
// Fri Jul  1 21:41:55 EDT 2022
*)
val xys =
gseq_x2map_list_cfr2
( list(1,3,5,7)
, list(0,2,4,8)
, lam(x:int,y:int) => 10*x + y)
val xys =
glseq_filter0(xys) where
{
#impltmp
filter0$test<int>(xy) = (xy % 10 <= 4)
}
val ( ) = prerrln("xys = ", xys)
//
(* ****** ****** *)
(*
// HX:
// Sat Jul  2 02:37:39 EDT 2022
*)
val ( ) =
gseq_x2iforeach_fnp4
( list(1,3,5),"2468"
, lam(i:int,x:int,j:int,y:char) =>
  (
  if j > 0 then prerr(",");
  prerr("(", x, ",", y, ")");
  if ((j+1)%4) = 0 then prerrln();
  )
) (* end of [gseq_x2iforeach_fnp4] *)
//
(* ****** ****** *)
//
(*
// HX-2022-07-03:
// Sun Jul  3 10:54:13 EDT 2022
*)
//
val ( ) =
prerrln0
(strm_vt_sieve0(f0(2))) where
{
//
#impltmp
strm_vt_print$len<>() = 020(*16*)
//
fun
f0(x: int): strm_vt(int) =
$llazy(strmcon_vt_cons(x, f0(x+1)))
//
#impltmp
sieve0$test<sint>(x1, x2) = x2 % x1 > 0
}
//
(* ****** ****** *)
(*
// HX-2022-07-03
*)
//
#typedef
sint3 = (sint, sint, sint)
//
val
the_pints =
strm_from(1)
//
val
the_cbsums =
strm_x2map_vt_cmp
(the_pints, the_pints) where
{
#impltmp
g_cmp<sint3>
(xyz1, xyz2) =
(xyz1.2 \cmp xyz2.2)
#impltmp
x2map$fopr
<sint
,sint>
<sint3>(x,y) = (x,y,x*x*x+y*y*y)
}(*where*)// end of [val(the_cbsums]
//
val
the_cbsums =
strm_vt_filter0<sint3>(the_cbsums)
where {
#impltmp
filter0$test<sint3>(xyz)=(xyz.0<=xyz.1)
} (*where*)
//
fun
ramanujan1
( xyzs
: strm_vt(sint3))
: strm_vt(list_vt(sint3)) =
(
case- !xyzs of
| ~
strmcon_vt_cons
  (xyz1, xyzs) =>
(
ramanujan2(xyz1, xyzs, list_vt_nil())
)
) (* end of [case] *)
//
and
ramanujan2
( xyz1
: sint3
, xyzs
: strm_vt(sint3)
, res0: list_vt(sint3))
: strm_vt(list_vt(sint3)) =
$llazy
(
case- !xyzs of
| ~
strmcon_vt_cons
  (xyz2, xyzs) =>
(
if
(xyz1.2 = xyz2.2)
then !
(
ramanujan2
( xyz1
, xyzs
, list_vt_cons(xyz2, res0)))
else
(
case+ res0 of
| ~
list_vt_nil() => !
(
ramanujan2(xyz2, xyzs, list_vt_nil())
)
| !
list_vt_cons _ =>
let
val res1 =
list_vt_cons(xyz1, reverse0(res0))
in//let
strmcon_vt_cons
( res1
, ramanujan2(xyz2, xyzs, list_vt_nil()))
endlet // end of [list_vt_cons]
)
)
)(* end-of-[ramanujan2(xyz1,xyzs,res0)] *)
//
val
the_ramanujans =
ramanujan1(the_cbsums)
//
local
//
#impltmp
g_print<sint3>(xyz) =
print
("("
,xyz.0,"^3"," + "
,xyz.1,"^3"," = ",xyz.2,")"
)
//
#impltmp strm_vt_print$len<>() = 50
//
in//local
val () =
prerrln0("the_ramanujans = ", the_ramanujans)
end//local
//
(* ****** ****** *)

(* end of [test01_synoug0.dats] *)
