(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

#define Int 100
#define Flt 100.0

#define CHRNIL ''
#define STRNIL ""

#define
sing(x) cons(x, nil())
#define
sing_vt(x) cons_vt(x, nil_vt())

#defrec
power(x, n) =
$if
(n > 0)
then x * power(x, n-1) else 1

#macdef
orelse(x, y) =
(if x then true else y): bool

#macdef
andalso(x, y) =
(if x then y else false): bool

#macdef
foo{T}(x1, x2) = bar<T>(x1 + x2)

#macdef
print!(...) =
$if
$iseqz($darg)
then ((*void*))
else (print($hd($darg)); print!($tl($darg)))
#macdef
println!(...) =
$if
$nilq($darg)
then print_newline()
else
let
val () = print($hd($darg)) in print!($tl($darg))
end

(* ****** ****** *)

datatype
tint_z() = Z()
datatype
tint_s(a:type) = S of a

#define
tint(n) =
$if (n=0) then tint_z else S(tint(n-1))

#extern
fun
<a:type>
<n:type>
g_pow(x: a): a

impltmp
{a:type}
g_pow<a><Z()>(x) = g_1<a>()
impltmp
{a:type}
{n:type}
g_pow<a><S(n)>(x) = x * g_pow<a><n>(x)

fun
<a:type>cube(x0: a) = g_pow<a><S(S(S(Z)))>(x)

(* ****** ****** *)

(* end of [test08.dats] *)
