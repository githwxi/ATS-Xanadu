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

#dynload "./test_libxats.dats"

(* ****** ****** *)
//
#staload "./../SATS/lexbuf.sats"
//
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
("Hello from [test_lexbuf]!")
//
(* ****** ****** *)

local
//
#staload
"./../SATS/location.sats"
#staload
_ = "./../DATS/location.dats"
//
#staload
"./../../util/SATS/cblist.sats"
#staload
"./../../util/SATS/Posix/cblist.sats"
#staload _ =
"./../../util/DATS/Posix/cblist.dats"
//
in
//
val
BSZ = i2sz(2)
val-
~Some_vt(cbs) =
fpath_get_cblist("./test_lexbuf.dats", BSZ)
//
var buf: lexbuf
var pos: position
//
val (_) = position_initize(pos, 0, 0, 0)
//
val (_) = lexbuf_initize_cblist(buf, cbs)
//
val uc0 = lexbuf_getc(buf)
val (_) = lexbuf_unget(buf, uc0)
val uc1 = lexbuf_getc(buf)
val (_) = lexbuf_unget(buf, uc1)
val (_) = println!("uc0 = ", int2char0(uc0))
val (_) = println!("uc1 = ", int2char0(uc1))
//
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
//
val (_) = println!("The first seg: ", lexbuf_get_fullseg(buf))
//
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
val (_) = println!(int2char0(lexbuf_getc(buf)))
//
val (_) = println!("The second seg: ", lexbuf_get_fullseg(buf))
//
end // end of [local]

(* ****** ****** *)

implement main0((*void*)) = ((*void*))

(* ****** ****** *)

(* end of [test_lexbuf.dats] *)
