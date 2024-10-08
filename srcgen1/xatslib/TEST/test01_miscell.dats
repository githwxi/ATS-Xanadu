(* ****** ****** *)
#include
"./xats2js_test.hats"
(* ****** ****** *)
//
(*
#impltmp
< a:vt >
g_free(x) = ()
*)
//
#impltmp
strn_vt_free<>(x) = ()
//
(* ****** ****** *)
//
#impltmp
strm_print$len<>() = 5
#impltmp
strx_print$len<>() = 10
#impltmp
strm_vt_print$len<>() = 5
#impltmp
strx_vt_print$len<>() = 10
//
(* ****** ****** *)
val () =
prerrln
("3 + -2 = ", 3 + -2)
val () =
prerrln
("3 * -2 = ", 3 * (-2))
(* ****** ****** *)

val () =
prerrln0(strmize(10))
val () =
prerrln0(listize(10))

(* ****** ****** *)

val () =
prerrln0(strmize"abcde")
val () =
prerrln0(listize"abcde")

(* ****** ****** *)
val () =
prerrln0(list(list(list(1))))
val () =
prerrln0(list_vt(list_vt(list_vt(1))))
(* ****** ****** *)

val () =
prerrln0(
"concat(...) = ",
gseq_concat_lstrn
(list("Hello",",","world","!")))

(* ****** ****** *)

val () =
prerrInc('A') where
{
fun
prerrInc
(n:char) =
(prerrln plusOne) where { val plusOne = n+1 }
}

