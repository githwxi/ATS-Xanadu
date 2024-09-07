(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
For miscellaneous functions on
(non-linear) lists
Sat 07 Sep 2024 11:54:25 AM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:t0>
list_partit
(
xs: list(a),
test: (a)->bool): @(list(a), list(a))
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
list_partit
(xs, test) =
(
  loop(xs, ys, zs)) where
{
//
val ys = list_vt_nil()
val zs = list_vt_nil()
//
fun
loop(xs, ys, zs) =
case+ xs of
| list_nil() =>
(
vt2t(ys), vt2t(zs)) where
{
val ys = list_vt_reverse0(ys)
val zs = list_vt_reverse0(zs)}
| list_cons(x1, xs) =>
if
test(x1)
then
loop(xs, ys, zs) where
{
  val ys = list_vt_cons(x1, ys) }
else
loop(xs, ys, zs) where
{
  val zs = list_vt_cons(x1, zs) }
//
}(*where*)//end-of-[list_partit(xs,test)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_gint000.dats] *)
