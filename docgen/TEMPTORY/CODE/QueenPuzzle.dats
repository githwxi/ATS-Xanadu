(* ****** ****** *)
//
// HX-2021-01-05:
// Porting from:
//
(*
// HX-2019-05-09:
// For ATS-Temptory
*)
//
(* ****** ****** *)
#include
"share\
/xatsopt_prelude.hats"
(* ****** ****** *)

#define N 8

(* ****** ****** *)

abstype board == p1tr

(* ****** ****** *)

#extern
fun
board_nil(): board
#extern
fun
board_cons
(x0: int, xs: board): board

(* ****** ****** *)

local

absimpl board = list(int)

in(* in-of-local *)

implfun
board_nil() = list_nil()
implfun
board_cons(x0, xs) = list_cons(x0, xs)

impltmp
gseq_streamize
<board><int>(xs) = list_streamize<int>(xs)

end (* end of [local] *)

(* ****** ****** *)

impltmp
g_print
<board> =
board_print where
{
fun
board_print
(xs: board): void =
(
rforeach(xs)
) where
{
impltmp
rforeach$work<int>(x0) =
(
  loop(0) ) where
{
fun
loop(i0: int): void =
if
i0 >= N
then
println((*void*))
else
(
if i0 = x0 then print "Q " else print ". "; loop(i0+1)
)
}
} (* end of [board_print *)
} (* where *) // end of [g_print<board>]

(* ****** ****** *)

fun
board_check
(x0: int, xs: board): bool =
(
iforall(xs)) where
{
impltmp
iforall$test<int>(i1, x1) =
if
(x0 != x1)
then (abs(x0 - x1) != i1 + 1) else false
} (* end of [board_check] *)

(* ****** ****** *)

fun
board_extend
(xs: board): list(board) =
(
list_vt2t
(
mapopt_list(N)
)
) where
{
impltmp
filter$test<int>(x0) = board_check(x0, xs)
impltmp
map$fopr<int><board>(x0) = board_cons(x0, xs)
} (* end of [board_extend] *)

fun
boardlst_extend
( xss
: list(board)): list(board) =
(
foldr
(xss, list_nil())) where
{
typedef xs = board
typedef r0 = list(board)
impltmp
foldr$fopr<xs><r0>(xs, r0) = append(board_extend(xs), r0)
} (* end of [boardlst_extend] *)

(* ****** ****** *)

fun
qsolve(): list(board) =
(
  loop(0, list_sing(board_nil()))
) where
{
  fun
  loop
  (i0: int, xss: list(board)): list(board) =
  if i0 < N then loop(i0+1, boardlst_extend(xss)) else xss
}

(* ****** ****** *)

fun
main0() = () where
{
//
val
xss = qsolve()
//
val () =
(
iforeach(xss)) where
{
impltmp
iforeach$work<board>(i0, xs) =
(println("Solution#", i0+1, ":"); println(xs))
}
}

(* ****** ****** *)

(* end of [QueenPuzzle.dats] *)
