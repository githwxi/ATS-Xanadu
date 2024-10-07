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
prerrsln("PROPSORT = ", PROPSORT)
val () =
prerrsln("VIEWSORT = ", VIEWSORT)
val () =
prerrsln("TBOXSORT = ", TBOXSORT)
val () =
prerrsln("TFLTSORT = ", TFLTSORT)
val () =
prerrsln("TYPESORT = ", TYPESORT)
val () =
prerrsln("VTBXSORT = ", VTBXSORT)
val () =
prerrsln("VTFTSORT = ", VTFTSORT)
val () =
prerrsln("VWTPSORT = ", VWTPSORT)

(* ****** ****** *)
//
val () =
let
val
k1 = 10
in//let
prerrsln("sortbox(",k1,")=",sortbox(k1));
prerrsln("sortlin(",k1,")=",sortlin(k1));
prerrsln("sortprf(",k1,")=",sortprf(k1));
prerrsln("sortpol(",k1,")=",sortpol(k1));
end // end of [let]
//
val () =
let
val
k1 = 15
in//let
prerrsln("sortbox(",k1,")=",sortbox(k1));
prerrsln("sortlin(",k1,")=",sortlin(k1));
prerrsln("sortprf(",k1,")=",sortprf(k1));
prerrsln("sortpol(",k1,")=",sortpol(k1));
end // end of [let]
//
(* ****** ****** *)

val () =
prerrsln("DCKval() = ", DCKval())
val () =
prerrsln("DCKfun() = ", DCKfun())
val () =
prerrsln("DCKpraxi() = ", DCKpraxi())
val () =
prerrsln("DCKprfun() = ", DCKprfun())
val () =
prerrsln("DCKprval() = ", DCKprval())
val () =
prerrsln("DCKfcast() = ", DCKfcast())

(* ****** ****** *)

val () =
prerrsln("VLKval() = ", VLKval())
val () =
prerrsln("VLKvlp() = ", VLKvlp())
val () =
prerrsln("VLKvln() = ", VLKvln())
val () =
prerrsln("VLKprval() = ", VLKprval())

(* ****** ****** *)

val () =
prerrsln("FNKfn0() = ", FNKfn0())
val () =
prerrsln("FNKfn1() = ", FNKfn1())
val () =
prerrsln("FNKfnx() = ", FNKfnx())
val () =
prerrsln("FNKpraxi() = ", FNKpraxi())
val () =
prerrsln("FNKprfun() = ", FNKprfun())
val () =
prerrsln("FNKfcast() = ", FNKfcast())

(* ****** ****** *)

val () =
prerrsln("CSKcas0() = ", CSKcas0())
val () =
prerrsln("CSKcasp() = ", CSKcasp())
val () =
prerrsln("CSKcasn() = ", CSKcasn())

(* ****** ****** *)

val () =
prerrsln("IMPLgen() = ", IMPLgen())
val () =
prerrsln("IMPLprf() = ", IMPLprf())
val () =
prerrsln("IMPLval() = ", IMPLval())
val () =
prerrsln("IMPLfun() = ", IMPLfun())
val () =
prerrsln("IMPLtmp() = ", IMPLtmp())

(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test01_xbasics.dats] *)
