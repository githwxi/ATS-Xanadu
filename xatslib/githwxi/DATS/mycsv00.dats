(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-05:
Thu 05 Sep 2024 11:44:03 PM EDT
Some simple stuff for CSV-handling 
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
mycsv00_csv$parse$opt
  (line: strn): optn_vt(arrsz(strn))
//
(* ****** ****** *)
//
fun<>
mycsv00$file_csv$$parse$opt_lstrm
  (file: strn): optn_vt(strm_vt(optn_vt(arrsz(strn))))
//
fun<>
mycsv00$file_csv$$parse$opt_llist
  (file: strn): optn_vt(list_vt(optn_vt(arrsz(strn))))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_mycsv00.dats] *)
