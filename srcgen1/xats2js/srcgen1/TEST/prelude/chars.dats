(* ****** ****** *)
#include
"./../..\
/xshared/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)

val a = 'a'
val b = 'b'
val () = g_print(a)
val () = g_print(b)
val () = g_print('\n')

(* ****** ****** *)
//
val eol = code('\n')
(*
val eol = code('\012')
*)
//
(* ****** ****** *)

val a = "a"
val b = "b"
val ab = "ab"
val cd = "cd"
val lte = ab <= cd
val gte = ab >= cd
val sgn = g_cmp(a, ab)
val sgn = g_cmp(b, ab)
val sgn = g_cmp(ab, ab)
val sgn = g_cmp(ab, cd)

(* ****** ****** *)

val
alphabet =
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
val () = g_print(alphabet)
val () = g_print(char(eol))
val () = gseq_print(alphabet)
val () = g_print(char(eol))

(* ****** ****** *)

val ai = gseq_indexof(alphabet, 'a')
val Ai = gseq_indexof(alphabet, 'A')
val Zi = gseq_indexof(alphabet, 'Z')

(* ****** ****** *)

val rai = gseq_rindexof(alphabet, 'a')
val rAi = gseq_rindexof(alphabet, 'A')
val rZi = gseq_rindexof(alphabet, 'Z')

(* ****** ****** *)

val a =
list_cons<cgtz>
('a', list_nil())
val b =
list_cons<cgtz>
('b', list_nil())
val c =
list_cons<cgtz>
('c', list_nil())

(* ****** ****** *)
//
val
abc =
list_cons
('a'
,
list_cons
('b'
,
list_cons
('c', list_nil())))
val a = abc[0]
and b = abc[1]
and c = abc[2]
//
val
abc = strn_make_list(abc)
val a = abc[0]
and b = abc[1]
and c = abc[2]
//
(* ****** ****** *)
//
val xyz =
let
val x = code('x')
in
strn_tabulate_cfr
(3, lam(i) => char(x+i))
end // end of [val]
val () =
( g_print("xyz = ")
; g_print( xyz ); g_print('\n'))
//
(* ****** ****** *)
//
val avg =
(
gseq_map_add
<xs><x0><y0>(xyz) / 3
) where
{
#typedef x0 = char
#typedef y0 = sint
#typedef xs = strn
#impltmp map$fopr<x0><y0>(c) = code(c)
}
//
val () =
( g_print("avg = ")
; g_print( avg ); g_print('\n'))
//
(* ****** ****** *)
//
(*
HX-2020-01-31
*)
//
val ans =
(
gseq_prefixq("abc", "abcde")
)
val ( ) = println("ans(tt) = ", ans)
//
val ans =
(
gseq_suffixq("abde", "abcde")
)
val ( ) = println("ans(ff) = ", ans)
//
(* ****** ****** *)
//
val
text = "Hello, world!"
//
local
#impltmp
group$test
<char>(c0) =
(
('a' <= c0)*(c0 <= 'z')
+
('A' <= c0)*(c0 <= 'Z')
)
in
val wrds =
gseq_group_lstrm<strn><cgtz>(text)
end // local
//
val (  ) =
(
print("wrds = ");
let
//
fn0
g_print_strn(cs) = g_print<strn>(cs)
#impltmp
g_print<strn>(cs) =
(print('"'); g_print_strn(cs); print('"')) in print0(wrds) end ; println((*void*)) )
//
(* ****** ****** *)

(* end of [ATS3-Xanadu/srcgen1/xats2js/srcgen1/TEST/prelude_char.dats] *)
