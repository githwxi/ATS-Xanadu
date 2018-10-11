(* ****** ****** *)
//
(*
#prefix 00 ! (* static *)
*)
//
#prefix 99 ! (* dynamic *)
//
(* ****** ****** *)

(*
#postfix 80 .lab // dynamic
#postfix 80 ->lab // dynamic
*)

(* ****** ****** *)

(*
#prefix 79 & // dynamic
*)

(* ****** ****** *)

(*
#infixl 70 app
*)

(* ****** ****** *)

(*
#postfix 69 ?
*)

(* ****** ****** *)
//
// HX-2015-08-04:
// mostly following the Fortran convention
//
#infixr 61 ** (*exp*)
//
(* ****** ****** *)
//
// multiplicative
//
#infixl 60 * / % mod
//
(*
#infixl 60 nmul ndiv nmod
*)
//
(* ****** ****** *)

#prefix 51 - ~ (*negative*)

(* ****** ****** *)
//
#infixl 50 + - (*additive*)
//
(*
#infixr (+) ++ // concatenative
*)
//
(* ****** ****** *)

#infixl 41 asl asr
#infixl 41 lsl lsr

(* ****** ****** *)
//
#infix0 40 < <= > >=
//
(*
//
// HX-2012-07: removed
//
#infixl ( < ) ilt flt plt ult
#infixl ( <= ) ilte flte plte ulte
#infixl ( > ) igt fgt pgt ugt
#infixl ( >= ) igte fgte pgte ugte
*)
//
(* ****** ****** *)

#infixr 40 :: @

(* ****** ****** *)

#infix 30 = == != // <>

(* ****** ****** *)

(*
//
// HX-2012-07: removed
//
#infix ( = ) ieq feq peq ueq
#infix ( <> ) ineq fneq pneq uneq
*)

(* ****** ****** *)

#infixl 21 &&
#infixl ( && ) andalso land

(* ****** ****** *)

#infixl 20 ||
#infixl ( || ) xor orelse lor lxor

(* ****** ****** *)

#infixr 10 ->

(* ****** ****** *)

#infix0 (0) := // HX: assign
#infix0 (0) :=: // HX: exchange

(* ****** ****** *)

#infixl (0) << (* g0int_asl, g0uint_lsl *)
#infixr (0) >> (* g0int_asr, g0uint_lsr *)

(* ****** ****** *)

(*
#prefix (0) ++ -- // inc and dec
#prefix (0) !++ --! // getinc and decget
#infixr (0) =++ --= // setinc and decset
*)

(* ****** ****** *)

(*
#infix0 (0) :+= :-= :*= :/= // x:=x+a, x:=x-a, ...
#infix0 (0) :=+ :=- :=* :=/ // x:=a+x, x:=a-x, ...
*)

(* ****** ****** *)

val xyz = (foo<a,b+c>(x, y))
val xyz = ((foo<a),(b+c>(x, y)))

(* ****** ****** *)

primplmnt
(*nonrec*)
lemma_list_param(xs) =
(
//
case+ xs of
| list_nil _ => () | list_cons _ => ()
//
) (* lemma_list_param *)

(* ****** ****** *)
//
implement
<a>(*tmp*)
list_tuple_0() = list_nil()
//
implement
<a>(*tmp*)
list_tuple_1(x0) = $list{a}(x0)
implement
<a>(*tmp*)
list_tuple_2(x0, x1) = $list{a}(x0, x1)
implement
<a>(*tmp*)
list_tuple_3(x0, x1, x2) = $list{a}(x0, x1, x2)
//
implement
<a>(*tmp*)
list_tuple_4
(x0, x1, x2, x3) = $list{a}(x0, x1, x2, x3)
implement
<a>(*tmp*)
list_tuple_5
(x0, x1, x2, x3, x4) = $list{a}(x0, x1, x2, x3, x4)
implement
<a>(*tmp*)
list_tuple_6
(x0, x1, x2, x3, x4, x5) = $list{a}(x0, x1, x2, x3, x4, x5)
//
(* ****** ****** *)

implement
<x>(*tmp*)
list_make_elt
  {n}(n, x) = let
//
fun loop
  {i:nat | i <= n} .<i>.
(
 i: int(i), x: x, res: list_vt(x, n-i)
) :<> list_vt(x, n) =
(
  if (i > 0)
    then loop(pred(i), x, list_vt_cons(x, res)) else res
  // end of [if]
) // end of [loop]
//
in
  loop(n, x, list_vt_nil(*void*))
end // end of [list_make_elt]

(* ****** ****** *)

implement
<(*tmp*)>
list_make_intrange
  {l0,r} (l0, r) = let
//
typedef
elt = intBtw(l0, r)
//
vtypedef
res(l:int) = list_vt(elt, r-l)
//
fun
loop
{
  l:int
| l0 <= l; l <= r
} .<r-l>.
(
  l: int l, r: int r
, res: &ptr? >> res(l)
) :<!wrt> void =
(
//
if
(l < r)
then let
  val () = res :=
    list_vt_cons{elt}{0}(l, _)
  // end of [val]
  val+list_vt_cons(_, res1) = res
  val () = loop(l+1, r, res1)
  prval ((*folded*)) = fold@(res)
in
  // nothing
end else (res := list_vt_nil())
//
) (* end of [loop] *)
//
in
//
  res where
  {
    // var res: ptr
    val ((*void*)) = $effmask_wrt(loop(l0, r, res))
  } (* end of [where] *)
end // end of [list_make_intrange]

(* ****** ****** *)
//
implement
<(*tmp*)>
fprint_list$sep
  (out) = fprint_string(out, ", ")
// end of [fprint_list$sep]
//
implement
<a>(*tmp*)
fprint_list(out, xs) = let
//
implement
{env}
list_iforeach$fwork<a><env>
  (i, x, env) = let
  val () =
  if i > 0
    then fprint_list$sep<>(out)
  // end of [if]
  // end of [val]
in
  fprint_val<a>(out, x)
end // end of [list_iforeach$fwork]
//
val _(*len*) = list_iforeach<a>(xs)
//
in
  // nothing
end // end of [fprint_list]

(* ****** ****** *)

(* end of [syntax_dyn.dats] *)
