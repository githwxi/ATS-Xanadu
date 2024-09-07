(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-05:
Thu 05 Sep 2024 11:44:03 PM EDT
Some simple stuff for CSV-handling 
*)
(* ****** ****** *)
(* ****** ****** *)
#staload "./../DATS/strn000.dats"
(* ****** ****** *)
#staload "./../DATS/myfil00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
mycsv00$line_csv$parse$opt
  (line: strn): optn_vt(a1sz(strn))
//
(* ****** ****** *)
//
fun<>
mycsv00$fpath_csv$$parse$opt_a1sz
  (fpath: strn)
: optn_vt(a1sz(optn_vt(a1sz(strn))))
//
fun<>
mycsv00$fpath_csv$$parse$opt_lstrm
  (fpath: strn)
: optn_vt(strm_vt(optn_vt(a1sz(strn))))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
mycsv00$fpath_csv$$parse$opt_a1sz
  (fpath) =
(
case+ opt0 of
| ~
optn_vt_nil() =>
optn_vt_nil()
| ~
optn_vt_cons(xs) =>
optn_vt_cons(a1sz_make_lstrm(xs))
) where
{
val opt0 =
mycsv00$fpath_csv$$parse$opt_lstrm(fpath)
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
mycsv00$fpath_csv$$parse$opt_lstrm
  (fpath) =
let
//
val opt0 =
myfil00$fpath_readall$opt<>(fpath)
//
in//let
//
case+ opt0 of
| ~
optn_vt_nil() =>
(
  optn_vt_nil())
| ~
optn_vt_cons(chrs) =>
let
//
#typedef
line = strn
#typedef x0 =
(    line    )
#vwtpdef y0 =
optn_vt(a1sz(line))
//
#impltmp
map$fopr0<x0><y0>(line) =
(
  mycsv00$line_csv$parse$opt<>(line))
in//let
optn_vt_cons
(
strm_vt_map0<x0><y0>(strn_line$strmize<>(chrs)))
end//let
//
end//let//end-of-[mycsv00$fpath_csv$$parse$opt_lstrm]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_mycsv00.dats] *)
