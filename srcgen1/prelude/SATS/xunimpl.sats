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
max$nil((*nil*)): (x0)
fun
<x0:t0>
min$nil((*nil*)): (x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
get_at$exn
(xs: xs, i0: ni): x0
fun
<xs:t0>
<x0:t0>
set_at$exn
(xs: xs, i0: ni): void
fun
<xs:t0>
<x0:t0>
fset_at$exn
(xs: xs, i0: ni): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:vt>
forall$test(ni, x0): bool
fun
<x0:vt>
rforall$test(ni, x0): bool
fun
<x0:vt>
iforall$test(ni, x0): bool
*)
fun
<x0:vt>
irforall$test(ni, x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
foritm$work(x0: x0): void
fun
<x0:t0>
rforitm$work(x0: x0): void
fun
<x0:t0>
iforitm$work(ni, x0): void
fun
<x0:t0>
irforitm$work(ni, x0): void
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
rfolditm$fopr(x0, r0): (r0)
fun
<x0:t0>
<r0:vt>
ifolditm$fopr(r0, ni, x0): (r0)
fun
<x0:t0>
<r0:vt>
irfolditm$fopr(ni, x0, r0): (r0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
foldall$fopr(r0, x0): (bool, r0)
fun
<x0:t0>
<r0:vt>
rfoldall$fopr(x0, r0): (bool, r0)
fun
<x0:t0>
<r0:vt>
ifoldall$fopr(r0, n0, x0): (bool, r0)
fun
<x0:t0>
<r0:vt>
irfoldall$fopr(n0, x0, r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
rfilter$test(x0: x0): bool
(*
fun
<x0:vt>
ifilter$test(ni, x0): bool
*)
fun
<x0:vt>
irfilter$test(ni, x0): bool
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
(*
fun
<xs:t0>
<x0:t0>
gseq_max(xs: xs): (x0)
fun
<xs:t0>
<x0:t0>
gseq_min(xs: xs): (x0)
*)
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
<xs:vt>
<x0:vt>
gseq$beg((*0*)): strn
fun
<xs:vt>
<x0:vt>
gseq$end((*0*)): strn
fun
<xs:vt>
<x0:vt>
gseq$sep((*0*)): strn
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
fun<>
nint_strmize
(xs: nint): strm_vt(ni)
fun<>
nint_strqize
{n:i0}
(xs: nint(n)): strq_vt(ni, n)
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
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_irforall(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_irexists(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_irforitm(xs): void
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfolditm(xs, r0): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfoldall(xs, r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Wed 17 Jul 2024 02:13:39 PM EDT
*)
//
(*
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_append(xs: xs, ys: ~ys): xs
*)
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_prepend(xs: xs, ys: ~ys): xs
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_xunimpl.sats] *)
