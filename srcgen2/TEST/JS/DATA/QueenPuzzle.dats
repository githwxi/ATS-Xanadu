(* ****** ****** *)
//
// HX-2021-01-05:
// Porting from:
//
(*
// HX-2019-05-09:
// For ATS-Temptory
*)
(*
// HX-2023-07-22:
// For ATS3/Xanadu
// Sat 22 Jul 2023 12:02:10 PM EDT
*)
//
(* ****** ****** *)
val N = 8
(* ****** ****** *)
(* ****** ****** *)
#abstype
board_tbox <= p0tr
#typedef
board = board_tbox
(* ****** ****** *)
#staload
"prelude/SATS/gseq000.sats"
#staload
"prelude/SATS/synoug0.sats"
(* ****** ****** *)
#extval
fun
board_nil(): board
#extval
fun
board_cons
(x0: int, xs: board): board
(* ****** ****** *)
#symload nil with board_nil
#symload cons with board_cons
(* ****** ****** *)

local

#absimpl
board_tbox = list(int)

in(* in-of-local *)

#implfun
board_nil
((*void*)) = list_nil()
#implfun
board_cons
( x0, xs ) = list_cons(x0, xs)
#impltmp
gseq_strmize
<board><int> = list_strmize<int>

end (* end of [local] *)

(* ****** ****** *)
(* ****** ****** *)

#impltmp
g_print
<board> =
board_print where
{
fun
board_print
(xs: board): void =
(
gseq_rforeach(xs) )
where {
//
#impltmp
rforeach$work
  (x0: int) =
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
if i0 = x0
then
print "Q " else print ". "; loop(i0+1))
}
//
} (* end of [board_print *)
} (* where *) // end of [g_print<board>]

(* ****** ****** *)
(* ****** ****** *)

fun
board_check
(xs: board, x0: int): bool =
(
gseq_iforall(xs)) where
{
#impltmp
iforall$test<int>(i1, x1) =
if
(x0 != x1)
then (abs(x0 - x1) != i1 + 1) else false
} (* end of [board_check] *)

(* ****** ****** *)
(* ****** ****** *)

fun
board_extend
(xs: board): list(board) =
(
list_vt2t
(
gseq_mapopt_list(N))) where
{
#impltmp
map$fopr(x0) = board_cons(x0, xs)
#impltmp
filter$test(x0) = board_check(xs, x0)
} (* end of [board_extend] *)

(* ****** ****** *)

fun
boardlst_extend
( xss
: list(board)): list(board) =
(
list_foldr
< xs><r0 >
(xss, list_nil())) where
{
#typedef xs = board
#typedef r0 = list(board)
#impltmp
foldr$fopr
<xs><r0>(xs,r0) =
(
  list_append(board_extend(xs), r0)) }
//(* end of [boardlst_extend] *)

(* ****** ****** *)
(* ****** ****** *)
//
fun
qsolve(): list(board) =
(
  loop(0, list_sing(board_nil()))
) where
{
fun
loop
( i0: int
, xss: list(board)): list(board) =
if
(i0 < N) then
loop(i0+1, boardlst_extend(xss)) else xss}
//
(* ****** ****** *)
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
list_iforeach(xss)) where
{
#impltmp
iforeach$work<board>(i0, xs) =
(
println
("Solution#", i0+1, ":"); println(xs))
} (* where *)
} (* where *) // end of [ main0((*void*)) ]

(* ****** ****** *)

(* end of [TEST/JSDATA/QueenPuzzle.dats] *)
