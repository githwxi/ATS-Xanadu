(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)
//
(*
//
// HX-2020-02-26:
// this idea is abandoned!!!
//
absprop
gseq_prop
(x0: tflt, xs: tflt)
propdef
gseq
( x0: tflt
, xs: tflt) = gseq_prop(x0, xs)
*)
//
(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
gseq_nil(): xs
fun
<x0:tflt
,xs:tflt>
gseq_cons(x0, xs): xs

(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
gseq_nil?(xs): bool
fun
<x0:tflt
,xs:tflt>
gseq_cons?(xs): bool

(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
gseq_length(xs): nint

(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
gseq_forall(xs): bool

(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
gseq_foreach(xs): void

(* ****** ****** *)
//
fun
<x0:tflt
,xs:tflt>
gseq_listize(xs): list_vt(x0)
//
fun
<x0:tflt
,xs:tflt>
gseq_streamize(xs): stream_vt(x0)
//
(* ****** ****** *)
//
(*
gseq_map: map$fopr
*)
//
fun
<x0:tflt
,xs:tflt>
<y0:vtflt>
gseq_map_list(xs): list_vt(y0)
fun
<x0:tflt
,xs:tflt>
<y0:vtflt>
gseq_map_rlist(xs): list_vt(y0)
//
(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
gseq_copy_list(xs): list_vt(x0)
fun
<x0:tflt
,xs:tflt>
gseq_copy_rlist(xs): list_vt(x0)

(* ****** ****** *)
//
(*
gseq_foldl: foldl$fopr
gseq_foldr: foldr$fopr
*)
//
fun
<x0:tflt
,xs:tflt>
<r0:vtflt>
gseq_foldl(xs, r0): r0
fun
<x0:tflt
,xs:tflt>
<r0:vtflt>
gseq_foldr(xs, r0): r0
//
(* ****** ****** *)
//
fun
<x0:tflt,xs:tflt>gseq_add(xs): x0
fun
<x0:tflt,xs:tflt>gseq_mul(xs): x0
//
(* ****** ****** *)

(* end of [gseq.sats] *)
