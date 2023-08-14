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
//
#impltmp
g_print
<board>(xs) =
(
board_print(xs)
) where {
fun
board_print
(xs: board): void =
(
gseq_rforeach
<xs><x0>( xs ) )
where {
//
#typedef x0 = sint
#typedef xs = board
//
#impltmp
rforeach$work
< x0 >(  x0  ) =
(
  loop(0(*i0*)) ) where
{
fun
loop(i0) =
if
i0 >= N
then println((*0*)) else
(
if
i0 = x0
then print "Q "
else print ". "; loop(i0+1)) }
//
} (*where*) // end of [board_print]
} (*where*) // end of [g_print<board>]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
board_check
(xs: board, x0: int): bool =
(*
HX-2023-08-04:
Should a bi-directional approach
be used for overloading resolution?
*)
iforall_cfr
(
xs,
lam
(i1:int, x1:int) =>
if
(x0 != x1)
then (abs(x0-x1) != i1+1) else false)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
board_extend
(xs: board): list(board) =
(
list_vt2t
(
gseq_mapopt_list
< xs >< x0 >< y0 >(N))) where
{
#typedef xs = sint
#typedef x0 = sint
#typedef y0 = board
#impltmp
map$fopr(x0) = board_cons(x0, xs)
#impltmp
filter$test(x0) = board_check(xs, x0)
}(*where*)//end of [board_extend(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
boardlst_extend
( xss
: list(board)): list(board) =
foldr_cfr
(
xss,
list_nil,
lam(xs, r0) =>
(
  list_append(board_extend(xs), r0)))
//(*where*)//end-[boardlst_extend(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
qsolve
((*0*)): list(board) =
(
loop
(
0(*i0*),
list_sing(board_nil())))
where
{
fun
loop
( i0: int
, xss
: list(board)): list(board) =
if
(i0 < N)
then loop
(i0+1,boardlst_extend(xss)) else xss }
//
(* ****** ****** *)
(* ****** ****** *)

fun
main0() =
let
//
val
xss = qsolve()
//
val () =
(*
HX-2023-08-04:
Should a bi-directional approach
be used for overloading resolution?
*)
iforeach_cfr
(
xss,
lam(i0:sint, xs:board) =>
(
println
("Solution#", i0+1, ":"); println(xs)))
//
end(* let *) // end of [main0((*void*))]

(* ****** ****** *)

(* end of [TEST/JS/DATA/QueenPuzzle2.dats] *)
