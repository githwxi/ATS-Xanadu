(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-03:
Sat 03 Aug 2024 01:39:53 PM EDT
For implementing operations on so-called
2-list-based queues
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
qlist_t0_tx(a:t0) <= p0tr
(*
#abstbox
qlist_t0_i0_tx(a:t0) <= p0tr
*)
//
#typedef
qlist(a:t0) = qlist_t0_tx(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a:t0 }
g_ptype
<qlist(a)>() =
(
pstrn
("qlist(");
g_ptype<a>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
qlist_nil{a:t0}(): qlist(a)
//
#extern
fun
<a:t0>
qlist_snoc
(xs: qlist(a), x0: a): qlist(a)
//
#extern
fun
<a:t0>
qlist_nilq(xs: qlist(a)): bool
//
#extern
fun
<a:t0>
qlist_forall(xs: qlist(a)): bool
#extern
fun
<a:t0>
qlist_rforall(xs: qlist(a)): bool
//
#extern
fun
<a:t0>
qlist_strmize(xs: qlist(a)): strm_vt(a)
#extern
fun
<a:t0>
qlist_rstrmize(xs: qlist(a)): strm_vt(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fcast // fun
GSEQ_make_qlist
{a:t0}
(A:qlist(a)): GSEQ(qlist(a), a)
#symload GSEQ with GSEQ_make_qlist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:t0>
UN_qlist_uncons_raw(xs: qlist(a)): @(a, qlist(a))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
qlist_dt(a:type+) =
QLIST of
(list(a)(*f*), list(a)(*r*))
//
#absimpl
qlist_t0_tx(a:t0) = qlist_dt(a)
//
in//local
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
qlist_nil
((*nil*)) =
QLIST(list_nil, list_nil)
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
qlist_snoc
( xs, x0 ) =
let
val+
QLIST(f1, r2) = xs
in//let
QLIST(f1, list_cons(x0, r2))
end//let//end-(qlist_snoc(...))
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
qlist_nilq
 (  xs  ) =
let
val+
QLIST(f1, r2) = xs
in//let
if
list_nilq(r2)
then list_nilq(f1) else false
end//let//end-(qlist_nilq(...))
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
qlist_forall(xs) =
let
//
val+
QLIST(f1, r2) = xs
//
val b0 =
(
  list_forall<a>(f1))
in//let
//
if b0 then
(
  list_rforall<a>(r2)
) where
{
#impltmp
rforall$test<a> = forall$test<a>
}
else (false) // else // end-of-[if]
//
end//let//end-of-[qlist_forall(xs)]
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
qlist_rforall(xs) =
let
//
val+
QLIST(f1, r2) = xs
//
val b0 =
(
  list_forall<a>(r2)) where
{
#impltmp
forall$test<a> = rforall$test<a>
}
in//let
(
if b0 then
list_rforall<a>(f1) else (false) )
end//let//end-of-[qlist_rforall(xs)]
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
qlist_strmize(xs) =
let
//
val+
QLIST(f1, r2) = xs
//
in//let
strm_vt_append00
(list_strmize(f1), list_rstrmize(r2))
end//let//end-of-[qlist_strmize(xs)]
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
qlist_rstrmize(xs) =
let
//
val+
QLIST(f1, r2) = xs
//
in//let
strm_vt_append00
(list_strmize(r2), list_rstrmize(f1))
end//let//end-of-[qlist_rstrmize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
UN_qlist_uncons_raw
 (  xs  ) =
let
val+
QLIST(f1, r2) = xs
in//let
case+ f1 of
|
list_nil() =>
(
@(r2.0, r2.1)) where
{
  val r2 = list_reverse<a>(r2)
}(*where*)//end-of-[list_nil()]
|
list_cons(x1, f1) => (x1, QLIST(f1, r2))
end//let//end-of-[UN_qlist_uncons_raw(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
end//local//end-of-[datatype(qlist_dt(a))]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: t0 }
gseq$end
<qlist(a)><a>() = ")"
#impltmp
{ a: t0 }
gseq$sep
<qlist(a)><a>() = ","
#impltmp
{ a: t0 }
gseq$beg
<qlist(a)><a>() = "qlist("
//
(* ****** ****** *)
//
#impltmp
{ a: t0 }
g_print
<qlist(a)>(xs) =
(
gseq_print<qlist(a)><a>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: t0 }
gseq_nil<qlist(a)><a> = qlist_nil{a}
//
#impltmp
{ a: t0 }
gseq_snoc<qlist(a)><a> = qlist_snoc<a>
//
#impltmp
{ a: t0 }
gseq_nilq<qlist(a)><a> = qlist_nilq<a>
//
#impltmp
{ a: t0 }
gseq_forall<qlist(a)><a> = qlist_forall<a>
#impltmp
{ a: t0 }
gseq_rforall<qlist(a)><a> = qlist_rforall<a>
//
#impltmp
{ a: t0 }
gseq_strmize<qlist(a)><a> = qlist_strmize<a>
#impltmp
{ a: t0 }
gseq_rstrmize<qlist(a)><a> = qlist_rstrmize<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: t0 }
$UN.gseq_uncons_raw<qlist(a)><a> = UN_qlist_uncons_raw<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_qlist00.dats] *)
