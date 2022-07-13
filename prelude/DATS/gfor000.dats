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
//
#impltmp
<a:t0>
range_make_arg2
(  s1, f2  ) = RANGE3(s1, f2, 1)
#impltmp
<a:t0>
range_make_arg3
(s1, f2, d3) = RANGE3(s1, f2, d3)
//
(* ****** ****** *)

#impltmp
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
}(*where*)//end-of-[g_x1forint(n1)]

(* ****** ****** *)

#impltmp
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
#impltmp
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
#impltmp x1forint$work<n1> = loop1
}
end(*let*)//end-of-[g_x2forint(n1,n2)]

(* ****** ****** *)

#impltmp
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
#impltmp
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
  #impltmp x1forint$work<n1> = loop1
}
end(*let*)//end-of-[g_x3forint(n1,n2,n3)]

(* ****** ****** *)
#impltmp
{x0:t0}
range_forall<x0> = gseq_forall<range(x0)><x0>
#impltmp
{x0:t0}
range_foreach<x0> = gseq_foreach<range(x0)><x0>
#impltmp
{x0:t0}
{r0:t0}
range_foldl<x0><r0> = gseq_foldl<range(x0)><x0><r0>
(* ****** ****** *)

#impltmp
<x0:t0>
range_strmize(xs) =
let
//
fun
fsucc
(s1: x0, d3: sint): x0 =
if d3 > 0
then
fsucc
(g_succ<x0>(s1), d3-1) else s1
fun
fpred
(s1: x0, d3: sint): x0 =
if d3 < 0
then
fpred
(g_pred<x0>(s1), d3+1) else s1
//
fun
auxmain1
( s1: x0
, f2: x0, d3: sint): strm_vt(x0) =
$llazy
(
if
(s1 < f2)
then
strmcon_vt_cons
(
s1,
auxmain1
(fsucc(s1,d3),f2,d3)) else strmcon_vt_nil())
//
fun
auxmain2
( s1: x0
, f2: x0, d3: sint): strm_vt(x0) =
$llazy
(
if
(s1 > f2)
then
strmcon_vt_cons
(
s1,
auxmain2
(fpred(s1,d3),f2,d3)) else strmcon_vt_nil())
//
in
let
val+
RANGE3(s1, f2, d3) = xs in
if
(d3 >= 0)
then
auxmain1(s1, f2, d3) else auxmain2(s1, f2, d3)
end(* let *)
end(* let *) // end of [ range_strmize( xs ) ]

(* ****** ****** *)

#impltmp
{x0:t0}
gseq_strmize<range(x0)><x0> = range_strmize<x0>

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gfor000.dats] *)
