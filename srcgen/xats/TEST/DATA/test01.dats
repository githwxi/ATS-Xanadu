(* ****** ****** *)

#extern
fun
gint_add :
(int, int) -> int
and
gint_sub :
(int, int) -> int
and
gint_mul :
(int, int) -> int

#symload + with gint_add
#symload - with gint_sub
#symload * with gint_mul

(* ****** ****** *)

#extern
fun
gint_gt1 :
(int, int) -> bool
and
gint_lt1 :
(int, int) -> bool

#symload > with gint_gt1 of 1
#symload < with gint_lt1 of 1

(* ****** ****** *)

#extern
fun
gint_gt2 :
(int, int) -> bool
and
gint_lt2 :
(int, int) -> bool

#symload > with gint_gt2 of 2
#symload < with gint_lt2 of 2

(* ****** ****** *)

#static
fun:rec
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
fun:nrc
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

(* end of [test01.dats] *)
