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
(*
fun
<x0:vt>
rforall$test0(x0: ~x0): bool
fun
<x0:vt>
rforall$test1(x0: !x0): bool
//
fun
<x0:vt>
iforall$test0(ni, ~x0): bool
fun
<x0:vt>
iforall$test1(ni, !x0): bool
*)
//
fun
<x0:vt>
irforall$test0(ni, ~x0): bool
fun
<x0:vt>
irforall$test1(ni, !x0): bool
//
(* ****** ****** *)
//
(*
fun
<x0:vt>
rexists$test0(x0: ~x0): bool
fun
<x0:vt>
rexists$test1(x0: !x0): bool
//
fun
<x0:vt>
iexists$test0(ni, ~x0): bool
fun
<x0:vt>
iexists$test1(ni, !x0): bool
*)
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
(*
fun
<x0:vt>
foritm$work0(x0: ~x0): void
fun
<x0:vt>
foritm$work1(x0: !x0): void
fun
<x0:vt>
rforitm$work0(x0: ~x0): void
fun
<x0:vt>
rforitm$work1(x0: !x0): void
fun
<x0:vt>
iforitm$work0(ni, ~x0): void
fun
<x0:vt>
iforitm$work1(ni, !x0): void
*)
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
filter$test1(x0: !x0): bool
*)
fun
<x0:vt>
rfilter$test1(x0: !x0): bool
//
(*
fun
<x0:vt>
ifilter$test1(x0: !x0): bool
*)
//
fun
<x0:vt>
irfilter$test1(ni, !x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<xs:vt>
<x0:vt>
gseq_foritm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_foritm1(xs: !xs): void
*)
//
(*
fun
<xs:vt>
<x0:vt>
gseq_rforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_rforitm1(xs: !xs): void
*)
//
(*
fun
<xs:vt>
<x0:vt>
gseq_iforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_iforitm1(xs: !xs): void
*)
//
(*
fun
<xs:vt>
<x0:vt>
gseq_irforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_irforitm1(xs: !xs): void
*)
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
gseq_irfolditm0(~xs, r0): ( r0 )
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfolditm1(!xs, r0): ( r0 )
//
(* ****** ****** *)
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
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfoldall0(~xs, r0): ( r0 )
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfoldall1(!xs, r0): ( r0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_map0_ares(xs: ~xs): ( ys )
fun
<xs:vt>
<x0:vt>
gseq_map0_self(xs: ~xs): ( xs )
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_map1_ares(xs: !xs): ( ys )
fun
<xs:vt>
<x0:vt>
gseq_map1_self(xs: !xs): ( xs )
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
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
irmap$fopr0
(pos: ni, itm: ~x0): (y0)
fun
<x0:vt>
<y0:vt>
irmap$fopr1
(pos: ni, itm: !x0): (y0)
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
HX-2024-07-15:
Mon 15 Jul 2024 04:56:50 PM EDT
*)
fun
<x0:vt>
max$nil0((*nil*)): (x0)
fun
<x0:vt>
max$nil1((*nil*)): (x0)
//
fun
<x0:vt>
min$nil0((*nil*)): (x0)
fun
<x0:vt>
min$nil1((*nil*)): (x0)
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
gseq_max$opt0(xs: ~xs): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_max$opt1(xs: !xs): optn_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_min$opt0(xs: ~xs): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_min$opt1(xs: !xs): optn_vt(x0)
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
get$at$exn0
(xs: ~xs, i0: ni): x0
fun
<xs:vt>
<x0:vt>
get$at$exn1
(xs: !xs, i0: ni): x0
//
fun
<xs:vt>
<x0:vt>
set$at$exn0
(xs: ~xs, ni, x0): void
fun
<xs:vt>
<x0:vt>
set$at$exn1
(xs: !xs, ni, x0): void
//
fun
<xs:vt>
<x0:vt>
fset$at$exn0
(xs: ~xs, ni, x0): (xs)
fun
<xs:vt>
<x0:vt>
fset$at$exn1
(xs: !xs, ni, x0): (xs)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_get$at0(xs: ~xs, i0: ni): (x0)
fun
<xs:vt>
<x0:vt>
gseq_get$at1(xs: !xs, i0: ni): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_set$at0(xs: ~xs, i0: ni, x0: ~x0): void
fun
<xs:vt>
<x0:vt>
gseq_set$at1(xs: !xs, i0: ni, x0: ~x0): void
//
fun
<xs:vt>
<x0:vt>
gseq_fset$at0(xs: ~xs, i0: ni, x0: ~x0): (xs)
fun
<xs:vt>
<x0:vt>
gseq_fset$at1(xs: !xs, i0: ni, x0: ~x0): (xs)
//
fun
<xs:vt>
<x0:vt>
gseq_get$at$opt0(xs: ~xs, i0: ni): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_get$at$opt1(xs: !xs, i0: ni): optn_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_set$at$opt0(xs: ~xs, i0: ni, x0: ~x0): bool
fun
<xs:vt>
<x0:vt>
gseq_set$at$opt1(xs: !xs, i0: ni, x0: ~x0): bool
//
fun
<xs:vt>
<x0:vt>
gseq_fset$at$opt0(xs: ~xs, i0: ni, x0: ~x0): optn_vt(xs)
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
<r0:vt>
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
<r0:vt>
gseq_irfoldall1(!xs, r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap0_llist(xs: ~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap1_llist(xs: !xs): list_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap0_lstrm(xs: ~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap1_lstrm(xs: !xs): strm_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap0_lstrq(xs: ~xs): strq_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap1_lstrq(xs: !xs): strq_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap0_rllist(xs: ~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap1_rllist(xs: !xs): list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rfilter0_llist(xs: ~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rfilter1_llist(xs: !xs): list_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_rfilter0_lstrm(xs: ~xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rfilter1_lstrm(xs: !xs): strm_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_rfilter0_lstrq(xs: ~xs): strq_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rfilter1_lstrq(xs: !xs): strq_vt(x0)
//
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
(*
HX-2024-07-25:
Thu 25 Jul 2024 04:53:04 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
gseq_rforall0_f1un
(xs: xs, test: (~x0)->bool): bool
fun
<xs:vt>
<x0:vt>
gseq_rforall1_f1un
(xs: xs, test: (!x0)->bool): bool
//
#symload rforall0_fun with gseq_rforall0_f1un of 0100
#symload rforall1_fun with gseq_rforall1_f1un of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_iforall0_f2un
(xs: ~xs, f0: (ni, ~x0) -> bool): bool
fun
<xs:vt>
<x0:vt>
gseq_iforall1_f2un
(xs: !xs, f0: (ni, !x0) -> bool): bool
//
#symload iforall0_fun with gseq_iforall0_f2un of 0100
#symload iforall1_fun with gseq_iforall1_f2un of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_irforall0_f2un
(xs: ~xs, f0: (ni, ~x0) -> bool): bool
fun
<xs:vt>
<x0:vt>
gseq_irforall1_f2un
(xs: !xs, f0: (ni, !x0) -> bool): bool
//
#symload irforall0_fun with gseq_irforall0_f2un of 0100
#symload irforall1_fun with gseq_irforall1_f2un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 04:53:04 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
gseq_foritm0_f1un
(xs: xs, work: (~x0)->void): void
//
#symload foritm0 with gseq_foritm0_f1un of 0100
#symload foritm0_fun with gseq_foritm0_f1un of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_foritm1_f1un
(xs: xs, work: (!x0)->void): void
//
#symload foritm1 with gseq_foritm1_f1un of 0100
#symload foritm1_fun with gseq_foritm1_f1un of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rforitm0_f1un
(xs: xs, work: (~x0)->void): void
//
#symload rforitm0 with gseq_rforitm0_f1un of 0100
#symload rforitm0_fun with gseq_rforitm0_f1un of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_rforitm1_f1un
(xs: xs, work: (!x0)->void): void
//
#symload rforitm1 with gseq_rforitm1_f1un of 0100
#symload rforitm1_fun with gseq_rforitm1_f1un of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_iforitm0_f2un
(xs: xs, work: (ni, ~x0)->void): void
//
#symload iforitm0 with gseq_iforitm0_f2un of 0100
#symload iforitm0_fun with gseq_iforitm0_f2un of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_iforitm1_f2un
(xs: xs, work: (ni, !x0)->void): void
//
#symload iforitm1 with gseq_iforitm1_f2un of 0100
#symload iforitm1_fun with gseq_iforitm1_f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_irforitm0_f2un
(xs: xs, work: (ni, ~x0)->void): void
//
#symload irforitm0 with gseq_irforitm0_f2un of 0100
#symload irforitm0_fun with gseq_irforitm0_f2un of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_irforitm1_f2un
(xs: xs, work: (ni, !x0)->void): void
//
#symload irforitm1 with gseq_irforitm1_f2un of 0100
#symload irforitm1_fun with gseq_irforitm1_f2un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_folditm0_f2un
( xs: ~xs, r0: r0
, fopr: (r0, ~x0)-> (r0)): (r0)
//
#symload
folditm0 with gseq_folditm0_f2un of 1000
#symload
folditm0_fun with gseq_folditm0_f2un of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_folditm1_f2un
( xs: !xs, r0: r0
, fopr: (r0, !x0)-> (r0)): (r0)
//
#symload
folditm1 with gseq_folditm1_f2un of 1000
#symload
folditm1_fun with gseq_folditm1_f2un of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfolditm0_f2un
( xs: ~xs, r0: r0
, fopr: (~x0, r0)-> (r0)): (r0)
//
#symload
rfolditm0 with gseq_rfolditm0_f2un of 1000
#symload
rfolditm0_fun with gseq_rfolditm0_f2un of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfolditm1_f2un
( xs: !xs, r0: r0
, fopr: (!x0, r0)-> (r0)): (r0)
//
#symload
rfolditm1 with gseq_rfolditm1_f2un of 1000
#symload
rfolditm1_fun with gseq_rfolditm1_f2un of 1000
//
(* ****** ****** *)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm0_f3un
( xs: ~xs, r0: r0
, fopr: (r0, ni, ~x0)-> (r0)): (r0)
//
#symload
ifolditm0 with gseq_ifolditm0_f3un of 1000
#symload
ifolditm0_fun with gseq_ifolditm0_f3un of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm1_f3un
( xs: !xs, r0: r0
, fopr: (r0, ni, !x0)-> (r0)): (r0)
//
#symload
ifolditm1 with gseq_ifolditm1_f3un of 1000
#symload
ifolditm1_fun with gseq_ifolditm1_f3un of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfolditm0_f3un
( xs: ~xs, r0: r0
, fopr: (ni, ~x0, r0)-> (r0)): (r0)
//
#symload
irfolditm0 with gseq_irfolditm0_f3un of 1000
#symload
irfolditm0_fun with gseq_irfolditm0_f3un of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfolditm1_f3un
( xs: !xs, r0: r0
, fopr: (ni, !x0, r0)-> (r0)): (r0)
//
#symload
irfolditm1 with gseq_irfolditm1_f3un of 1000
#symload
irfolditm1_fun with gseq_irfolditm1_f3un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:vt>
list_vt_forall0(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_forall1(xs: !list_vt(x0)): bool
*)
fun
<x0:vt>
list_vt_rforall0(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_rforall1(xs: !list_vt(x0)): bool
//
fun
<x0:vt>
list_vt_iforall0(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_iforall1(xs: !list_vt(x0)): bool
//
fun
<x0:vt>
list_vt_irforall0(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_irforall1(xs: !list_vt(x0)): bool
//
(* ****** ****** *)
//
(*
fun
<x0:vt>
list_vt_foritm0(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_foritm1(xs: !list_vt(x0)): void
*)
//
fun
<x0:vt>
list_vt_rforitm0(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_rforitm1(xs: !list_vt(x0)): void
//
fun
<x0:vt>
list_vt_iforitm0(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_iforitm1(xs: !list_vt(x0)): void
//
fun
<x0:vt>
list_vt_irforitm0(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_irforitm1(xs: !list_vt(x0)): void
//
(* ****** ****** *)
//
(*
fun
<x0:vt>
strm_vt_foritm0(xs: ~strm_vt(x0)): void
*)
fun
<x0:vt>
strm_vt_rforitm0(xs: ~strm_vt(x0)): void
fun
<x0:vt>
strm_vt_iforitm0(xs: ~strm_vt(x0)): void
fun
<x0:vt>
strm_vt_irforitm0(xs: ~strm_vt(x0)): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
list_vt_folditm0(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_rfolditm0(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_ifolditm0(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_irfolditm0(xs: ~list_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strm_vt_folditm0(xs: ~strm_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
strm_vt_foldall0(xs: ~strm_vt(x0), r0: r0): (r0)
//
fun
<x0:vt>
<r0:vt>
strm_vt_ifolditm0(xs: ~strm_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
strm_vt_ifoldall0(xs: ~strm_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
strm_vt_irfoldall0(xs: ~strm_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 04:53:04 PM EDT
*)
//
fun
<x0:vt>
strm_vt_forall0_f1un
( xs: strm_vt(x0)
, test: (~x0)->bool): bool
//
#symload
forall0 with strm_vt_forall0_f1un of 1000
#symload
forall0_fun with strm_vt_forall0_f1un of 1000
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_foritm0_f1un
(xs: strm_vt(x0), work: (~x0)->void): void
//
#symload
foritm0 with strm_vt_foritm0_f1un of 1000
#symload
foritm0_fun with strm_vt_foritm0_f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-19:
Mon 29 Jul 2024 12:57:10 PM EDT
*)
//
(*
fun
<x0:vt>
<y0:vt>
z2forall$test0(~x0, ~y0): bool
fun
<x0:vt>
<y0:vt>
z2forall$test1(!x0, !y0): bool
*)
//
fun
<x0:vt>
<y0:vt>
rz2forall$test0(~x0, ~y0): bool
fun
<x0:vt>
<y0:vt>
rz2forall$test1(!x0, !y0): bool
//
(*
<x0:vt>
<y0:vt>
iz2forall$test0(ni, ~x0, ~y0): bool
fun
<x0:vt>
<y0:vt>
iz2forall$test1(ni, !x0, !y0): bool
*)
//
fun
<x0:vt>
<y0:vt>
irz2forall$test0(ni, ~x0, ~y0): bool
fun
<x0:vt>
<y0:vt>
irz2forall$test1(ni, !x0, !y0): bool
//
(* ****** ****** *)
//
(*
fun
<x0:vt>
<y0:vt>
z2foritm$work0(~x0, ~y0): void
fun
<x0:vt>
<y0:vt>
z2foritm$work1(!x0, !y0): void
*)
//
fun
<x0:vt>
<y0:vt>
rz2foritm$work0(~x0, ~y0): void
fun
<x0:vt>
<y0:vt>
rz2foritm$work1(!x0, !y0): void
//
(*
fun
<x0:vt>
<y0:vt>
iz2foritm$work0(ni, ~x0, ~y0): void
fun
<x0:vt>
<y0:vt>
iz2foritm$work1(ni, !x0, !y0): void
*)
//
fun
<x0:vt>
<y0:vt>
irz2foritm$work0(ni, ~x0, ~y0): void
fun
<x0:vt>
<y0:vt>
irz2foritm$work1(ni, !x0, !y0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
rz2map$fopr0(~x0, ~y0): ( z0 )
fun
<x0:vt>
<y0:vt>
<z0:vt>
rz2map$fopr1(!x0, !y0): ( z0 )
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
irz2map$fopr0(ni, ~x0, ~y0): ( z0 )
fun
<x0:vt>
<y0:vt>
<z0:vt>
irz2map$fopr1(ni, !x0, !y0): ( z0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2forall1(xs: !xs, ys: !ys): bool
*)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_rz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_rz2forall1(xs: !xs, ys: !ys): bool
//
(*
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_iz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_iz2forall1(xs: !xs, ys: !ys): bool
*)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_irz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_irz2forall1(xs: !xs, ys: !ys): bool
//
(* ****** ****** *)
//
(*
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2foritm1(xs: !xs, ys: !ys): void
*)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_rz2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_rz2foritm1(xs: !xs, ys: !ys): void
//
(*
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_iz2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_iz2foritm1(xs: !xs, ys: !ys): void
*)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_irz2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_irz2foritm1(xs: !xs, ys: !ys): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<zs:vt>
<z0:vt>
gseq_z2map0_ares(~xs, ~ys): ( zs )
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2map0_self(~xs, ~ys): ( xs )
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_rz2map0_lstrm(~xs, ~ys): strm_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_iz2map0_lstrm(~xs, ~ys): strm_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_irz2map0_lstrm(~xs, ~ys): strm_vt(z0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
strm_vt_irz2map0
(xs: strm_vt(x0), ys: strm_vt(y0)): strm_vt(z0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_z2folditm0
(xs: ~strm_vt(x0), ys: ~strm_vt(y0), r0: r0): (r0)
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_iz2folditm0
(xs: ~strm_vt(x0), ys: ~strm_vt(y0), r0: r0): (r0)
//
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_z2foldall0
(xs: ~strm_vt(x0), ys: ~strm_vt(y0), r0: r0): (r0)
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_iz2foldall0
(xs: ~strm_vt(x0), ys: ~strm_vt(y0), r0: r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:vt>
<y0:vt>
strm_vt_z2strmize0
( xs: strm_vt(x0)
, ys: strm_vt(y0)): strm_vt@(x0, y0)
*)
//
fun
<x0:vt>
<y0:vt>
strm_vt_z2listize0
(xs: strm_vt(x0), ys: strm_vt(y0)): list_vt@(x0, y0)
fun
<x0:vt>
<y0:vt>
strm_vt_z2rlistize0
(xs: strm_vt(x0), ys: strm_vt(y0)): list_vt@(x0, y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
optn_vt_iforall0(xs: ~optn_vt(x0)): bool
fun
<x0:vt>
optn_vt_iforall1(xs: !optn_vt(x0)): bool
//
fun
<x0:vt>
optn_vt_irforall0(xs: ~optn_vt(x0)): bool
fun
<x0:vt>
optn_vt_irforall1(xs: !optn_vt(x0)): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
optn_vt_iforitm0(xs: ~optn_vt(x0)): void
fun
<x0:vt>
optn_vt_iforitm1(xs: !optn_vt(x0)): void
//
fun
<x0:vt>
optn_vt_irforitm0(xs: ~optn_vt(x0)): void
fun
<x0:vt>
optn_vt_irforitm1(xs: !optn_vt(x0)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_filter0_f1un
( xs: strm_vt(x0)
, test: (!x0) -> bool): strm_vt(x0)
#symload filter0 with strm_vt_filter0_f1un of 1000
#symload filter0_fun with strm_vt_filter0_f1un of 1000
//
fun
<x0:vt>
strm_vt_ifilter0_f2un
( xs: strm_vt(x0)
, test: (ni,!x0) -> bool): strm_vt(x0)
#symload ifilter0 with strm_vt_ifilter0_f2un of 1000
#symload ifilter0_fun with strm_vt_ifilter0_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_iforall0_f2un
(xs: strm_vt(x0), test: (ni,~x0)->bool): bool
#symload iforall0 with strm_vt_iforall0_f2un of 1000
#symload iforall0_fun with strm_vt_iforall0_f2un of 1000
//
fun
<x0:vt>
strm_vt_iforitm0_f2un
(xs: strm_vt(x0), test: (ni,~x0)->void): void
#symload iforitm0 with strm_vt_iforitm0_f2un of 1000
#symload iforitm0_fun with strm_vt_iforitm0_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_VT_xunimpl_vt.sats] *)
