(* ****** ****** *)
(*
** For forint-loops
*)
(* ****** ****** *)
//
(*
#staload
"./../SATS/xfor.sats"
*)
//
(* ****** ****** *)

impltmp
<n1>(*tmp*)
g_x1forint
( n1 ) =
loop(0, n1) where
{
fun
loop
{n1:int
;i1:nat
|i1<=n1}.<n1-i1>.
( i1:int(i1)
, n1:int(n1)): void =
if
(i1 < n1)
then
(
loop(succ(i1), n1)
) where
{
val () = x1forint$work<n1>(i1)
}
else ( (* else *) )
} (* end of [g_x1forint] *)

(* ****** ****** *)

impltmp
<n1,n2>
g_x2forint
( n1, n2 ) =
let
fun
loop1
( i1
: nintlt(n1)) =
(
  g_x1forint<n2>( n2 )
) where
{
impltmp
x1forint$work<n2>
  (i2) =
(
  x2forint$work<n1,n2>(i1, i2)
)
}
in
(
  g_x1forint<n1>( n1 )
) where
{
  impltmp x1forint$work<n1> = loop1
}
end (* end of [x2forint] *)

(* ****** ****** *)

impltmp
<n1,n2,n3>
g_x3forint(n1,n2,n3) =
let
fun
loop1
( i1
: nintlt(n1)) =
(
  g_x2forint<n2,n3>(n2,n3)
) where
{
impltmp
x2forint$work<n2,n3>
  (i2, i3) =
(
x3forint$work<n1,n2,n3>(i1, i2, i3)
)
}
in
(
  g_x1forint<n1>( n1 )
) where
{
  impltmp x1forint$work<n1> = loop1
}
end (* end of [x3forint] *)

(* ****** ****** *)

(* end of [gfor.dats] *)
