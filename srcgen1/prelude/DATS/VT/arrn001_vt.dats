(* ****** ****** *)
(*
HX: for arrays with size
Wed Dec 20 23:11:33 EST 2023
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
//
local
//
datavwtp
a1psz //
(a:vwtp,int(*sz*)) =
{n:int}
A1PSZ of
(a1ptr(a, n), sint(n))
//
#absimpl
a1psz_vt_i0_x0
( a:vt, n:i0 ) = a1psz(a, n)
//
(* ****** ****** *)
in(*local*)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
a1psz_make0_ptrsize
  (A0, n0) = A1PSZ( A0, n0 )
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
a1psz_length1(AZ) =
let
val+A1PSZ(A0, n0) = AZ in n0 end
//
(* ****** ****** *)

end (*local*) // end of [local(a1rsz)]

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_arrn001_vt.dats] *)
