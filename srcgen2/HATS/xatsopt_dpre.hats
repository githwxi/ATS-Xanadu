(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-02-06:
For ATS3/XATSOPT
*)
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
(*
#include
"srcgen1/prelude/DATS/gfor000.dats"
#include
"srcgen1/prelude/DATS/gfun000.dats"
*)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/genv000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/bool000.dats"
#include
"srcgen1/prelude/DATS/char000.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/gint000.dats"
#include
"srcgen1/prelude/DATS/gflt000.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/strn000.dats"
(* ****** ****** *)
(*
#include
"srcgen1/prelude/DATS/arrn000.dats"
#include
"srcgen1/prelude/DATS/arrn001.dats"
*)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/list000.dats"
#include
"srcgen1/prelude/DATS/optn000.dats"
#include
"srcgen1/prelude/DATS/strm000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/synoug0.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/unsafex.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/VT/gseq000_vt.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/DATS/VT/list000_vt.dats"
#include
"srcgen1/prelude/DATS/VT/optn000_vt.dats"
#include
"srcgen1/prelude/DATS/VT/strm000_vt.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1/prelude/DATS/CATS/JS/basics0.dats"
#include
"srcgen1/prelude/DATS/CATS/JS/basics1.dats"
//
#include
"srcgen1/prelude/DATS/CATS/JS/prelude.dats"
//
#include
"srcgen1/prelude/DATS/CATS/JS/g_eqref.dats"
//
#include
"srcgen1/prelude/DATS/CATS/JS/g_print.dats"
//
#include
"srcgen1/prelude/DATS/CATS/JS/unsafex.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload print with g_print of 0101 // > 0100
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a:vt >
a0ref_make_1val(x0) =
a0ptr2ref(a0ptr_make0_1val<a>(x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
strn_tabulate$f1un
(n0, fopr) =
(
strn_vt2t
(strn_vt_tabulate$f1un<>(n0, fopr)))
//
(* ****** ****** *)
(* ****** ****** *)
#staload _(*local*) = "./../DATS/xatsopt_tmplib.dats"
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_HATS_xatsopt_dpre.hats] *)
