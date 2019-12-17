

#extern fun <a:type>
foo$helper(help: a): int

(* #extern fun <a:type> *)
(* foo(x: a): int *)

implement foo$helper<bool>(x) = if x then 1 else 0

fun <a:type> foo(x: a): int = foo$helper<a>(x)


(* implement<a> foo(x) = foo$helper<a>(x) *)

val xs = foo(false)
(* where *)
(* implement foo$helper<bool>(x) = if x then 1 else 0   *)
(* end *)




////

(*
fun<a:type><b:type>
map (xs:list(a), f0: a -> b) =
(
case+ xs of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons(f0(x0), map(xs, f0))
)

fun foo (a: int): bool = a = 0

(*
val ys = list_cons(1, list_nil())
fun foo (a: int): bool = a = 0
val xys = map(ys, foo)
*)
*)

#extern fun
<res:type><x:type>
foldl$fopr(res:res, x:x): res

implement foldl$fopr<int><int>(res, x) = g_add<int>(res, x)

fun<res:type><x:type>
foldl (xs:list(x), res: res) =
(
case+ xs of
| list_cons(x0, xs) => foldl(xs, foldl$fopr<res><x>(res, x0))
| list_nil() => res
)

val ys = list_cons(1, list_cons(2, list_nil()))


val res = foldl(ys, 0)
(*
where
  implement foldl$fopr(res, x) = res + x
end
*)
(*
val res = foldl<int><int>(ys, 0) where
  implement foldl$fopr<int><int>(res, x) = res + x
end
*)


(*
fun<a:type><b:type>
foldl (xs:list(a), f0: (a, b) -> b, res: b) =
(
case+ xs of
| list_nil() => res
| list_cons(x0, xs) => foldl(xs, f0, f0(x0, res))
)

*)
(* val ys = list_cons(1, list_cons(2, list_nil())) *)
(* val xys = map(ys, lam a => a = 0) *)
(* val res = foldl(xys, lam(a,res) => (if a then res else res+1), 0) *)
