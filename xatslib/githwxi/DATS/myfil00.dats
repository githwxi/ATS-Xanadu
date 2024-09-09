(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-05:
Thu 05 Sep 2024 11:44:03 PM EDT
Some simple stuff for handling files
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
myfil00$fpath_readall$opt
  (fpath: strn): optn_vt(strn)
//
#extern
fun<>
myfil00$fpath_readall$fwork
  (fpath: strn, work: (strn)->void): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
myfil00$fpath_readall$opt
  (fpath) =
let
//
#vwtpdef
r0 = // res
optn_vt(strn)
//
var r0: r0 =
optn_vt_nil((*0*))
val p0 = $addr(r0)
//
in//let
myfil00$fpath_readall$fwork
(
fpath,
lam(cs) =>
$UN.p2tr_set<r0>(p0, optn_vt_cons(cs))); r0
end//let
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_myfil00.dats] *)
