(* ****** ****** *)
(*
** HX-2020-02:
** for unsafe functions
*)
(* ****** ****** *)
//
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_get
(p0) = $eval(p0)
#impltmp
<a>(*tmp*)
$UN.p2tr_set
(p0, x0) = $eval(p0) := x0
//
#impltmp
<a>(*tmp*)
$UN.p2tr_ret
(p0, x0) =
let
val x0 = $UN.delinear(x0) in ()
endlet // end of [$UN.p2tr_ret]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_set_list_nil
  (p0) =
(
$UN.p2tr_set
<list(a)>(p0, list_nil())
)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_set_list_cons
  (p0, x0) =
let
#typedef
xs = list(a)
val xs = 
$UN.p2tr_get<xs>(p0)
in
$UN.p2tr_set<xs>(p0,list_cons(x0,xs))
end // end of [$UN.p2tr_set_list_cons]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.p2tr_set_list_vt_nil
  (p0) =
(
$UN.p2tr_set
<list_vt(a)>(p0, list_vt_nil())
)
#impltmp
<a>(*tmp*)
$UN.p2tr_set_list_vt_cons
  (p0, x0) =
let
#vwtpdef
xs = list_vt(a)
val xs = 
$UN.p2tr_get<xs>(p0)
in
$UN.p2tr_set<xs>(p0,list_vt_cons(x0,xs))
end//end-of-[$UN.p2tr_set_list_vt_nil(p0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs><x0>
$UN.gseq_last$raw(xs) =
(
gseq_last_ini<xs><x0>(xs, x0)
) where
{
var xs = xs
val x0 =
$UN.gseq_uncons$raw<xs><x0>(xs)}
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
$UN.gseq_uncons$raw(xs) =
(
let
  val () = xs := tl in hd
end
) where
{
val hd =
  $UN.gseq_head$raw<xs><x0>(xs)
val tl =
  $UN.gseq_tail$raw<xs><x0>(xs)
}(*where*)//end(gseq-uncons$raw(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
local
#typedef xs = strn
#typedef x0 = cgtz
in//local
#impltmp
$UN.gseq_head$raw<xs><x0> = $UN.strn_head$raw<>
#impltmp
$UN.gseq_tail$raw<xs><x0> = $UN.strn_tail$raw<>
end//local
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{a:t0}
$UN.gseq_uncons$raw
< list(a) >< a >(xs) =
let
  val x0 = xs.0
  val () = xs := xs.1 in x0
end // end of [gseq_uncons$raw]
//
(* ****** ****** *)
//
#impltmp
{a:type}
$UN.gseq_head$raw<list(a)><a> = $UN.list_head$raw<a>
#impltmp
{a:type}
$UN.gseq_tail$raw<list(a)><a> = $UN.list_tail$raw<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
$UN.strm_head$raw(xs) =
$UN.strmcon_head$raw<a>(!xs)
#impltmp
<a>(*tmp*)
$UN.strm_tail$raw(xs) =
$UN.strmcon_tail$raw<a>(!xs)
//
#impltmp
<a>(*tmp*)
$UN.strmcon_head$raw(xs) = xs.0
#impltmp
<a>(*tmp*)
$UN.strmcon_tail$raw(xs) = xs.1
//
(* ****** ****** *)
//
#impltmp
{a:type}
$UN.gseq_head$raw<strm(a)><a> = $UN.strm_head$raw<a>
#impltmp
{a:type}
$UN.gseq_tail$raw<strm(a)><a> = $UN.strm_tail$raw<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{xs:t0}
{x0:t0}
$UN.gasz_get$at$raw
  (xs, i0) =
let
prval() =
(
  owed_t0_elim0(pf)) in x0 end
where
{ val (pf | x0) =
  $UN.gasz_lget$at$raw<xs><x0>(xs, i0)
}(*where*)//end-of-[$UN.gasz_get$at$raw(...)]
//
(* ****** ****** *)
//
#impltmp
{xs:t0}
{x0:t0}
$UN.gasz_set$at$raw
  (xs, i0, x0) =
let
prval pf = owed_t0_make()
in//let
$UN.gasz_lset$at$raw<xs><x0>(pf|xs,i0,x0)
end(*let*)//end-of-[$UN.gasz_set$at$raw(...)]
//
(* ****** ****** *)
//
#impltmp
{xs:t0}
{x0:vt}
$UN.gasz_cget$at$raw
  (xs, i0) =
let
//
val x1 = g_copy<x0>(x0)
//
prval() =
(
owed_vt_return0(pf, x1)) in x0 end
where
{
val (pf | x0) =
(
  $UN.gasz_lget$at$raw<xs><x0>(xs, i0))
}(*where*)//end-of-[$UN.gasz_cget$at$raw(...)]
//
(* ****** ****** *)
//
(*
HX:
[gasz_setf]
is not efficient
as it involves two "trips"!
We can eliminate the inefficiency
by employing pointer arithmetic!!!
*)
#impltmp
{xs:t0}
{x0:vt}
$UN.gasz_setf$at$raw
  (xs, i0, x0) =
let
//
val (pf | x1) =
(
  $UN.gasz_lget$at$raw<xs><x0>(xs, i0))
//
in//let
//
let
val ((*void*)) = g_free<x0>(x1)
in//let
$UN.gasz_lset$at$raw<xs><x0>(pf|xs,i0,x0)
end//let
//
end(*let*)//end-of-[$UN.gasz_set$at$raw(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_unsafex.dats] *)
