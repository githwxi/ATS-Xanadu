(* ****** ****** *)
(*
** HX: For
** functional lin-streams
*)
(* ****** ****** *)
#abstbox box_tx
#typedef box = box_tx
(* ****** ****** *)
//
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strmcon_vt_nil_
((*void*)) =
strmcon_vt_nil(*void*)
#impltmp
<a>(*tmp*)
strmcon_vt_cons_
( x0, xs ) =
strmcon_vt_cons(x0, xs)
//
#impltmp
<a>(*tmp*)
strxcon_vt_cons_
( x0, xs ) =
strxcon_vt_cons(x0, xs)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strmcon_vt_sing
(  x0  ) =
strmcon_vt_cons
(x0, strm_vt_nil<a>())
#impltmp
<a>(*tmp*)
strmcon_vt_pair
( x0, y0 ) =
strmcon_vt_cons
(x0, strm_vt_sing<a>(y0))
//
(* ****** ****** *)
//
#impltmp
<x0><r0>
strmcon_vt_uncons_cfr
(xs, f0, f1) =
(
case+ xs of
| ~
strmcon_vt_nil() => f0((*void*))
| ~
strmcon_vt_cons(x0, xs) => f1(x0, xs)
)
#impltmp
<x0><r0>
strxcon_vt_uncons_cfr
(xs, f1) =
(
case+ xs of
| ~
strxcon_vt_cons(x0, xs) => f1(x0, xs)
)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strx_vt_strmize0
  ( xs ) =
(
  auxmain(xs)) where
{
//
fun
auxmain(xs) = $llazy
(
//
g_free(xs);
case+ !xs of
| ~
strxcon_vt_cons
( x0, xs ) =>
(
strmcon_vt_cons(x0, auxmain(xs)))
//
) (*case+*) // end of [auxmain(xs)]
//
} (*where*) // end-of(strx_vt_strmize0(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<a:vt>
strq_vt_strmize0
(xs: strq_vt(a)): strm_vt(a)
*)
#impltmp
<a>(*tmp*)
strq_vt_strmize0(xs) =
$UN.castlin01{strq_vt(a)}(xs)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strq_vt_listize0(xs) =
$UN.castlin01
(strm_vt_listize0<a>(xs)) where
{
val xs = strq_vt_strmize0<a>(xs) }
//
#impltmp
<a>(*tmp*)
strq_vt_rlistize0(xs) =
$UN.castlin01
(strm_vt_rlistize0<a>(xs)) where
{
val xs = strq_vt_strmize0<a>(xs) }
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
strx_vt_map0
  (xs) =
(
  auxmain(xs)
) where
{
fun
auxmain
( xs
: strx_vt(x0)
)
: strx_vt(y0) =
$llazy
(
//
g_free(xs);
//
case+ !xs of
| ~
strxcon_vt_cons(x0, xs) =>
let
  val y0 =
  map0$fopr<x0><y0>(x0)
in
  strxcon_vt_cons(y0, auxmain(xs))
end//let//end-[strxcon_vt_cons]
)
} (*where*) // end of [ strx_vt_map0(xs) ]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strx_vt_filter0
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain
( xs
: strx_vt(x0)
)
: strx_vt(x0) =
$llazy
(
g_free(xs);
auxloop($eval(xs)))
and
auxloop
( xs
: strxcon_vt(x0)
)
: strxcon_vt(x0) =
(
case+ xs of
| ~
strxcon_vt_cons
  (x0, xs) =>
( if
  filter0$test(x0)
  then
  strxcon_vt_cons(x0, auxmain(xs))
  else
  let
  val () = g_free(x0) in auxloop(!xs)
  end
) (* end of [strxcom_vt_cons] *)
)
} (*where*) // end of [strx_vt_filter0(xs)]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
strx_vt_mapopt0
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain
( xs
: strx_vt(x0)
)
: strx_vt(y0) =
$llazy
(
g_free(xs);
auxloop($eval(xs)))
and
auxloop
( xs
: strxcon_vt(x0)
)
: strxcon_vt(y0) =
(
case+ xs of
| ~
strxcon_vt_cons(x0, xs) =>
let
(*
  val
  opt =
  mapopt0$fopr<x0><y0>(x0)
*)
  val
  opt = filter0$test<x0>(x0)
in
(*
  case+ opt of
  | optn_vt_nil() =>
    auxloop($eval(xs)) // tail-call
  | optn_vt_cons(y0) =>
    strxcon_vt_cons(y0, auxmain(xs))
*)
  if
  opt
  then
  let
    val y0 =
    map0$fopr<x0><y0>(x0)
  in
    strxcon_vt_cons(y0, auxmain(xs))
  end
  else
  let
    val () =
    g_free(x0) in auxloop($eval(xs))
  end
//
end // end of [strxcon_vt_cons]
)
} (*where*) // end of [strx_vt_mapopt0(xs)]
//
(* ****** ****** *)
//
#impltmp
<x0:t0>
strx_vt_sieve0
  (  xs  ) =
