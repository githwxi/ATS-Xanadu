(* ****** ****** *)

#abstype T0

(* ****** ****** *)

#extval
fun
foo1(T0): @(T0, sint)
#extval
fun
foo2(T0): @(T0, sint)

(* ****** ****** *)

local

#absimpl T0 = sint

in//local

#implfun
foo1(x1) = (x1+0, x1+1)

endloc // end-of-[local]

(* ****** ****** *)

#implfun
foo2(x2) = (x2+0, x2+1)

(* ****** ****** *)

(* end of [DATA/myabstp.dats] *)
