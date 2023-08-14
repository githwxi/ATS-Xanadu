(* ****** ****** *)
(*
Hongwei Xi
email: gmhwxi@gmail.com
Sun Aug 13 17:57:19 EDT 2023
*)
(* ****** ****** *)
(*
** For generic
** random number generators
*)
(* ****** ****** *)
//
fun
<a:vt>
g_rand((*void*)): a
//
(* ****** ****** *)
//
fun
<a:vt>
list_rand(): list_vt(a)
fun<>
list_rand$length(): nint
//
fun
<a:vt>
list_rand_length
{n:nat}(ln: sint(n)): list_vt(a,n)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_rand000.sats] *)
