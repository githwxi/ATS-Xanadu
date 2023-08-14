(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)
//
#staload
"prelude/SATS/rand000.sats"
//
(* ****** ****** *)
//
#impltmp
{a:type}
g_rand<list(a)>() =
list_vt2t(list_rand<a>())
#impltmp
{a:vwtp}
g_rand<list_vt(a)>() = list_rand<a>()
//
(* ****** ****** *)
//
#impltmp
<a:vwtp>
list_rand() =
list_rand_length<a>
(list_rand$length<>())
//
#impltmp
<>(*tmp*)
list_rand$length() = 10 // HX: reasonable?
//
#impltmp
<a:vwtp>
list_rand_length(ln) =
(
gint_map_list_nint<a>(ln)
) where
{
#impltmp
map$fopr<sint><a>(_) = g_rand<a>()
}(*where*)//end-of-[list_rand_length(...)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_rand000.dats] *)
