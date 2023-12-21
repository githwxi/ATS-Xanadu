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
<a>(*tmp*)
a1rsz_length(AZ) =
let
val+A1RSZ(A0, n0) = AZ in n0 end
//
#implfun
<a>(*tmp*)
a1rsz_getref(AZ) =
let
val+A1RSZ(A0, n0) = AZ in A0 end
//
(* ****** ****** *)

end (*local*) // end of [local(a1rsz)]

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_arrn001.dats] *)
