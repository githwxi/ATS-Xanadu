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
#include
"xatslib\
/libcats/HATS/libcats_dats.hats"
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
#extern
fun<>
myfil00_output
  ( (*void*) ): void
//
(* ****** ****** *)
//
#extern
fun<>
myfil00$FILR_close
  (filr: FILR): void
//
(* ****** ****** *)
//
#extern
fun<>
myfil00$fpath_createWrite$opt
  (fpath: strn): FILRopt_vt
#extern
fun<>
myfil00$fpath_createWrite$fwork
  (fpath: strn, work: (FILR)->void): void
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
myfil00$fpath_createWrite$opt
  (fpath) =
let
//
#vwtpdef
r0 = // res
optn_vt(FILR)
//
var r0: r0 =
optn_vt_nil((*0*))
val p0 = $addr(r0)
//
in//let
myfil00$fpath_createWrite$fwork
(
fpath,
lam(cs) =>
$UN.p2tr_set<r0>(p0, optn_vt_cons(cs))); r0
end//let
//
(* ****** ****** *)
//
#extern
fun<> // HX: succ/fail: true/false
myfil00$myfil_make$opt_stdout(fpath: strn): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
myfil00$myfil_make$opt_stdout
  (fpath) =
(
//
case+ opt of
| ~
optn_vt_nil() => false
| ~
optn_vt_cons(out) =>
(
true
where{
val () =
myfil00$FILR_close(out) }
where{
//
val () =
(
  myfil00_output<>((*void*)))
where{
  #impltmp g_stdout<>() = out } } )
//
) where
{
  val opt = myfil00$fpath_createWrite$opt(fpath)
}(*where*)//end-of-[myfil00$myfil_make$opt_stdout(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_myfil00.dats] *)
