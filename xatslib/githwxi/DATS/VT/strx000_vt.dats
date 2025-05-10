(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-05-10
For printing linear streams
Sat May 10 05:29:18 PM EDT 2025
*)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
strx_vt_beg(): strn
#extern
fun<>
strx_vt_end(): strn
#extern
fun<>
strx_vt_sep(): strn
#extern
fun<>
strx_vt_rst(): strn
//
#extern
fun
<x0:vt>
strx_vt_print0
(xs: strx_vt(x0)): void
fun<>
strx_vt_print$len(): sint
//
#extern
fun
<x0:vt>
strx_vt_all$print0
(xs: strx_vt(x0)): void
#extern
fun
<x0:vt>
strx_vt_len$print0
(xs: strx_vt(x0), ln: sint): void
//
(* ****** ****** *)
(* ****** ****** *)
#impltmp
{ x0:vt }
g_print0
<strx_vt(x0)> =
strx_vt_print0<x0>(*void*)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strx_vt_end() = ")"
#impltmp
<>(*tmp*)
strx_vt_sep() = ","
#impltmp
<>(*tmp*)
strx_vt_rst() = "..."
//
#impltmp
<>(*tmp*)
strx_vt_beg() = "$strx_vt("
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strx_vt_print$len() = (10)
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strx_vt_print0(xs) =
let
val len = 
strx_vt_print$len<>()
in//let
if
(len < 0)
then strx_vt_all$print0(xs)
else strx_vt_len$print0(xs, len)
end (*let*) // end of [strx_vt_print0]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strx_vt_all$print0
  (xs) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strx_vt_beg<>())
}
) where
{
#vwtpdef
xs = strx_vt(x0)
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strxcon_vt_cons(x0, xs) =>
let
//
val () =
if
(i0 > 0)
then
pstrn(strx_vt_sep<>())
//
in
(
  loop(xs, i0+1)) where
{
  val () = g_print0<x0>(x0)
}
end // end of [strxcon_vt_cons]
)
}(*where*)//end-of(strx_vt_all$print0)
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strx_vt_len$print0
  (xs, n0) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strx_vt_beg<>())
}
) where
{
//
#vwtpdef
xs = strx_vt(x0)
//
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strxcon_vt_cons(x0, xs) =>
if
(i0 >= n0)
then
let
//
val () =
g_free<x0>(x0)
val () =
strx_vt_free<x0>(xs)
//
val () =
if
(i0 > 0)
then
pstrn(strx_vt_sep<>())
//
val () =
pstrn(strx_vt_rst<>())
//
in
(
pstrn(strx_vt_end<>()))
end // end of [if-then]
else
let
//
val () =
if
(i0 > 0)
then
pstrn(strx_vt_sep<>())
//
in//let
(
  loop(xs, i0+1)) where
{
  val () = g_print0<x0>(x0)
}
end // end of [if-else]
)(*case+*)//end-of(loop(xs,i0))
}(*where*)//end-of(strx_vt_len$print0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_VT_strx000_vt.dats] *)
(***********************************************************************)
