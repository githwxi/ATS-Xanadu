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
foldl_e1nv$fopr
( r0: r0
, x0: x0, e1: !e1): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
foldl_e2nv$fopr
( r0: r0
, x0: x0, e1: !e1, e2: !e2): r0
//
fun
<x0:t0>
<r0:vt>
<e1:vt>
foldr_e1nv$fopr
( x0: x0
, r0: r0, e1: !e1): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
<e2:vt>
foldr_e2nv$fopr
( x0: x0
, r0: r0, e1: !e1, e2: !e2): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
forall_e1nv$test
(x0: x0, e1: !e1): bool
fun
<x0:t0>
<e1:vt>
<e2:vt>
forall_e2nv$test
(x0: x0, e1: !e1, e2: !e2): bool
//
fun
<x0:t0>
<e1:vt>
foreach_e1nv$work
(x0: x0, e1: !e1): void
fun
<x0:t0>
<e1:vt>
<e2:vt>
foreach_e2nv$work
(x0: x0, e1: !e1, e2: !e2): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
<e1:vt>
map_e1nv$fopr
(x0: x0, e1: !e1): (y0)
fun
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
map_e2nv$fopr
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
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_foreach_e1nv(xs, !e1): void
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
{n:int}
(list(x0, n), e1: !e1): list(y0, n)
fun
<x0:t0>
<y0:t0>
<e1:vt>
list_map_e1nv_vt
{n:int}
(list(x0, n), e1: !e1): list_vt(y0, n)
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
{n:int}
(list(x0, n), e1: !e1, e2: !e2): list(y0, n)
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
list_map_e2nv_vt
{n:int}
(list(x0, n), e1: !e1, e2: !e2): list_vt(y0, n)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_genv000.sats] *)
 
