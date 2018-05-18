(* ****** ****** *)
(*
** HX-2018-05-16
** Unit testing. Kind of.
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#staload
"./../../SATS/cblist.sats"
#staload
"./../../SATS/Posix/cblist.sats"
//
#staload
"./../../DATS/cblist.dats"
#staload
"./../../DATS/Posix/cblist.dats"
//
(* ****** ****** *)

local
//
#include "./../../DATS/cblist.dats"
#include "./../../DATS/Posix/cblist.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)
//
val () =
println!
("Hello from [test_cblist]!")
//
(* ****** ****** *)

val opt =
fpath_get_cblist
("./test_cblist.dats", i2sz(16))
val-~Some_vt(cbs) = opt

(* ****** ****** *)

val () = println! ("|cbs| = ", length(cbs))

(* ****** ****** *)

val () = foreach(cbs) where
{
  val out = stdout_ref
  implement
  fprint_array$sep<>(out) = ()
  implement
  cblist_foreach$fwork<>(n, cs) = fprint_arrayref<uchar>(out, cs, n)
}

(* ****** ****** *)

implement main0() = ((*void*))

(* ****** ****** *)

(* end of [test_cblist.dats] *)
