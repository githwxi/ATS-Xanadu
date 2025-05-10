(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-04-24:
For printing linear streams
Thu Apr 24 11:34:32 PM EDT 2025
*)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
strm_vt_beg(): strn
#extern
fun<>
strm_vt_end(): strn
#extern
fun<>
strm_vt_sep(): strn
#extern
fun<>
strm_vt_rst(): strn
//
#extern
fun
<x0:vt>
strm_vt_print0
(xs: strm_vt(x0)): void
fun<>
strm_vt_print$len(): sint
//
#extern
fun
<x0:vt>
strm_vt_all$print0
(xs: strm_vt(x0)): void
#extern
fun
<x0:vt>
strm_vt_len$print0
(xs: strm_vt(x0), ln: sint): void
//
(* ****** ****** *)
(* ****** ****** *)
#impltmp
{ x0:vt }
g_print0
<strm_vt(x0)> =
strm_vt_print0<x0>(*void*)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strm_vt_end() = ")"
#impltmp
<>(*tmp*)
strm_vt_sep() = ","
#impltmp
<>(*tmp*)
strm_vt_rst() = "..."
//
#impltmp
<>(*tmp*)
strm_vt_beg() = "$strm_vt("
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strm_vt_print$len() = (10)
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_print0(xs) =
let
val len = 
strm_vt_print$len<>()
in//let
if
(len < 0)
then strm_vt_all$print0(xs)
else strm_vt_len$print0(xs, len)
end (*let*) // end of [strm_vt_print0]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_all$print0
  (xs) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strm_vt_beg<>())
}
) where
{
#vwtpdef
xs = strm_vt(x0)
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(
pstrn(strm_vt_end<>())
)
| ~
strmcon_vt_cons(x0, xs) =>
let
//
val () =
if
(i0 > 0)
then
pstrn(strm_vt_sep<>())
//
in
(
  loop(xs, i0+1)) where
{
  val () = g_print0<x0>(x0)
}
end // end of [strmcon_vt_cons]
)
}(*where*)//end-of(strm_vt_all$print0)
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
strm_vt_len$print0
  (xs, n0) =
(
loop
(xs, 0(*i0*)) where
{
val () =
pstrn(strm_vt_beg<>())
}
) where
{
//
#vwtpdef
xs = strm_vt(x0)
//
fnx
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
pstrn(strm_vt_end<>())
| ~
strmcon_vt_cons(x0, xs) =>
if
(i0 >= n0)
then
let
//
val () =
g_free<x0>(x0)
val () =
strm_vt_free<x0>(xs)
//
val () =
if
(i0 > 0)
then
pstrn(strm_vt_sep<>())
//
val () =
pstrn(strm_vt_rst<>())
//
in
(
pstrn(strm_vt_end<>()))
end // end of [if-then]
else
let
//
val () =
if
(i0 > 0)
then
pstrn(strm_vt_sep<>())
//
in//let
(
  loop(xs, i0+1)) where
{
  val () = g_print0<x0>(x0)
}
end // end of [if-else]
)(*case+*)//end-of(loop(xs,i0))
}(*where*)//end-of(strm_vt_len$print0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_VT_strm000_vt.dats] *)
(***********************************************************************)
