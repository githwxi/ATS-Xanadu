(* ****** ****** *)

#abstype T1

(* ****** ****** *)

#extval
fun
foo1(T1): @(T1, sint)

(* ****** ****** *)

local

#absimpl T1 = sint

in//local

#implfun
foo1(x1) = (x1, x1 + 1)

endloc // end-of-[local]

(* ****** ****** *)

(* end of [DATA/myabstp.dats] *)
