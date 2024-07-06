(* ****** ****** *)
//
#staload
"srcgen1\
/prelude/DATS/gbas000.dats"
#staload
"srcgen1\
/prelude/DATS/gord000.dats"
#staload
"srcgen1\
/prelude/DATS/gseq000.dats"
#staload
"srcgen1\
/prelude/DATS/unsafex.dats"
//
(* ****** ****** *)
//
#staload _ =
"srcgen1\
/prelude/DATS/char000.dats"
#staload _ =
"srcgen1\
/prelude/DATS/gint000.dats"
//
#staload _ =
"srcgen1\
/prelude/DATS/list000.dats"
#staload _ =
"srcgen1\
/prelude/DATS/strn000.dats"
//
#staload _ =
"srcgen1\
/prelude/DATS/VT/list000_vt.dats"
#staload _ =
"srcgen1\
/prelude/DATS/VT/strm000_vt.dats"
//
(* ****** ****** *)
#staload // _ =
"srcgen1\
/prelude/DATS/CATS/Xint/basics0.dats"
#staload // _ =
"srcgen1\
/xatslib/githwxi/DATS/CATS/Xint/basics0.dats"
(* ****** ****** *)

val xs1 =
list_cons(1,
list_cons(2, list_nil()))
val xs2 =
list_cons(2,
list_cons(3, list_nil()))

val ans = (xs1 = xs2)
val sgn = g_cmp(xs1, xs2)

(* ****** ****** *)

val xss =
list_cons(xs1,
list_cons(xs2, list_nil()))

(* ****** ****** *)

val ans = (xss = xss)

(* ****** ****** *)

val xs3 = list_concat<int>(xss)

(* ****** ****** *)

val xs1 = list_copy_vt(xs1)
val xs2 = list_copy_vt(xs2)
val xs3 = list_vt_append0(xs1, xs2)

(* ****** ****** *)

val ys1 =
list_vt_cons(1,
list_vt_cons(2,
list_vt_cons(3, list_vt_nil())))
val ys2 =
list_vt_cons(1,
list_vt_cons(2,
list_vt_cons(3, list_vt_nil())))

(* ****** ****** *)

val ys3 =
list_vt_rappend11<int>(ys1, ys2)

(* ****** ****** *)

val ln1 = list_vt_length1<int>(ys1)
val ln2 = list_vt_length1<int>(ys2)
val ln3 = list_vt_length1<int>(ys3)

(* ****** ****** *)

val ys4 = list_vt_mergesort0<int>(ys3)

(* ****** ****** *)

val zs1 =
list_vt_cons(1, list_vt_nil())
val zs2 =
list_vt_cons(2, list_vt_nil())
val zs3 =
list_vt_cons(3, list_vt_nil())
val zss =
list_vt_cons(zs1,
list_vt_cons(zs2,
list_vt_cons(zs3, list_vt_nil())))
val zs4 = list_vt_concat0<int>(zss)

(* ****** ****** *)

val len =
strm_vt_length0(list_vt_permutize0<int>(zs4))

(* ****** ****** *)

(* end of [ATS-Xanadu/srcgen1/xinterp/srcgen1/TEST/prelude_lists.dats] *)
