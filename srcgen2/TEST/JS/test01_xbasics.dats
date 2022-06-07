(* ****** ****** *)
#include
"prelude\
/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude\
/HATS\
/CATS/JS/prelude_dats.hats"
(* ****** ****** *)
#staload
"xatslib\
/libcats/DATS/synoug0.dats"
(* ****** ****** *)
#staload
"xatslib\
/githwxi/DATS/g00iout.dats"
(* ****** ****** *)
#staload _ =
"xatslib\
/githwxi\
/DATS/CATS/JS/Node/basics0.dats"
(* ****** ****** *)
#staload
"./../../SATS/xbasics.sats"
(* ****** ****** *)
#staload _ =
"./../../DATS/xbasics.dats"
#staload _ =
"./../../DATS/xbasics_print0.dats"
(* ****** ****** *)
//
val () =
let
val
k1 = 10
in//let
prerrln("sortbox(",k1,")=",sortbox(k1));
prerrln("sortlin(",k1,")=",sortlin(k1));
prerrln("sortprf(",k1,")=",sortprf(k1));
prerrln("sortpol(",k1,")=",sortpol(k1));
end // end of [let]
//
val () =
let
val
k1 = 15
in//let
prerrln("sortbox(",k1,")=",sortbox(k1));
prerrln("sortlin(",k1,")=",sortlin(k1));
prerrln("sortprf(",k1,")=",sortprf(k1));
prerrln("sortpol(",k1,")=",sortpol(k1));
end // end of [let]
//
(* ****** ****** *)

val () =
prerrln("DCKval() = ", DCKval())
val () =
prerrln("DCKfun() = ", DCKfun())
val () =
prerrln("DCKpraxi() = ", DCKpraxi())
val () =
prerrln("DCKprfun() = ", DCKprfun())
val () =
prerrln("DCKprval() = ", DCKprval())
val () =
prerrln("DCKfcast() = ", DCKfcast())

(* ****** ****** *)

val () =
prerrln("VLKval() = ", VLKval())
val () =
prerrln("VLKvlp() = ", VLKvlp())
val () =
prerrln("VLKvln() = ", VLKvln())
val () =
prerrln("VLKprval() = ", VLKprval())

(* ****** ****** *)

val () =
println("FNKfn0() = ", FNKfn0())
val () =
proutln("FNKfn1() = ", FNKfn1())
val () =
prerrln("FNKfnx() = ", FNKfnx())
val () =
prerrln("FNKpraxi() = ", FNKpraxi())
val () =
prerrln("FNKprfun() = ", FNKprfun())
val () =
prerrln("FNKfcast() = ", FNKfcast())

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test01_xbasics.dats] *)
