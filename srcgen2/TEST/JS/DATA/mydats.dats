(* ****** ****** *)
fun
<x0:vt>
mycopy(x0: !x0): x0 = x0
(* ****** ****** *)
fun
<x0:vt>
myfree(x0: ~x0): void = ()
(* ****** ****** *)
#impltmp
<>(*tmp*)
list_nilq
  (xs) =
(
case+ xs of
|list_nil _ => true
|list_cons _ => false
) (*case*) // end-of-[list_nilq(xs)]
(* ****** ****** *)

(* end of [DATA/mydats.dats] *)
