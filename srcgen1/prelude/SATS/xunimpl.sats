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
<a:vt>
g_iden(obj: a): (a)
//
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
<x0:vt>
get_at$exn
(xs: xs, i0: ni): x0
fun
<xs:t0>
<x0:vt>
set_at$exn
( xs: xs
, i0: ni, x0: x0): void
fun
<xs:t0>
<x0:t0>
fset_at$exn
( xs: xs
, i0: ni, x0: x0): (xs)
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
fun
<x0:t0
,y0:t0>
irz2forall$work(ni, x0, y0): void
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
<y0:vt>
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
<y0:vt>
nint_map_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
//
#symload
map_llist with nint_map_llist of 1000
//
fun
<y0:vt>
nint_rmap_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
//
#symload
rmap_llist with nint_rmap_llist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 11:48:37 AM EDT
*)
//
fun
<y0:vt>
nint_map_lstrm(xs: nint): strm_vt(y0)
//
#symload
map_lstrm with nint_map_lstrm of 1000
//
fun
<y0:vt>
nint_map_lstrm_c1fr
( xs: nint
, fopr: (nint)-<cfr>(y0)): strm_vt(y0)
fun
<y0:vt>
nint_map_lstrm_f1np
( xs: nint
, fopr: (nint)-<fnp>(y0)): strm_vt(y0)
//
#symload
map_lstrm with nint_map_lstrm_c1fr of 1000
#symload
map_lstrm_cfr with nint_map_lstrm_c1fr of 1000
#symload
map_lstrm_fnp with nint_map_lstrm_f1np of 1000
//
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 09:20:16 PM EDT
*)
//
fun
<y0:vt>
nint_rmap_lstrm(xs: nint): strm_vt(y0)
//
#symload
rmap_lstrm with nint_rmap_lstrm of 1000
//
fun
<y0:vt>
nint_rmap_lstrm_c1fr
( xs: nint
, fopr: (nint)-<cfr>(y0)): strm_vt(y0)
fun
<y0:vt>
nint_rmap_lstrm_f1np
( xs: nint
, fopr: (nint)-<fnp>(y0)): strm_vt(y0)
//
#symload
rmap_lstrm with nint_rmap_lstrm_c1fr of 1000
#symload
rmap_lstrm_cfr with nint_rmap_lstrm_c1fr of 1000
#symload
rmap_lstrm_fnp with nint_rmap_lstrm_f1np of 1000
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
(*
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2forall(xs: xs, ys: ys): bool
*)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_rz2forall(xs: xs, ys: ys): bool
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_iz2forall(xs: xs, ys: ys): bool
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_irz2forall(xs: xs, ys: ys): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 12:54:06 PM EDT
*)
//
fun
<xs:t0>
<x0:vt>
gasz_length(xs: xs): nint
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_forall(xs: xs): bool
//
fun
<xs:t0>
<x0:vt>
gasz_rforall(xs: xs): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_listize(xs: xs): list_vt(x0)
fun
<xs:t0>
<x0:vt>
gasz_rlistize(xs: xs): list_vt(x0)
//
fun
<xs:t0>
<x0:vt>
gasz_strmize(xs: xs): strm_vt(x0)
fun
<xs:t0>
<x0:vt>
gasz_strqize(xs: xs): strq_vt(x0)
//
fun
<xs:t0>
<x0:vt>
gasz_rstrmize(xs: xs): strm_vt(x0)
fun
<xs:t0>
<x0:vt>
gasz_rstrqize(xs: xs): strq_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gasz_get_at(xs: xs, i0: ni): (x0)
fun
<xs:t0>
<x0:t0>
gasz_set_at(xs: xs, i0: ni, x0: x0): void
//
(*
fun
<xs:t0>
<x0:vt>
gasz_get_at_raw(xs: xs, i0: ni): (x0)
fun
<xs:t0>
<x0:vt>
gasz_set_at_raw(xs: xs, i0: ni, x0: x0): void
*)
//
(* ****** ****** *)
//
#absview
owed_view(vt) // linprop
#sexpdef owed = owed_view
//
prfun
owed_t0_make
{a:t0}((*void*)): owed(a)
prfun
owed_t0_elim0
{a:t0}(pf: ~owed(a)): void
prfun
owed_vt_return0
{a:vt}(pf: ~owed(a), x0: a): void
//
#symload return0 with owed_vt_return0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_get_at_raw
(xs: xs, i0: ni): (owed(x0) | x0)
fun
<xs:t0>
<x0:vt>
gasz_set_at_raw
(pf: owed(x0) | xs: xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasz_cget_at_raw(xs: xs, i0: ni): x0
fun
<xs:t0>
<x0:vt>
gasz_setf_at_raw(xs: xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 12:19:14 PM EDT
*)
//
fun
<xs:t0>
<x0:t0>
gseq_foritm_c1fr
(xs: xs, work: (x0)-<cfr>void): void
fun
<xs:t0>
<x0:t0>
gseq_foritm_f1np
(xs: xs, work: (x0)-<fnp>void): void
//
#symload foritm with gseq_foritm_c1fr of 0100
#symload foritm_cfr with gseq_foritm_c1fr of 0100
#symload foritm_fnp with gseq_foritm_f1np of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm_c2fr
( xs: xs
, r0: r0, fopr: (r0, x0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm_f2np
( xs: xs
, r0: r0, fopr: (r0, x0)-<fnp>(r0)): (r0)
//
#symload folditm with gseq_folditm_c2fr of 0100
#symload folditm_cfr with gseq_folditm_c2fr of 0100
#symload folditm_fnp with gseq_folditm_f2np of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares_c1fr
(xs: xs, fopr: (x0)-<cfr>(y0)): (ys)
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares_f1np
(xs: xs, fopr: (x0)-<cfr>(y0)): (ys)
//
fun
<xs:t0>
<x0:t0>
gseq_map_self_c1fr
(xs: xs, fopr: (x0)-<cfr>(x0)): (xs)
fun
<xs:t0>
<x0:t0>
gseq_map_self_f1np
(xs: xs, fopr: (x0)-<cfr>(x0)): (xs)
//
#symload map with gseq_map_ares_c1fr of 0100
#symload map_cfr with gseq_map_ares_c1fr of 0100
#symload map_fnp with gseq_map_ares_c1fr of 0100
//
#symload map with gseq_map_self_c1fr of 0110
#symload map_cfr with gseq_map_self_c1fr of 0110
#symload map_fnp with gseq_map_self_c1fr of 0110
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
mapref$fopr0
  (x0: ~x0): x0
fun
<x0:vt>
mapref$fopr1
  (x0: !x0): x0
fun
<x0:vt>
mapref$fopr1r
( ref: &x0 >> x0 ): void
(*
fun
<x0:vt>
mapref$fopr0r
( ref: &x0 >> ?x0 ): void
*)
//
fun
<xs:t0>
<x0:vt>
gasz_mapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasz_mapref_c1fr
(xs: xs, fopr: (~x0)-<cfr>(x0)): void
//
#symload mapref with gseq_mapref_c1fr of 0110
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_xunimpl.sats] *)
