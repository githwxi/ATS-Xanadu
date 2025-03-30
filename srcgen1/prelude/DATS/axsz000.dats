(* ****** ****** *)
(*
HX: for arrays with size
Sun Mar 30 01:39:46 PM EDT 2025
*)
(* ****** ****** *)
(*
#staload
"./..\
/SATS/arrn000.sats"
#staload
"./..\
/SATS/VT/arrn000_vt.sats"
*)
(* ****** ****** *)
//
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
a1rsz_dt //
(a:vwtp,int(*sz*)) =
{n:int}
A1RSZ of
(a1ref(a,n), sint(n))
//
#absimpl
a1rsz_vt_i0_x0
(a:vt,n:i0) = a1rsz_dt(a,n)
//
(* ****** ****** *)
in(*local*)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
a1rsz_make_refsize
  (A0, n0) = A1RSZ( A0, n0 )
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
a1rsz_length(AZ) =
let
val+A1RSZ(A0, n0) = AZ in n0 end
//
#impltmp
<>(*tmp*)
a1rsz_getref(AZ) =
let
val+A1RSZ(A0, n0) = AZ in A0 end
//
(* ****** ****** *)
//
end(*local*)//end-of-[local(a1rsz)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
a1rsz_get$at
  (AZ, i0) =
let
val A0 =
a1rsz_getref<>(AZ)
in//let
  a1ref_get$at<a>(A0, i0) end
(*let*)//end-[a1rsz_get$at(...)]
//
#impltmp
<a>(*tmp*)
a1rsz_set$at
  (AZ, i0, x0) =
let
val A0 =
a1rsz_getref<>(AZ)
in//let
a1ref_set$at<a>(A0, i0, x0) end
(*let*)//end-[a1rsz_set$at(...)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
a1rsz_make_list
  (   xs   ) =
(
 a1rsz_make_refsize<a>(A0, n0)
) where
{
val n0 = length(xs)
val A0 =
(
 a1ptr2ref
 (a1ptr_make_listn<a>(xs, n0)))
}(*where*)//end-[a1rsz_make_list]
//
#impltmp
<a>(*tmp*)
a1rsz_make0_llist
  (    xs    ) =
(
 a1rsz_make_refsize<a>(A0, n0)
) where
{
val n0 = length1(xs)
val A0 =
(
 a1ptr2ref
 (a1ptr_make0_llistn<a>(xs, n0)))
}(*where*)//end-[a1rsz_make0_llist]
//
(* ****** ****** *)
(* ****** ****** *)

#impltmp
< a:vt >
a1rsz_strmize
  {n}(A0) =
(
  auxmain(0(*i0*))
) where
{
//
val n0 =
(
  a1rsz_length<>(A0))
//
fun
auxmain
{i:nat
|i<=n}
(i0: sint(i)): strm_vt(a) =
$llazy
(
if
(i0 >= n0)
then
strmcon_vt_nil((*void*))
else
strmcon_vt_cons
(a1rsz_get$at(A0, i0), auxmain(suc(i0)))
) (* end of [auxmain] *)
} (*where*) // end-of(a1rsz_strmize(...A0...))

(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{a:t0}
gseq_strmize
<a1rsz(a)><a>(AZ) = a1rsz_strmize<a>(AZ)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_axsz000.dats] *)
