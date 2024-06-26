(* ****** ****** *)
(*
** HX-2020-02:
** for unsafe functions
*)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
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

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_unsafex.dats] *)
