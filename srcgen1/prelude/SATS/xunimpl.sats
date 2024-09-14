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
#typedef si = sint
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
get$at$exn
(xs: xs, i0: ni): x0
fun
<xs:t0>
<x0:vt>
set$at$exn
( xs: xs
, i0: ni, x0: x0): void
fun
<xs:t0>
<x0:t0>
fset$at$exn
( xs: xs
, i0: ni, x0: x0): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:t0>
forall$test(ni, x0): bool
fun
<x0:t0>
rforall$test(ni, x0): bool
fun
<x0:t0>
iforall$test(ni, x0): bool
*)
fun
<x0:t0>
irforall$test(ni, x0): bool
//
(* ****** ****** *)
(*
fun
<x0:t0>
exists$test(ni, x0): bool
fun
<x0:t0>
rexists$test(ni, x0): bool
fun
<x0:t0>
iexists$test(ni, x0): bool
*)
fun
<x0:t0>
irexists$test(ni, x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:t0>
iforitm$work(ni, x0): void
*)
fun
<x0:t0>
irforitm$work(ni, x0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
folditm$fopr(r0, x0): r0
fun
<x0:t0>
<r0:vt>
rfolditm$fopr(x0, r0): r0
fun
<x0:t0>
<r0:vt>
ifolditm$fopr(r0, ni, x0): r0
fun
<x0:t0>
<r0:vt>
irfolditm$fopr(ni, x0, r0): r0
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
ifoldall$fopr(r0, ni, x0): (bool, r0)
fun
<x0:t0>
<r0:vt>
irfoldall$fopr(ni, x0, r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:t0>
<y0:vt>
map$fopr(itm: x0): (y0)
fun
<x0:t0>
<y0:vt>
rmap$fopr(itm: x0): (y0)
fun
<x0:t0>
<y0:vt>
imap$fopr(pos: ni, itm: x0): (y0)
*)
fun
<x0:t0>
<y0:vt>
irmap$fopr(pos: ni, itm: x0): (y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:vt>
filter$test(x0: x0): bool
*)
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
gseq_omit((*0*)): strn
//
fun
<xs:vt>
<x0:vt>
gseq_prlen((*0*)): sint
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
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<xs:t0>
g_foritm(xs: xs): void
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
*)
fun
<xs:t0>
<x0:t0>
gseq_irforitm(xs: xs): void
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
gseq_rfolditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifolditm(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfolditm(xs, r0): ( r0 )
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldall(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfoldall(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldall(xs, r0): ( r0 )
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfoldall(xs, r0): ( r0 )
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
mapstrq$fopr
(itm: x0): strq_vt(y0)
*)
fun
<x0:t0>
<y0:vt>
rmapstrq$fopr
(itm: x0): strq_vt(y0)
fun
<x0:t0>
<y0:vt>
imapstrq$fopr
(pos: ni, itm: x0): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
nint_strmize
(xs: nint): strm_vt(ni)
fun<>
nint_strqize
{n:i0}(xs: nint(n)): strq_vt(ni, n)
//
(* ****** ****** *)
//
fun<>
nint_rstrmize
(xs: nint): strm_vt(ni)
fun<>
nint_rstrqize
{n:i0}(xs: nint(n)): strq_vt(ni, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
nint_forall(xs: nint): bool
fun<>
nint_rforall(xs: nint): bool
//
fun<>
nint_forall_f1un
(ni: nint, test: (ni)->bool): bool
#symload
forall with nint_forall_f1un of 1000
//
fun<>
nint_rforall_f1un
(ni: nint, test: (ni)->bool): bool
#symload
rforall with nint_rforall_f1un of 1000
//
(* ****** ****** *)
//
fun<>
nint_foritm(xs: nint): void
fun<>
nint_rforitm(xs: nint): void
//
fun<>
nint_foritm_f1un
(ni: nint, work: (ni)->void): void
#symload
foritm with nint_foritm_f1un of 1000
//
fun<>
nint_rforitm_f1un
(ni: nint, work: (ni)->void): void
#symload
rforitm with nint_rforitm_f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<y0:vt>
nint_map_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
fun
<y0:vt>
nint_map_f1un_llist
 {n0:i0}
(xs: nint(n0)
,f0: nintlt(n0)->y0): list_vt(y0, n0)
//
#symload
map_llist with nint_map_llist of 1000
#symload
map_llist with nint_map_f1un_llist of 1000
#symload
map_fun_llist with nint_map_f1un_llist of 1000
//
fun
<y0:vt>
nint_rmap_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
fun
<y0:vt>
nint_rmap_f1un_llist
 {n0:i0}
(xs: nint(n0)
,f0: nintlt(n0)->y0): list_vt(y0, n0)
//
#symload
rmap_llist with nint_rmap_llist of 1000
#symload
rmap_llist with nint_rmap_f1un_llist of 1000
#symload
rmap_fun_llist with nint_rmap_f1un_llist of 1000
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
nint_map_f1un_lstrm
( xs: nint
, fopr: (nint)->(y0)): strm_vt(y0)
//
#symload
map_lstrm with nint_map_f1un_lstrm of 1000
#symload
map_fun_lstrm with nint_map_f1un_lstrm of 1000
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
nint_rmap_f1un_lstrm
( xs: nint
, fopr: (nint)->(y0)): strm_vt(y0)
//
#symload
rmap_lstrm with nint_rmap_f1un_lstrm of 1000
#symload
rmap_fun_lstrm with nint_rmap_f1un_lstrm of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
strn_gmake( a ): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_slice
{n0:i0}
{i0:nat
;j0:int
|i0<=j0
;j0<=n0}
( cs: strn(n0)
, i0: sint(i0)
, j0: sint(j0)): strn(j0-i0)
#symload
slice with strn_slice of 1000
//
fun<>
strn_prefix
{n0:i0}
{i0:i0|i0<=n0}
( cs: strn(n0)
, i0: sint(i0)): strn(i0)
fun<>
strn_suffix
{n0:i0}
{i0:i0|i0<=n0}
( cs: strn(n0)
, i0: sint(i0)): strn(n0-i0)
//
#symload
prefix with strn_prefix of 1000
#symload
suffix with strn_suffix of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<cs:t0>
strn_make_gseq(cs: cs): strn
fun
<xs:t0>
<x0:t0>
// HX: map$fopr(x0):cgtz
strn_map$make_gseq(xs: xs): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_make_ncpy
{n0:i0}
(n0:nint(n0),ch:cgtz): strn(n0)
#symload
strn with strn_make_ncpy of 1000
//
fun<>
strn_make_nfun
{n0:i0}
(n0: nint(n0)
,f0: nintlt(n0)->cgtz): strn(n0)
#symload
strn with strn_make_nfun of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun<>
strn_forall(cs: strn): bool
fun<>
strn_rforall(cs: strn): bool
fun<>
strn_iforall(cs: strn): bool
*)
fun<>
strn_irforall(cs: strn): bool
//
(*
fun<>
strn_foritm(cs: strn): void
fun<>
strn_rforitm(cs: strn): void
fun<>
strn_iforitm(cs: strn): void
*)
fun<>
strn_irforitm(cs: strn): void
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
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_irmap_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_irmap_self(xs: xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_irmap_list(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_llist(xs: xs): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_lstrm(xs: xs): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_lstrq(xs: xs): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_irmap_rlist(xs: xs): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_rllist(xs: xs): list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:t0>
list_forall(xs: list(x0)): bool
fun
<x0:t0>
list_rforall(xs: list(x0)): bool
fun
<x0:t0>
list_iforall(xs: list(x0)): bool
*)
fun
<x0:t0>
list_irforall(xs: list(x0)): bool
//
(*
fun
<x0:t0>
list_foritm(xs: list(x0)): void
fun
<x0:t0>
list_rforitm(xs: list(x0)): void
fun
<x0:t0>
list_iforitm(xs: list(x0)): void
*)
fun
<x0:t0>
list_irforitm(xs: list(x0)): void
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
fun
<xs:t0>
<x0:t0>
gseq_irforall_f2un
(xs: xs, test: (ni, x0)->bool): bool
//
#symload irforall with gseq_irforall_f2un of 0100
#symload irforall_fun with gseq_irforall_f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_irexists_f2un
(xs: xs, test: (ni, x0)->bool): bool
//
#symload irexists with gseq_irexists_f2un of 0100
#symload irexists_fun with gseq_irexists_f2un of 0100
//
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 12:19:14 PM EDT
*)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_foritm_f1un
(xs: xs, work: (x0)->void): void
#symload foritm with gseq_foritm_f1un of 0100
#symload foritm_fun with gseq_foritm_f1un of 0100
*)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_rforitm_f1un
(xs: xs, work: (x0)->void): void
#symload rforitm with gseq_rforitm_f1un of 0100
#symload rforitm_fun with gseq_rforitm_f1un of 0100
*)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_iforitm_f2un
(xs: xs, work: (ni,x0)->void): void
#symload iforitm with gseq_iforitm_f2un of 0100
#symload iforitm_fun with gseq_iforitm_f2un of 0100
*)
//
(*
fun
<xs:t0>
<x0:t0>
gseq_irforitm_f2un
(xs: xs, work: (ni,x0)->void): void
#symload irforitm with gseq_irforitm_f2un of 0100
#symload irforitm_fun with gseq_irforitm_f2un of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_folditm_f2un
( xs: xs
, r0: r0, fopr: (r0, x0)->(r0)): (r0)
//
#symload folditm with gseq_folditm_f2un of 0100
#symload folditm_fun with gseq_folditm_f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfolditm_f2un
( xs: xs
, r0: r0, fopr: (x0, r0)->(r0)): (r0)
//
#symload rfolditm with gseq_rfolditm_f2un of 0100
#symload rfolditm_fun with gseq_rfolditm_f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifolditm_f3un
( xs: xs
, r0: r0, fopr: (r0, ni, x0)->(r0)): (r0)
//
#symload ifolditm with gseq_ifolditm_f3un of 0100
#symload ifolditm_fun with gseq_ifolditm_f3un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfolditm_f3un
( xs: xs
, r0: r0, fopr: (ni, x0, r0)->(r0)): (r0)
//
#symload irfolditm with gseq_irfolditm_f3un of 0100
#symload irfolditm_fun with gseq_irfolditm_f3un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_foldall_f2un
( xs: xs
, r0: r0
, fopr: (r0, x0)->(bool, r0)): ( r0 )
//
#symload foldall with gseq_foldall_f2un of 0100
#symload foldall_fun with gseq_foldall_f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_rfoldall_f2un
( xs: xs
, r0: r0
, fopr: (x0, r0)->(bool, r0)): ( r0 )
//
#symload rfoldall with gseq_rfoldall_f2un of 0100
#symload rfoldall_fun with gseq_rfoldall_f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_ifoldall_f3un
( xs: xs
, r0: r0
, fopr: (r0, ni, x0)->(bool, r0)): (r0)
//
#symload ifoldall with gseq_ifoldall_f3un of 0100
#symload ifoldall_fun with gseq_ifoldall_f3un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
gseq_irfoldall_f3un
( xs: xs
, r0: r0
, fopr: (ni, x0, r0)->(bool, r0)): (r0)
//
#symload irfoldall with gseq_irfoldall_f3un of 0100
#symload irfoldall_fun with gseq_irfoldall_f3un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
<y0:vt>
gseq_map_ares_f1un
(xs: xs, fopr: (x0)->(y0)): (ys)
//
fun
<xs:t0>
<x0:t0>
gseq_map_self_f1un
(xs: xs, fopr: (x0)->(x0)): (xs)
//
#symload map with gseq_map_ares_f1un of 0100
#symload map_fun with gseq_map_ares_f1un of 0100
//
#symload map with gseq_map_self_f1un of 0110
#symload map_fun with gseq_map_self_f1un of 0110
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 03:16:49 AM EDT
*)
//
(* ****** ****** *)
//
fun
<x0:t0>
c2hoose$forall$test(x0, x0): bool
fun
<x0:t0>
c3hoose$forall$test(x0, x0, x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
list_c2hoose_lstrm
(xs: list(x0)): strm_vt@(x0, x0)
//
#symload c2hoose_lstrm with list_c2hoose_lstrm
//
fun
<x0:t0>
list_c2hoose$forall(list(x0)): bool
fun
<x0:t0>
list_c2hoose$forall_f2un
(xs:list(x0), test:(x0,x0)->bool): bool
//
#symload c2hoose$forall with list_c2hoose$forall
#symload c2hoose$forall with list_c2hoose$forall_f2un
//
(* ****** ****** *)
//
fun
<x0:t0>
list_c3hoose_lstrm
(xs: list(x0)): strm_vt@(x0, x0, x0)
//
#symload c3hoose_lstrm with list_c3hoose_lstrm
//
fun
<x0:t0>
list_c3hoose$forall(list(x0)): bool
fun
<x0:t0>
list_c3hoose$forall_f3un
(xs:list(x0), test:(x0,x0,x0)->bool): bool
//
#symload c3hoose$forall with list_c3hoose$forall
#symload c3hoose$forall with list_c3hoose$forall_f3un
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 12:53:34 PM EDT
*)
//
fun
<x0:vt> // HX: vt!
fmake$fwork((*void*)): void
fun
<x0:t0>
fmake$fwork$work(x0: x0): void
//
fun
<x0:t0>
list_fmake((*void*)): list(x0)
fun
<x0:t0>
list_fmake_fwork
(fwork: (x0->void)->void): list(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast // fun
GSEQ_make_list
{a:t0}
(xs: list(a)): GSEQ(list(a), a)
#symload GSEQ with GSEQ_make_list of 1000
#symload GSEQ_list with GSEQ_make_list of 1000
//
fcast // fun
GSEQ_make_strn
(xs: strn): GSEQ(strn, cgtz)
#symload GSEQ with GSEQ_make_strn of 1000
#symload GSEQ_strn with GSEQ_make_strn of 1000
fcast // fun
GASZ_make_strn
(xs: strn): GASZ(strn, cgtz)
#symload GASZ with GASZ_make_strn of 1000
#symload GASZ_strn with GASZ_make_strn of 1000
//
fcast // fun
GSEQ_make_nint0
(xs: nint): GSEQ(nint, unit)
fcast // fun
GSEQ_make_nint1
(xs: nint): GSEQ(nint, nint)
#symload GSEQ with GSEQ_make_nint1 of 1000
#symload GSEQ_nint0 with GSEQ_make_nint0 of 1000
#symload GSEQ_nint1 with GSEQ_make_nint1 of 1000
fcast // fun
GASZ_make_nint0
(xs: nint): GASZ(nint, unit)
fcast // fun
GASZ_make_nint1
(xs: nint): GASZ(nint, nint)
#symload GASZ with GASZ_make_nint1 of 1000
#symload GASZ_nint0 with GASZ_make_nint0 of 1000
#symload GASZ_nint1 with GASZ_make_nint1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 09:20:01 PM EDT
*)
fun
<x0:t0>
g_ncpy(x0, nint): (x0)
#symload ncpy with g_ncpy of 0100
//
(* ****** ****** *)
//
(*
HX-2024-7-31:
Wed 31 Jul 2024 07:58:53 PM EDT
*)
//
fun
<xs:t0>
g_append(y1: xs, y2: xs): (xs) // for [appends]
fun
<xs:t0>
g_prepend(y1: xs, y2: xs): (xs) // for [prepends]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
rz2forall$test(x0, y0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
irz2forall$test(ni, x0, y0): bool
//
(* ****** ****** *)
//
(*
fun
<x0:t0>
<y0:t0>
z2foritm$work(x0, y0): void
*)
fun
<x0:t0>
<y0:t0>
rz2foritm$work(x0, y0): void
(*
fun
<x0:t0>
<y0:t0>
iz2foritm$work(ni, x0, y0): void
*)
fun
<x0:t0>
<y0:t0>
irz2foritm$work(ni, x0, y0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2forall(xs: xs, ys: ys): bool
*)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_rz2forall(xs: xs, ys: ys): bool
(*
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2forall(xs: xs, ys: ys): bool
*)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_irz2forall(xs: xs, ys: ys): bool
//
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2foritm(xs: xs, ys: ys): void
*)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_rz2foritm(xs: xs, ys: ys): void
(*
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2foritm(xs: xs, ys: ys): void
*)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_irz2foritm(xs: xs, ys: ys): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
gz2seq
( xs: t0, x0: t0
, ys: t0, y0: t0) =
(
  z2tup(GSEQ(xs, x0), GSEQ(ys, y0)))
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
GSEQ_z2make
( xs: GSEQ(xs, x0)
, ys: GSEQ(ys, y0)): GSEQ(gz2seq(xs,x0,ys,y0), (x0,y0))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_z2forall
( xs: list(x0)
, ys: list(y0)): bool//end-of-[fun]
//
fun
<x0:t0>
<y0:t0>
list_iz2forall
( xs: list(x0)
, ys: list(y0)): bool//end-of-[fun]
//
#symload
z2forall with list_z2forall of 1000
#symload
iz2forall with list_iz2forall of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<x0:t0>
<y0:t0>
x2forall$test(x0, y0): bool
fun
<x0:t0>
<y0:t0>
x2rforall$test(x0, y0): bool
fun
<x0:t0>
<y0:t0>
x2iforall$test(ni, x0, ni, y0): bool
*)
fun
<x0:t0>
<y0:t0>
x2irforall$test(ni, x0, ni, y0): bool
//
(* ****** ****** *)
//
(*
fun
<x0:t0>
<y0:t0>
x2foritm$work(x0, y0): void
fun
<x0:t0>
<y0:t0>
x2rforitm$work(x0, y0): void
fun
<x0:t0>
<y0:t0>
x2iforitm$work(ni, x0, y0): void
*)
fun
<x0:t0>
<y0:t0>
x2irforitm$work(ni, x0, y0): void
//
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2rforall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2iforall(xs: xs, ys: ys): bool
*)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2irforall(xs: xs, ys: ys): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
gx2seq
( xs: t0, x0: t0
, ys: t0, y0: t0) =
(
  x2tup(GSEQ(xs, x0), GSEQ(ys, y0)))
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
GSEQ_x2make
( xs: GSEQ(xs, x0)
, ys: GSEQ(ys, y0)): GSEQ(gx2seq(xs, x0, ys, y0), (x0, y0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_f1un_llist
( xs: xs
, fopr: (x0)->(y0)): list_vt(y0)
*)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map_f1un_rllist
( xs: xs
, fopr: (x0)->(y0)): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_rmap_f1un_list
( xs: xs
, fopr: (x0)->(y0)): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_f1un_llist
( xs: xs
, fopr: (x0)->(y0)): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_f1un_lstrm
( xs: xs
, fopr: (x0)->(y0)): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_f1un_lstrq
( xs: xs
, fopr: (x0)->(y0)): strq_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_rmap_f1un_rlist
( xs: xs
, fopr: (x0)->(y0)): list(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_rmap_f1un_rllist
( xs: xs
, fopr: (x0)->(y0)): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
gseq_imap_f2un_rlist
( xs: xs
, fopr: (ni, x0)->(y0)): list(y0)
(*
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_f2un_llist
( xs: xs
, fopr: (ni, x0)->(y0)): list_vt(y0)
*)
(*
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_f2un_lstrm
( xs: xs
, fopr: (ni, x0)->(y0)): strm_vt(y0)
*)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_f2un_lstrq
( xs: xs
, fopr: (ni, x0)->(y0)): strq_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_imap_f2un_rllist
( xs: xs
, fopr: (ni, x0)->(y0)): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_f2un_llist
( xs: xs
, fopr: (ni, x0)->(y0)): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_f2un_lstrm
( xs: xs
, fopr: (ni, x0)->(y0)): strm_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_f2un_lstrq
( xs: xs
, fopr: (ni, x0)->(y0)): strq_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_irmap_f2un_rllist
( xs: xs
, fopr: (ni, x0)->(y0)): list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: gfun000.sats
*)
//
fun
<a1:t0>
f1un_not
( f0
: f1un(a1,bool)): f1un(a1,bool)
fun<>
f0un_repeat_nint
( f0
: f0un(void), times: nint): void
//
fun
<x0:vt>
f0un_enum$make0_strx_vt
  (xs: strx_vt( x0 )): f0un( x0 )
//
fun
<xs:t0>
<x0:t0>
f1un_srch$make_gseq(xs): f1un(x0,bool)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 11:35:35 AM EDT
*)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$listize
(xs: xs): list_vt(y0) //HX: [map_llist]
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$strmize
(xs: xs): strm_vt(y0) //HX: [map_lstrm]
fun
<xs:t0>
<x0:t0>
<y0:vt>
gseq_map$strqize
(xs: xs): strq_vt(y0) //HX: [map_lstrq]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-16:
Fri 16 Aug 2024 08:33:31 AM EDT
*)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
// HX: this one composes [map] with
gseq_map$forall(xs: xs): bool // [forall]
fun
<xs:t0>
<x0:t0>
<y0:vt>
// HX: this one composes
gseq_map$forall_f1un // [map] with
(xs: xs, fopr: (x0)->y0): bool // [forall]
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
// HX: this one composes [imap] with
gseq_imap$iforall(xs: xs): bool // [iforall]
fun
<xs:t0>
<x0:t0>
<y0:vt>
// HX: this one composes
gseq_imap$iforall_f2un // [imap] with
(xs: xs, fopr: (ni,x0)->y0): bool // [iforall]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0> // HX: this one is forall cond.
gseq_uncons$forall(xs: xs): bool // on uncons
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0> // HX: it is strmize cond. on
gseq_uncons$strmize(xs:xs): strm_vt(x0)//uncons
fun
<xs:t0>
<x0:t0> // HX: it is strqize cond. on
gseq_uncons$strqize(xs:xs): strq_vt(x0)//uncons
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_fmake((*void*)): strn
fun<>
strn_fmake_fwork
(fwork: (cgtz->void)->void): strn//HX:3rd-order!
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_forall_f1un
(cs: strn, test: (cgtz)->bool): bool
#symload forall with strn_forall_f1un of 1000
//
fun<>
strn_rforall_f1un
(cs: strn, test: (cgtz)->bool): bool
#symload rforall with strn_rforall_f1un of 1000
//
fun<>
strn_iforall_f2un
(cs: strn, test: (ni,cgtz)->bool): bool
#symload iforall with strn_iforall_f2un of 1000
//
fun<>
strn_irforall_f2un
(cs: strn, test: (ni,cgtz)->bool): bool
#symload irforall with strn_irforall_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_foritm_f1un
(cs: strn, work: (cgtz)->void): void
#symload foritm with strn_foritm_f1un of 1000
//
fun<>
strn_rforitm_f1un
(cs: strn, work: (cgtz)->void): void
#symload rforitm with strn_rforitm_f1un of 1000
//
fun<>
strn_iforitm_f2un
(cs: strn, work: (ni,cgtz)->void): void
#symload iforitm with strn_iforitm_f2un of 1000
//
fun<>
strn_irforitm_f2un
(cs: strn, work: (ni,cgtz)->void): void
#symload irforitm with strn_irforitm_f2un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
gseq_strn$concat(xs: xs(*strnseq*)): strn
#symload strn$concat with gseq_strn$concat of 1000
//
fun
<xs:t0>
gseq_strn$rconcat(xs: xs(*strnseq*)): strn
#symload strn$rconcat with gseq_strn$rconcat of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
list_make_gseq(xs: xs): list(x0)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
// HX: map$fopr(x0):y0
list_map$make_gseq(xs: xs): list(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_make_t0up1
(tup: t0up(x0)): list(x0,1)
fun
<x0:t0>
list_make_t0up2
(tup: t0up(x0,x0)): list(x0,2)
fun
<x0:t0>
list_make_t0up3
(tup: t0up(x0,x0,x0)): list(x0,3)
//
fun
<x0:t0>
list_make_t0up4
(tup: t0up(x0,x0,x0,x0)): list(x0,4)
fun
<x0:t0>
list_make_t0up5
(tup: t0up(x0,x0,x0,x0,x0)): list(x0,5)
fun
<x0:t0>
list_make_t0up6
(tup: t0up(x0,x0,x0,x0,x0,x0)): list(x0,6)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_fmake_fwork(fwork: ((x0)->void)->void): xs
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_xunimpl.sats] *)
