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
//
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
<e2:vt>
foldl$fopr_e2nv
( r0: r0
, x0: x0, e1: !e1, e2: !e2): r0
//
fun
<x0:t0>
<r0:vt>
<e1:vt>
foldr$fopr_e1nv
( x0: x0
, r0: r0, e1: !e1): r0
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
<e1:vt>
forall$test_e1nv
(x0: x0, e1: !e1): bool
fun
<x0:t0>
<e1:vt>
<e2:vt>
forall$test_e2nv
(x0: x0, e1: !e1, e2: !e2): bool
//
fun
<x0:t0>
<e1:vt>
foreach$work_e1nv
(x0: x0, e1: !e1): void
fun
<x0:t0>
<e1:vt>
<e2:vt>
foreach$work_e2nv
(x0: x0, e1: !e1, e2: !e2): void
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
<e2:vt>
map$fopr_e2nv
(x0: x0, e1: !e1, e2: !e2): (y0)
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
<e2:vt>
gseq_forall_e2nv(xs, !e1, !e2): bool
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_foreach_e1nv(xs, !e1): void
fun
<xs:t0>
<x0:t0>
<e1:vt>
<e2:vt>
gseq_foreach_e2nv(xs, !e1, !e2): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
gseq_map_e1nv_list
(xs: xs, e1: !e1): list_vt(y0)
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
gseq_map_e2nv_list
(xs: xs, e1: !e1, e2: !e2): list_vt(y0)
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

(* end of [ATS3/XANADU_prelude_genv000.sats] *)
 
