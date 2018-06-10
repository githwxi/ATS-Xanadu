(* ****** ****** *)
(*
** HX-2018-05-16
** Unit testing. Kind of.
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

#dynload "./test_libxats.dats"

(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
//
(* ****** ****** *)

val a = 'a'
val A = 'A'
val EOL = '\n'
val NUL = '\000'

(* ****** ****** *)

local
//
#include
"./../../util/DATS/cblist.dats"
#include
"./../../util/DATS/Posix/cblist.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)
//
val () =
println!
("Hello from [test_lexing_util0]!")
//
(* ****** ****** *)

local
//
#staload
"./../SATS/lexbuf.sats"
#staload
"./../SATS/lexing.sats"
#staload
"./../SATS/location.sats"
//
#staload
"./../DATS/lexing_util0.dats"
//
in
//
val-
~Some_vt(tnds) =
(
  fpath_tokenize("./test_syntax.text")
)
//
val ((*void*)) =
list0_foreach<tnode>
( g0ofg1(list_vt2t(tnds))
, lam(tnd) => fprint2_tnode(stdout_ref, tnd))
//
end // end of [local]

(* ****** ****** *)

implement main0((*void*)) = ((*void*))

(* ****** ****** *)

(* end of [test_lexing_util0.dats] *)
