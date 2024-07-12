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
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rstrqize0
(xs: ~xs): strq_vt(x0)//fun
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
fun
<x0:vt>
foritm0$work(x0: ~x0): void
fun
<x0:vt>
rforitm0$work(x0: ~x0): void
fun
<x0:vt>
iforitm0$work(ni, ~x0): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
folditm0$fopr(r0, ~x0): (r0)
fun
<x0:vt>
<r0:vt>
foldall0$fopr(r0, ~x0): (bool, r0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
rfolditm0$fopr(x0, r0): (r0)
fun
<x0:vt>
<r0:vt>
rfoldall0$fopr(x0, r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<ys:vt>
g_make0_lstrm
(xs: strm_vt(x0)): (ys)
fun
<x0:vt>
<ys:vt>
g_make0_lstrq
(xs: strq_vt(x0)): (ys)
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
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_foritm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_rforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_iforitm0(xs: ~xs): void
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_folditm0(~xs, r0): ( r0 )
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldall0(~xs, r0): ( r0 )
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfolditm0(~xs, r0): ( r0 )
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfoldall0(~xs, r0): ( r0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
list_vt_foritm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
<r0:vt>
list_vt_rforitm0
(xs: ~list_vt(x0)): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strm_vt_foritm0
(xs: ~strm_vt(x0)): void
fun
<x0:vt>
<r0:vt>
strm_vt_rforitm0
(xs: ~strm_vt(x0)): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
list_vt_folditm0
(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
strm_vt_folditm0
(xs: ~strm_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
list_vt_rfolditm0
(xs: ~list_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_map0_ares(xs: ~xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_map0_self(xs: ~xs): (xs)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_map1_ares(xs: !xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_map1_self(xs: !xs): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_filter0_ares(xs: ~xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_filter0_self(xs: ~xs): (xs)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_filter1_ares(xs: !xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_filter1_self(xs: !xs): (xs)
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
mapstrq0$fopr(x0: ~x0): strq_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrq1$fopr(x0: !x0): strq_vt(y0)
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
fun
<a:vt>
strn_gmake0( ~a ): strn
fun
<a:vt>
strn_gmake1( !a ): strn
//
//
fun<>
strn_foritm(cs: strn): void
//
(* ****** ****** *)
//
fun<>
strn_make1_llist
{n0:i0}
(cs: !list_vt(cgtz, n0)): strn(n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
strn_vt_gmake(a): strn_vt
fun
<a:vt>
strn_vt_gmake0(~a): strn_vt
fun
<a:vt>
strn_vt_gmake1(!a): strn_vt
//
(* ****** ****** *)
//
fun<>
strn_vt_foritm0(cs: ~strn): void
//
fun<>
strn_vt_make1_llist
{n0:i0}
(cs: !list_vt(cgtz, n0)): strn_vt(n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strq_vt_filter0
{n0:i0}
(xs: strq_vt(x0,n0)): strqlte_vt(x0,n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_xunimpl.sats] *)
