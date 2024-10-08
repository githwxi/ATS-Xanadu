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
foldl$fopr_e1nv
( r0: r0
, x0: x0, e1: !e1): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
foldr$fopr_e1nv
( x0: x0
, r0: r0, e1: !e1): r0
//
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
foldl$fopr_e2nv
( r0: r0
, x0: x0, e1: !e1, e2: !e2): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
foldr$fopr_e2nv
( x0: x0
, r0: r0, e1: !e1, e2: !e2): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
<e1:vt>
ifoldl$fopr_e1nv
( r0: r0
, i0: n0
, x0: x0, e1: !e1): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
ifoldr$fopr_e1nv
( i0: n0
, x0: x0
, r0: r0, e1: !e1): r0
//
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
ifoldl$fopr_e2nv
( r0: r0
, i0: n0
, x0: x0, e1: !e1, e2: !e2): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
ifoldr$fopr_e2nv
( i0: n0
, x0: x0
, r0: r0, e1: !e1, e2: !e2): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
forall$test_e1nv
(x0: x0, e1: !e1): bool
fun
<x0:t0>
<e1:vt>
iforall$test_e1nv
( i0: n0, x0: x0, e1: !e1): bool
//
fun
<x0:t0>
<e1:vt>
<e2:vt>
forall$test_e2nv
(x0: x0, e1: !e1, e2: !e2): bool
fun
<x0:t0>
<e1:vt>
<e2:vt>
iforall$test_e2nv
( i0: n0
, x0: x0, e1: !e1, e2: !e2): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
foritm$work_e1nv
(x0: x0, e1: !e1): void
fun
<x0:t0>
<e1:vt>
iforitm$work_e1nv
(i0: n0, x0: x0, e1: !e1): void
//
fun
<x0:t0>
<e1:vt>
<e2:vt>
foritm$work_e2nv
(x0: x0, e1: !e1, e2: !e2): void
fun
<x0:t0>
<e1:vt>
<e2:vt>
iforitm$work_e2nv
( i0: n0
, x0: x0, e1: !e1, e2: !e2): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
<e1:vt>
map$fopr_e1nv
(x0: x0, e1: !e1): (y0)
fun
<x0:t0>
<y0:vt>
<e1:vt>
imap$fopr_e1nv
(i0: n0, x0: x0, e1: !e1): (y0)
//
fun
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
map$fopr_e2nv
(x0: x0, e1: !e1, e2: !e2): (y0)
fun
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
imap$fopr_e2nv
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
gseq_foldl_e1nv
(xs: xs, r0: r0, e1: !e1): r0
fun
<xs:t0>
<x0:t0>
<r0:vt>
<e1:vt>
gseq_foldr_e1nv
(xs: xs, r0: r0, e1: !e1): r0
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
<e1:vt>
gseq_ifoldl_e1nv
(xs: xs, r0: r0, e1: !e1): r0
fun
<xs:t0>
<x0:t0>
<r0:vt>
<e1:vt>
gseq_ifoldr_e1nv
(xs: xs, r0: r0, e1: !e1): r0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_forall_e1nv(xs, !e1): bool
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_iforall_e1nv(xs, !e1): bool
//
fun
<x0:t0>
<e1:vt>
list_forall_e1nv
{n:i0}(list(x0, n), e1: !e1): bool
fun
<x0:t0>
<e1:vt>
list_iforall_e1nv
{n:i0}(list(x0, n), e1: !e1): bool
//
fun
<x0:t0>
<e1:vt>
optn_forall_e1nv
{b:b0}(optn(x0, b), e1: !e1): bool
fun
<x0:t0>
<e1:vt>
optn_iforall_e1nv
{b:b0}(optn(x0, b), e1: !e1): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
<e2:vt>
gseq_forall_e2nv(xs, !e1, !e2): bool
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
<e2:vt>
gseq_iforall_e2nv(xs, !e1, !e2): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_foritm_e1nv(xs, !e1): void
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_iforitm_e1nv(xs, !e1): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
list_foritm_e1nv
{n:i0}(list(x0, n), e1: !e1): void
fun
<x0:t0>
<e1:vt>
optn_foritm_e1nv
{b:b0}(optn(x0, b), e1: !e1): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
<e2:vt>
gseq_foritm_e2nv(xs,!e1,!e2): void
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
<e2:vt>
gseq_iforitm_e2nv(xs,!e1,!e2): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
gseq_map_e1nv_llist
  ( xs: xs, e1: !e1 ): list_vt(y0)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
gseq_imap_e1nv_llist
  ( xs: xs, e1: !e1 ): list_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
list_map_e1nv
{n:i0}
(list(x0, n), e1: !e1): list(y0, n)
fun
<x0:t0>
<y0:t0>
<e1:vt>
list_map_e1nv_vt
{n:i0}
(list(x0, n), e1: !e1): list_vt(y0, n)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
optn_map_e1nv
{b:b0}
(optn(x0, b), e1: !e1): optn(y0, b)
fun
<x0:t0>
<y0:t0>
<e1:vt>
optn_map_e1nv_vt
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
gseq_map_e2nv_llist
(xs: xs, e1: !e1, e2: !e2): list_vt(y0)
//
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
gseq_imap_e2nv_llist
(xs: xs, e1: !e1, e2: !e2): list_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
list_map_e2nv
{n:i0}
(list(x0, n), e1: !e1, e2: !e2): list(y0, n)
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
list_map_e2nv_vt
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
optn_map_e2nv
{b:b0}
(optn(x0, b), e1: !e1, e2: !e2): optn(y0, b)
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
optn_map_e2nv_vt
{b:b0}
(optn(x0, b), e1: !e1, e2: !e2): optn_vt(y0, b)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_genv000.sats] *) 
