(* ****** ****** *)

#abstype T1

(* ****** ****** *)

#extval
fun f1(T1): T1

(* ****** ****** *)

local

#absimpl T1 = sint

in//local

#implfun f1(x1) = (1)

end // end-of-[local]

(* ****** ****** *)

(* end of [DATA/myabstp.dats] *)
