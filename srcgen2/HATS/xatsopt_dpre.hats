(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-02-06:
For ATS3/XATSOPT
*)
(* ****** ****** *)
(* ****** ****** *)
#symload // > 0100
print with g_print of 0101
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/gbas000.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/gord000.dats"
#include
"srcgen1/prelude/DATS/gnum000.dats"
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/gseq000.dats"
//
(*
#include
"srcgen1/prelude/DATS/gseqn00.dats"
*)
//
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/gmap000.dats"
(* ****** ****** *)
(*
#include
"srcgen1/prelude/DATS/gfor000.dats"
#include
"srcgen1/prelude/DATS/gfun000.dats"
*)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/genv000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/bool000.dats"
#include
"srcgen1/prelude/DATS/char000.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/gint000.dats"
#include
"srcgen1/prelude/DATS/gflt000.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/strn000.dats"
(* ****** ****** *)
(*
#include
"srcgen1/prelude/DATS/arrn000.dats"
#include
"srcgen1/prelude/DATS/arrn001.dats"
*)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/list000.dats"
#include
"srcgen1/prelude/DATS/optn000.dats"
#include
"srcgen1/prelude/DATS/strm000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/synoug0.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/tupl000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/unsafex.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/VT/gseq000_vt.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/VT/strn000_vt.dats"
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/VT/arrn000_vt.dats"
(*
#include
"srcgen1/prelude/DATS/VT/arrn001_vt.dats"
*)
//
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/VT/list000_vt.dats"
#include
"srcgen1/prelude/DATS/VT/optn000_vt.dats"
//
#include
"srcgen1/prelude/DATS/VT/strm000_vt.dats"
#include
"srcgen1/prelude/DATS/VT/strm001_vt.dats"
//
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/VT/synoug0_vt.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/CATS/JS/basics0.dats"
#include
"srcgen1/prelude/DATS/CATS/JS/basics1.dats"
//
#include
"srcgen1/prelude/DATS/CATS/JS/prelude.dats"
//
#include
"srcgen1/prelude/DATS/CATS/JS/g_eqref.dats"
//
#include
"srcgen1/prelude/DATS/CATS/JS/g_print.dats"
//
#include
"srcgen1/prelude/DATS/CATS/JS/unsafex.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a:t0 >
a0ref_get(A0) =
(
a0ref_dtget<a>(A0))
//
#impltmp
< a:vt >
a0ref_exch(A0, x0) =
(
$UN.castlin10{a}(x1)
) where
{
//
val x1 =
(
  a0ref_dtget<a>(A0))
//
val x0 =
(
  $UN.castlin10{?a}(x0))
//
val A1 =
$UN.cast10{a0ref(?a)}(A0)
//
val () =
XATS2JS_a0ref_set{?a}(A1, x0)
where
{
#extern
fun
XATS2JS_a0ref_set
{a:t0}
( A0
: a0ref(a)
, x0 : (a)) : void = $extnam() }
//
} (*where*) // a0ref_exch(A0, x0)
//
(* ****** ****** *)
//
#impltmp
< a:vt >
a0ref_make_1val(x0) =
a0ptr2ref(a0ptr_make0_1val<a>(x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
strn_forall<>(cs) =
let
//
#extern
fun
XATS2JS_strn_forall$f1un
( cs: strn
, f0: (cgtz) -> bool): bool
= $extnam((*self*))//native
//
in
XATS2JS_strn_forall$f1un
( cs
, lam(c0) => forall$test<cgtz>(c0))
end//let//end-of-[strn_forall<>(cs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_tabulate$f1un
(n0, fopr) =
(
strn_vt2t
(strn_vt_tabulate$f1un<>(n0, fopr)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_vt_tabulate$f1un
{n0: i0}
(n0, fopr) =
(
UN_strn_vt_cast(p0))
where
{
//
val p0 =
strtmp_vt_alloc<>(n0)
//
val i0 = 0(*start*)
val () = loop(p0, i0)
//
} where
{
//
#sexpdef
stmp = strtmp1_vt
//
fnx
loop
{i0:nat
|i0<=n0}
.<n0-i0>.
( p0: stmp(n0)
, i0: sint(i0)): void =
(
if
(i0 < n0)
then
(
loop(p0, suc(i0))) where
{
val c0 = fopr(i0)
val () =
strtmp_vt_set$at<>(p0, i0, c0)
}
) (* end-of-of[loop(p0, i0)] *)
//
} (*where*)//end-of-[strn_vt_tabulate]
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1/xatslib/libcats/DATS/synoug0.dats"
//
(* ****** ****** *)
//
#include
"srcgen1/xatslib/githwxi/DATS/genv000.dats"
#include
"srcgen1/xatslib/githwxi/DATS/f00path.dats"
#include
"srcgen1/xatslib/githwxi/DATS/g00iout.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload _(*local*) = "./../DATS/xatsopt_tmplib.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1/xatslib/githwxi/DATS/CATS/JS/NODE/basics0.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_HATS_xatsopt_dpre.hats] *)
