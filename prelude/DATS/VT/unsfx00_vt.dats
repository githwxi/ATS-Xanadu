(* ****** ****** *)
(*
** HX-2020-02:
** for unsafe functions
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-07-25:
This one is already
included by [./../unsfx00.dats]
Thu 25 Jul 2024 10:36:52 AM EDT
*)
(* ****** ****** *)
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
in//let
$UN.p2tr_set<xs>(p0,list_vt_cons(x0,xs))
end//end-of-[$UN.p2tr_set_list_vt_nil(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_unsfx00_vt.dats] *)
