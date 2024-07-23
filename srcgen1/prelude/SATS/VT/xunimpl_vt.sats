(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-07-10:
These are newly designed
function interfaces in ATS3,
which are not meant to be
implemented in ATS3/srcgen1.
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_sum0(xs: ~xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_sum1(xs: !xs): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_prod0(xs: ~xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_prod1(xs: !xs): (x0)
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
<x0:vt>
irforall$test0(ni, ~x0): bool
fun
<x0:vt>
irforall$test1(ni, !x0): bool
//
fun
<x0:vt>
irexists$test0(ni, ~x0): bool
fun
<x0:vt>
irexists$test1(ni, !x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
foritm$work0(x0: ~x0): void
fun
<x0:vt>
foritm$work1(x0: !x0): void
//
fun
<x0:vt>
rforitm$work0(x0: ~x0): void
fun
<x0:vt>
rforitm$work1(x0: !x0): void
//
fun
<x0:vt>
iforitm$work0(ni, ~x0): void
fun
<x0:vt>
iforitm$work1(ni, !x0): void
//
fun
<x0:vt>
irforitm$work0(ni, ~x0): void
fun
<x0:vt>
irforitm$work1(ni, !x0): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
folditm$fopr0(r0, ~x0): (r0)
fun
<x0:vt>
<r0:vt>
folditm$fopr1(r0, !x0): (r0)
//
fun
<x0:vt>
<r0:vt>
rfolditm$fopr0(~x0, r0): (r0)
fun
<x0:vt>
<r0:vt>
rfolditm$fopr1(!x0, r0): (r0)
//
fun
<x0:vt>
<r0:vt>
ifolditm$fopr0(r0, ni, ~x0): (r0)
fun
<x0:vt>
<r0:vt>
ifolditm$fopr1(r0, ni, !x0): (r0)
//
fun
<x0:vt>
<r0:vt>
irfolditm$fopr0(ni, ~x0, r0): (r0)
fun
<x0:vt>
<r0:vt>
irfolditm$fopr1(ni, !x0, r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
foldall$fopr0(r0, ~x0): (bool, r0)
fun
<x0:vt>
<r0:vt>
foldall$fopr1(r0, !x0): (bool, r0)
//
fun
<x0:vt>
<r0:vt>
rfoldall$fopr0(~x0, r0): (bool, r0)
fun
<x0:vt>
<r0:vt>
rfoldall$fopr1(!x0, r0): (bool, r0)
//
fun
<x0:vt>
<r0:vt>
ifoldall$fopr0(r0, ni, ~x0): (bool, r0)
fun
<x0:vt>
<r0:vt>
ifoldall$fopr1(r0, ni, !x0): (bool, r0)
//
fun
<x0:vt>
<r0:vt>
irfoldall$fopr0(ni, ~x0, r0): (bool, r0)
fun
<x0:vt>
<r0:vt>
irfoldall$fopr1(ni, !x0, r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:vt>
filter$test0(x0: !x0): bool
fun
<x0:vt>
filter$test1(x0: !x0): bool
*)
//
fun
<x0:vt>
rfilter$test0(x0: !x0): bool
fun
<x0:vt>
rfilter$test1(x0: !x0): bool
//
(*
fun
<x0:vt>
ifilter$test0(x0: !x0): bool
fun
<x0:vt>
ifilter$test1(x0: !x0): bool
*)
//
fun
<x0:vt>
irfilter$test0(x0: !x0): bool
fun
<x0:vt>
irfilter$test1(x0: !x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:vt
,y0:vt>
z2forall$test0(~x0, ~y0): bool
*)
fun
<x0:vt
,y0:vt>
rz2forall$test0(~x0, ~y0): bool
fun
<x0:vt
,y0:vt>
iz2forall$test0(ni, ~x0, ~y0): bool
fun
<x0:vt
,y0:vt>
irz2forall$test0(ni, ~x0, ~y0): bool
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
z2foritm$work0(~x0, ~y0): void
fun
<x0:vt
,y0:vt>
rz2foritm$work0(~x0, ~y0): void
fun
<x0:vt
,y0:vt>
iz2foritm$work0(ni, ~x0, ~y0): void
fun
<x0:vt
,y0:vt>
irz2foritm$work0(ni, ~x0, ~y0): void
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
<xs:vt>
<x0:vt>
gseq_foritm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_foritm1(xs: !xs): void
//
fun
<xs:vt>
<x0:vt>
gseq_rforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_rforitm1(xs: !xs): void
//
fun
<xs:vt>
<x0:vt>
gseq_iforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_iforitm1(xs: !xs): void
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
gseq_folditm1(!xs, r0): ( r0 )
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldall0(~xs, r0): ( r0 )
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldall1(!xs, r0): ( r0 )
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
gseq_rfolditm1(!xs, r0): ( r0 )
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfoldall0(~xs, r0): ( r0 )
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfoldall1(!xs, r0): ( r0 )
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm0(~xs, r0): ( r0 )
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm1(!xs, r0): ( r0 )
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifoldall0(~xs, r0): ( r0 )
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifoldall1(!xs, r0): ( r0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_foritm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_rforitm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_iforitm0
(xs: ~list_vt(x0)): void
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_foritm0
(xs: ~strm_vt(x0)): void
fun
<x0:vt>
strm_vt_rforitm0
(xs: ~strm_vt(x0)): void
fun
<x0:vt>
strm_vt_iforitm0
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
list_vt_rfolditm0
(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_ifolditm0
(xs: ~list_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strm_vt_folditm0
(xs: ~strm_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
strm_vt_foldall0
(xs: ~strm_vt(x0), r0: r0): (r0)
//
fun
<x0:vt>
<r0:vt>
strm_vt_ifolditm0
(xs: ~strm_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
strm_vt_ifoldall0
(xs: ~strm_vt(x0), r0: r0): (r0)
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
(*
fun
<x0:vt>
<y0:vt>
mapstrq$fopr0(~x0): strq_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrq$fopr1(!x0): strq_vt(y0)
*)
//
fun
<x0:vt>
<y0:vt>
rmapstrq$fopr0(~x0): strq_vt(y0)
fun
<x0:vt>
<y0:vt>
rmapstrq$fopr1(!x0): strq_vt(y0)
//
fun
<x0:vt>
<y0:vt>
imapstrq$fopr0
  (pos: ni, itm: ~x0): strq_vt(y0)
fun
<x0:vt>
<y0:vt>
imapstrq$fopr1
  (pos: ni, itm: !x0): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
strn_gmake0( x: ~a ): strn
fun
<a:vt>
strn_gmake1( x: !a ): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
strn_vt_gmake0(x : ~a): strn_vt
fun
<a:vt>
strn_vt_gmake1(x : !a): strn_vt
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
(*
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2forall0(xs: ~xs, ys: ~ys): bool
*)
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2foritm0(xs: ~xs, ys: ~ys): void
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_iz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_iz2foritm0(xs: ~xs, ys: ~ys): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-15:
Mon 15 Jul 2024 04:56:50 PM EDT
*)
fun
<x0:vt>
max0$nil((*nil*)): (x0)
fun
<x0:vt>
max1$nil((*nil*)): (x0)
//
fun
<x0:vt>
min0$nil((*nil*)): (x0)
fun
<x0:vt>
min1$nil((*nil*)): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_max0(xs: ~xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_max1(xs: !xs): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_min0(xs: ~xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_min1(xs: !xs): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_max0_opt(xs: ~xs): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_max1_opt(xs: !xs): optn_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_min0_opt(xs: ~xs): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_min1_opt(xs: !xs): optn_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-07-15:
Mon 15 Jul 2024 06:32:03 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
get0_at$exn
  (i0: ni): x0
fun
<xs:vt>
<x0:vt>
get1_at$exn
(xs: !xs, i0: ni): x0
//
fun
<xs:vt>
<x0:vt>
set0_at$exn
(xs: ~xs, ni, x0): void
fun
<xs:vt>
<x0:vt>
set1_at$exn
(xs: !xs, ni, x0): void
//
fun
<xs:vt>
<x0:vt>
fset0_at$exn
(xs: ~xs, ni, x0): (xs)
fun
<xs:vt>
<x0:vt>
fset1_at$exn
(xs: !xs, ni, x0): (xs)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_get0_at(xs: ~xs, i0: ni): (x0)
fun
<xs:vt>
<x0:vt>
gseq_get1_at(xs: !xs, i0: ni): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_set0_at(xs: ~xs, i0: ni, x0: ~x0): void
fun
<xs:vt>
<x0:vt>
gseq_set1_at(xs: !xs, i0: ni, x0: ~x0): void
//
fun
<xs:vt>
<x0:vt>
gseq_fset0_at(xs: ~xs, i0: ni, x0: ~x0): (xs)
fun
<xs:vt>
<x0:vt>
gseq_fset1_at(xs: !xs, i0: ni, x0: ~x0): (xs)
//
fun
<xs:vt>
<x0:vt>
gseq_get0_at_opt(xs: ~xs, i0: ni): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_get1_at_opt(xs: !xs, i0: ni): optn_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_set0_at_opt(xs: ~xs, i0: ni, x0: ~x0): bool
fun
<xs:vt>
<x0:vt>
gseq_set1_at_opt(xs: !xs, i0: ni, x0: ~x0): bool
//
fun
<xs:vt>
<x0:vt>
gseq_fset0_at_opt(xs: ~xs, i0: ni, x0: ~x0): optn_vt(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_irforall0(~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_irforall1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
gseq_irexists0(~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_irexists1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
gseq_irforitm0(~xs): void
fun
<xs:vt>
<x0:vt>
gseq_irforitm1(!xs): void
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfolditm0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
gseq_irfolditm1(!xs, r0): (r0)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfoldall0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
gseq_irfoldall1(!xs, r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Wed 17 Jul 2024 02:15:09 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_append00(xs: ~xs, ys: ~ys): xs
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_append01(xs: ~xs, ys: !ys): xs
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_append10(xs: !xs, ys: ~ys): xs
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_append11(xs: !xs, ys: !ys): xs
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Wed 17 Jul 2024 02:16:48 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_prepend00(xs: ~xs, ys: ~ys): xs
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_prepend01(xs: ~xs, ys: !ys): xs
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_prepend10(xs: !xs, ys: ~ys): xs
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_prepend11(xs: !xs, ys: !ys): xs
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Wed 17 Jul 2024 04:30:36 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_rappend00(xs: ~xs, ys: ~ys): xs
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_rappend01(xs: ~xs, ys: !ys): xs
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_rappend10(xs: !xs, ys: ~ys): xs
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_rappend11(xs: !xs, ys: !ys): xs
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_append00
(strm_vt(x0), strm_vt(x0)): strm_vt(x0)
//
fun
<x0:vt>
strm_vt_prepend00
(strm_vt(x0), strm_vt(x0)): strm_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_VT_xunimpl_vt.sats] *)
