(* ****** ****** *)
(*
** For linear envs
*)
(* ****** ****** *)
(*
Author: Hongwei Xi
(*
Thu Aug  4 16:46:11 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#typedef i0 = sint
#typedef n0 = nint
//
(* ****** ****** *)
(* ****** ****** *)
fun
<x0:t0>
<r0:vt>
<e1:vt>
foldl$e1nv$fopr
( r0: r0
, x0: x0, e1: !e1): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
foldr$e1nv$fopr
( x0: x0
, r0: r0, e1: !e1): r0
//
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
foldl$e2nv$fopr
( r0: r0
, x0: x0, e1: !e1, e2: !e2): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
foldr$e2nv$fopr
( x0: x0
, r0: r0, e1: !e1, e2: !e2): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
<e1:vt>
ifoldl$e1nv$fopr
( r0: r0
, i0: n0
, x0: x0, e1: !e1): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
ifoldr$e1nv$fopr
( i0: n0
, x0: x0
, r0: r0, e1: !e1): r0
//
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
ifoldl$e2nv$fopr
( r0: r0
, i0: n0
, x0: x0, e1: !e1, e2: !e2): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
ifoldr$e2nv$fopr
( i0: n0
, x0: x0
, r0: r0, e1: !e1, e2: !e2): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
forall$e1nv$test
(x0: x0, e1: !e1): bool
fun
<x0:t0>
<e1:vt>
iforall$e1nv$test
( i0: n0, x0: x0, e1: !e1): bool
//
fun
<x0:t0>
<e1:vt>
<e2:vt>
forall$e2nv$test
(x0: x0, e1: !e1, e2: !e2): bool
fun
<x0:t0>
<e1:vt>
<e2:vt>
iforall$e2nv$test
( i0: n0
, x0: x0, e1: !e1, e2: !e2): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
foritm$e1nv$work
(x0: x0, e1: !e1): void
fun
<x0:t0>
<e1:vt>
iforitm$e1nv$work
(i0: n0, x0: x0, e1: !e1): void
//
fun
<x0:t0>
<e1:vt>
<e2:vt>
foritm$e2nv$work
(x0: x0, e1: !e1, e2: !e2): void
fun
<x0:t0>
<e1:vt>
<e2:vt>
iforitm$e2nv$work
( i0: n0
, x0: x0, e1: !e1, e2: !e2): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
<e1:vt>
map$e1nv$fopr
(x0: x0, e1: !e1): (y0)
fun
<x0:t0>
<y0:vt>
<e1:vt>
imap$e1nv$fopr
(i0: n0, x0: x0, e1: !e1): (y0)
//
fun
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
map$e2nv$fopr
(x0: x0, e1: !e1, e2: !e2): (y0)
fun
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
imap$e2nv$fopr
( i0: n0
, x0: x0, e1: !e1, e2: !e2): (y0)
//
(* ****** ****** *)
(*
HX: variants of gseq-functions
*)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
<e1:vt>
gseq_foldl$e1nv
(xs: xs, r0: r0, e1: !e1): r0
fun
<xs:t0>
<x0:t0>
<r0:vt>
<e1:vt>
gseq_foldr$e1nv
(xs: xs, r0: r0, e1: !e1): r0
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
<e1:vt>
gseq_ifoldl$e1nv
(xs: xs, r0: r0, e1: !e1): r0
fun
<xs:t0>
<x0:t0>
<r0:vt>
<e1:vt>
gseq_ifoldr$e1nv
(xs: xs, r0: r0, e1: !e1): r0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_forall$e1nv(xs, !e1): bool
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_iforall$e1nv(xs, !e1): bool
//
fun
<x0:t0>
<e1:vt>
list_forall$e1nv
{n:i0}(list(x0, n), e1: !e1): bool
fun
<x0:t0>
<e1:vt>
list_iforall$e1nv
{n:i0}(list(x0, n), e1: !e1): bool
//
fun
<x0:t0>
<e1:vt>
optn_forall$e1nv
{b:b0}(optn(x0, b), e1: !e1): bool
fun
<x0:t0>
<e1:vt>
optn_iforall$e1nv
{b:b0}(optn(x0, b), e1: !e1): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
<e2:vt>
gseq_forall$e2nv(xs, !e1, !e2): bool
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
<e2:vt>
gseq_iforall$e2nv(xs, !e1, !e2): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_foritm$e1nv(xs, !e1): void
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_iforitm$e1nv(xs, !e1): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
list_foritm$e1nv
{n:i0}(list(x0, n), e1: !e1): void
fun
<x0:t0>
<e1:vt>
optn_foritm$e1nv
{b:b0}(optn(x0, b), e1: !e1): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
<e2:vt>
gseq_foritm$e2nv(xs,!e1,!e2): void
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
<e2:vt>
gseq_iforitm$e2nv(xs,!e1,!e2): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
gseq_map$e1nv_llist
  ( xs: xs, e1: !e1 ): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
gseq_imap$e1nv_llist
  ( xs: xs, e1: !e1 ): list_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
list_map$e1nv
{n:i0}
(list(x0, n), e1: !e1): list(y0, n)
fun
<x0:t0>
<y0:t0>
<e1:vt>
list_map$e1nv_vt
{n:i0}
(list(x0, n), e1: !e1): list_vt(y0, n)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
optn_map$e1nv
{b:b0}
(optn(x0, b), e1: !e1): optn(y0, b)
fun
<x0:t0>
<y0:t0>
<e1:vt>
optn_map$e1nv_vt
{b:b0}
(optn(x0, b), e1: !e1): optn_vt(y0, b)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
gseq_map$e2nv_llist
(xs: xs, e1: !e1, e2: !e2): list_vt(y0)
//
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
gseq_imap$e2nv_llist
(xs: xs, e1: !e1, e2: !e2): list_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
list_map$e2nv
{n:i0}
(list(x0, n), e1: !e1, e2: !e2): list(y0, n)
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
list_map$e2nv_vt
{n:i0}
(list(x0, n), e1: !e1, e2: !e2): list_vt(y0, n)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
optn_map$e2nv
{b:b0}
(optn(x0, b), e1: !e1, e2: !e2): optn(y0, b)
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
optn_map$e2nv_vt
{b:b0}
(optn(x0, b), e1: !e1, e2: !e2): optn_vt(y0, b)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_genv000.sats] *) 