(* ****** ****** *)
//
val () =
prerrln
(0,'0',false,0.0,"0")
val () =
prerrln
(@(0,'0',false,0.0,"0"))
//
(* ****** ****** *)
//
val () =
prerrln
(0,1,2,3,4,5,6,7,8,9)
val () =
prerrln
(@(0,1,2,3,4,5,6,7,8,9))
val () =
prerrln
(#(0,1,2,3,4,5,6,7,8,9))
//
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
(*
val () =
prerrln
(
"a1ref(1,2,3,4,5) = ", A1
) where
{
val A1 =
a1ref_make_list
(list(1,2,3,4,5))
#impltmp{a:vt}a1ref_length<a><5>(A1) = 5
}
*)
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

val xs1 = list(1,2,3,4,5)
val xs2 =
(*
gseq_z2map_list(xs1, xs1)//HX: FIXME!!!
*)
gseq_z2map_llist
<list(int),list(int)><int,int>(xs1, xs1)
where
{
#impltmp
z2map$fopr<int,int><int>(x0, y0) = x0 + y0 }
val ( ) = prerrln0("xs2 = ", xs2)

(* ****** ****** *)
(*
// HX:
// Fri Jul  1 20:34:36 EDT 2022
*)
val ( ) = prerrln("xys = ", xys) where
{
val xys =
gseq_z2map_f2np
( list(1,3,5)
, list(2,4,6), lam(x:int,y:int) => 10*x+y) }
//
(* ****** ****** *)
(*
// HX:
// Fri Jul  1 21:41:55 EDT 2022
*)
val ( ) =
prerrln0("xys = ", xys) where
{
val xys =
gseq_x2map_c2fr_llist
( list(1,3,5,7)
, list(0,2,4,8)
, lam(x:int,y:int) => 10*x + y)
val xys =
glseq_filter0(xys) where
{
#impltmp
filter0$test<int>(xy) = (xy % 10 <= 4) } }
//
(* ****** ****** *)
(*
// HX:
// Sat Jul  2 02:37:39 EDT 2022
*)
val ( ) =
gseq_x2iforitm_f4np
( list(1,3,5),"2468"
, lam(i:int,x:int,j:int,y:char) =>
  (
  if j > 0 then prerr(",");
  prerr("(", x, ",", y, ")");
  if ((j+1)%4) = 0 then prerrln();
  )
) (* end of [gseq_x2iforitm_f4np] *)
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
(*
#impltmp
g_print<sint3>(xyz) =
print
("("
,xyz.0,"^3"," + "
,xyz.1,"^3"," = ",xyz.2,")"
) (* end of [g_print(xyz)] *)
*)
//
#impltmp strm_vt_print$len<>() = 10
//
in//local
val () =
prerrln0("the_ramanujans = ", the_ramanujans)
end//local
//
(* ****** ****** *)

val () =
prerrln
("gappend(...) = ", gappend("a", "b"))
val () =
prerrln
("gappend(...) = ", gappend("cd", "ef", "gh"))
val () =
prerrln
("strnlst_concat(...) = ", strnlst_concat(list("ax","by")))

(* ****** ****** *)

val ab =
strn_copy_vt("ab")
val cd =
strn_copy_vt("cd")
val ef =
strn_copy_vt("ef")
val () = prerrln("ab = ", ab)
val () = prerrln("cd = ", cd)
val () = prerrln("ef = ", ef)
val () = prerrln("glappend1(...) = ", glappend1(ab, cd, ef))
val () = prerrln("glappend0(...) = ", glappend0(ab, cd, ef))

(* ****** ****** *)

val ab = list_vt('a', 'b')
val cd = list_vt('c', 'd')
val ef = list_vt('e', 'f')
val () = prerrln("ab = ", ab)
val () = prerrln("cd = ", cd)
val () = prerrln("ef = ", ef)
val () =
prerrln
("glappend1(...) = ", glappend1(ab, cd, ef))
val () =
prerrln
("glappend0(...) = ", glappend0(ab, cd, ef))

(* ****** ****** *)

val () =
prerrln("0-9 = ", gseq_range_lte<strn>('0', '9'))
val () =
prerrln("a-z = ", gseq_range_lte<strn>('a', 'z'))
val () =
prerrln("A-Z = ", gseq_range_lte<strn>('A', 'Z'))

(* ****** ****** *)

val () =
prerrln("list(1) > list(0,1): ", list(1) > list(0,1))
val () =
prerrln("list(0) < list(0,1): ", list(1) > list(0,1))

(* ****** ****** *)

val () =
prerrln("list_btw(1, 10) = ", list_btw<sint>(1, 10))
val () =
prerrln("list_btwe(1, 10) = ", list_btwe<sint>(1, 10))

(* ****** ****** *)

val () =
prerrln
("gseq_take(\"abcdefg\", 3) = ", gseq_take("abcdefg", 3))
val () =
prerrln
("gseq_drop(\"abcdefg\", 3) = ", gseq_drop("abcdefg", 3))

(* ****** ****** *)
//
local
val
linum =
fenum
(strx_vt_from(0))
in//local
val () =
foritm(10) where
{
#impltmp
foritm$work<int>(i0) =
prerrln("linum() = ", linum())
}
endloc (*local*) // end of [local(linum)]
//
(* ****** ****** *)

val strm =
strm_vt_range_lte(1, 1000000)
val (  ) =
prerrln
("sum(strm) = ", strm_vt_add0(strm))

(* ****** ****** *)

val xs =
list
("Hello", ",", "world", "!")
local
//
#impltmp
g_max<strn>(x, y) =
if
(  length x
>= length y ) then x else y
//
#impltmp gseq_max$nil<strn>() = ""
//
in//local
val () =
prerrln
("gseq_max(", xs, ") = "
, gseq_max<list(strn)><strn>(xs))
endloc (*local*) // end of [gseq_max(xs)]

(* ****** ****** *)

val () =
prerrln
( "gmax(1,2,3,4,5) = "
, gmax('1', '2', '3', '4', '5'))
val () =
prerrln
( "gmin(1,2,3,4,5) = "
, gmin("1", "2", "3", "4", "5"))

(* ****** ****** *)

val () =
prerrln
("reverse(...) = "
, strn_reverse(gseq_range_lte('a', 'z')))

(* ****** ****** *)
//
val () =
prerrln0
("range1(0,10) = ", strmize(range1(0,10)))
val () =
prerrln0
("r(range1(0,10)) = ", rstrmize(range1(0,10)))
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prerrln0
("range1(10,0) = ", listize(range1(10,0)))
val () =
prerrln0
("r(range1(10,0)) = ", rlistize(range1(10,0)))
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
let
#impltmp
foldl$fopr<sint><sint>(r0,x0) = r0*( x0+1 )
in
prerrln0
("product(range1(0,10)+1) = ", foldl(range1(0,10), 1))
end(*let*)
//
(* ****** ****** *)

val () = prerrln("b0 = ", b0) where
{
  val b0 =
  exists(
  list_map_f1np
  (list_btw(0, 10), lam(x:int) => x >= 10))
}

(* ****** ****** *)

val () = prerrln("b0 = ", b0) where
{
  val b0 =
  forall(
  list_map
  (list_btw(0, 10)) where
  {
    #impltmp map$fopr<sint><bool>(x) = (x < 10) } )
}

(* ****** ****** *)

(* end of [ATS3/xatslib/TEST/test01_miscell.dats] *)
