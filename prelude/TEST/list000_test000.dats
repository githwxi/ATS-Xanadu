(* ****** ****** *)

#staload
"prelude\
/SATS/rand000.sats"

(* ****** ****** *)

val N = 10

(* ****** ****** *)
#typedef int0 = sint
#typedef ints = list(int0)
(* ****** ****** *)
//
fun
<a:type>
myfun_rand_test
(f0: c1fr(a,bool)): void =
N.foreach_cfr
(
lam _ =>
if // if
f0(g_rand<a>())
then () else $raise AssertExn())
//
(* ****** ****** *)

(*
#symload = with g_equal of 1000
*)

(* ****** ****** *)

val () =
myfun_rand_test
(
lam(xs:ints)=>
(length(xs) = length(reverse(xs))))

(* ****** ****** *)

val () =
myfun_rand_test
(
lam@(xs:ints,ys:ints)=>
(length(append(xs,ys)) = length(xs)+length(ys)))

(* ****** ****** *)

val () =
myfun_rand_test
(
lam(xs:ints)=>
(xs = reverse(reverse(xs))))

(* ****** ****** *)

val () =
myfun_rand_test
(
lam@(xs:ints,ys:ints)=>
(reverse(append(xs,ys)) =
 append(reverse(ys), reverse(xs))))

(* ****** ****** *)

val () =
myfun_rand_test
(
lam(xss: list(ints)) =>
(length(concat(xss)) =
 xss.foldl_cfr
 (0, lam(r0:int0, xs) => r0 + length(xs))))

(* ****** ****** *)

val () =
myfun_rand_test
(
lam@(xs:ints,ys:ints,zs:ints)=>
(append(append(xs,ys),zs) = append(xs,append(ys,zs))))

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_list000_test000.dats] *)
