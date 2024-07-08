(* ****** ****** *)
(*
#staload
"prelude/SATS/gseqn00.sats"
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
<xs>
<x0><ln>
gseqn_nilq(xs) =
(
  ln = 0 ) where
{ val
  ln =
  gseqn_length<xs><x0><ln>(xs) }
(*where*) // end of [gseqn_nilq(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><ln>
gseqn_consq(xs) =
(
  bool_neg<>
  (gseqn_nilq<xs><x0><ln>(xs)))
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><ln>
gseqn_listize(xs) =
strq_vt_listize0<x0>
(gseqn_strqize<xs><x0><ln>(xs))
//
#impltmp
<xs>
<x0><ln>
gseqn_rlistize(xs) =
list_vt_reverse0<x0>
(gseqn_listize<xs><x0><ln>(xs))
//
(* ****** ****** *)
//
(*
//
// HX-2023-12-23:
// This does not seem to be useful!
//
#impltmp
<xs>
<x0><ln>
gseqn_unlist(xs) =
gseqn_unlist_vt
< xs >< x0 >< ln >(list_copy_vt<x0>(xs))
*)
//
(*
//
// HX-2023-12-23:
// This does not seem to be useful!
//
#impltmp
<xs>
<x0><ln>
gseqn_unrlist(xs) =
gseqn_unrlist_vt
< xs >< x0 >< ln >(list_copy_vt<x0>(xs))
*)
//
(* ****** ****** *)
(* ****** ****** *)

local
//
#sexpdef
listn(a:t0) =
(
lam(n:i0) => list(a,n))
//
(* ****** ****** *)
in(*local*)
(* ****** ****** *)
//
#impltmp
{x0:t0}
{ln:i0}
gseqn_nilq
<listn(x0)>
< x0 >< ln > = list_nilq<>{x0}{ln}
#impltmp
{x0:t0}
{ln:i0}
gseqn_consq
<listn(x0)>
< x0 >< ln > = list_consq<>{x0}{ln}
//
(* ****** ****** *)

#impltmp
{x0:t0}
{ln:i0}
gseqn_head
<listn(x0)><x0><ln> = list_head<x0>{ln}
#impltmp
{x0:t0}
{ln:i0}
gseqn_tail
<listn(x0)><x0><ln> = list_tail<x0>{ln}

(* ****** ****** *)

#impltmp
{x0:t0}
{ln:i0}
gseqn_length
<listn(x0)><x0><ln> = list_length<x0>{ln}

(* ****** ****** *)

#impltmp
{x0:t0}
{ln:i0}
gseqn_get_at
<listn(x0)><x0><ln> = list_get_at<x0>{ln}

(* ****** ****** *)

end (*local*) // end of [local(gseqn(listn))]

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_gseqn00.dats] *)
