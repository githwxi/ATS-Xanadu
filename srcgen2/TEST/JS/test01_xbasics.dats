(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload
"./../../SATS/xbasics.sats"
(* ****** ****** *)
#include
"./../../DATS/xbasics.dats"
#include
"./../../DATS/xbasics_print0.dats"
(* ****** ****** *)

val () =
prerrln
("max(1,2,3,4,5) = ", max('1', '2', '3', '4', '5'))
val () =
prerrln
("min(1,2,3,4,5) = ", min("1", "2", "3", "4", "5"))

(* ****** ****** *)

val () =
prerrln("PROPSORT = ", PROPSORT)
val () =
prerrln("VIEWSORT = ", VIEWSORT)
val () =
prerrln("TBOXSORT = ", TBOXSORT)
val () =
prerrln("TFLTSORT = ", TFLTSORT)
val () =
prerrln("TYPESORT = ", TYPESORT)
val () =
prerrln("VTBXSORT = ", VTBXSORT)
val () =
prerrln("VTFTSORT = ", VTFTSORT)
val () =
prerrln("VWTPSORT = ", VWTPSORT)

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

val () =
prerrln("CSKcas0() = ", CSKcas0())
val () =
prerrln("CSKcasp() = ", CSKcasp())
val () =
prerrln("CSKcasn() = ", CSKcasn())

(* ****** ****** *)

val () =
prerrln("IMPLgen() = ", IMPLgen())
val () =
prerrln("IMPLprf() = ", IMPLprf())
val () =
prerrln("IMPLval() = ", IMPLval())
val () =
prerrln("IMPLfun() = ", IMPLfun())
val () =
prerrln("IMPLtmp() = ", IMPLtmp())

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test01_xbasics.dats] *)
