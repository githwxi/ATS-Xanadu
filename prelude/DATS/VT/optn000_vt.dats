(* ****** ****** *)
(*
** For opts_vt
*)
(* ****** ****** *)
(*
#staload
"./../SATS/optn.sats"
*)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
optn_vt_nilq(xs) =
(
case+ xs of
| !
optn_vt_nil() => true
| !
optn_vt_cons(x0) => false
)
//
#impltmp
<>(*tmp*)
optn_vt_consq(xs) =
(
case+ xs of
| !
optn_vt_nil() => false
| !
optn_vt_cons(x0) => (true)
)
//
#impltmp
{a:vt}
g_free
<optn_vt(a)> = optn_vt_free<a>
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_vt_free(xs) =
(
case+ xs of
| ~
optn_vt_nil() => ()
| ~
optn_vt_cons(x0) => g_free<a>(x0)
)
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
optn_vt_copy(xs) =
(
case+ xs of
| !
optn_vt_nil() =>
optn_vt_nil()
| !
optn_vt_cons(x0) =>
let
val x0 =
g_copy<a>(x0) in optn_vt_cons(x0)
end
) (* end of [optn_vt_copy] *)

(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_vt_length1(xs) =
(
case+ xs of
| !none_vt() => 0 | !some_vt(x0) => 1
)
//
(* ****** ****** *)

#impltmp
<a>(*tmp*)
optn_vt_forall0(xs) =
(
case+ xs of
| ~optn_vt_nil() => true
| ~optn_vt_cons(x0) => forall0$test<a>(x0)
) (* end of [glseq_forall0] *)
#impltmp
<a>(*tmp*)
optn_vt_forall1(xs) =
(
case+ xs of
| !optn_vt_nil() => true
| !optn_vt_cons(x0) => forall1$test<a>(x0)
) (* end of [glseq_forall1] *)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
optn_vt_foreach0(xs) =
(
case+ xs of
| ~optn_vt_nil() => ()
| ~optn_vt_cons(x0) => foreach0$work<a>(x0)
) (* end of [glseq_foreach0] *)
#impltmp
<a>(*tmp*)
optn_vt_foreach1(xs) =
(
case+ xs of
| !optn_vt_nil() => ()
| !optn_vt_cons(x0) => foreach1$work<a>(x0)
) (* end of [glseq_foreach1] *)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
optn_vt_listize(xs) =
(
case+ xs of
| ~
optn_vt_nil() => list_vt_nil()
| ~
optn_vt_cons(x0) => list_vt_sing(x0)
)
#impltmp
<a>(*tmp*)
optn_vt_strmize(xs) =
$llazy
(
g_free(xs);
case+ xs of
| ~
optn_vt_nil() => strmcon_vt_nil()
| ~
optn_vt_cons(x0) => strmcon_vt_sing(x0)
)

(* ****** ****** *)

#impltmp
<a>(*tmp*)
optn_vt_rlistize(xs) =
(
case+ xs of
| ~
optn_vt_nil() => list_vt_nil()
| ~
optn_vt_cons(x0) => list_vt_sing(x0)
)

(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
#impltmp
{a:vt}
gl_print1<optn_vt(a)> =
glseq_print1<optn_vt(a)><a>
//
#impltmp
{a:vt}
glseq_print$beg
<optn_vt(a)><a>() = strn_print("(")
#impltmp
{a:vt}
glseq_print$end
<optn_vt(a)><a>() = strn_print(")")
//
(* ****** ****** *)

#impltmp
{a:vt}
glseq_forall0<optn_vt(a)><a> = optn_vt_forall0
#impltmp
{a:vt}
glseq_forall1<optn_vt(a)><a> = optn_vt_forall1

(* ****** ****** *)
//
#impltmp
{a:vt}
glseq_listize<optn_vt(a)><a> = optn_vt_listize
#impltmp
{a:vt}
glseq_strmize<optn_vt(a)><a> = optn_vt_strmize
//
#impltmp
{a:vt}
glseq_rlistize<optn_vt(a)><a> = optn_vt_rlistize
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_optn000_vt.dats] *)
