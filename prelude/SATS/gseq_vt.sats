(* ****** ****** *)
(*
** For glseq-operations
*)
(* ****** ****** *)

fun
<x0:vt
,xs:vt>
glseq_nil(): xs
fun
<x0:vt
,xs:vt>
glseq_cons(x0, xs): xs

(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
glseq_nilq(!xs): bool
fun
<x0:vt
,xs:vt>
glseq_consq(!xs): bool
//
(*
fun
<x0:vt
,xs:vt>
glseq_is_nil(!xs): bool
fun
<x0:vt
,xs:vt>
glseq_is_cons(!xs): bool
*)
//
(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
glseq_length0(xs): nint
fun
<x0:vt
,xs:vt>
glseq_length1(!xs): nint
//
(* ****** ****** *)

(* end of [gseq_vt.sats] *)
