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

implement main0() = {
  #define BUFSIZE 16
  val opt =
  fpath_get_cblist
  ("./DATA/test_cblist.txt", i2sz(BUFSIZE))
  val-~Some_vt(cbs) = opt

  val () = assert (2 = length(cbs))

  val () = foreach(cbs) where
  {
    val r = ref<int>(0)
    val out = stdout_ref
    implement
    fprint_array$sep<>(out) = ()
    implement
    cblist_foreach$fwork<>(n, cs) = let
      val () = assert (n <= i2sz(BUFSIZE))
      implement
      tostrptr_val<uchar> (x) = tostrptr_char (uchar2char0 x)
      val x = tostrptr_arrayref (cs, n)
      val x = strptr2string x
    in
      if r[] = 0 then
        assert ("hello world\n\nfor" = x)
      else
        assert (" cblist\n" = x);
      r[] := succ (r[])
    end // end of [cblist_foreach$fwork]
  }
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test_cblist.dats] *)
