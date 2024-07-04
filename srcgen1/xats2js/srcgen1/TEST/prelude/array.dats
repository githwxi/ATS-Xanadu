(* ****** ****** *)
#include
"./../..\
/xshared/xats2js_prelude.hats"
(* ****** ****** *)
#staload
"srcgen1\
/prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
//
val A0 = a0ref(0)
//
val x0 =
a0ref_get<int>(A0)
val () = println(A0)
val () =
a0ref_set<int>(A0, 1)
val x1 =
a0ref_get<int>(A0)
val () = println(A0)
//
(* ****** ****** *)
//
val B1 =
a1ref_make_nval<int>
  (10, 0)
//
val y0 = get_at(B1, 0   )
val () = set_at(B1, 1, 1)
val y1 = get_at(B1, 1   )
val () = set_at(B1, 2, 2)
val y2 = get_at(B1, 2   )
//
(* ****** ****** *)

val () =
gseq_rforeach
(gseq_length(B1)) where
{
#impltmp
a1ref_length<int>(_) = 10
#impltmp
rforeach$work<int>(i0) = set_at(B1, i0, i0+1)
}

(* ****** ****** *)
//
val
bs =
(
gseq_map_list(B1)
) where
{
#impltmp
a1ref_length<int>(_) = 10
#impltmp
map$fopr<int><int>(x) = (x)
}
//
val () = println("bs = ", bs)
//
(* ****** ****** *)
//
val
sum = gseq_add(B1) where
{
  #impltmp
  a1ref_length<int>(_) = 10
}
//
val () = println("sum = ", sum)
//
(* ****** ****** *)

val B2 =
a1ref_make_list(xs) where
{
  val xs =
  list_cons
  (1,list_cons(2, list_nil()))
}

(* ****** ****** *)

val B3 =
a1ref_make0_llist(xs) where
{
  val xs =
  list_vt_cons(1,
  list_vt_cons(2,
  list_vt_cons(3, list_vt_nil())))
}

(* ****** ****** *)
//
(*
gseq_permutize
<a1ref(int,3)> :
gseq_listize<a1ref(int,3)> :
a1ref_length<int>(a1ref(int,3))
*)
//
val xss =
(
gseq_permutize_lstrm(B3)
) where
{
#impltmp a1ref_length<int>(_) = 3
}
//
val len = length0(xss)
val ( ) = println("|xss| = ", len)
//
(* ****** ****** *)

(* end of [ATS3-Xanadu/srcgen1/xats2js/srcgen1/TEST/prelude_array.dats] *)
