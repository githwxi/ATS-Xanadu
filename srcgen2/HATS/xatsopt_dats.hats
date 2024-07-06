(* ****** ****** *)
(* ****** ****** *)
(*
HX-2022-06-06:
For ATS3/XATSOPT
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"\
srcgen1\
/prelude\
/HATS/prelude_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
// #ifdef(_XATSOPT_JS_)
//
#include
"\
srcgen1\
/prelude\
/HATS/CATS/JS/prelude_dats.hats"
//
// #endif // end of [ifdef(_XATSOPT_JS_)]
//
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"\
srcgen1\
/xatslib/libcats/DATS/synoug0.dats"
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"\
srcgen1\
/xatslib/githwxi/DATS/genv000.dats"
#staload _ =
"\
srcgen1\
/xatslib/githwxi/DATS/f00path.dats"
#staload _ =
"\
srcgen1\
/xatslib/githwxi/DATS/g00iout.dats"
(* ****** ****** *)
(* ****** ****** *)
#staload _
(*local*) = "./../DATS/xatsopt_tmplib.dats"
(* ****** ****** *)
(* ****** ****** *)
//
// #ifdef(_XATSOPT_JS_)
//
#staload
"\
srcgen1\
/xatslib/githwxi/DATS/CATS/JS/Node/basics0.dats"
//
// #endif // end of [ifdef(_XATSOPT_JS_)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_HATS_xatsopt_dats.hats] *)
