(* ****** ****** *)

val myadd =
lam(x: sint, y: sint) => x + y
val mymul =
lam(x: sint, y: sint) => x * y

(* ****** ****** *)

val myfact =
fix f(x: sint) =>
(if x > 0 then x * f(x-1) else 1)

(* ****** ****** *)

val myfact2 =
lam(i: sint) =>
(
fix f(i,r) =>
(
if i > 0 then f(i-1,i*r) else r))(i,1)

(* ****** ****** *)

val myfact3 =
lam(i: sint) =>
(
fix f@(i,r) =>
(
if i > 0 then f@(i-1,i*r) else r))@(i,1)

(* ****** ****** *)

val myfact4 =
lam(i: sint) =>
(
fix f#(i,r) =>
(
if i > 0 then f#(i-1,i*r) else r))#(i,1)

(* ****** ****** *)

(* end of [DATA/myl1am.dats] *)
