(* ****** ****** *)
(*
Sun 26 May 2024 06:04:03 PM EDT
*)
(* ****** ****** *)

fun{a:t@ype}
g_free<a:type>(x:int, y: int)

datatype
list(a:t@ype)
| list_nil // of ()
| list_cons of (a, list(a))

fun{a:type}
list_length<a>(xs: list(a)): sint =
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => 1 + list_length(xs)

fun{a:type}
list_vt_length<a>(xs: list(a)): sint =
case+ xs
| list_nil() => 0
| list_cons(_, xs) => 1 + list_length(xs)

#impltmp<a>
list_btw_vt(s1,f2) =
let
//
#vwtpdef tres = list_vt(a)
//
fnx
loop(i0: sint, r0: tres): tres =
if (i0 = f2)
then
  r0
else
  loop(i0+1, r0) where
  { val x0 = g_si<a>(i0)
    val r0 = list_vt_cons(x0, r0) }
endif // if (i0 = f0)
//
in//let
(
  if s1 > f2
  then
    list_vt_nil()
  else
    list_vt_reverse0<a>(loop(s1,list_vt_nil))
)
end(*let*)
//
(* ****** ****** *)
//
(*
HX-2026-04-19:
Suggestions for loop syntax:
Sun Apr 19 11:14:18 AM EDT 2026
*)
//
$forall x in xs with ( ... )
$foritm x in xs with ( ... )
$rforall x in xs with ( ... )
$rforitm x in xs with ( ... )
$iforall i, x in xs with ( ... )
$iforitm i, x in xs with ( ... )
$irforall i, x in xs with ( ... )
$irforitm i, x in xs with ( ... )
//
$z2forall x, y in xs, ys with ( ... )
//
$map_list x in xs with ( ... )
$map_strm x in xs with ( ... )
$map_strx x in xs with ( ... )
$map_llist x in xs with ( ... )
$map_lstrm x in xs with ( ... )
$map_lstrx x in xs with ( ... )
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3-Xanadu/docgenx/SYNTAX/ATS3-SyntaxDesign.dats] *)
