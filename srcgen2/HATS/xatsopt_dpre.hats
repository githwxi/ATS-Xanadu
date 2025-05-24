(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-02-06:
For ATS3/XATSOPT
*)
(* ****** ****** *)
(* ****** ****** *)
#symload // > 0100
print with g_print of 0101
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/gbas000.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/gord000.dats"
#include
"srcgen1/prelude/DATS/gnum000.dats"
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/gseq000.dats"
//
(*
#include
"srcgen1/prelude/DATS/gseqn00.dats"
*)
//
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/gmap000.dats"
(* ****** ****** *)
//
(*
#include
"srcgen1/prelude/DATS/gfor000.dats"
#include
"srcgen1/prelude/DATS/gfun000.dats"
*)
//
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/genv000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/bool000.dats"
#include
"srcgen1/prelude/DATS/char000.dats"
#include
"srcgen1/prelude/DATS/gint000.dats"
#include
"srcgen1/prelude/DATS/gflt000.dats"
#include
"srcgen1/prelude/DATS/strn000.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/arrn000.dats"
(*
#include
"srcgen1/prelude/DATS/arrn001.dats"
*)
#include
"srcgen1/prelude/DATS/axsz000.dats"
//
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/list000.dats"
#include
"srcgen1/prelude/DATS/optn000.dats"
#include
"srcgen1/prelude/DATS/strm000.dats"
//
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/synoug0.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/tupl000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/unsafex.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/CATS/bool000.dats"
#include
"srcgen1/prelude/DATS/CATS/char000.dats"
#include
"srcgen1/prelude/DATS/CATS/gint000.dats"
#include
"srcgen1/prelude/DATS/CATS/gflt000.dats"
#include
"srcgen1/prelude/DATS/CATS/strn000.dats"
#include
"srcgen1/prelude/DATS/CATS/arrn000.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/VT/gseq000_vt.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/VT/strn000_vt.dats"
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/VT/arrn000_vt.dats"
(*
#include
"srcgen1/prelude/DATS/VT/arrn001_vt.dats"
*)
//
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/VT/list000_vt.dats"
#include
"srcgen1/prelude/DATS/VT/optn000_vt.dats"
//
#include
"srcgen1/prelude/DATS/VT/strm000_vt.dats"
#include
"srcgen1/prelude/DATS/VT/strm001_vt.dats"
//
#include
"srcgen1/prelude/DATS/VT/synoug0_vt.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-04-23: For compiling to JS
*)
//
#if
defq(_XATS2JS_)
#then
//
(*
#include
"srcgen1/prelude/DATS/CATS/JS/basics0.dats"
*)
//
#include
"srcgen1/prelude/DATS/CATS/JS/basics1.dats"
#include
"srcgen1/prelude/DATS/CATS/JS/basics2.dats"
#include
"srcgen1/prelude/DATS/CATS/JS/basics3.dats"
//
#include
"srcgen1/prelude/DATS/CATS/JS/g_eqref.dats"
#include
"srcgen1/prelude/DATS/CATS/JS/g_print.dats"
//
(*
#include
"srcgen1/prelude/DATS/CATS/JS/unsafex.dats"
*)
//
#endif // end-of-[------ifdef(_XATS2JS_)------]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-04-28: For compiling to PY
*)
//
#if
defq(_XATS2PY_)
#then
//
(*
#include
"srcgen1/prelude/DATS/CATS/PY/basics0.dats"
*)
//
#include
"srcgen1/prelude/DATS/CATS/PY/basics1.dats"
#include
"srcgen1/prelude/DATS/CATS/PY/basics2.dats"
#include
"srcgen1/prelude/DATS/CATS/PY/basics3.dats"
//
#endif // end-of-[------ifdef(_XATS2PY_)------]
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1/xatslib/libcats/DATS/synoug0.dats"
//
#include
"srcgen1/xatslib/githwxi/DATS/genv000.dats"
#include
"srcgen1/xatslib/githwxi/DATS/f00path.dats"
#include
"srcgen1/xatslib/githwxi/DATS/g00iout.dats"
//
(* ****** ****** *)
//
#include
"srcgen1/xatslib/libcats/DATS/CATS/libcats.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-04-12:
For compiling to JS with Node
*)
//
#if
defq(_XATS2JS_)
#then
#include
"srcgen1\
/xatslib/libcats/DATS/CATS/JS/NODE/libcats.dats"
#include
"srcgen1\
/xatslib/githwxi/DATS/CATS/JS/NODE/basics0.dats"
#endif//end-of-[--------#ifdef(_XATS2JS_)--------]
//
(*
HX-2025-05-22: For compiling to Python3
*)
#if
defq
(_XATS2PY_)
#then
#include
"srcgen1/xatslib/libcats/DATS/CATS/PY/libcats.dats"
#endif//end-of-[---------#ifdef(_XATS2PY_)---------]
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload _(*local*) = "./../DATS/xlibext_tmplib.dats"
#staload _(*local*) = "./../DATS/xatsopt_tmplib.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#if
defq(_XATS2JS_)
// HX-2025-05:
// for function templates
#staload _(*local*) = "./../DATS/xlibext_jsemit.dats"
#endif//#ifdefq(_XATS2JS_)(staload(xlibext_jsemit.dats))
//
#if
defq(_XATS2PY_)
// HX-2025-05:
// for function templates
#staload _(*local*) = "./../DATS/xlibext_pyemit.dats"
#endif//#ifdefq(_XATS2JS_)(staload(xlibext_pyemit.dats))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_HATS_xatsopt_dpre.hats] *)
(***********************************************************************)
