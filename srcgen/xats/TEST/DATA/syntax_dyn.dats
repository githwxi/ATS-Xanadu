sortdef
nat = {a:int | a >= 0}
////
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

#prefix 51 - (* neg *)
#prefix 51 ~ (* neg *)

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

val float0 = 0x.abcdefp0f

val ((*void*)) =
println!("float0 = ", float0)

(* ****** ****** *)

var
foo: sexp with pf = 123

#symload
[] with $BAR.bar of 100
#symload
foo with $BAR.bar of 100
#symload
.foo with $BAR$BAZ.bar of 100

(* ****** ****** *)

val-
nil() = xs0
withtype list(int)

val+
:rec
x \cons xs2 = xs1

val
tup_flat = @(1, 2)
val
tup_boxd = $(1, 2)

(* ****** ****** *)
//
val:rec cons(x, xs) = xs
//
(* ****** ****** *)
//
val xyz =
  (if x > 0 then (f; g; h) else i; j)
//
(* ****** ****** *)

fun
foo(x) =
(
case+ x of
| list_nil() //
| list_nil() => 0
| list_cons(_, xs) => foo(xs) + 1
) where
{
  val x = x + x
}

(* ****** ****** *)

implement
:nonrec
{a:type;b,c:tbox}
<a:type;b,c:tbox>
foo2<list(a)><b,c>(x: a): int =
  (if x then x + x else x - x)

(* ****** ****** *)

#extern
fun
fact
{n:int}
(*.<n+1>.*)
(x: int(n)): intGte(1)

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
:nonrec
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
:nonrec
<(*tmp*)>
list_make_intrange
  {l0,r}
  (l0, r) = let
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

val bar = xs.f(x).g(y).h(z1, z2)

val foo = xs.foldleft(0, $lam($0+$1))
val foo = xs.foldright($lam($0+$1), 0)

(* ****** ****** *)

fun
<a:type>
permute
(xs: list(a)): list(list(a)) =
if
iseqz(xs)
then $list(nil())
else concat(xs.imap(lam(i,x)=>mcons(x, permute(xs-i))))

(* ****** ****** *)

absimpl
$FOO.foo(x:int): type = bar

fun
:rec
foo(xs: list(int)): int =
(
case+ xs of
| nil() => 0
| cons(x, xs) => (x) + foo(xs)
)

val
:rec
fact =
lam(x: int): int =<ntm>
if x >= 1 then x * fact(x-1) else x

val f =
lam(x, y) =>
if x > y then x else y endif endlam

(* ****** ****** *)

val
:rec
fact =
lam(x: int): int =<cloref1>
  if x >= 1 then x * fact(x-1) else 1
// end of [lam]

(* ****** ****** *)
//
val xs =
xs.1().2().insert(i, x).insert(i', x')
//
(* ****** ****** *)

val x =
if
(if True then False else True)
then if True then False else True endif
else if True then False else True endif
endif

(* ****** ****** *)

(* end of [syntax_dyn.dats] *)