(
auxmain(xs) ) where
{
fun
auxmain
( xs
: strx_vt(x0)
)
: strx_vt(x0) = $llazy
(
case+ !xs of
| ~
strxcon_vt_cons(x1, xs) =>
let
  val xs = 
  strx_vt_filter0<x0>(xs)
in
  strxcon_vt_cons(x1, auxmain(xs))
end where
{
#impltmp
filter0$test
< x0 >( x2 ) = sieve0$test<x0>(x1, x2)
}
)
} (*where*) // end-of-[ strx_vt_sieve0(xs) ]
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
strx_vt_imap0
  (xs) =
(
auxmain(0(*i0*), xs)
) where
{
fun
auxmain
( i0: nint
, xs
: strx_vt(x0)
)
: strx_vt(y0) =
$llazy
(
//
g_free(xs);
//
case+ !xs of
| ~
strxcon_vt_cons(x0, xs) =>
let
val y0 =
imap0$fopr<x0><y0>(i0, x0)
in
strxcon_vt_cons(y0, auxmain(i0+1, xs))
end // strxcon_vt_cons
) (* end of [auxmain] *)
} (*where*) // end-of-(strx_vt_imap0(xs))
//
(* ****** ****** *)
//
#impltmp
<x0><y0>
strx_vt_imapopt0
  (xs) =
(
auxmain(0(*i0*), xs)
) where
{
//
fnx
auxmain
( i0: nint
, xs
: strx_vt(x0)
)
: strx_vt(y0) =
$llazy
(
g_free(xs);
auxloop(i0, $eval(xs)))
//
and
auxloop
( i0: nint
, xs
: strxcon_vt(x0)
)
: strxcon_vt(y0) =
(
case+ xs of
| ~
strxcon_vt_cons(x0, xs) =>
let
  val i1 = succ(i0)
  val
  opt = ifilter0$test<x0>(i0, x0)
in
//
if
opt
then
let
val y0 =
imap0$fopr<x0><y0>(i0, x0)
in
strxcon_vt_cons(y0, auxmain(i1, xs))
end // end of [then]
else
let
val () =
g_free(x0) in auxloop(i1, $eval(xs))
end // end of [else]
//
end // end of [strxcon_vt_cons]
) (* end of [auxloop] *)
//
} (*where*)//end-of(strx_vt_imapopt0(xs))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strx_vt_istrmize0
  (xs) =
(
auxmain(0, xs)) where
{
fun
auxmain
( i0
: nint
, xs
: strx_vt(a))
: strm_vt(@(nint, a)) =
$llazy
(
g_free(xs);
case+ !xs of
| ~
strxcon_vt_cons
  ( x0, xs ) =>
(
  strmcon_vt_cons
  ( (i0, x0), auxmain(i0+1, xs) ) )
) (* end of [auxmain] *)
} (*where*)//end-of(strx_vt_istrmize0(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-01-02: for gseq-operations
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{x0:vt}
gseq_strmize0
<strx_vt(x0)><x0> = strx_vt_strmize0<x0>
#impltmp
{x0:vt}
gseq_strmize0
<strq_vt(x0)><x0> = strq_vt_strmize0<x0>
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strm001_vt.dats] *)
