(* ****** ****** *)
(*
HX: for arrays with size
Wed Dec 20 19:13:09 EST 2023
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
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datatype
a1rsz //
(a:vwtp,int(*sz*)) =
{n:int}
A1RSZ of
(a1ref(a, n), sint(n))
//
#absimpl
a1rsz_vt_i0_x0
( a:vt, n:i0 ) = a1rsz(a, n)
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
a1rsz_get_at
  (AZ, i0) =
let
val A0 =
a1rsz_getref<>(AZ)
in//let
  a1ref_get_at<a>(A0, i0) end
(*let*)//end-[a1rsz_get_at(...)]
//
#impltmp
<a>(*tmp*)
a1rsz_set_at
  (AZ, i0, x0) =
let
val A0 =
a1rsz_getref<>(AZ)
in//let
a1ref_set_at<a>(A0, i0, x0) end
(*let*)//end-[a1rsz_set_at(...)]
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
//
#impltmp
<a>(*tmp*)
a1rsz_forall{n}(AZ) =
let
val n0 =
a1rsz_length{a}(AZ)
#impltmp
a1ref_length<a><n>(A) = n0
in//let
a1ref_forall<a>(a1rsz_getref(AZ))
end//let//end-of-[a1rsz_forall(...)]
//
#impltmp
<a>(*tmp*)
a1rsz_forall1{n}(AZ) =
let
val n0 =
(
 a1rsz_length{a}(AZ))
#impltmp
a1ref_length<a><n>(A) = n0
in//let
a1ref_forall1<a>(a1rsz_getref(AZ))
end//let//end-of-[a1rsz_forall1(...)]
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
a1rsz_listize{n}(AZ) =
let
val n0 =
(
 a1rsz_length{a}(AZ))
#impltmp
a1ref_length<a><n>(A) = n0
in//let
a1ref_listize<a>(a1rsz_getref(AZ))
end//let//end-of-[a1rsz_strimize(...)]
//
#impltmp
<a>(*tmp*)
a1rsz_strmize{n}(AZ) =
let
val n0 =
(
 a1rsz_length{a}(AZ))
#impltmp
a1ref_length<a><n>(A) = n0
in//let
a1ref_strmize<a>(a1rsz_getref(AZ))
end//let//end-of-[a1rsz_strimize(...)]
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
#impltmp
{a:t0}
{n:i0}
gseq_forall
<a1rsz(a,n)><a> = a1rsz_forall<a>{n}
#impltmp
{a:t0}
{n:i0}
gseq_foreach
<a1rsz(a,n)><a> = a1rsz_foreach<a>{n}
//
(* ****** ****** *)
//
#impltmp
{a:t0}
{n:i0}
gseq_listize
<a1rsz(a,n)><a> = a1rsz_listize<a>{n}
//
#impltmp
{a:t0}
{n:i0}
gseq_strmize
<a1rsz(a,n)><a> = a1rsz_strmize<a>{n}
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_arrn001.dats] *)
