(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-03:
Sat 03 Aug 2024 03:08:26 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-21:
Sun 21 Jul 2024 11:06:11 PM EDT
*)
//
#include
"xatslib\
/HATS/xatslib_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1\
/prelude\
/HATS/CATS/JS/prelude_dats.hats"
//
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../HATS/githwxi_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val AB =
strn(26, lam(i)=>'a'+i)
val () =
prints("AB = ", AB, "\n")
//
val
ABAB =
adds(AB, AB) where
{
#impltmp
g_add<strn> = strn_append
}
val () =
prints("ABAB = ", ABAB, "\n")
//
val
rABAB =
strn$rconcat(@(AB, AB))
val () =
prints("rABAB = ", rABAB, "\n")
//
val
ABABAB =
strn$concat(@(AB, AB, AB))
val () =
prints("ABABAB = ", ABABAB, "\n")
//
(* ****** ****** *)
////
(* ****** ****** *)
//
val wrd0 = "hello"
val wrds =
list_fmake_fwork<strn>
(
lam(work) =>
GASZ(wrd0).iforitm(
lam(i, ci) => GASZ(26).foritm
(
  lam(j) =>
  let
    val cj = 'a'+j
  in
    if ci = cj
    then () else work
    ($UN.strn_fset$at$raw(wrd0, i, cj))
  end
)
)
)
//
val (  ) = prints("wrds = ", wrds, "\n")
//
////
val wrds =
list_fmake_fwork<strn>
(
lam(work) =>
GSEQ(wrd0).iforitm
(
  lam(i, ci) => GASZ(26).foritm
  (
    lam(j) =>
    let
      val cj = 'a'+j
    in
      if ci = cj
      then () else work
      ($UN.strn_fset$at$raw(wrd0, i, cj))
    end
  )
)
)
//
val (  ) = prints("wrds = ", wrds, "\n")
//
(* ****** ****** *)
////
(* ****** ****** *)
//
val ds =
nint_dgt$listize(123456789)
val () = print1s("ds = ", ds,"\n")
//
(* ****** ****** *)
////
(* ****** ****** *)
val f0 =
lam(x:int) => @(x, x=x)
val () =
prints
("type(f0) = ", type(f0), "\n")
(* ****** ****** *)
(*
val b0 =
GASZ("abcde").exists(lam(c)=>c='f')
*)
(* ****** ****** *)
//
//
(* ****** ****** *)
//
val word = "hello"
val (  ) =
GSEQ(26).foritm(
  lam(i) =>
  GSEQ(word).iforitm(
    lam(j, cj) =>
    let
      val ci = 'a'+i
    in
      if ci = cj then ()
      else prints("ci = ", ci, ";", "cj = ", cj, "\n")
    end
  )
)
//
(* ****** ****** *)
(*
GSEQ(26).foritm(
  lam(i) =>
  GSEQ(length(word)).iforitm(
    lam(j, c) => if word[i] != c then work(word.fset_at(i, c))
  )
)
*)
(* ****** ****** *)
////
(* ****** ****** *)
val b0 =
GASZ(10).forall(lam(x)=>x<10)
val () = prints("b0 = ", b0, "\n")
(* ****** ****** *)
val xs =
list(1,2,3,4)
val xss = list(xs)
val ( ) =
prints
("type(xs) = ", type(xs), "\n")
val ( ) =
prints
("type(xss) = ", type(xss), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs = 
GSEQ(list(1,2,3)).folditm
( qlist_nil()
, lam(r0, x0) => qlist_snoc(r0, x0))
//
val ( ) =
prints
("xs(type) = ", type(xs), "\n")
val () =
prints("xs(value) = ", xs, "\n")
//
val () = prints("sum(xs) = ", sum(GSEQ(xs)), "\n")
val () = prints("prod(xs) = ", prod(GSEQ(xs)), "\n")
val () = print1s("listize(xs) = ", listize(GSEQ(xs)), "\n")
val () = print1s("rlistize(xs) = ", rlistize(GSEQ(xs)), "\n")
//
(* ****** ****** *)
//
#define
GZ2SEQ(xs, ys) =
GSEQ_z2make(GSEQ(xs), GSEQ(ys))
#define
GX2SEQ(xs, ys) =
GSEQ_x2make(GSEQ(xs), GSEQ(ys))
//
val ys =
list(10,20,30,40,50)
val ztup = GZ2SEQ(xs, ys)
val zxys = rlistize(ztup)
val ( ) =
prints("ztup = ", ztup, "\n")
val ( ) =
print1s("rlistize(ztup) = ", zxys, "\n")
////
val () =
irforitm
( GSEQ(ys)
, lam(i, y) => prints("(i, x) = (", i, ",", y, ")"))
val () = prints("\n")
////
val rys = rlistize(GSEQ(ys))
val ( ) = print1s("rys = ", rys, "\n")
////
val rxys =
rlistize(GZ2SEQ(xs, ys))
val ( ) =
print1s("rlistize(GSEQ_z2make(GSEQ(xs), GSEQ(ys))) = ", rxys, "\n")
//
val xys =
listize(GX2SEQ(xs, ys))
val ( ) =
print1s("listize(GSEQ_x2make(GSEQ(xs), GSEQ(ys))) = ", xys, "\n")
val rxys =
rlistize(GX2SEQ(xs, ys))
val ( ) =
print1s("rlistize(GSEQ_x2make(GSEQ(xs), GSEQ(ys))) = ", rxys, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_mydiary.dats] *)
