(* ****** ****** *)
(*
** AS-2018-10-27
** Unit-tests for cblist
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#staload
"./../SATS/cblist.sats"
#staload
"./../SATS/Posix/cblist.sats"
//
#staload
"./../DATS/cblist.dats"
//
(* ****** ****** *)

local
//
#include "./../DATS/cblist.dats"
//
in
  // nothing
end // end of [local]
//
(* ****** ****** *)

implement main0() =
{
//
#define STR "HELLO"
//
val cb =
string2cblist(STR)
val () =
assert(1 = length(cb))
//
val () =
(
  cblist_foreach(cb) ) where
{
implement
cblist_foreach$fwork<> (n, cs) =
{
//
val () =
assertloc(length(STR) = n)
val () =
assertloc(char2uchar0(g0ofg1('H')) = cs[0])
val () =
assertloc(char2uchar0(g0ofg1('E')) = cs[1])
val () =
assertloc(char2uchar0(g0ofg1('L')) = cs[2])
val () =
assertloc(char2uchar0(g0ofg1('L')) = cs[3])
val () =
assertloc(char2uchar0(g0ofg1('O')) = cs[4])
} (* end of [cblist_foreach$fwork] *)
}
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test_cblist.dats] *)
