(* ****** ****** *)
#include
"\
srcgen1/prelude\
/HATS/prelude_dats.hats"
(* ****** ****** *)
//
(*
#ifdef(_XATSOPT_JS_)
*)
//
#include
"\
srcgen1\
/prelude\
/HATS/CATS/JS/prelude_dats.hats"
//
(*
#endif
// end of [ifdef(_XATSOPT_JS_)]
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload
"\
srcgen1\
/xatslib/libcats/SATS/libcats.sats"
#staload
"\
srcgen1\
/xatslib/libcats/SATS/synoug0.sats"
(* ****** ****** *)
#staload
"\
srcgen1\
/xatslib/githwxi/SATS/genv000.sats"
#staload
"\
srcgen1\
/xatslib/githwxi/SATS/githwxi.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload _ =
"\
srcgen1\
/xatslib/githwxi/DATS/genv000.dats"
//
#staload _ =
"\
srcgen1\
/xatslib/githwxi/DATS/f00path.dats"
//
#staload _ =
"\
srcgen1\
/xatslib/githwxi/DATS/g00iout.dats"
//
(* ****** ****** *)
#staload _ =
"\
srcgen1\
/xatslib/libcats/DATS/synoug0.dats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
#ifdef(_XATSOPT_JS_)
*)
//
#staload
"\
srcgen1\
/xatslib\
/githwxi/DATS/CATS/JS/Node/basics0.dats"
//
(*
#endif // end of [ifdef(_XATSOPT_JS_)]
*)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3-XANADU/xatslib/TEST/xats2js_test.hats] *)
