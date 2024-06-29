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
g_rand<list(a)>
((*void*)) = list_rand<a>()
#impltmp
{a:vwtp}
g_rand<list_vt(a)>
((*void*)) = list_rand_vt<a>()
//
(* ****** ****** *)
//
#impltmp
<a:type>
list_rand() =
list_vt2t(list_rand_vt())
//
#impltmp
<a:vwtp>
list_rand_vt() =
list_rand_length_vt<a>
(list_rand$length<>((*0*)))
//
#impltmp
<>(*tmp*)
list_rand$length() = 10 // HX: reasonable?
//
#impltmp
<a:vwtp>
list_rand_length_vt(ln) =
(
gint_map_llist_nint<a>(ln)
) where
{
#impltmp
map$fopr<sint><a>(_) = g_rand<a>()
}(*where*)//end-of-[list_rand_length_vt(...)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_rand000.dats] *)
