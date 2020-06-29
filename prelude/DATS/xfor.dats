(* ****** ****** *)
(*
** For x-for-loops
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
x1for( n1 ) =
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
val () = x1for$work<n1>(i1)
}
else ( (* else *) )
} (* end of [x1for] *)

(* ****** ****** *)

impltmp
<n1,n2>
x2for(n1,n2) =
let
fun
loop1
( i1
: nintlt(n1)) =
(
  x1for<n2>( n2 )
) where
{
impltmp
x1for$work<n2>
  (i2) =
(
  x2for$work<n1,n2>(i1, i2)
)
}
in
(
  x1for<n1>( n1 )
) where
{
  impltmp x1for$work<n1> = loop1
}
end (* end of [x2for] *)

(* ****** ****** *)

impltmp
<n1,n2,n3>
x3for(n1,n2,n3) =
let
fun
loop1
( i1
: nintlt(n1)) =
(
  x2for<n2,n3>(n2,n3)
) where
{
impltmp
x2for$work<n2,n3>
  (i2, i3) =
(
x3for$work<n1,n2>(i1, i2, i3)
)
}
in
(
  x1for<n1>( n1 )
) where
{
  impltmp x1for$work<n1> = loop1
}
end (* end of [x3for] *)

(* ****** ****** *)

(* end of [xfor.dats] *)
