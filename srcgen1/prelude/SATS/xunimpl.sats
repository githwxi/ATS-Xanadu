(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-07-10:
These are newly designed function interfaces ATS3,
which are not supposed to be implemented in srcgen1
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
foritm$work(x0: x0): void
//
fun
<x0:t0>
rforitm$work(x0: x0): void
//
fun
<x0:t0>
iforitm$work(ni, x0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
folditm$fopr(r0, x0): (r0)
fun
<x0:t0>
<r0:vt>
foldall$fopr(r0, x0): (bool, r0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
rfolditm$fopr(x0, r0): (r0)
fun
<x0:t0>
<r0:vt>
rfoldall$fopr(x0, r0): (bool, r0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
ifolditm$fopr(r0, ni, x0): (r0)
fun
<x0:t0>
<r0:vt>
ifoldall$fopr(r0, n0, x0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
z2forall$work(x0, y0): void
fun
<x0:t0
,y0:t0>
rz2forall$work(x0, y0): void
fun
<x0:t0
,y0:t0>
iz2forall$work(ni, x0, y0): void
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
z2foritm$work(x0, y0): void
fun
<x0:t0
,y0:t0>
rz2foritm$work(x0, y0): void
fun
<x0:t0
,y0:t0>
iz2foritm$work(ni, x0, y0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_sum(xs: xs): (x0)
fun
<xs:t0>
<x0:t0>
gseq_prod(xs: xs): (x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_foritm(xs: xs): void
fun
<xs:t0>
<x0:t0>
gseq_rforitm(xs: xs): void
fun
<xs:t0>
<x0:t0>
gseq_iforitm(xs: xs): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldall(xs, r0): ( r0 )
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfolditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfoldall(xs, r0): ( r0 )
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifolditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldall(xs, r0): ( r0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_map_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_map_self(xs: xs): (xs)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_filter_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_filter_self(xs: xs): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:t0>
<y0:vt>
mapstrq$fopr(itm: x0): strq_vt(y0)
*)
fun
<x0:t0>
<y0:vt>
rmapstrq$fopr(itm: x0): strq_vt(y0)
fun
<x0:t0>
<y0:vt>
imapstrq$fopr(pos: ni, itm: x0): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
nint_forall(xs: nint): bool
fun<>
nint_foritm(xs: nint): bool
//
fun<>
nint_rforall(xs: nint): bool
fun<>
nint_rforitm(xs: nint): bool
//
fun<>
nint_iforall(xs: nint): bool
fun<>
nint_iforitm(xs: nint): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
strn_gmake( a ): strn
//
fun<>
strn_foritm(cs: strn): void
//
(* ****** ****** *)
//
fun
<a:t0>
strn_vt_gmake(obj: a): strn_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_foritm(xs: list(x0)): void
fun
<x0:t0>
list_rforitm(xs: list(x0)): void
fun
<x0:t0>
list_iforitm(xs: list(x0)): void
//
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_xunimpl.sats] *)
