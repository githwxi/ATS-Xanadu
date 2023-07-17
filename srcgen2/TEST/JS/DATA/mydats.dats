(* ****** ****** *)
fun
<x0:vt>
mycopy(x0: !x0): x0 = x0
(* ****** ****** *)
fun
<x0:vt>
myfree(x0: ~x0): void = ()
(* ****** ****** *)
(* ****** ****** *)
#impltmp
<>(*tmp*)
sub_char_char
  (c1, c2) =
( code(c1) - code(c2) )
(* ****** ****** *)

(* end of [DATA/mydats.dats] *)
