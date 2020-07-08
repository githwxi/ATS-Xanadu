(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
//
#extern
fun
<a:type>
list_nchoose1
(xs: list(a), n0: nint): stream_vt(list(a))
#extern
fun
<a:type>
list_nchoose2
(xs: list(a), n0: nint): stream_vt@(list(a),list(a))
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
list_nchoose1
  (xs, n0) =
(
let
val
m0 =
list_length(xs)
in
if
(m0 < n0)
then
stream_vt_nil()
else
auxmain(xs, m0, n0)
end
) where
{
//
fun
auxmain
( xs
: list(a)
, m0: nint
, n0: nint): stream_vt(list(a)) =
$llazy
(
if
(m0 = n0)
then
strmcon_vt_sing(xs)
else
(
case+ xs of
| list_nil() =>
  strmcon_vt_nil()
| list_cons(x0, xs) => !
  stream_vt_append<list(a)>
  (
  stream_vt_mcons<a>
  (x0, auxmain(xs, m0-1, n0-1)), auxmain(xs, m0-1, n0)
  ) (* end of [list_cons] *)
)
)
//
} endwhr (* end of [list_nchoose1] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
list_nchoose2
  (xs, n0) =
(
let
val
m0 =
list_length(xs)
in
if
(m0 < n0)
then
stream_vt_nil()
else
auxmain(xs, m0, n0)
end
) where
{
//
typedef
res =
(list(a), list(a))
//
fun
auxmain
( xs
: list(a)
, m0: nint
, n0: nint)
: stream_vt(res) =
$llazy
(
if
(m0 = n0)
then
strmcon_vt_sing
@(xs, list_nil())
else
(
case+ xs of
|
list_nil() =>
strmcon_vt_nil()
|
list_cons(x0, xs) =>
let
//
val m1 = m0-1
and n1 = n0-1
//
val
rs1 =
stream_vt_map0
(
auxmain(xs, m1, n1)
) where
{
impltmp
map0$fopr<res><res>(rr) =
  (list_cons(x0, rr.0), rr.1)
}
val
rs2 =
stream_vt_map0
(
auxmain(xs, m1, n0)
) where
{
impltmp
map0$fopr<res><res>(rr) =
  (rr.0, list_cons(x0, rr.1))
}
in
  !(stream_vt_append<res>(rs1, rs2))
end // list_cons
) (* end of [else] *)
) (* end of [auxmain] *)
//
} endwhr (* end of [list_nchoose2] *)

(* ****** ****** *)

(* end of [test04.dats] *)
