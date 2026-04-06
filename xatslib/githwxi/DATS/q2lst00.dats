(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-03:
Sat 03 Aug 2024 01:39:53 PM EDT
For implementing operations
on so-called 2-list-based queues
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
q2lst_t0_tx(a:t0) <= p0tr
(*
#abstbox
q2lst_t0_i0_tx(a:t0) <= p0tr
*)
//
#typedef
q2lst(a:t0) = q2lst_t0_tx(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a:t0 }
g_ptype
<q2lst(a)>() =
(
pstrn
("q2lst(");
g_ptype<a>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
q2lst_nil{a:t0}(): q2lst(a)
//
#extern
fun
<a:t0>
q2lst_snoc
(xs: q2lst(a), x0: a): q2lst(a)
//
#extern
fun
<a:t0>
q2lst_nilq(xs: q2lst(a)): bool
//
#extern
fun
<a:t0>
q2lst_forall(xs: q2lst(a)): bool
#extern
fun
<a:t0>
q2lst_rforall(xs: q2lst(a)): bool
//
#extern
fun
<a:t0>
q2lst_strmize(xs: q2lst(a)): strm_vt(a)
#extern
fun
<a:t0>
q2lst_rstrmize(xs: q2lst(a)): strm_vt(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fcast // fun
GSEQ_make_q2lst
{a:t0}
(A:q2lst(a)): GSEQ(q2lst(a), a)
#symload GSEQ with GSEQ_make_q2lst of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:t0>
UN_q2lst_uncons$raw(xs: q2lst(a)): @(a, q2lst(a))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
q2lst_dt(a:type+) =
Q2LST of
(list(a)(*f*), list(a)(*r*))
//
#absimpl
q2lst_t0_tx(a:t0) = q2lst_dt(a)
//
in//local
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
q2lst_nil
((*nil*)) =
Q2LST(list_nil, list_nil)
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
q2lst_snoc
( xs, x0 ) =
let
val+
Q2LST(f1, r2) = xs
in//let
Q2LST(f1, list_cons(x0, r2))
end//let//end-(q2lst_snoc(...))
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
q2lst_nilq
 (  xs  ) =
let
val+
Q2LST(f1, r2) = xs
in//let
if
list_nilq(r2)
then list_nilq(f1) else false
end//let//end-(q2lst_nilq(...))
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
q2lst_forall(xs) =
let
//
val+
Q2LST(f1, r2) = xs
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
end//let//end-of-[q2lst_forall(xs)]
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
q2lst_rforall(xs) =
let
//
val+
Q2LST(f1, r2) = xs
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
end//let//end-of-[q2lst_rforall(xs)]
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
q2lst_strmize(xs) =
let
//
val+
Q2LST(f1, r2) = xs
//
in//let
strm_vt_append00
(list_strmize(f1), list_rstrmize(r2))
end//let//end-of-[q2lst_strmize(xs)]
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
q2lst_rstrmize(xs) =
let
//
val+
Q2LST(f1, r2) = xs
//
in//let
strm_vt_append00
(list_strmize(r2), list_rstrmize(f1))
end//let//end-of-[q2lst_rstrmize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
UN_q2lst_uncons$raw
 (  xs  ) =
let
val+
Q2LST(f1, r2) = xs
in//let
case+ f1 of
|list_nil() =>
(
@(r2.0, r2.1)) where
{
  val r2 = list_reverse<a>(r2)
}(*where*)//end-of-[list_nil()]
|list_cons(x1, f1) => (x1, Q2LST(f1, r2))
end//let//end-of-[UN_q2lst_uncons$raw(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
end//local//end-of-[datatype(q2lst_dt(a))]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: t0 }
gseq$end
<q2lst(a)><a>() = ")"
#impltmp
{ a: t0 }
gseq$sep
<q2lst(a)><a>() = ","
#impltmp
{ a: t0 }
gseq$beg
<q2lst(a)><a>() = "q2lst("
//
(* ****** ****** *)
//
#impltmp
{ a: t0 }
g_print
<q2lst(a)>(xs) =
(
gseq_print<q2lst(a)><a>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: t0 }
gseq_nil<q2lst(a)><a> = q2lst_nil{a}
//
#impltmp
{ a: t0 }
gseq_snoc<q2lst(a)><a> = q2lst_snoc<a>
//
#impltmp
{ a: t0 }
gseq_nilq<q2lst(a)><a> = q2lst_nilq<a>
//
#impltmp
{ a: t0 }
gseq_forall<q2lst(a)><a> = q2lst_forall<a>
#impltmp
{ a: t0 }
gseq_rforall<q2lst(a)><a> = q2lst_rforall<a>
//
#impltmp
{ a: t0 }
gseq_strmize<q2lst(a)><a> = q2lst_strmize<a>
#impltmp
{ a: t0 }
gseq_rstrmize<q2lst(a)><a> = q2lst_rstrmize<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: t0 }
$UN.gseq_uncons$raw<q2lst(a)><a> = UN_q2lst_uncons$raw<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_q2lst00.dats] *)
(***********************************************************************)
